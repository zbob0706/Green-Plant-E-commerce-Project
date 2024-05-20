from flask import Flask
from home import home_bp
from admin import admin_bp
from staff import staff_bp
from manager import manager_bp
from customer import customer_bp




app = Flask(__name__,
            static_url_path='',
            static_folder='static',
            template_folder='templates')

app.config['SECRET_KEY'] = 'Group_AA'
app.config['WTF_CSRF_ENABLED'] = True


app.register_blueprint(admin_bp, url_prefix='/admin')
app.register_blueprint(home_bp, url_prefix='/')
app.register_blueprint(customer_bp, url_prefix='/customer')
app.register_blueprint(staff_bp, url_prefix='/staff')
app.register_blueprint(manager_bp, url_prefix='/manager')


    

if __name__ == "__main__":
   
    app.run(debug=True)
