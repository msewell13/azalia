# flake8: noqa
import argparse
import logging
import sys

import utils, functions as fn
from typing import List, Tuple


log = logging.getLogger(__name__)


def configure_logging(level) -> None:
    """Configures the core attributes for the logger.

    :param level: the default log level, defaults to logging.INFO
    :type level: [type], optional
    """
    log_format = '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
    logging.basicConfig(format=log_format, level=level)


def initiate_task():
    menu_items: List[Tuple(str, Callabel)] = [
        ('Run Payroll', lambda c: fn.select_employee()),
        ('Get Tenant Invoices', lambda c: fn.invoices(c)),
        ('Email Tenant Invoices', lambda c: fn.invoices(c)),
        ('Get Bank Transactions', lambda c: fn.get_transactions()),
        ('Create Document', lambda c: fn.create_documents()),
    ]

    labels = list(map(lambda i: i[0], menu_items))
    choice = utils.make_choice(labels)

    utils.display_title()
    if choice == utils.QUIT_ID:
        print('Goodbye\n')
        sys.exit(0)

    choice_value = int(choice) - 1
    func = menu_items[choice_value][1]

    try:
        func(choice)
    except Exception as ex:
        print(f'>> error: {ex}\n')
        sys.exit(1)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-d', '--debug', help='show debug logs', action='store_true')
    parser.add_argument('-l', '--log', help='enable logging', action='store_true')

    args = parser.parse_args(sys.argv[1:])
    if args.log:
        log_level = logging.DEBUG if args.debug else logging.INFO
        configure_logging(log_level)

    initiate_task()


main()
