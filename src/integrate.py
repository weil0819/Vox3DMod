#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
Integrate 6 BIM voxel into 1 building.xyz.

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

build_list = ['BE', 'BlockHouse', 'Dalton', 'Quadrangle', 'Roundhouse', 'SciThe']
ID = 1
frames = []
columns = ['x', 'y', 'z', 'objID']

if __name__=='__main__':
	print('********** Initializing ArgumentParser and related arguments **********')
	parser = argparse.ArgumentParser(description='Input data dir and output filename', formatter_class=argparse.ArgumentDefaultsHelpFormatter)
	parser.add_argument('--input', help='directory for input data')
	parser.add_argument('--output', help='filename for output')
	args = parser.parse_args(sys.argv[1:])
	if os.path.exists(args.input):
		print('Input dir exists')

	print('********** Reading and Writing .xyz file **********')
	for build in build_list:
		filename = os.path.join(args.input, build, 'classmodel.xyz')
		message = 'Opening "{}"'.format(filename)
		with stopwatch(message):
			# with open(filename, mode='r', encoding='utf-8') as reader:
			# 	while(True):
			# 		line = reader.readline().strip()
			# 		if not line:
			# 			break
			# 		with open(args.output, mode='a+', encoding='utf-8') as writer:
			# 			writer.write(line + ' ' + str(ID) + '\n')
			df = pd.read_csv(filename, sep=' ', names=columns)
			df['buildID'] = ID
			frames.append(df)
		ID = ID + 1

	result = pd.concat(frames)
	result.to_csv(args.output, sep=' ', header=False, index=False)
