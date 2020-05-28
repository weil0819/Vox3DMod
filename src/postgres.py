#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
- Managing PostgreSQL Databases
- Import & Export Data.
- Querying Data

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
import warnings
warnings.filterwarnings('ignore')

from platform import python_version

print('Python Version: ', python_version())


def create_db(db_name, user, password):
	'''
	:function:
		- Create a database
	:param db_name:
		- The database name
	:param user:
		- User name
	:param password:
		- Password
	'''


def drop_db(db_name, user, password):
	'''
	:function:
		- Drop a database
	:param db_name:
		- The database name
	:param user:
		- User name
	:param password:
		- Password
	'''


if __name__=='__main__':
	print('********** Initializing ArgumentParser and related arguments **********')
	arg_parser = create_arg_parser()
	args = arg_parser.parse_args(sys.argv[1:])


