#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
Func:
- Connect MonetDB Database, using the default 'demo'
- Import Data.

Ref:
https://www.monetdb.org/Documentation/ClientInterfaces/PythonLibrary
https://pymonetdb.readthedocs.io/en/latest/

Usage:
> python monetdb.py --input=YOUR DATA PATH  --tbname='YOUR TABLE NAME'
e.g.,
> python monetdb.py --input=../data/bim/SciThe/classmodel.xyz --tbname=SciThe 

@date: June 25, 2020
@author: Wesley

"""

# Import necessary packages and modules.
from __future__ import print_function
from __future__ import division
import os
import sys
import argparse
import pymonetdb
import warnings
warnings.filterwarnings('ignore')

from platform import python_version

print('Python Version: ', python_version())


def create_db(tbname):
	'''
	'''
	conn = None
	try:
		# print('Connecting to the MonetDB database ...')
		# set up a connection. arguments below are the defaults
		conn = pymonetdb.connect(username="monetdb", password="monetdb", hostname="localhost", database="demo")
		# create a cursor
		cur = conn.cursor()
		# create a table
		cur.execute('CREATE TABLE IF NOT EXISTS '+ tbname + 
			' (voxid SERIAL, x INTEGER NOT NULL, y INTEGER NOT NULL, z INTEGER NOT NULL, objID INTEGER);')

		# close connection
		cur.close()
		conn.commit()
	except (Exception, pymonetdb.exceptions.DatabaseError) as error:
		print(error)
	finally:
		return conn


def write_db(conn, tbname, file):
	'''
	'''
	if conn is not None:
		try:
			cur = conn.cursor()
			with open(file, mode='r', encoding='utf-8') as f:
				while(True):
					line = f.readline().strip()
					if not line:
						break
					x, y, z = int(line.split()[0]), int(line.split()[1]), int(line.split()[2])
					objID = int(line.split()[3])
					cur.execute("INSERT INTO " + tbname + 
						" (x, y, z, objID) VALUES({0}, {1}, {2}, {3})".format(
							int(x), int(y), int(z), int(objID)))
			cur.close()
			conn.commit()
		except (Exception, pymonetdb.exceptions.DatabaseError) as error:
			print(error)
		finally:
			conn.close()
			print('Database connection closed.')


if __name__ == '__main__':
	print('********** Initializing ArgumentParser and related arguments **********')
	parser = argparse.ArgumentParser(description='Argument list', formatter_class=argparse.ArgumentDefaultsHelpFormatter)
	parser.add_argument('--input', help='directory for input data')
	parser.add_argument('--tbname', help='table name')
	args = parser.parse_args(sys.argv[1:])

	print('********** Creating Database **********')
	conn = create_db(args.tbname)

	print('********** Writing Database **********')
	write_db(conn, args.tbname, args.input)

