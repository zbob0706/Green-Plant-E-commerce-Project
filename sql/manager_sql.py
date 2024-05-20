# -*- coding: utf-8 -*-
# !/usr/bin/env python
"""
Created on: 2024/5/19 18:14
@file: manager_sql.py
@author: HD
"""
from sql.sql import get_cursor


def get_manager_from_user_id(user_id: int):
    cursor, connection = get_cursor()
    cursor.execute(f"SELECT * FROM staff WHERE user_id = {user_id} AND role = 'Manager'")
    columns = [col[0] for col in cursor.description]
    result = cursor.fetchone()
    cursor.close()
    connection.close()
    if result:
        result_dict = dict(zip(columns, result))
        return result_dict
    return {}


def get_manager_from_staff_id(staff_id: int):
    cursor, connection = get_cursor()
    cursor.execute(f"SELECT * FROM staff WHERE staff_id = {staff_id} AND role = 'Manager'")
    columns = [col[0] for col in cursor.description]
    result = cursor.fetchone()
    cursor.close()
    connection.close()
    if result:
        result_dict = dict(zip(columns, result))
        return result_dict
    return {}


def update_manager_from_user_id(user_id, form_data):
    manager_info = get_manager_from_user_id(user_id)
    if len(manager_info):
        raise ValueError('user_id incorrect')
    cursor, connection = get_cursor()
    sql = f"UPDATE staff SET "
    update_values = []
    for key, value in form_data.items():
        if 'id' not in key:
            sql += f"{key} = %s, "
            update_values.append(value)
    sql = sql.rstrip(', ')
    sql += " WHERE id = %s"
    update_values.append(user_id)
    cursor.execute(sql, update_values)
    cursor.close()
    connection.close()
    return True
