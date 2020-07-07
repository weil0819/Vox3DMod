#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
Integrate 6 BIM voxel into 1 building.xyz.
Integrate 52 GIS voxel into 1 building.xyz.

@date: June 10, 2020
@author: Wesley

"""

# Import necessary packages and modules.
from __future__ import print_function
from __future__ import division
import os
import sys
import argparse
import pandas as pd
from config import stopwatch
import warnings
warnings.filterwarnings('ignore')

from platform import python_version

print('Python Version: ', python_version())


def get_bim_unfragmented(build_list, dir, columns):
	"""
	Concat 6 bim voxels into 1 building.xyz
	"""
	ID = 1
	frames = []
	for build in build_list:
		filename = os.path.join(dir, build, 'classmodel.xyz')
		message = 'Opening "{}"'.format(filename)
		with stopwatch(message):			
			df = pd.read_csv(filename, sep=' ', names=columns)
			df['buildID'] = ID
			frames.append(df)
		ID = ID + 1

	output = os.path.join(dir, 'building.xyz')
	message = 'Writing "{}"'.format(output)
	with stopwatch(message):
		result = pd.concat(frames)	
		result.to_csv(output, sep=' ', header=False, index=False)


def get_gis_unfragmented(build_list, dir, columns):
	"""
	Concat 52 gis voxels into 1 building.xyz
	"""
	frames = []
	for build in build_list:
		filename = os.path.join(dir, build+'.xyz')
		message = 'Opening "{}"'.format(filename)
		with stopwatch(message):			
			df = pd.read_csv(filename, sep=' ', names=columns)
			frames.append(df)

	output = os.path.join(dir, 'building.xyz')
	message = 'Writing "{}"'.format(output)
	with stopwatch(message):
		result = pd.concat(frames)	
		result.to_csv(output, sep=' ', header=False, index=False)


if __name__=='__main__':
	print('********** Initializing ArgumentParser and related arguments **********')
	parser = argparse.ArgumentParser(description='Input data dir and output filename', formatter_class=argparse.ArgumentDefaultsHelpFormatter)
	parser.add_argument('--dir', help='directory for data')
	args = parser.parse_args(sys.argv[1:])
	if os.path.exists(args.dir):
		print('Input dir exists')

	print('********** Reading and Writing .xyz file **********')
	# build_list = ['BE', 'BlockHouse', 'Dalton', 'Quadrangle', 'Roundhouse', 'SciThe']
	# columns = ['x', 'y', 'z', 'objID']
	# get_bim_unfragmented(build_list, args.dir, columns)

	build_list = ['bld1', 'bld2', 'bld3', 'bld4', 'bld5', 'bld6', 'bld7', 'bld8', 'bld9', 
					'bld10', 'bld11', 'bld12', 'bld13', 'bld14', 'bld15', 'bld16', 'bld17', 'bld18', 'bld19', 
					'bld20', 'bld21', 'bld22', 'bld23', 'bld24', 'bld25', 'bld27', 'bld28', 'bld29', 
					'bld30', 'bld31', 'bld32', 'bld33', 'bld34', 'bld35', 'bld36', 'bld37', 'bld38', 'bld39', 
					'bld40', 'bld41', 'bld42', 'bld43', 'bld44', 'bld45', 'bld47', 'bld48', 'bld49', 
					'bld50', 'bld51', 'bld52', 'bld53', 'bld54']
	columns = ['x', 'y', 'z', 'buildID']
	get_gis_unfragmented(build_list, args.dir, columns)
