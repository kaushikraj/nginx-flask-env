# -*- coding: utf-8 -*-

import os
from flask import Flask

flaskapp = Flask(__name__)

r = "Hello World"
x = os.environ.get('ReturnData', None)
if x:
    r = x

@flaskapp.route('/', methods=['GET'])
def index():
    return r