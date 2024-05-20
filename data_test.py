import mysql.connector
from werkzeug.security import generate_password_hash

# 数据库连接配置
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '123456',  # 根据实际情况更改
    'database': 'cromwell_garden_centre'
}

# 统一的密码和加密方式
plain_password = 'AA123456'
hashed_password = generate_password_hash(plain_password)

# 用户数据
users = [
    # Admins
    {'username': 'admin1', 'role': 'Admin', 'first_name': 'Alice', 'last_name': 'Smith', 'email': 'admin1@example.com', 'phone': '555-0101', 'address': '123 Admin St, City, Country'},
    {'username': 'admin2', 'role': 'Admin', 'first_name': 'Bob', 'last_name': 'Brown', 'email': 'admin2@example.com', 'phone': '555-0102', 'address': '124 Admin St, City, Country'},
    
    # Managers
    {'username': 'manager1', 'role': 'Manager', 'first_name': 'Charlie', 'last_name': 'Johnson', 'email': 'manager1@example.com', 'phone': '555-0201', 'address': '125 Manager St, City, Country'},
    {'username': 'manager2', 'role': 'Manager', 'first_name': 'David', 'last_name': 'Williams', 'email': 'manager2@example.com', 'phone': '555-0202', 'address': '126 Manager St, City, Country'},
    {'username': 'manager3', 'role': 'Manager', 'first_name': 'Eve', 'last_name': 'Jones', 'email': 'manager3@example.com', 'phone': '555-0203', 'address': '127 Manager St, City, Country'},
    {'username': 'manager4', 'role': 'Manager', 'first_name': 'Frank', 'last_name': 'Miller', 'email': 'manager4@example.com', 'phone': '555-0204', 'address': '128 Manager St, City, Country'},
    {'username': 'manager5', 'role': 'Manager', 'first_name': 'Grace', 'last_name': 'Davis', 'email': 'manager5@example.com', 'phone': '555-0205', 'address': '129 Manager St, City, Country'},
    
    # Staff
    {'username': 'staff1', 'role': 'Staff', 'first_name': 'Hannah', 'last_name': 'Garcia', 'email': 'staff1@example.com', 'phone': '555-0301', 'address': '130 Staff St, City, Country'},
    {'username': 'staff2', 'role': 'Staff', 'first_name': 'Isaac', 'last_name': 'Martinez', 'email': 'staff2@example.com', 'phone': '555-0302', 'address': '131 Staff St, City, Country'},
    {'username': 'staff3', 'role': 'Staff', 'first_name': 'Jack', 'last_name': 'Rodriguez', 'email': 'staff3@example.com', 'phone': '555-0303', 'address': '132 Staff St, City, Country'},
    {'username': 'staff4', 'role': 'Staff', 'first_name': 'Karen', 'last_name': 'Wilson', 'email': 'staff4@example.com', 'phone': '555-0304', 'address': '133 Staff St, City, Country'},
    {'username': 'staff5', 'role': 'Staff', 'first_name': 'Liam', 'last_name': 'Martinez', 'email': 'staff5@example.com', 'phone': '555-0305', 'address': '134 Staff St, City, Country'},
    {'username': 'staff6', 'role': 'Staff', 'first_name': 'Mia', 'last_name': 'Anderson', 'email': 'staff6@example.com', 'phone': '555-0306', 'address': '135 Staff St, City, Country'},
    {'username': 'staff7', 'role': 'Staff', 'first_name': 'Noah', 'last_name': 'Taylor', 'email': 'staff7@example.com', 'phone': '555-0307', 'address': '136 Staff St, City, Country'},
    {'username': 'staff8', 'role': 'Staff', 'first_name': 'Olivia', 'last_name': 'Thomas', 'email': 'staff8@example.com', 'phone': '555-0308', 'address': '137 Staff St, City, Country'},
    {'username': 'staff9', 'role': 'Staff', 'first_name': 'Paul', 'last_name': 'Hernandez', 'email': 'staff9@example.com', 'phone': '555-0309', 'address': '138 Staff St, City, Country'},
    {'username': 'staff10', 'role': 'Staff', 'first_name': 'Quinn', 'last_name': 'Moore', 'email': 'staff10@example.com', 'phone': '555-0310', 'address': '139 Staff St, City, Country'},
    
    # Customers
    *[
        {'username': f'customer{i}', 'role': 'Customer', 'first_name': f'Customer{i}', 'last_name': 'Last', 'email': f'customer{i}@example.com', 'phone': f'555-04{i:02d}', 'address': f'{140 + i} Customer St, City, Country'}
        for i in range(1, 31)
    ]
]

def insert_users(users):
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()

    try:
        for user in users:
            cursor.execute("INSERT INTO users (username, password_hashed, role) VALUES (%s, %s, %s)", 
                           (user['username'], hashed_password, user['role']))
            user_id = cursor.lastrowid

            if user['role'] == 'Customer':
                cursor.execute("INSERT INTO customers (user_id, first_name, last_name, email, phone, address) VALUES (%s, %s, %s, %s, %s, %s)", 
                               (user_id, user['first_name'], user['last_name'], user['email'], user['phone'], user['address']))
            else:
                cursor.execute("INSERT INTO staff (user_id, first_name, last_name, email, phone, role) VALUES (%s, %s, %s, %s, %s, %s)", 
                               (user_id, user['first_name'], user['last_name'], user['email'], user['phone'], user['role']))

        conn.commit()
        print("Users inserted successfully.")
    except mysql.connector.Error as err:
        conn.rollback()
        print(f"Error: {err}")
    finally:
        cursor.close()
        conn.close()

if __name__ == "__main__":
    insert_users(users)
