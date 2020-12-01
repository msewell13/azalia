import logging
from requests import codes, Response, Session
from typing import Tuple

log = logging.getLogger(__name__)


class APIClient:
    pass


class ManagerAPIClient(APIClient):
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

    def __init__(self, domain: str, auth: Tuple[str, str], token: str):
        self.auth = auth
        self.domain = domain
        self.token = token

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

    def get_object(self, object_id: str, is_collection=True) -> Response:
        """Performs a GET request for an object from an API endpoint."""
        resource = '/index.json' if is_collection else '.json'
        pathname = f'api/{self.token}/{object_id}{resource}'
        return self.get(pathname)
