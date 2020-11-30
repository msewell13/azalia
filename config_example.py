# Lob API keys
live_secret = ''
test_secret = ''

# Manager
mgr_usr = ''
mgr_pass = ''
mgr_domain = '' # this is your manager subdomain
mgr_api_root = '' # this is the url string after ...manager.io/api/
mgr_url = f'https://{mgr_domain}.manager.io/api/{mgr_api_root}/'
employee_url = '' # the url string for employee index
bank_url = '' # the url string for bank account index
invoice_url = '' # the url string for invoice index
payslip_url = '' # url string for payslips, not the index.json

# Manager payroll account items. You will need to create payslip items under settings in Manager and then get the account id's from the api
earnings = ''
federal_deduction = ''
medicare_deduction = ''
ss_deduction = ''
employer_medicare = ''
employer_ss = ''


# Manager custom fields - input the field ID for each 
pay_rate = ''
fed_holding = ''
invoice_paid = ''

# Sendgrid
sendgrid_api = ''


documents = [
	{
		'name': 'Lease',
		'id': '1'
	}]


