import base64
import logging

from enum import Enum
from pathlib import Path
from requests import codes, Response, Session
from sendgrid import SendGridAPIClient
from sendgrid.helpers import mail
from typing import Any, List, Optional, Tuple
from yaml import load, Loader


NEW_LINE = '\r\n'
BUSINESS = 'azalia'
EMAIL_HTML_CONTENT = '''
    '<strong>Please see the attached document.</strong><br>
    If you have any questions please call.<br><br>
    Matt Sewell<br>
    509.863.3607'
'''

LOG_LEVEL = logging.INFO
LOG_FORMAT = '%(asctime)s - %(name)s - %(levelname)s - %(message)s'


class AttrDict(dict):
    def __getattr__(self, key: str) -> Optional[Any]:
        try:
            value = self.__getitem__(key)
        except KeyError:
            return None
        else:
            if value:
                if isinstance(value, dict):
                    return AttrDict(value)
                return value

    def __setattr__(self, key: str, value: Any):
        if not value:
            return
        if isinstance(value, dict):
            value = AttrDict(value)
        self[key] = value


class APIClient:
    HEADERS = {
        'User-Agent': (
            'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 '
            '(KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'
        )
    }
    REDIRECT_CODES = [
        codes.found,
        codes.moved_permanently,
        codes.permanent_redirect,
        codes.temporary_redirect,
    ]

    def __init__(self, domain: str, business_id: str, auth: Tuple[str, str]):
        self.auth = auth
        self.domain = domain
        self.business_id = business_id

        self.base_url = f'https://{domain}.manager.io'
        self.session = Session()

    def get(self, pathname: str, params: dict = None) -> Response:
        """Performs a GET request and gracefully handles redirects."""

        target_url = f'{self.base_url}/{pathname}'
        log.debug(f'GET {target_url}')

        kwargs = {'allow_redirects': False, 'auth': self.auth, 'headers': self.HEADERS}
        res = self.session.get(target_url, params=params, **kwargs)
        if res.status_code in self.REDIRECT_CODES:
            target_url = res.headers['Location']
            res = self.session.get(target_url, **kwargs)
            log.debug(f'redirect: GET {target_url}')

        # res.raise_for_status()
        return res

    def get_resource(self, resource_id: str, is_collection=True) -> Response:
        """Performs a GET request for a resource from an API endpoint."""
        resource = '/index.json' if is_collection else '.json'
        pathname = f'api/{self.business_id}/{resource_id}{resource}'
        return self.get(pathname)


class MenuAction(Enum):
    GetPayroll = '1'
    GetInvoice = '2'
    EmailInvoice = '3'
    GetTransactions = '4'
    CreateDocument = '5'

    @classmethod
    def get_labels(cls):
        return [
            (cls.GetPayroll, 'Run Payroll'),
            (cls.GetInvoice, 'Get Tenant Invoices'),
            (cls.EmailInvoice, 'Email Tenant Invoices'),
            (cls.GetTransactions, 'Get Bank Transactons'),
            (cls.CreateDocument, 'Create Documents'),
        ]


def configure_logging(level=LOG_LEVEL, log_format=LOG_FORMAT) -> None:
    """Configures the core attributes for the logger.

    :param level: the default log level, defaults to logging.INFO
    :type level: [type], optional
    """
    logging.basicConfig(format=log_format, level=level)


def display_title() -> None:
    title = 'Azalia Apartments'
    line = f"{NEW_LINE}{'*' * 50}{NEW_LINE}"
    print(f'{line}***{title:^44}***{line}')


def make_choice(choices: List[str], include_quit: bool = True) -> str:
    """Display a menu of choices, get and validate selected choice.

    :param choices: choices displayed within menu
    :type choices: List[str]
    :return: index for selected choice
    :rtype: int
    """
    display_title()

    menu_choices = list(enumerate(choices, start=1))
    if include_quit:
        menu_choices += [('q', 'Quit Menu')]

    choice_values = list(map(lambda e: str(e[0]), menu_choices))
    for idx, text in menu_choices:
        print(f'[{idx}] {text}')

    choice = None
    choice_range = f'1-{len(choices)}' + ('|q' if include_quit else '')
    while choice not in choice_values:
        if choice is None:
            choice = input(f'\nPlease select an option [{choice_range}]: ').strip()
        else:
            print('>> error: Invalid choice entered')
            choice = None

    return choice


def read_config(filename='config.yml'):
    """Read configuration."""
    config_file = Path(__file__).absolute().parent / filename
    if not config_file.exists():
        raise Exception(f'Configuration file not found: {filename}')

    with config_file.open('r') as fp:
        config = AttrDict(load(fp, Loader))

    # update templated api.url value
    config.api.url = config.api.url.format(api=config.api)
    return config


def send_email(email, attachment):
    with open(attachment, 'rb') as f:
        data = f.read()
        f.close()

    encoded_file = base64.b64encode(data).decode()
    attached_file = mail.Attachment(
        mail.Disposition('attachment'),
        mail.FileContent(encoded_file),
        mail.FileName(attachment),
        mail.FileType('application/pdf'),
    )

    message = mail.Mail(
        from_email='',
        to_email=email,
        subject='Your monthly invoice is ready ...',
        html_content=EMAIL_HTML_CONTENT,
    )

    message.attachment = attached_file
    try:
        sg = SendGridAPIClient(config.services.sendgrid.live_token)
        response = sg.send(message)
    except Exception as ex:
        log.error(ex)
    else:
        log.info(f'Email sent to: {email}')
        log.debug(f'status code: {response.status_code}')
        log.debug(f'headers: {response.headers}')
        log.debug(f'body: {response.body}')


# configure logger
configure_logging()
log = logging.getLogger(__name__)


# SET GLOBAL VARIABLES
# read and set config
config = read_config()


# instantiate api clients
api_client = APIClient(
    config.api.url,
    config.api.business[BUSINESS],
    (config.credential.username, config.credential.password),
)
