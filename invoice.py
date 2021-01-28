import base64
import lob
import logging
import os
import re
import requests

from collections import namedtuple
from pathlib import Path
from typing import Any, Iterable, List

from PyPDF2.pdf import PageObject
from PyPDF2 import PdfFileReader, PdfFileWriter
from sendgrid import SendGridAPIClient
from sendgrid.helpers import mail

from utils import AttrDict, api_client as api, config


log = logging.getLogger(__name__)

EMAIL_HTML_CONTENT = '''
    '<strong>Please see the attached document.</strong><br>
    If you have any questions please call.<br><br>
    Matt Sewell<br>
    509.863.3607'
'''


class Address(namedtuple('Address', ['address', 'city', 'state', 'zip_code'])):
    def as_dict(self):
        return AttrDict(
            {
                'address_line1': self.address,
                'address_city': self.city,
                'address_state': self.state,
                'address_zip': self.zip_code,
            }
        )

    @classmethod
    def make(cls, value: str):
        address = re.split('\n', value)[0]
        city = re.findall('([^,]+),', value)[0]
        state = re.findall('\\s[A-Z]{2}\\s', value)[0]
        zip_code = re.findall('[0-9]{5}', value)[0]
        return cls(address, city, state, zip_code)


class Customer(namedtuple('Customer', ['id', 'address', 'email', 'name'])):
    @classmethod
    def get(cls, customer_id: str):
        data = api.get_resource_data(customer_id, False)
        addr = Address.make(data.BillingAddress)
        return cls(customer_id, addr, data.Email, data.Name)


class Invoice(namedtuple('Invoice', ['id', 'data', 'file'], defaults=[None])):
    PT_SCALE = 72  # 1in = 72pt
    PDF_NAME = 'sales-invoice-view.pdf'

    def __iter__(self) -> Iterable[PageObject]:
        """Return page of the invoice as a iterator."""
        with self.file.open('rb') as f:
            reader = PdfFileReader(f)
            for page_no in range(reader.numPages):
                page = reader.getPage(page_no)
                yield page

    def get_file(self, output_dir: Path) -> bool:
        params = {'Key': self.id, 'FileID': config.business_id}
        res = api.get(self.PDF_NAME, params=params)
        if res.status_code != requests.codes.ok:
            return False

        self.save(res.content, output_dir)
        return True

    def is_paid(self) -> bool:
        return self.data.CustomFields[config.custom_fields.invoice] == 'True'

    def save(self, content: Any, output_dir: Path):
        output_file = output_dir.joinpath(f'{self.id}.pdf')
        self._replace(file=output_file)

        with self.file.open('wb') as f:
            f.write(content)
            f.flush()

    def scale_to(self, width: float, height: float, output_dir: Path):
        writer = PdfFileWriter()

        SCALE = self.PT_SCALE
        for page in iter(self):
            page.scaleTo(width=SCALE * width, height=SCALE * height)
            writer.addPage(page)

        scaled_file = output_dir.joinpath(f'{self.id}.scaled.pdf')
        with scaled_file.open('wb') as f:
            writer.writer(f)
            f.close()

        # delete old file
        os.remove(self.file)

        # replace file with scaled one
        self._replace(file=scaled_file)

    @classmethod
    def list_all(cls) -> List[str]:
        return api.get_resource_data(config.resources.invoice)

    @classmethod
    def get(cls, invoice_id: str):
        data = api.get_resource_data(invoice_id, False)
        return cls(invoice_id, data)


def send_email(invoice: Invoice, customer: Customer) -> bool:
    log.debug(f'sending invoice via email: {customer.email}')
    with invoice.file.open('rb') as f:
        data = f.read()
        f.close()

    encoded_file = base64.b64encode(data).decode()
    attachment = mail.Attachment(
        mail.Disposition('attachment'),
        mail.FileContent(encoded_file),
        mail.FileName(invoice.file.name),
        mail.FileType('application/pdf'),
    )

    message = mail.Mail(
        from_email=config.email or '',
        to_email=customer.email,
        subject='Your monthly invoice is ready ...',
        html_content=EMAIL_HTML_CONTENT,
    )

    message.attachment = attachment
    try:
        sg = SendGridAPIClient(config.services.sendgrid.live_token)
        sg.send(message)

        log.debug('invoice sent successfully')
        return True
    except Exception as ex:
        log.error(f'unable to send invoice: {ex}')
        return False


def send_letter(invoice: Invoice, customer: Customer) -> bool:
    addr = customer.address.as_dict()
    addr.name = customer.name

    # configure lob
    DEBUG = config.debug
    conf = config.services.lob

    lob.api_key = conf.test_token if DEBUG else conf.live_token
    lob.Letter.create(
        color=False,
        description='Demo Letter',
        file=invoice.file.open('rb'),
        from_address=addr,
        to_address=addr,
        perforated_page=1,
        return_envelope=True,
    )
