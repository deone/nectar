from nectar.settings import *

DEBUG = TEMPLATE_DEBUG = False

ALLOWED_HOSTS = ['nectarbeautyhub.com', 'www.nectarbeautyhub.com']

STATICFILES_DIRS = (
    os.path.join(BASE_DIR, 'static'),
)

STATIC_URL = "http://nectarbeautyhub.com/static/"

MEDIA_ROOT = "/home/deone/webapps/nectar_media"

MEDIA_URL = "/media/"
