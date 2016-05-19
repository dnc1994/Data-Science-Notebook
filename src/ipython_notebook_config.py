#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Configuration file for ipython-notebook.

c = get_config()
c.NotebookApp.ip = '*'
c.NotebookApp.open_browser = False
c.NotebookApp.port = 8888

# Fix issue with using matplot lib via headless machine: https://github.com/conda/conda/issues/1051
c.IPKernelApp.matplotlib = 'inline'

# Whether to trust or not X-Scheme/X-Forwarded-Proto and X-Real-Ip/X-Forwarded-
# For headerssent by the upstream reverse proxy. Necessary if the proxy handles
# SSL
c.NotebookApp.trust_xheaders = True

# Supply overrides for the tornado.web.Application that the IPython notebook
# uses.
# c.NotebookApp.tornado_settings = {
#     'template_path':['/srv/ga/', '/srv/ipython/IPython/html',
#                      '/srv/ipython/IPython/html/templates'],
#     'headers': {
#         'Content-Security-Policy': "frame-ancestors 'self' https://*.jupyter.org https://jupyter.github.io https://*.tmpnb.org"
#     }
# }