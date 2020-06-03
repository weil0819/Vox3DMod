#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
Making an .oct file from a voxel.xyz.

Usage:
> python xyz2oct.py --input='YOUR INPUT DATA PATH' --output='YOUR OUTPUT DATA PATH'
E.g.,
> python xyz2oct.py --input='../data/bim/Dalton/classmodel.xyz' --output='../data/bim/Dalton/classmodel.oct'

@date: June 2, 2020
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


def translation_and_scaling(xMin, xMax, yMin, yMax, zMin, zMax, depth):
	'''
	:function:
		- Calculate BBox translation and scaling.
		- The translation is necessary to define the lower left corner of the front of 
		the bounding box as the origin of the point cloud. 
		- The scaling is needed so that our code fits to any kind and size of point cloud, 
		and so that every cell which we define has coordinates represented by integers between 0 and 2n.
	:param xMin, xMax, yMin, yMax, zMin, zMax:
		- min and max boundary
	:param depth:
		- The Octree depth
	:return translateX, translateY, translateZ, scale:
		- translation and scaling
	'''
	# Check bounding to calculate scaling factor.				
	lenX = xMax - xMin
	lenY = yMax - yMin
	lenZ = zMax - zMin

	# Putting the BBox min coordinates at 0.
	if xMin < 0:
		translateX = abs(xMin)
	elif (xMin > 0): 
		translateX = 0 - xMin
	else:
		translateX = 0

	if (yMin < 0):
		translateY = abs(yMin)
	elif (yMin > 0): 
		translateY = 0 - yMin
	else:
		translateY = 0

	if (zMin < 0):
		translateZ = abs(zMin)
	elif (zMin > 0): 
		translateZ = 0 - zMin
	else:
		translateZ = 0

	if (lenX != 2**depth) or (lenY != 2**depth) or (lenZ != 2**depth):
		# if scaling is required we take the maximum domain of the point cloud for scaling
		maxDomain = max([lenX, lenY, lenZ])
		scale = 2**depth / maxDomain
	else: 
		# if no scaling is required we set the scale to 1
		scale = 1

	return translateX, translateY, translateZ, scale


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
	xyzset = set()		# store xyz in each line from raw data file
	xMin, yMin, zMin = None, None, None
	xMax, yMax, zMax = None, None, None
	message = 'Opening "{}"'.format(args.input)	# output message
	with stopwatch(message):
		with open(args.input, mode='r', encoding='utf-8') as f:
			while(True):
				line = f.readline().strip()
				if not line:
					break				
				x, y, z, objNum = int(line.split()[0]), int(line.split()[1]), int(line.split()[2]), int(line.split()[3])
				xyzset.add(tuple(int(i) for i in line.split()))
				if xMin is None:
					xMin, yMin, zMin = x, y, z
					xMax, yMax, zMax = x, y, z
				if x < xMin:
					xMin = x
				if y < yMin:
					yMin = y
				if z < zMin:
					zMin = z
				if x > xMax:
					xMax = x
				if y > yMax:
					yMax = y
				if z > zMax:
					zMax = z
				
	depth = 8
	translateX, translateY, translateZ, scale = translation_and_scaling(xMin, xMax, yMin, yMax, zMin, zMax, depth)
	print('********** Writing .obj file **********')
	message = 'Writing "{}"'.format(args.output)
	with stopwatch(message):
		with open(args.output, mode='w', encoding='utf-8') as f:
			for line in xyzset:
				xRaw, yRaw, zRaw = line[0], line[1], line[2]
				objNum = line[3]
				# Scaling coordinates.
				x = (xRaw + translateX) * scale
				y = (yRaw + translateY) * scale
				z = (zRaw + translateZ) * scale

				# Snap point to leaf node by converting float to integer and truncate towards 0.
				leafNode = (int(x), int(y), int(z))

				# Retrieve material path from box.
				materialPath = get_material_path(depth, leafNode[0], leafNode[1], leafNode[2])

				# Write material path into .oct file.
				f.write(str(xRaw)+' '+str(yRaw)+' '+str(zRaw)+' '+str(objNum)+' '+str(materialPath)+'\n')

