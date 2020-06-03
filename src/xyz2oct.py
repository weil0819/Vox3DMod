#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
Making an .oct file from a voxel.xyz.

Usage:
> python xyz2oct.py --input='YOUR INPUT DATA PATH' --output='YOUR OUTPUT DATA PATH'
E.g.,
> python xyz2oct.py --input='../data/bim/Dalton/classmodel.xyz' --output='../data/bim/Dalton/classmodel.oct'

@date: June 1, 2020
@author: Wesley

"""

# Import necessary packages and modules.
from __future__ import print_function
from __future__ import division
import os
import sys
import argparse
from config import stopwatch
import warnings
warnings.filterwarnings('ignore')

from platform import python_version

print('Python Version: ', python_version())

def get_material_path(depth, x, y, z):
	'''
	:function:
		- Calculate material path of a leaf node in an octree
	:param depth:
		- Octree depth
	:param x,y,z:
		- The x,y,z coordinates
	'''
	ocKey = ''
	for i in range(depth, 0, -1):
		digit = 0
		mask = 1 << (i-1)
		if (x & mask) != 0:
			digit += 1
		if (y & mask) != 0:
			digit += 2
		if (z & mask) != 0:
			digit += 4
		ocKey +=str(digit)
	return ocKey



if __name__=='__main__':
	print('********** Initializing ArgumentParser and related arguments **********')
	parser = argparse.ArgumentParser(description='Input and output data path', formatter_class=argparse.ArgumentDefaultsHelpFormatter)
	parser.add_argument('--input', help='directory for input data')
	parser.add_argument('--output', help='directory for output data')
	args = parser.parse_args(sys.argv[1:])
	if os.path.exists(args.input):
		print('Input file exists')

	print('********** Opening .xyz file **********')
	xyzset = set()		# store xyz in each line from raw data file
	message = 'Opening "{}"'.format(args.input)	# output message
	with stopwatch(message):
		with open(args.input, mode='r', encoding='utf-8') as f:
			while(True):
				line = f.readline().strip()
				if not line:
					break
				xyzset.add(tuple(int(i) for i in line.split()[:3]))

	print('********** Writing .obj file **********')
	message = 'Writing "{}"'.format(args.output)
	with stopwatch(message):
		with open(args.output, mode='w', encoding='utf-8') as f:


