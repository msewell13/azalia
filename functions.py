# flake8: noqa
import json
import lob
import logging
import os
import PyPDF2
import re
import requests
import sys

from datetime import date
from plaid import Client
from tqdm import tqdm

from lease import new_lease
from utils import api_client as api, config, output_dir, send_email


DEBUG = True
log = logging.getLogger(__name__)


# configure lob service
lob_conf = config.services.lob
lob.api_key = lob_conf.test_token if DEBUG else lob_conf.live_token


def choices(list_of_dicts):
    x = 1
    print('\n')
    for dict_item in list_of_dicts:
        print(f"[{x}] {dict_item['name']}")
        x += 1
    choice = input("\nPlease make a selection: ")
    selection = list_of_dicts[int(choice) - 1]
    # selection = next((item for item in list_of_dicts if item['number'] == choice), None)
    if selection == None:
        print("I didn't understand that choice. Try again")
    else:
        return selection


def select_employee():
    selection = choices(employees)
    hours = float(input(f"\nHow many hours did {selection['name']} work?: "))
    print(f"Gross pay = ${selection['rate'] * hours}")
    description = input('Please add a description: ')
    data = payroll_data(hours, selection, description)
    r = s.post(url + '1d103fa7-6fc1-4951-811e-972968b842cc', data=json.dumps(data))
    utils.display_title()
    if r.status_code == 201:
        print('Success!')
    else:
        print(f'Something went wrong. Error: {r.status_code}')


def payroll_data(hours, employee_data, description):

    data = {
        'Date': date.today().strftime("%Y/%m/%d"),
        'Employee': employee_data['id'],
        'Earnings': [
            {
                'Item': "4d89f708-f265-4cd7-8f6b-587ef38a2aae",
                'Units': hours,
                'Rate': employee_data['rate'],
            }
        ],
        'Deductions': [
            {
                'Item': '086775b0-3684-4a92-a2ce-7106798fce47',  # Federal Taxes
                'Amount': round(
                    (hours * employee_data['rate']) * employee_data['fed_holding'], 2
                ),
            },
            {
                'Item': '744996a6-828b-4ac2-baa7-e3b81ee5e70b',  # Medicare
                'Amount': round((hours * employee_data['rate']) * 0.0145, 2),
            },
            {
                'Item': '2d2f6d15-26da-4b1c-9de0-ab7f713e0bae',  # Social Security
                'Amount': round((hours * employee_data['rate']) * 0.0620, 2),
            },
        ],
        'Contributions': [
            {
                'Item': '9fa2e97e-46bc-48a2-a1c8-10df235c564f',  # Employer Medicare
                'Amount': round((hours * employee_data['rate']) * 0.0145, 2),
            },
            {
                'Item': 'cb50fb6b-c645-4fa8-8aab-0ebd7d4f398a',  # Employer Socail Security
                'Amount': round((hours * employee_data['rate']) * 0.0620, 2),
            },
        ],
        'Description': description,
        'ShowTotalsForThePeriod': True,
        'TotalsPeriodStart': '2020-01-01',
    }

    return data


class Customer:
    def __init__(self, customer_id):
        self.customer_id = customer_id
        self.customer = api.get_resource(customer_id, False).json()
        self.name = self.customer['Name']
        self.address = re.split('\n', self.customer['BillingAddress'])[0]
        self.city = re.findall('([^,]+),', self.customer['BillingAddress'])[0]
        self.state = re.findall('\\s[A-Z]{2}\\s', self.customer['BillingAddress'])[0]
        self.zip_code = re.findall('[0-9]{5}', self.customer['BillingAddress'])[0]
        self.email = self.customer['Email']


def invoices(choice):
    invoices = api.get_resource_data(config.resources.invoice)
    pdfWriter = PyPDF2.PdfFileWriter()

    for invoice in tqdm(invoices[:5]):
        log.debug(f'processing invoice: {invoice}')
        data = api.get_resource_data(invoice, False)

        try:
            # tests if invoice is marked paid
            if data.CustomFields[config.custom_fields.invoice] == "False":
                params = {'Key': invoice, 'FileID': config.business_id}
                r = api.get('sales-invoice-view.pdf', params=params)

                if r.status_code == requests.codes.ok:
                    invoice_pdf = output_dir.joinpath(f'{invoice}.pdf')
                    with invoice_pdf.open('wb') as out_file:
                        out_file.write(r.content)
                        out_file.flush()

                    if choice == '2':
                        pdfReader = PyPDF2.PdfFileReader(str(invoice_pdf))
                        for pageNum in range(pdfReader.numPages):
                            pageObj = pdfReader.getPage(pageNum)
                            # pageObj.scaleTo(width=612, height=792)
                            pdfWriter.addPage(pageObj)

                        # Send invoice to tenant
                        customer_id = api.get_resource_data(invoice, False).Customer
                        customer = Customer(customer_id)

                        send_letter(
                            customer.name,
                            customer.address,
                            customer.city,
                            customer.state,
                            customer.zip_code,
                            str(invoice_pdf),
                        )

                    elif choice == '3':
                        try:
                            customer = api.get_resource_data(invoice, False).Customer
                            email = api.get_resource_data(customer, False).Email
                            send_email(email, str(invoice_pdf))
                        except KeyError:
                            tqdm.write('This customer does not have an email')
                    else:
                        tqdm.write('The choice selected was not recognized')
                    os.remove(f'{invoice}.pdf')
                else:
                    tqdm.write(f'Something went wrong with invoice: {invoice}')

                with output_dir.joinpath('invoices.pdf').open('wb') as pdf:
                    pdfWriter.write(pdf)
                    pdf.close()
            else:
                tqdm.write(f'skipping paid invoice: {invoice}')
        except KeyError:
            pass


