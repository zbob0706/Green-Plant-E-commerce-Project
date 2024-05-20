from flask import Blueprint, render_template, redirect, url_for, flash, session,request
from werkzeug.security import generate_password_hash, check_password_hash
from .forms import RegistrationForm, LoginForm, UpdatePasswordForm
from connect import get_db_connection, close_db_connection
from . import home_bp
import mysql.connector
from functools import wraps


@home_bp.route('/')
def index():
    return render_template('index.html')

@home_bp.route('/register', methods=['GET', 'POST'])
def register():
    form = RegistrationForm()
    if form.validate_on_submit():
        username = form.username.data
        email = form.email.data
        password = generate_password_hash(form.password.data)
        first_name = form.first_name.data
        last_name = form.last_name.data
        phone = form.phone.data
        address = form.address.data
        role = form.role.data

       
        conn = get_db_connection()
        cursor = conn.cursor()

        try:
            cursor.execute("INSERT INTO users (username, password_hashed, role) VALUES (%s, %s, %s)", (username, password, role))
            user_id = cursor.lastrowid

            if role == 'Customer':
                cursor.execute("INSERT INTO customers (user_id, first_name, last_name, email, phone, address) VALUES (%s, %s, %s, %s, %s, %s)", (user_id, first_name, last_name, email, phone, address))
            else:
                cursor.execute("INSERT INTO staff (user_id, first_name, last_name, email, phone, role) VALUES (%s, %s, %s, %s, %s, %s)", (user_id, first_name, last_name, email, phone, role))

            conn.commit()
            flash('Registration successful! Please log in.', 'success')
            return redirect(url_for('home_bp.login'))
        except mysql.connector.Error as err:
            conn.rollback()
            flash(f'Error: {err}', 'danger')
        finally:
            close_db_connection(conn, cursor)

    return render_template('register.html', form=form)


