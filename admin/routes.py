from flask import  flash, render_template,session,request,Flask,redirect,url_for
from . import admin_bp

@admin_bp.route('/')
@admin_bp.route('/dashboard', methods=['GET', 'POST'])
def dashboard():

    return render_template('dash_board_admin.html')
