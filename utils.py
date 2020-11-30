import os
import base64
from sendgrid import SendGridAPIClient
from sendgrid.helpers.mail import Attachment, Disposition, FileContent, FileName, FileType, Mail


def send_email(email, attachment):
    message = Mail(
        from_email='Matt@PythonFinancial.com',
        to_emails=email,
        subject='Your monthly invoice is ready...',
        html_content='<strong>Please see the attached document.</strong><br>If you have any questions please call.<br><br>Matt Sewell<br>509.863.3607',
    )

    with open(attachment, 'rb') as f:
        data = f.read()
        f.close()
    encoded_file = base64.b64encode(data).decode()

    attachedFile = Attachment(
        FileContent(encoded_file),
        FileName(attachment),
        FileType('application/pdf'),
        Disposition('attachment'),
    )
    message.attachment = attachedFile

    try:
        sg = SendGridAPIClient(
            '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'
        )
        response = sg.send(message)
        print(response.status_code)
        print(response.body)
        print(response.headers)
    except Exception as e:
        print(e.message)
