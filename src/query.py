#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
Func:
- Python function for retrieving all the points in a given semantic class
- Python function for executing a basic range (i.e., rectangular) query

Usage:
> python query.py --input=../exp/dat/ --buildID=3

@date: 11 June, 2020
@author: Wesley

"""

# Import necessary packages and modules.
from __future__ import print_function
from __future__ import division
import os
import sys
import argparse
import pandas as pd
# import feather
from config import stopwatch
import warnings
warnings.filterwarnings('ignore')

from platform import python_version

print('Python Version: ', python_version())

dir_dict = {
	1: 'BE',
	2: 'BlokcHouse',
	3: 'Dalton',
	4: 'Quadrangle',
	5: 'Roundhouse',
	6: 'SciThe'
}

def get_building_1(dir, buildID):
	columns = ['x', 'y', 'z', 'objID']
	df = pd.DataFrame(columns=columns)
	dir = os.path.join(dir, 'building.xyz')
	with open(dir, mode='r', encoding='utf-8') as f:
		while(True):
			line = f.readline().strip()
			if not line:
				break
			if int(line.split()[4]) == int(buildID):
				df.append({
					'x': line.split()[0],
					'y': line.split()[1],
					'z': line.split()[2],
					'objID': line.split()[3]
				}, ignore_index=True)

	return df

def get_building_2(dir, buildID):
	columns = ['x', 'y', 'z', 'objID']
	df = pd.DataFrame(columns=columns)	
	dir = os.path.join(dir, dir_dict[int(buildID)]+'.xyz')
	with open(dir, mode='r', encoding='utf-8') as f:
		while(True):
			line = f.readline().strip()
			if not line:
				break
			df.append({
				'x': line.split()[0],
				'y': line.split()[1],
				'z': line.split()[2],
				'objID': line.split()[3]
			}, ignore_index=True)

	return df

def get_building_3(dir, buildID):
	columns = ['x', 'y', 'z', 'objID', 'buildID']
	dir = os.path.join(dir, 'building.xyz')	
	df = pd.read_feather(dir, columns=columns)
	result = df.loc[df['buildID']==buildID]
	return result

def get_building_4(dir, buildID):
	columns = ['x', 'y', 'z', 'objID']
	dir = os.path.join(dir, dir_dict[int(buildID)]+'.xyz')
	df = pd.read_feather(dir, columns=columns)
	return df


if __name__=='__main__':
	print('********** Initializing ArgumentParser and related arguments **********')
	parser = argparse.ArgumentParser(description='Argument list', formatter_class=argparse.ArgumentDefaultsHelpFormatter)
	parser.add_argument('--input', help='directory for input data')
	parser.add_argument('--buildID', help='building ID')
	args = parser.parse_args(sys.argv[1:])
	if os.path.exists(args.input):
		print('Input file exists')

	print('********** Retrieving all voxels in a given building semantic class **********')
	
	# message4 = 'Loading "{}" voxels in seperate file through feather library'.format(dir_dict[int(args.buildID)])
	# with stopwatch(message4):
	# 	df = get_building_4(args.input, args.buildID)

	message2 = 'Loading "{}" voxels in seperate file through row scanning'.format(dir_dict[int(args.buildID)])
	with stopwatch(message2):
		get_building_2(args.input, args.buildID)

	# message3 = 'Loading "{}" voxels in integrared file through feather library'.format(dir_dict[int(args.buildID)])
	# with stopwatch(message3):
	# 	get_building_3(args.input, args.buildID)

	message1 = 'Loading "{}" voxels in integrared file through row scanning'.format(dir_dict[int(args.buildID)])
	with stopwatch(message1):
		get_building_1(args.input, args.buildID)

