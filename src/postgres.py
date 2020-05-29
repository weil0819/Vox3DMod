#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
- Connect PostgreSQL Database.
- Manage PostgreSQL Database.
- Import & Export Data.
- Query Data.

Usage:
> python postgres.py --db_name='YOUR DATABASE NAME' --user='YOUR USER NAME' --password='YOUR PASSWORD' --op='YOUR OPERATION'
E.g.,
> python postgres.py --db_name='voxeldb' --user='postgres' --password='postgres' --op='create'

@date: May 28, 2020
@author: Wesley

"""

# Import necessary packages and modules.
from __future__ import print_function
from __future__ import division
import os
import sys
import argparse
import psycopg2
import time
import contextlib
from config import config
import warnings
warnings.filterwarnings('ignore')

from platform import python_version

print('Python Version: ', python_version())


def connect():
	'''	
	:function:
		- Connect to the PostgreSQL database server.
	:return:
		- cursor object and connection object.
	'''
	conn = None
	try:
		params = config()						# read connection parameters

		print('Connecting to the PostgreSQL database ...')
		conn = psycopg2.connect(**params)		# connect to the PostgreSQL server

		cur = conn.cursor()						# create a cursor

		print('PostgreSQL database version:')	# execute a statement
		cur.execute('SELECT version()')

		db_version = cur.fetchone()				# display the PostgreSQL database server version
		print(db_version)

		cur.close()								# close the communication with the PostgreSQL
	except (Exception, psycopg2.DatabaseError) as error:
		print(error)
	finally:
		return conn


def connect(user, password, host='localhost'):
	'''
	:function:
		- Create a database
	:param host:
		- The host address	
	:param database:
		- The database name
	:param user:
		- The user name
	:param password:
		- The password
	'''
	try:
		print('Connecting to the PostgreSQL database ...')
		conn = psycopg2.connect("'host='" + host + "' user='" + user + "' password='" + password + "'")

		cur = conn.cursor()

		print('PostgreSQL database version:')	# execute a statement
		cur.execute('SELECT version()')

		db_version = cur.fetchone()				# display the PostgreSQL database server version
		print(db_version)

		cur.close()								# close the communication with the PostgreSQL
	except (Exception, psycopg2.DatabaseError) as error:
		print(error)
	finally:
		return conn


def disconnect(conn):
	'''
	:function:
		- Disconnect to the PostgreSQL database server.
	:param conn:
		- The connection object
	'''
	if conn is not None:
		conn.close()
		print('Database connection closed.')


def create_db(dbname):
	'''
	:function:
		- Create a database
	:param db_name:
		- The database name
	:param conn:
		- The connection object
	'''

	conn = connect()
	cur = conn.cursor()

	try:
		cur.execute('DROP DATABASE ' + dbname)
		print('Database already exists, replacing database')
	except:
		pass
	finally:
		cur.execute('CREATE DATABASE ' + dbname)
		cur.close()


def drop_db(dbname):
	'''
	:function:
		- Drop a database
	:param db_name:
		- The database name
	:param conn:
		- The connection object
	'''

	conn = connect()
	cur = conn.cursor()

	try:
		cur.execute('DROP DATABASE ' + dbname)
	except (Exception, psycopg2.DatabaseError) as error:
		print(error)
	finally:
		disconnect(conn)





if __name__=='__main__':
	print('********** Initializing ArgumentParser and related arguments **********')
	arg_parser = create_arg_parser()
	args = arg_parser.parse_args(sys.argv[1:])