@home_bp.route('/login', methods=['GET', 'POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        username = form.username.data
        password = form.password.data

       
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)

        cursor.execute("SELECT * FROM users WHERE username = %s", (username,))
        user = cursor.fetchone()

        if user and check_password_hash(user['password_hashed'], password):
            session['user_id'] = user['user_id']
            session['username'] = user['username']
            session['role'] = user['role']
            flash('Login successful!', 'success')
            print(f"User {username} ")
            print("see what happend")
            
            if user['role'] == 'Customer':
                return redirect(url_for('customer_bp.dashboard'))
            elif user['role'] == 'Staff':
                return redirect(url_for('staff_bp.dashboard'))
            elif user['role'] == 'Manager':
                return redirect(url_for('manager_bp.dashboard'))
            elif user['role'] == 'Admin':
                return redirect(url_for('admin_bp.dashboard'))
        else:
            flash('Invalid username or password', 'danger')

        close_db_connection(conn, cursor)

    return render_template('login.html', form=form)


def login_required(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        if 'user_id' in session:
            return func(*args, **kwargs)
        else:
            flash('Please log in to access this page.', 'danger')
            return redirect(url_for('home_bp.login'))
    return wrapper

def get_all_categories():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM categories")
    categories = cursor.fetchall()
    close_db_connection(conn, cursor)
    return categories


def get_product_by_id(product_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM products WHERE product_id = %s", (product_id,))
    product = cursor.fetchone()
    close_db_connection(conn, cursor)
    return product


def get_all_products():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("""
        SELECT 
            product_id,
            name, 
            price, 
            image, 
            stock_quantity,
            CASE 
                WHEN stock_quantity = 0 THEN 'Out of Stock' 
                ELSE 'In Stock' 
            END AS availability
        FROM products
    """)
    products = cursor.fetchall()
    close_db_connection(conn, cursor)
    return products

@home_bp.route('/products', methods=['GET'])
def products():
    sort_by = request.args.get('sort_by', 'name')
    filter_by_stock = request.args.get('filter_by_stock', 'all')
    
    products = get_all_products()
    
    if filter_by_stock == 'in_stock':
        products = [product for product in products if product['stock_quantity'] > 0]
    elif filter_by_stock == 'out_of_stock':
        products = [product for product in products if product['stock_quantity'] == 0]
    
    if sort_by == 'price':
        products = sorted(products, key=lambda x: x['price'])
    elif sort_by == 'name':
        products = sorted(products, key=lambda x: x['name'])
    elif sort_by == 'availability':
        products = sorted(products, key=lambda x: x['availability'])
    
    return render_template('products.html', products=products)

@home_bp.route('/categories')
def categories():
    categories = get_all_categories()
    return render_template('categories.html', categories=categories)

@home_bp.route('/category/<int:category_id>')
def category_products(category_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("""
        SELECT 
            product_id,
            name, 
            price, 
            image, 
            stock_quantity,
            CASE 
                WHEN stock_quantity = 0 THEN 'Out of Stock' 
                ELSE 'In Stock' 
            END AS availability
        FROM products
        WHERE category_id = %s
    """, (category_id,))
    products = cursor.fetchall()
    close_db_connection(conn, cursor)
    return render_template('products.html', products=products)





@home_bp.route('/view_cart')
def view_cart():
    cart = session.get('cart', [])
    total = sum(float(item['total']) for item in cart)  
    return render_template('cart.html', cart=cart, total=total)

@home_bp.route('/add_to_cart/<int:product_id>', methods=['POST'])
def add_to_cart(product_id):
    quantity = int(request.form['quantity'])
    
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM products WHERE product_id = %s", (product_id,))
    product = cursor.fetchone()
    close_db_connection(conn, cursor)
    
    if not product:
        flash('Product not found', 'danger')
        return redirect(url_for('home_bp.products'))
    
    item = {
        'product_id': product['product_id'],
        'name': product['name'],
        'price': float(product['price']),  # 确保 price 是浮点数
        'quantity': quantity,
        'total': float(product['price']) * quantity  # 确保 total 是浮点数
    }
    
    cart = session.get('cart', [])
    cart.append(item)
    session['cart'] = cart
    
    flash('Item added to cart', 'success')
    return redirect(url_for('home_bp.view_cart'))


@home_bp.route('/checkout', methods=['GET', 'POST'])
def checkout():
    if request.method == 'POST':
        delivery_option = request.form.get('delivery_option')
        delivery_cost = 0
        if delivery_option == 'standard':
            delivery_cost = 10
        elif delivery_option == 'oversized':
            delivery_cost = 100

        total = sum(item['total'] for item in session['cart']) + delivery_cost

        # Stripe payment processing
        stripe.Charge.create(
            amount=int(total * 100),  # Stripe works with cents
            currency='usd',
            source=request.form['stripeToken'],
            description='Cromwell Garden Centre Order'
        )

        # Create order
        conn = get_db_connection()
        cursor = conn.cursor()

        try:
            cursor.execute("""
                INSERT INTO orders (customer_id, total_amount, date, status, shipping_method, shipping_cost, is_paid, payment_method, payment_date) 
                VALUES (%s, %s, CURDATE(), 'Prepared', %s, %s, TRUE, 'Credit Card', CURDATE())
            """, (session['user_id'], total, delivery_option, delivery_cost))

            order_id = cursor.lastrowid

            for item in session['cart']:
                cursor.execute("""
                    INSERT INTO order_items (order_id, product_id, quantity, price_at_time_of_order)
                    VALUES (%s, %s, %s, %s)
                """, (order_id, item['product_id'], item['quantity'], item['price']))

            conn.commit()

            # Clear cart after successful payment
            session.pop('cart', None)

            return render_template('order_confirmation.html', total=total)
        except mysql.connector.Error as err:
            conn.rollback()
            flash(f'Error: {err}', 'danger')
        finally:
            close_db_connection(conn, cursor)

    return render_template('checkout.html')


@home_bp.route('/product/<int:product_id>')
def product_detail(product_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM products WHERE product_id = %s", (product_id,))
    product = cursor.fetchone()
    close_db_connection(conn, cursor)
    return render_template('product_detail.html', product=product)




@home_bp.route('/update_password', methods=['GET', 'POST'])
@login_required
def update_password():
    form = UpdatePasswordForm()
    if form.validate_on_submit():
        current_password = form.current_password.data
        new_password = form.new_password.data

       
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM users WHERE user_id = %s", (session['user_id'],))
        user = cursor.fetchone()

        if user and check_password_hash(user['password_hashed'], current_password):
            hashed_password = generate_password_hash(new_password)
            cursor.execute("UPDATE users SET password_hashed = %s WHERE user_id = %s", (hashed_password, session['user_id']))
            conn.commit()
            flash('Your password has been updated!', 'success')
            
            
            if user['role'] == 'Customer':
                return redirect(url_for('customer_bp.dashboard'))
            elif user['role'] == 'Staff':
                return redirect(url_for('staff_bp.dashboard'))
            elif user['role'] == 'Manager':
                return redirect(url_for('manager_bp.dashboard'))
            elif user['role'] == 'Admin':
                return redirect(url_for('admin_bp.dashboard'))
        else:
            flash('Current password is incorrect.', 'danger')

        close_db_connection(conn, cursor)

    return render_template('update_password.html', form=form)
