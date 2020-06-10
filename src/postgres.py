#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
Func:
- Connect PostgreSQL Database.
- Import Data.

Usage:
> python postgres.py --input='YOUR DATA PATH' --dbname='YOUR DATABASE NAME' 
--host='YOUR HOST ADDRESS' --user='YOUR USER NAME' --pwd='YOUR PASSWORD' --tbname='YOUR TABLE NAME'
e.g.,
> python postgres.py --input=../bim.xyz --dbname=voxeldb --host=localhost 
--user=postgres --pwd=postgres --tabname=Dalton 

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


def create_db(user, password, dbname, tbname, host):
	'''
	:function:
		- Create a database and tables 
	:param host:
		- The host address	
	:param dbname:
		- The database name
	:param tbname:
		- The table name
	:param user:
		- The user name
	:param password:
		- The password
	:return conn:
		- The connection object
	'''
	conn = None
	try:
		print('Connecting to the PostgreSQL database ...')
		conn = psycopg2.connect(host=host, user=user, password=password)
		conn.set_isolation_level(psycopg2.extensions.ISOLATION_LEVEL_AUTOCOMMIT)
		cur = conn.cursor()

		print('PostgreSQL database version:')		# execute a statement
		cur.execute('SELECT version();')
		db_version = cur.fetchone()					# display the PostgreSQL database server version
		print(db_version)

		cur.execute('SELECT datname FROM pg_database;')
		list_database = cur.fetchall()
		if (dbname,) in list_database:
			print('{} Database already exists ...'.format(dbname))
		else:
			cur.execute('CREATE DATABASE ' + dbname + ';')
		cur.close()
		conn.close()

		conn = psycopg2.connect(host=host, database=dbname, user=user, password=password)
		cur = conn.cursor()
		cur.execute('CREATE EXTENSION IF NOT EXISTS POSTGIS;')
		# cur.execute("select exists(select relname from pg_class where relname='" + tbname + "');")
		# tb_exist = cur.fetchone()[0]
		# if tb_exist:
		# 	print('{} table already exists ...'.format(tbname))
		# else:
			# cur.execute('CREATE TABLE IF NOT EXISTS'+ tbname + 
			# 	' (voxid SERIAL PRIMARY KEY, x INTEGER NOT NULL, y INTEGER NOT NULL, z INTEGER NOT NULL, objNum INTEGER);')
		"""
		cur.execute('CREATE TABLE IF NOT EXISTS '+ tbname + 
			' (voxid serial PRIMARY KEY, x INTEGER NOT NULL, y INTEGER NOT NULL, z INTEGER NOT NULL, objNum INTEGER, materialpath VARCHAR(100));')
		"""
		cur.execute('CREATE TABLE IF NOT EXISTS '+ tbname + 
			' (voxid serial PRIMARY KEY, x INTEGER NOT NULL, y INTEGER NOT NULL, z INTEGER NOT NULL, classID INTEGER, buildID INTEGER NOT NULL);')
		cur.close()
		conn.commit()	# commit the changes		
	except (Exception, psycopg2.DatabaseError) as error:
		print(error)
	finally:
		return conn


def write_db(conn, tbname, file):
	'''
	:function:
		- Write xyz data into a database
	:param conn:
		- The connection object
	:param tbname:
		- The table name
	:param file:
		- The input file
	'''
	if conn is not None:
		try:
			cur = conn.cursor()
			"""
			xyzset = set()		# store xyz in each line from raw data file
			xMin, yMin, zMin = None, None, None
			xMax, yMax, zMax = None, None, None
			"""
			with open(file, mode='r', encoding='utf-8') as f:
				while(True):
					line = f.readline().strip()
					if not line:
						break
					x, y, z = int(line.split()[0]), int(line.split()[1]), int(line.split()[2])
					classID, buildID = int(line.split()[3]), int(line.split()[4])
					cur.execute("INSERT INTO " + tbname + 
						" (x, y, z, classID, buildID) VALUES({0}, {1}, {2}, {3}, {4})".format(
						int(x), int(y), int(z), int(classID), int(buildID)))
					"""
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

				cur.execute("INSERT INTO " + tbname + 
					" (x, y, z, objnum, materialpath) VALUES({0}, {1}, {2}, {3}, {4})".format(
						int(xRaw), int(yRaw), int(zRaw), int(objNum), str(materialPath)))
			"""
			cur.close()
			conn.commit()
		except (Exception, psycopg2.DatabaseError) as error:
			print(error)
		finally:
			conn.close()
			print('Database connection closed.')


if __name__=='__main__':
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

