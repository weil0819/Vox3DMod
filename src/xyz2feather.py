#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
Making an .obj file from a voxel.xyz.

Usage:
> python xyz2obj.py --input='YOUR INPUT DATA PATH' --output='YOUR OUTPUT DATA PATH'
E.g.,
> python xyz2obj.py --input='../data/bim/Dalton/classmodel.xyz' --output='../data/bim/Dalton/classmodel.obj'

@date: 11 June, 2020
@author: Wesley

"""

# Import necessary packages and modules.
from __future__ import print_function
from __future__ import division
import os
import sys
import argparse
import feather
import pandas as pd
from config import stopwatch
import warnings
warnings.filterwarnings('ignore')

from platform import python_version

print('Python Version: ', python_version())


if __name__=='__main__':
	print('********** Initializing ArgumentParser and related arguments **********')
	parser = argparse.ArgumentParser(description='Input and output data path', 
		formatter_class=argparse.ArgumentDefaultsHelpFormatter)
	parser.add_argument('--input', help='directory for input data')
	parser.add_argument('--output', help='directory for output data')
	args = parser.parse_args(sys.argv[1:])
	if os.path.exists(args.input):
		print('Input file exists')

	print('********** Opening .xyz file **********')
	columns = ['x', 'y', 'z', 'objID']
	message = 'Opening "{}"'.format(args.input)	# output message
	with stopwatch(message):
		df = pd.read_csv(args.input, columns=columns)

	print('********** Writing .feather file **********')
	message = 'Writing "{}"'.format(args.output)
	with stopwatch(message):
		df.to_feather(args.output)
