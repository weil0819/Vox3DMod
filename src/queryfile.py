#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
Func:
- Python function for retrieving all the points in a given semantic class
- Python function for executing a basic range (i.e., rectangular) query

Usage:
> python query.py --input=../exp/dat/ --buildID=3

@date: 16 June, 2020
@author: Wesley

"""

# Import necessary packages and modules.
from __future__ import print_function
from __future__ import division
import os
import sys
import argparse
import pandas as pd
import feather
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


def get_build_unfragmented(dir, buildID):
	columns = ['x', 'y', 'z', 'objID', 'buildID']
	dir = os.path.join(dir, 'building.feather')	
	df = pd.read_feather(dir, columns=columns)
	df_build = df.loc[df['buildID']==int(buildID)]
	df_build.drop(['buildID'], axis=1, inplace=True)
	return df_build, len(df_build)


def get_build_fragmented(dir, buildID):
	columns = ['x', 'y', 'z', 'objID']
	dir = os.path.join(dir, dir_dict[int(buildID)], 'classmodel.feather')
	df_build = pd.read_feather(dir, columns=columns)
	return df_build, len(df_build)


def get_object(dir, buildID, objID):
	columns = ['x', 'y', 'z', 'objID']
	dir = os.path.join(dir, dir_dict[int(buildID)], 'classmodel.feather')
	df = pd.read_feather(dir, columns=columns)
	df_obj = df.loc[df['objID']==int(objID)]
	return df_obj, len(df_obj)


def get_rectangular(dir, buildID, xmin, xmax, ymin, ymax):
	restrict_x = ' x >= ' + repr(xmin) + ' & ' + ' x <= ' + repr(xmax)
	restrict_y = ' y >= ' + repr(ymin) + ' & ' + ' y <= ' + repr(ymax)
	restrict = restrict_x + ' & ' + restrict_y

	columns = ['x', 'y', 'z', 'objID']
	dir = os.path.join(dir, dir_dict[int(buildID)], 'classmodel.feather')
	df = pd.read_feather(dir, columns=columns)

	df_rec = df.query(restrict)
	return df_rec, len(df_rec)


def get_radial(dir, buildID, x, y, radius):
	xmin = x - radius
	xmax = x + radius
	ymin = y - radius
	ymax = y + radius
	restrict_x = ' x >= ' + repr(xmin) + ' & ' + ' x <= ' + repr(xmax)
	restrict_y = ' y >= ' + repr(ymin) + ' & ' + ' y <= ' + repr(ymax)
	restrict_pow = '(' + ' (x - ' + repr(x) + ')**2' + ' + ' + ' (y - ' + repr(y) + ')**2' + ') < ' + '(' + repr(radius**2) + ')'

	restrict = restrict_x + ' & ' + restrict_y + ' & ' + restrict_pow

	columns = ['x', 'y', 'z', 'objID']
	dir = os.path.join(dir, dir_dict[int(buildID)], 'classmodel.feather')
	df = pd.read_feather(dir, columns=columns)

	df_rec = df.query(restrict)
	return df_rec, len(df_rec)


if __name__=='__main__':
	print('********** Initializing ArgumentParser and related arguments **********')
	parser = argparse.ArgumentParser(description='Argument list', 
		formatter_class=argparse.ArgumentDefaultsHelpFormatter)
	parser.add_argument('--input', help='directory for input data')
	parser.add_argument('--buildID', help='building ID')
	parser.add_argument('--objID', help='object ID')
	parser.add_argument('--xmin', help='min x')
	parser.add_argument('--xmax', help='max x')
	parser.add_argument('--ymin', help='min y')
	parser.add_argument('--ymax', help='max y')
	parser.add_argument('--x', help='x')
	parser.add_argument('--y', help='y')
	parser.add_argument('--r', help='radius')
	args = parser.parse_args(sys.argv[1:])
	if os.path.exists(args.input):
		print('Input file exists')

	print('********** Q1: Retrieving all voxels in a given building semantic class **********')
	message1 = 'Loading "{}" voxels in unfragmented file'.format(dir_dict[int(args.buildID)])
	with stopwatch(message1):
		df, _ = get_build_unfragmented(args.input, args.buildID)

	message2 = 'Loading "{}" voxels in fragmented file'.format(dir_dict[int(args.buildID)])
	with stopwatch(message2):
		df, _ = get_build_fragmented(args.input, args.buildID)

	print('********** Q2: Retrieving all voxels refer to a given IFC class **********')
	message3 = 'Loading "{}" voxels in {} building'.format(int(args.objID), dir_dict[int(args.buildID)])
	with stopwatch(message3):
		df, _ = get_object(args.input, args.buildID, args.objID)

	print('********** Q3: Retrieving all voxels in a given building semantic class **********')
	message4 = 'Loading "{}" voxels in range [{}, {}] and [{}, {}]'.format(
		dir_dict[int(args.buildID)], int(args.xmin), int(args.xmax), int(args.ymin), int(args.ymax))
	with stopwatch(message4):
		df, _ = get_rectangular(args.input, args.buildID, int(args.xmin), int(args.xmax), int(args.ymin), int(args.ymax))

	print('********** Q4: Retrieving all voxels in a given building semantic class **********')
	message5 = 'Loading "{}" voxels centered at ({}, {}) with radius={}'.format(
		dir_dict[int(args.buildID)], int(args.x), int(args.y), float(args.r))
	with stopwatch(message5):
		df, _ = get_radial(args.input, args.buildID, int(args.x), int(args.y), float(args.r))

