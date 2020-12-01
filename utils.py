import base64
import logging
import os

from sendgrid import SendGridAPIClient
from sendgrid.helpers.mail import Attachment, Disposition, FileContent, FileName, FileType, Mail


log = logging.getLogger(__name__)

SENDGRID_APITOKEN='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'
EMAIL_HTML_CONTENT='''
    '<strong>Please see the attached document.</strong><br>
    If you have any questions please call.<br><br>
    Matt Sewell
    <br>509.863.3607'
'''

def send_email(email, attachment):
    with open(attachment, 'rb') as f:
        data = f.read()
        f.close()

    encoded_file = base64.b64encode(data).decode()
    attached_file = Attachment(
        Disposition('attachment'),
        FileContent(encoded_file),
        FileName(attachment),
        FileType('application/pdf'),
    )

    message = Mail(
        from_email='Matt@PythonFinancial.com',
        to_emails=email,
        subject='Your monthly invoice is ready...',
        html_content=EMAIL_HTML_CONTENT,
    )

    message.attachment = attached_file

    try:
        sg = SendGridAPIClient(SENDGRID_APITOKEN)
        response = sg.send(message)
        log.debug(f'status code: {response.status_code}')
        log.debug(f'headers: {response.headers}')
        log.debug(f'body: {response.body}')
    except Exception as ex:
        log.error(ex)
