# # These details are available on the first MySQL Workbench screen
import mysql.connector

def get_db_connection():
    conn = mysql.connector.connect(
        host='localhost',
        user='root',
        password='123456',
        database='cromwell_garden_centre'
    )
    return conn

def close_db_connection(conn, cursor):
    cursor.close()
    conn.close()
