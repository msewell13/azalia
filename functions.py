from datetime import date


def payroll_data(hours, employee_data, description):

	data = {
		'Date': date.today().strftime("%Y/%m/%d"),
		'Employee': employee_data['id'],
		'Earnings': [
			{
				'Item': "4d89f708-f265-4cd7-8f6b-587ef38a2aae",
				'Units': hours,
				'Rate': employee_data['rate']
			}
		],
		'Deductions': [
			{
				'Item': '086775b0-3684-4a92-a2ce-7106798fce47', # Federal Taxes
				'Amount': round((hours * employee_data['rate']) * employee_data['fed_holding'],2)
			},
			{
				'Item': '744996a6-828b-4ac2-baa7-e3b81ee5e70b', # Medicare
				'Amount': round((hours * employee_data['rate']) * .0145,2)
			},
			{
				'Item': '2d2f6d15-26da-4b1c-9de0-ab7f713e0bae', # Social Security
				'Amount': round((hours * employee_data['rate']) * .0620,2)

			}
		],
		'Contributions': [
			{
				'Item': '9fa2e97e-46bc-48a2-a1c8-10df235c564f', # Employer Medicare
				'Amount': round((hours * employee_data['rate']) * .0145,2)
			},
			{
				'Item': 'cb50fb6b-c645-4fa8-8aab-0ebd7d4f398a', # Employer Socail Security
				'Amount': round((hours * employee_data['rate']) * .0620,2)
			}
		],
		'Description': description,
		'ShowTotalsForThePeriod': True,
		'TotalsPeriodStart': '2020-01-01'

	}

	return data

