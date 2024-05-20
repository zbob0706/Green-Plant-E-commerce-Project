from flask import  flash, render_template,session,request,Flask,redirect,url_for
from . import customer_bp
from connect import get_db_connection, close_db_connection
from .forms import UpdateProfileForm
from functools import wraps


def login_required(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        if 'user_id' not in session:
            flash('Please log in to access this page.', 'danger')
            return redirect(url_for('home_bp.login'))
        return func(*args, **kwargs)
    return wrapper

@customer_bp.route('/dashboard')
@login_required
def dashboard():

    return render_template('profile.html')

@customer_bp.route('/profile', methods=['GET', 'POST'])
@login_required
def profile():
    user_id = session['user_id']
    
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("""
        SELECT u.username, c.first_name, c.last_name, c.email, c.phone, c.address
        FROM users u
        JOIN customers c ON u.user_id = c.user_id
        WHERE u.user_id = %s
    """, (user_id,))
    
    customer = cursor.fetchone()
    print("what happend")
    print(customer)
    close_db_connection(conn, cursor)
    
    form = UpdateProfileForm()
    if request.method == 'POST' and form.validate_on_submit():
        first_name = form.first_name.data
        last_name = form.last_name.data
        email = form.email.data
        phone = form.phone.data
        address = form.address.data
        
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("""
            UPDATE customers
            SET first_name = %s, last_name = %s, email = %s, phone = %s, address = %s
            WHERE user_id = %s
        """, (first_name, last_name, email, phone, address, user_id))
        
        conn.commit()
        close_db_connection(conn, cursor)
        
        flash('Profile updated successfully', 'success')
        return redirect(url_for('customer_bp.profile'))
    
    return render_template('profile_customer.html', customer=customer, form=form)