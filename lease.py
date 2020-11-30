#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import os
import json
from os.path import join as opj
from os.path import dirname as opd
from jinja2 import Environment
from jinja2 import FileSystemLoader
from datetime import date
from num2words import num2words
import pdfkit


def new_lease(
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
):
    PATH = opd(os.path.abspath(__file__))
    TEMPLATES_DIR = './templates'
    TEMPLATE_FILENAME = 'lease_tn.tpl'

    OUTPUT_DIR = './'
    output_filename = opj(OUTPUT_DIR, TEMPLATE_FILENAME.replace('.tpl', '.html'))

    env = Environment(loader=FileSystemLoader(opj(PATH, TEMPLATES_DIR)))
    template = env.get_template(TEMPLATE_FILENAME)

    # s_date = date(2020, 11, 13)
    # e_date = date(2021, 11, 30)
    delta = lease_end - lease_start

    context = dict()
    context = {
        'first_name': fname,
        'last_name': lname,
        'address': address,
        'city_state_zip': city + ', ' + state + ' ' + zip_code,
        'email': email,
        'start_lease': lease_start,
        'end_lease': lease_end,
        'lease_term': delta.days,
        'rent_amount': "${:,.2f}".format(rent),
        'rent_spelled': num2words(
            rent, to='currency', lang='en', separator=' and', cents=True, currency='USD'
        ),
        'pro_rate_rent': "${:,.2f}".format((rent * 12 / 365) * (delta.days - 365)),
        'total_rent': "${:,.2f}".format((rent * 12) + ((rent * 12 / 365) * (delta.days - 365))),
        'deposit_amount': "${:,.2f}".format(deposit),
        'deposit_spelled': num2words(
            deposit, to='currency', lang='en', separator=' and', cents=True, currency='USD'
        ),
        'additional_occupants': add_occ,
        'late_fee': "${:,.2f}".format(rent * 0.1),
    }

    # let's render template and write out into HTML file
    with open(output_filename, 'w') as fp:
        fp.write(template.render(context))

    pdfkit.from_file('lease_tn.html', 'sample.pdf')
