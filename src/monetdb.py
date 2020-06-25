#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
Func:
- Connect MonetDB Database.
- Import Data.

Ref:
https://www.monetdb.org/Documentation/ClientInterfaces/PythonLibrary
https://pymonetdb.readthedocs.io/en/latest/

Usage:
> python monetdb.py --input=YOUR DATA PATH --dbname=YOUR DATABASE NAME 
--host='YOUR HOST ADDRESS' --user='YOUR USER NAME' --pwd='YOUR PASSWORD' --tbname='YOUR TABLE NAME'
e.g.,
> python monetdb.py --input=../bim.xyz --dbname=voxeldb --host=localhost 
--user=postgres --pwd=postgres --tabname=Dalton 

@date: June 25, 2020
@author: Wesley

"""

# Import necessary packages and modules.
from __future__ import print_function
from __future__ import division
import os
import sys
import argparse
# import psycopg2
import pymonetdb
import warnings
warnings.filterwarnings('ignore')

from platform import python_version

print('Python Version: ', python_version())


def create_db(user, password, dbname, tbname, host):


def write_db(conn, tbname, file):




if __name__ == '__main__':
	print('********** Initializing ArgumentParser and related arguments **********')
	parser = argparse.ArgumentParser(description='Argument list', formatter_class=argparse.ArgumentDefaultsHelpFormatter)
	parser.add_argument('--input', help='directory for input data')
	parser.add_argument('--user', help='username')
	parser.add_argument('--pwd', help='user password')
	parser.add_argument('--dbname', help='database name')
	parser.add_argument('--tbname', help='table name')
	parser.add_argument('--host', help='host address')
	args = parser.parse_args(sys.argv[1:])

	print('********** Creating Database **********')
	conn = create_db(args.user, args.pwd, args.dbname, args.tbname, args.host)

	print('********** Writing Database **********')
	write_db(conn, args.tbname, args.input)

