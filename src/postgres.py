#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
Func:
- Connect PostgreSQL Database.
- Import Data.


Usage:
> python postgres.py --input='YOUR DATA PATH' --dbname='YOUR DATABASE NAME' --host='YOUR HOST ADDRESS' --user='YOUR USER NAME' --pwd='YOUR PASSWORD' --tbname='YOUR TABLE NAME'
e.g.,
> python postgres.py --input='../bim.xyz' --dbname='voxeldb' --host='localhost' --user='postgres' --pwd='postgres' --tabname='Dalton' 

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
import warnings
warnings.filterwarnings('ignore')

from platform import python_version

print('Python Version: ', python_version())


def create_db(user, password, dbname, tbname, host='localhost'):
	'''
	:function:
		- Create a database and tables 
	:param host:
		- The host address	
	:param dbname:
		- The database name
	:param tbname:
		- The table name
	:param user:
		- The user name
	:param password:
		- The password
	:return conn:
		- The connection object
	'''
	conn = None
	try:
		print('Connecting to the PostgreSQL database ...')
		conn = psycopg2.connect("host='" + host + "' user='" + user + "' password='" + password + "'")		
		cur = conn.cursor()

		print('PostgreSQL database version:')		# execute a statement
		cur.execute('SELECT version();')
		db_version = cur.fetchone()					# display the PostgreSQL database server version
		print(db_version)

		cur.execute('SELECT datname FROM pg_database;')
		list_database = cur.fetchall()
		if (dbname,) in list_database:
			print("'{}' Database already exists ...".format(dbname))
		else:
			cur.execute('CREATE DATABASE ' + dbname + ';')
		cur.close()
		con.close()

		conn = psycopg2.connect("host='" + host + "' database='" + dbname + "' user='" + user + "' password='" + password + "'")
		cur = conn.cursor()
		cur.execute('CREATE EXTENSION POSTGIS;')
		cur.execute('CREATE TABLE '+ tbname + ' (voxid SERIAL PRIMARY KEY, x INTEGER NOT NULL, y INTEGER NOT NULL, z INTEGER NOT NULL, objNum INTEGER;')
		cur.close()
		conn.commit()	# commit the changes		
	except (Exception, psycopg2.DatabaseError) as error:
		print(error)
	finally:
		# return conn
		if conn is not None:
			conn.close()

"""
def write_db(conn, tbname, file):
	'''
	:function:
		- Write xyz data into a database
	:param conn:
		- The connection object
	:param tbname:
		- The table name
	:param file:
		- The input file
	'''
	if conn is not None:
		try:
			cur = conn.cursor()
			with open(file, mode='r', encoding='utf-8') as f:
				while(True):
					line = f.readline().strip()
					if not line:
						break
					cur.execute("INSERT INTO " + tbname + " VALUES('{}')".format(line.split()[0], line.split()[1], line.split()[2], line.split()[3]))
		except (Exception, psycopg2.DatabaseError) as error:
	        print(error)
	    finally:
	        if conn is not None:
	            conn.close()
	            print('Database connection closed.')

"""

if __name__=='__main__':
	print('********** Initializing ArgumentParser and related arguments **********')
	parser = argparse.ArgumentParser(description='Argument list', formatter_class=argparse.ArgumentDefaultsHelpFormatter)
	parser.add_argument('--input', help='directory for input data')
	parser.add_argument('--user', help='username')
	parser.add_argument('--pwd', help='user password')
	parser.add_argument('--dbname', help='database name')
	parser.add_argument('--tbname', help='table name')
	parser.add_argument('--host', help='host address')
	args = parser.parse_args(sys.argv[1:])

	# ********** Creating Database **********
	conn = create_db(args.user, args.pwd, args.dbname, args.tbname, args.host)

	# ********** Writing Database **********
	# write_db(conn, args.tbname, args.input)



