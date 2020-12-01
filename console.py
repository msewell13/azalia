# flake8: noqa
import logging
from functions import *


LOG_LEVEL = logging.DEBUG
LOG_FORMAT = '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
logging.basicConfig(format=LOG_FORMAT, level=LOG_LEVEL)

log = logging.getLogger(__name__)

# Set up a loop where users can choose what they'd like to do.
choice = ''
display_title_bar()
while choice != 'q':

    print('\n[1] Run payroll')
    print('[2] Get tenant invoices')
    print('[3] Email tenant invoices')
    print('[4] Get Bank Transactions')
    print('[5] Create Documents')
    print('[q] Quit.')

    choice = input("\nPlease select an option: ")

    if choice == '1':
        display_title_bar()
        select_employee()
    elif choice == '2':
        display_title_bar()
        invoices(choice)
        display_title_bar()
    elif choice == '3':
        display_title_bar()
        invoices(choice)
        display_title_bar()
    elif choice == '4':
        display_title_bar()
        get_transactions()
    elif choice == '5':
        display_title_bar()
        create_documents()
    elif choice == 'q':
        display_title_bar()
        print('Goodbye')
