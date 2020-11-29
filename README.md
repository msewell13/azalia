# Manager.io Console

This project is a somewhat simple console script that aims to automote some tasks using the Manager.io accounting platform. It is also a work in progress so some features may be broken.

## Features

* Email all customers with open invoices at once with the touch of button
* Send a paper copy of open invoices in the mail to all customers with open invoices
* Automate your payroll by automating your payslips; The script automatically creates the payslip and calculates payroll deductions
* Automatically fetch bank transactions using the Plaid API and reconcile your accounts.

## Getting Started

You will need to create a few custom fields in Manager.io in order for the script to work. You will also need to get the field ID from the manager API and add them in config.py. Please add the following under Settings/Custom Fields:

Sales Invoice - We use this to determine through the API if the invoice has been paid or not.
1. Label: 'Paid', Type: 'Drop-down list' The options for the dropdown should be True and False. 

Bank Account - We will create two custom fields for this. We use these two custom fields to fetch bank transactions using the Plaid API. You will need to use the [Plaid quickstart app](https://github.com/plaid/quickstart) to get a plaid token and an account id for each bank account you plan to use.
1. Label:'Account ID', Type: 'Single line text'
2. Label: 'Plaid Token' Type: 'Single line text'


Employee - These two custom fields are used to automacilly create payslips for employees and calculate thier withholdings.
1. Label: 'Federal Withholding' Type: 'Number'
2. Label: 'Pay Rate' Type: 'Number'

### Installing

1. Clone this repository
2. ```pip install -r requirements.txt```
3. Change config_example.py to config.py ```mv config_example.py config.py```
4. Add your API keys to config.py
5. ```python3 console.py```

## Future Developments

* Add a new customer
* Archive a customer

## Authors

* **Matthew Sewell** - [Python Financial](https://pythonfinancial.com)

## License

This project is licensed under the MIT License
