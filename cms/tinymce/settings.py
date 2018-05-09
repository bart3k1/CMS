import os

from django.conf import settings
from django.contrib.staticfiles import finders

import enchant
enchant.dict_exists('pl')

DEFAULT_CONFIG = getattr(settings, 'TINYMCE_DEFAULT_CONFIG',
                         {
                            'plugins': "spellchecker",
                            'theme': "advanced",
                            'toolbar': "undo redo | styleselect | bold italic | link image",
                            'relative_urls': False,
                            'width': '100%',
                            'height': 500,

                          })

USE_SPELLCHECKER = getattr(settings, 'TINYMCE_SPELLCHECKER', True)

USE_COMPRESSOR = getattr(settings, 'TINYMCE_COMPRESSOR', False)

INCLUDE_JQUERY = getattr(settings, 'TINYMCE_INCLUDE_JQUERY', True)

USE_EXTRA_MEDIA = getattr(settings, 'TINYMCE_EXTRA_MEDIA', None)

USE_FILEBROWSER = getattr(settings, 'TINYMCE_FILEBROWSER',
                          'filebrowser' in settings.INSTALLED_APPS)

if 'staticfiles' in settings.INSTALLED_APPS or 'django.contrib.staticfiles' in settings.INSTALLED_APPS:
    JS_URL = getattr(settings, 'TINYMCE_JS_URL', os.path.join(settings.STATIC_URL, 'tiny_mce/tiny_mce.js'))
    JS_ROOT = getattr(settings, 'TINYMCE_JS_ROOT', finders.find('tiny_mce', all=False))
else:
    JS_URL = getattr(settings, 'TINYMCE_JS_URL', '{!s}js/tiny_mce/tiny_mce.js'.format(settings.MEDIA_URL))
    JS_ROOT = getattr(settings, 'TINYMCE_JS_ROOT', os.path.join(settings.MEDIA_ROOT, 'js/tiny_mce'))

JS_BASE_URL = JS_URL[:JS_URL.rfind('/')]
