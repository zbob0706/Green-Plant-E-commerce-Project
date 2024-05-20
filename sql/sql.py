# -*- coding: utf-8 -*-
# !/usr/bin/env python
"""
Created on: 2024/5/19 18:11
@file: sql.py
@author: DH
"""
import mysql.connector

import connect


def get_connection():
    connection = mysql.connector.connect(user=connect.dbuser,
                                         password=connect.dbpass, host=connect.dbhost,
                                         auth_plugin='mysql_native_password',
                                         database=connect.dbname, autocommit=True)
    return connection


def get_cursor():
    connection = get_connection()
    cursor = connection.cursor()
    return cursor, connection


def get_customers_list():
    cursor, connection = get_cursor()
    cursor.execute(f"SELECT * FROM customers")
    columns = [col[0] for col in cursor.description]
    results = cursor.fetchall()
    cursor.close()
    connection.close()
    return_results = list()
    for result in results:
        result_dict = dict(zip(columns, result))
        print(result_dict)
        return_results.append(result_dict)
    return return_results


def get_staff_list():
    cursor, connection = get_cursor()
    cursor.execute(f"SELECT * FROM staff WHERE role = 'Staff'")
    columns = [col[0] for col in cursor.description]
    results = cursor.fetchall()
    cursor.close()
    connection.close()
    return_results = list()
    for result in results:
        result_dict = dict(zip(columns, result))
        print(result_dict)
        return_results.append(result_dict)
    return return_results
