# -*- coding: utf-8 -*-
# !/usr/bin/env python
"""
Created on: 2024/5/11 11:46
@file: __init__.py
@author: DH
"""
from flask import Blueprint

manager_bp = Blueprint(
    'manager_bp', __name__,
    static_folder="static",
    template_folder='templates',
)

from . import routes
