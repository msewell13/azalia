import os
import requests
from requests.auth import HTTPBasicAuth
import json
from functions import *

## Future developments ##
# Email payslips after creating them?
# Email invoices


# Payroll is a terminal application that creates payslips for
# employees in Manager.io

employees = None


### FUNCTIONS ###

def display_title_bar():
    # Clears the terminal screen, and displays a title bar.
    os.system('clear')
              
    print("\t**********************************************")
    print("\t***            Azalia Apartments           ***")
    print("\t**********************************************")


### MAIN PROGRAM ###

s = requests.Session()
s.auth = (os.getenv('at_user'), os.getenv('at_pass'))

# Set up a loop where users can choose what they'd like to do.
choice = ''
display_title_bar()
while choice != 'q':    
	
	print('\n[1] Run payroll')
	print('[2] Get tenant invoices')
	print('[3] Email tenant invoices')
	print('[q] Quit.')

	choice = input("\nPlease select an option: ")

	if choice == '1':
		display_title_bar()
		x = 1
		print('\n')
		for employee in employees:
			print(f"[{x}] {employee['name']}")
			x+=1
		choice2 = input("\nPlease select an employee: ")

		employee_data = next((item for item in employees if item['number'] == choice2), None)
		if employee_data == None:
			print("I didn't understand that choice. Try again")
		else:
			hours = float(input(f"\nHow many hours did {employee_data['name']} work?: "))
			print(f"Gross pay = ${employee_data['rate'] * hours}")
			description = input('Please add a description: ')
			data = payroll_data(hours, employee_data, description)
		r =	s.post('https://sewell.manager.io/api/QXphbGlhIEFwYXJ0bWVudHM/1d103fa7-6fc1-4951-811e-972968b842cc', data=json.dumps(data))
		display_title_bar()
		if r.status_code == 201:
			print('Success!')
		else:
			print('Something went wrong. Try again')
	elif choice == '2':
		display_title_bar()
		invoices = s.get('https://sewell.manager.io/api/QXphbGlhIEFwYXJ0bWVudHM/ad12b60b-23bf-4421-94df-8be79cef533e/index.json')
		for invoice in invoices.json():
			print(invoice)
			r = s.get(f'https://sewell.manager.io/sales-invoice-view.pdf?Key={invoice}&FileID=QXphbGlhIEFwYXJ0bWVudHM')
			if r.status_code == 200:
				print('Success!')
				open(f'{invoice}.pdf', 'wb').write(r.content)
	elif choice == '3':
		display_title_bar()
		print('This feature is not yet developed')
	elif choice == 'q':
		print('Goodbye')


