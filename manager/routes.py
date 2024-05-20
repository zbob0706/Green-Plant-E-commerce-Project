# -*- coding: utf-8 -*-
# !/usr/bin/env python
"""
Created on: 2024/5/11 11:46
@file: routes.py
@author: DH
"""

from flask import flash, render_template, session, request, redirect, url_for
from . import manager_bp


@manager_bp.route('/')
def index():
    return redirect(url_for("manager_bp.dashboard"))


@manager_bp.route('/dashboard')
def dashboard():
    return render_template('manager_dashboard.html')


# @manager_bp.route('/profile', methods=['GET'])
# def profile():
#     return render_template('manager_profile.html')

# @manager_bp.route('/test')
# def test():
#     return render_template('manager_index.html')