def get_transactions():
    print('Which bank shall we pull transactions from?')
    bank = choices(banks)
    print('Please select the appropriate account:')
    account = choices(bank['accounts'])
    start_date = input("input a start date 'YYYY-MM-DD': ")
    end_date = input("input an end date 'YYYY-MM-DD': ")
    client = Client(
        client_id='5850e87d3936192710fb73fc',
        secret='7c1a63bbe4fb6ddac2fb555244de05',
        environment='development',
    )
    response = client.Transactions.get(bank['token'], start_date=start_date, end_date=end_date)
    transactions = response['transactions']

    # the transactions in the response are paginated, so make multiple calls while increasing the offset to
    # retrieve all transactions
    while len(transactions) < response['total_transactions']:
        response = client.Transactions.get(
            bank['token'], start_date=start_date, end_date=end_date, offset=len(transactions)
        )
        transactions.extend(response['transactions'])
    upload = ''
    utils.display_title()
    while upload.upper() != 'Y' and upload.upper() != 'N':
        upload = input("Would you like to upload these transactions to Manager? [Y/N]: ")
        if upload.upper() == 'Y':
            for transaction in tqdm(transactions):
                if transaction['account_id'] == account['id']:
                    if transaction['amount'] < 0:
                        trans_type = 'Receipt'
                    else:
                        trans_type = 'Payment'
                    date = transaction['date']
                    bank_account = bank['manager_account']
                    description = transaction['name']
                    amount = abs(transaction['amount'])
                    data = receipts_payments(
                        trans_type, date, bank_account, description, amount
                    )
                    r = s.post(
                        url + '699401fe-23fd-4b52-9699-b88b36fa6b26', data=json.dumps(data)
                    )
                    if r.status_code == 201:
                        tqdm.write('Success!')
                    else:
                        tqdm.write(f'Something went wrong. Error: {r.status_code}')
                        tqdm.write(json.dumps(data))
                else:
                    pass
        elif upload.upper() == 'N':
            utils.display_title()
            print('Very well, the transactions will not be uploaded')
        else:
            utils.display_title()
            print('The choice selected was not recognized. Try again.')

        # Save to CSV file for upload to Manager or offer to import into manager automatically
        # Add Chase card to transactions script


def receipts_payments(trans_type, date, bank_account, description, amount):
    transaction = {
        "Type": trans_type,
        "Date": date,
        "BankAccount": bank_account,
        "Description": description,
        "Lines": [
            {
                "Amount": amount,
            }
        ],
        "BankClearStatus": "Cleared",
    }
    return transaction


def create_documents():
    selection = choices(documents)
    if selection['id'] == '1':
        fname = input('Enter the tenants first name: ')
        lname = input('Enter the tenants last name: ')
        email = input('Enter tenant email address: ')
        address = input('Enter the street address of the rental unit: ')
        city = input('Enter the city: ')
        state = input('Enter the state: ')
        zip_code = input('Enter the zip code: ')
        lease_start = date.fromisoformat(
            input('Enter the lease start date (format: YYYY-MM-DD): ')
        )
        lease_end = date.fromisoformat(input('Enter the lease end date (format: YYYY-MM-DD): '))
        rent = int(input('Enter the monthly rental amount: $'))
        deposit = int(input('Enter the deposit amount: $'))
        add_occ = input('input any additional occupants (comma seperated): ')

        new_lease(
            fname,
            lname,
            email,
            address,
            city,
            state,
            zip_code,
            lease_start,
            lease_end,
            rent,
            deposit,
            add_occ,
        )
        utils.display_title()
    else:
        utils.display_title()
        print('The choice selected was not recognized. Try again.')
        print(selection)


def send_letter(name, address, city, state, zip_code, file):
    lob.Letter.create(
        description='Demo Letter',
        to_address={
            'name': name,
            'address_line1': address,
            'address_city': city,
            'address_state': state,
            'address_zip': zip_code,
        },
        from_address='adr_8948dc77b27123cb',
        file=open(file, 'rb'),
        color=False,
        return_envelope=True,
        perforated_page=1,
    )


# def new_tenant():
# 	# create tenant in Manager
# 	# send onboarding letter and tenant rules via lob
# 	# send onboarding email with tenant rules attached

# def late_rent():
