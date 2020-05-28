#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
Making an .obj file from a voxel.xyz.

Usage:
> python xyz2obj.py --input='YOUR INPUT DATA PATH' --output='YOUR OUTPUT DATA PATH'
E.g.,
> python xyz2obj.py --input='./data/bim/Dalton/classmodel.xyz' --output='./data/bim/Dalton/classmodel.obj'

@date: May 26, 2020
@author: Wesley

"""

# Import necessary packages and modules.
from __future__ import print_function
from __future__ import division
import os
import sys
import argparse
import time
import contextlib
import warnings
warnings.filterwarnings('ignore')

from platform import python_version

print('Python Version: ', python_version())


# Global variables.
V = {
	(-1,-1,-1): 0
}
idx = 0
XYZ = {
	0: '-1 -1 -1'
}

@contextlib.contextmanager
def stopwatch(message):    
    '''
    :function:
        - A context manager to print the run time of a block of code.
    :param message:
        - The message pertaining to the block of code to be executed. (str)
    :return:
        - A dictionary containing the message and elapsed time.
    '''
    
    t0 = time.time()
    try:
        yield
    finally:
        t1 = time.time()
        print('Total elapsed time for %s: %.3f' % (message, t1 - t0))
        return {
            'message': message,
            'elapsed_time': (t1 - t0)
        }


# Utility functions.
def create_arg_parser():
	'''
	:function:
		- Creates and returns the ArgumentParser object.
	:return 
		- An ArgumentParser object
	'''
	parser = argparse.ArgumentParser(description='Input and output data path', formatter_class=argparse.ArgumentDefaultsHelpFormatter)
	parser.add_argument('--input', help='directory for input data')
	parser.add_argument('--output', help='directory for output data')

	return parser

def vertex(x, y, z):
	'''
	:function:
		- Create vertex for .obj file
	:param x, y, z:
		- x,y,z coordinates
	:param V:
		- a map for <xyz, idx>
	:param idx:
		- latest index for x,y,z
	:return:
		- vertex number
	'''
	if (x,y,z) in V:
		return V.get((x,y,z))
	else:
		global idx
		idx = idx + 1
		V[(x,y,z)] = idx
		XYZ[idx] = str(x)+' '+str(y)+' '+str(z)
		return idx


def face(x1,y1,z1, x2,y2,z2, x3,y3,z3, x4,y4,z4):
	'''
	:function:
		- Create face according to 4 xyz
	:param x,y,z
		- four xyz coordinates
	:return:
		- a string representing one face
	'''
	v1 = vertex(x1,y1,z1)
	v2 = vertex(x2,y2,z2)
	v3 = vertex(x3,y3,z3)
	v4 = vertex(x4,y4,z4)
	return 'f'+' '+str(v1)+' '+str(v2)+' '+str(v3)+' '+str(v4) + '\n'


if __name__=='__main__':
	print('********** Initializing ArgumentParser and related arguments **********')
	arg_parser = create_arg_parser()
	args = arg_parser.parse_args(sys.argv[1:])
	if os.path.exists(args.input):
		print('Input file exists')

	print('********** Opening .xyz file **********')
	xyzlist = []	# store xyz in each line from raw data file
	message = 'Opening "{}"'.format(args.input)	# output message
	with stopwatch(message):
		with open(args.input, mode='r', encoding='utf-8') as f:
			while(True):
				line = f.readline().strip()
				if not line:
					break
				xyzlist.append([int(i) for i in line.split()[:3]])

	print('********** Writing .obj file **********')
	message = 'Writing "{}"'.format(args.output)
	with stopwatch(message):
		with open(args.output, mode='w', encoding='utf-8') as f:
			for line in xyzlist:
				x, y, z = line[0], line[1], line[2]
				if [x,y,z-1] not in xyzlist:
					f.write(face(x,y,z,   x,y+1,z,   x+1,y+1,z,   x+1,y,z))
				if [x,y,z+1] not in xyzlist:
					f.write(face(x,y,z+1, x+1,y,z+1, x+1,y+1,z+1, x,y+1,z+1))
				if [x,y-1,z] not in xyzlist:
					f.write(face(x,y,z,   x+1,y,z,   x+1,y,z+1,   x,y,z+1))
				if [x,y+1,z] not in xyzlist:
					f.write(face(x,y+1,z, x,y+1,z+1, x+1,y+1,z+1, x+1,y+1,z))
				if [x-1,y,z] not in xyzlist:
					f.write(face(x,y,z,   x,y,z+1,   x,y+1,z+1,   x,y+1,z))
				if [x+1,y,z] not in xyzlist:
					f.write(face(x+1,y,z, x+1,y+1,z, x+1,y+1,z+1, x+1,y,z+1))


