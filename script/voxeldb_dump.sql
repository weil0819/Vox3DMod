/* ---------------------------------------------------- */
/*  Created On : 26-June-2020 	             			*/
/*  DBMS       : PostgreSQL 			     			*/
/*  Usage      : voxeldb=# \i C:/voxeldb_dump.sql       */
/*  Author     : Wesley      			     			*/
/* ---------------------------------------------------- */

/* Add PostGIS Extension */
CREATE EXTENSION IF NOT EXISTS POSTGIS;
CREATE EXTENSION IF NOT EXISTS pointcloud;
CREATE EXTENSION IF NOT EXISTS pointcloud_postgis;

INSERT INTO pointcloud_formats (pcid, srid, schema) VALUES (1, 4326,
'<?xml version="1.0" encoding="UTF-8"?>
<pc:PointCloudSchema xmlns:pc="http://pointcloud.org/schemas/PC/1.1"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <pc:dimension>
    <pc:position>1</pc:position>
    <pc:size>4</pc:size>
    <pc:description>X coordinate as a long integer. You must use the
                    scale and offset information of the header to
                    determine the double value.</pc:description>
    <pc:name>X</pc:name>
    <pc:interpretation>int32_t</pc:interpretation>
    <pc:scale>0.01</pc:scale>
  </pc:dimension>
  <pc:dimension>
    <pc:position>2</pc:position>
    <pc:size>4</pc:size>
    <pc:description>Y coordinate as a long integer. You must use the
                    scale and offset information of the header to
                    determine the double value.</pc:description>
    <pc:name>Y</pc:name>
    <pc:interpretation>int32_t</pc:interpretation>
    <pc:scale>0.01</pc:scale>
  </pc:dimension>
  <pc:dimension>
    <pc:position>3</pc:position>
    <pc:size>4</pc:size>
    <pc:description>Z coordinate as a long integer. You must use the
                    scale and offset information of the header to
                    determine the double value.</pc:description>
    <pc:name>Z</pc:name>
    <pc:interpretation>int32_t</pc:interpretation>
    <pc:scale>0.01</pc:scale>
  </pc:dimension>
  <pc:metadata>
    <Metadata name="compression">dimensional</Metadata>
  </pc:metadata>
</pc:PointCloudSchema>');


/* Drop Tables */
DROP TABLE IF EXISTS voxel CASCADE;
DROP TABLE IF EXISTS voxelpt CASCADE;
DROP TABLE IF EXISTS voxelmpt CASCADE;
DROP TABLE IF EXISTS voxelpatch CASCADE;
DROP TABLE IF EXISTS ifcclass CASCADE;
DROP TABLE IF EXISTS objclass CASCADE;

/* Create Tables */
CREATE TABLE voxel
(
	id serial PRIMARY KEY,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	classID INTEGER,
	ifcID INTEGER
);

CREATE TABLE voxelpt
(
	id serial PRIMARY KEY,
	classID INTEGER,
	ifcID INTEGER,
	geom geometry
);

CREATE TABLE voxelmpt
(
	id serial PRIMARY KEY,
	classID INTEGER,
	geom geometry
);

CREATE TABLE voxelpatch (
  id SERIAL PRIMARY KEY,
  classID INTEGER,
  pa PCPATCH(1)
);

CREATE TABLE ifcclass (
  ifcID INTEGER PRIMARY KEY,
  name VARCHAR(50) NULL
);

CREATE TABLE objclass (
  classID INTEGER PRIMARY KEY,
  name VARCHAR(50) NULL
);


/* Drop index */
DROP INDEX IF EXISTS idx_voxel CASCADE;
DROP INDEX IF EXISTS idx_voxelpt CASCADE;
DROP INDEX IF EXISTS idx_voxelmpt CASCADE;
DROP INDEX IF EXISTS idx_voxelpatch CASCADE;
DROP INDEX IF EXISTS idx_ifcclass CASCADE;
DROP INDEX IF EXISTS idx_objclass CASCADE;

/* Import Data */
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld1.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld2.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld3.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld4.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld5.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld6.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld7.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld8.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld9.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld10.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld11.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld12.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld13.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld14.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld15.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld16.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld17.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld18.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld19.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld20.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld21.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld22.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld23.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld24.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld25.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld27.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld28.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld29.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld30.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld31.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld32.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld33.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld34.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld35.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld36.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld37.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld38.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld39.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld40.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld41.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld42.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld43.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld44.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld45.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld47.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld48.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld49.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld50.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld51.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld52.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld53.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld54.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\tree\tree.xyz' DELIMITER ' ';
UPDATE voxel SET classID=55 WHERE id > 241613693;
\COPY voxel(x, y, z, classID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\dtm\dtmbot.xyz' DELIMITER ' ';
UPDATE voxel SET classID=56 WHERE id > 301253693;
\COPY voxel(x, y, z, ifcID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\BE\classIDmodel.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, ifcID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\BlockHouse\classIDmodel.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, ifcID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\Dalton\classIDmodel.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, ifcID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\Quadrangle\classIDmodel.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, ifcID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\Roundhouse\classIDmodel.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, ifcID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\SciThe\classIDmodel.xyz' DELIMITER ' ';

-- For table "voxelpt"
INSERT INTO voxelpt(classID, ifcID, geom) SELECT classID, ifcID, ST_MakePoint(x,y,z) FROM voxel AS VALUES;

-- For table "voxelmpt"
INSERT INTO voxelmpt(classid, geom) SELECT 1, ST_Collect(ARRAY(select geom from voxelpt where classID=1));
INSERT INTO voxelmpt(classid, geom) SELECT 2, ST_Collect(ARRAY(select geom from voxelpt where classID=2));
INSERT INTO voxelmpt(classid, geom) SELECT 3, ST_Collect(ARRAY(select geom from voxelpt where classID=3));
INSERT INTO voxelmpt(classid, geom) SELECT 4, ST_Collect(ARRAY(select geom from voxelpt where classID=4));
INSERT INTO voxelmpt(classid, geom) SELECT 5, ST_Collect(ARRAY(select geom from voxelpt where classID=5));
INSERT INTO voxelmpt(classid, geom) SELECT 6, ST_Collect(ARRAY(select geom from voxelpt where classID=6));
INSERT INTO voxelmpt(classid, geom) SELECT 7, ST_Collect(ARRAY(select geom from voxelpt where classID=7));
INSERT INTO voxelmpt(classid, geom) SELECT 8, ST_Collect(ARRAY(select geom from voxelpt where classID=8));
INSERT INTO voxelmpt(classid, geom) SELECT 9, ST_Collect(ARRAY(select geom from voxelpt where classID=9));
INSERT INTO voxelmpt(classid, geom) SELECT 10, ST_Collect(ARRAY(select geom from voxelpt where classID=10));
INSERT INTO voxelmpt(classid, geom) SELECT 11, ST_Collect(ARRAY(select geom from voxelpt where classID=11));
INSERT INTO voxelmpt(classid, geom) SELECT 12, ST_Collect(ARRAY(select geom from voxelpt where classID=12));
INSERT INTO voxelmpt(classid, geom) SELECT 13, ST_Collect(ARRAY(select geom from voxelpt where classID=13));
INSERT INTO voxelmpt(classid, geom) SELECT 14, ST_Collect(ARRAY(select geom from voxelpt where classID=14));
INSERT INTO voxelmpt(classid, geom) SELECT 15, ST_Collect(ARRAY(select geom from voxelpt where classID=15));
INSERT INTO voxelmpt(classid, geom) SELECT 16, ST_Collect(ARRAY(select geom from voxelpt where classID=16));
INSERT INTO voxelmpt(classid, geom) SELECT 17, ST_Collect(ARRAY(select geom from voxelpt where classID=17));
INSERT INTO voxelmpt(classid, geom) SELECT 18, ST_Collect(ARRAY(select geom from voxelpt where classID=18));
INSERT INTO voxelmpt(classid, geom) SELECT 19, ST_Collect(ARRAY(select geom from voxelpt where classID=19));
INSERT INTO voxelmpt(classid, geom) SELECT 20, ST_Collect(ARRAY(select geom from voxelpt where classID=20));
INSERT INTO voxelmpt(classid, geom) SELECT 21, ST_Collect(ARRAY(select geom from voxelpt where classID=21));
INSERT INTO voxelmpt(classid, geom) SELECT 22, ST_Collect(ARRAY(select geom from voxelpt where classID=22));
INSERT INTO voxelmpt(classid, geom) SELECT 23, ST_Collect(ARRAY(select geom from voxelpt where classID=23));
INSERT INTO voxelmpt(classid, geom) SELECT 24, ST_Collect(ARRAY(select geom from voxelpt where classID=24));
INSERT INTO voxelmpt(classid, geom) SELECT 25, ST_Collect(ARRAY(select geom from voxelpt where classID=25));
INSERT INTO voxelmpt(classid, geom) SELECT 27, ST_Collect(ARRAY(select geom from voxelpt where classID=27));
INSERT INTO voxelmpt(classid, geom) SELECT 28, ST_Collect(ARRAY(select geom from voxelpt where classID=28));
INSERT INTO voxelmpt(classid, geom) SELECT 29, ST_Collect(ARRAY(select geom from voxelpt where classID=29));
INSERT INTO voxelmpt(classid, geom) SELECT 30, ST_Collect(ARRAY(select geom from voxelpt where classID=30));
INSERT INTO voxelmpt(classid, geom) SELECT 31, ST_Collect(ARRAY(select geom from voxelpt where classID=31));
INSERT INTO voxelmpt(classid, geom) SELECT 32, ST_Collect(ARRAY(select geom from voxelpt where classID=32));
INSERT INTO voxelmpt(classid, geom) SELECT 33, ST_Collect(ARRAY(select geom from voxelpt where classID=33));
INSERT INTO voxelmpt(classid, geom) SELECT 34, ST_Collect(ARRAY(select geom from voxelpt where classID=34));
INSERT INTO voxelmpt(classid, geom) SELECT 35, ST_Collect(ARRAY(select geom from voxelpt where classID=35));
INSERT INTO voxelmpt(classid, geom) SELECT 36, ST_Collect(ARRAY(select geom from voxelpt where classID=36));
INSERT INTO voxelmpt(classid, geom) SELECT 37, ST_Collect(ARRAY(select geom from voxelpt where classID=37));
INSERT INTO voxelmpt(classid, geom) SELECT 38, ST_Collect(ARRAY(select geom from voxelpt where classID=38));
INSERT INTO voxelmpt(classid, geom) SELECT 39, ST_Collect(ARRAY(select geom from voxelpt where classID=39));
INSERT INTO voxelmpt(classid, geom) SELECT 40, ST_Collect(ARRAY(select geom from voxelpt where classID=40));
INSERT INTO voxelmpt(classid, geom) SELECT 41, ST_Collect(ARRAY(select geom from voxelpt where classID=41));
INSERT INTO voxelmpt(classid, geom) SELECT 42, ST_Collect(ARRAY(select geom from voxelpt where classID=42));
INSERT INTO voxelmpt(classid, geom) SELECT 43, ST_Collect(ARRAY(select geom from voxelpt where classID=43));
INSERT INTO voxelmpt(classid, geom) SELECT 44, ST_Collect(ARRAY(select geom from voxelpt where classID=44));
INSERT INTO voxelmpt(classid, geom) SELECT 45, ST_Collect(ARRAY(select geom from voxelpt where classID=45));
INSERT INTO voxelmpt(classid, geom) SELECT 47, ST_Collect(ARRAY(select geom from voxelpt where classID=47));
INSERT INTO voxelmpt(classid, geom) SELECT 48, ST_Collect(ARRAY(select geom from voxelpt where classID=48));
INSERT INTO voxelmpt(classid, geom) SELECT 49, ST_Collect(ARRAY(select geom from voxelpt where classID=49));
INSERT INTO voxelmpt(classid, geom) SELECT 50, ST_Collect(ARRAY(select geom from voxelpt where classID=50));
INSERT INTO voxelmpt(classid, geom) SELECT 51, ST_Collect(ARRAY(select geom from voxelpt where classID=51));
INSERT INTO voxelmpt(classid, geom) SELECT 52, ST_Collect(ARRAY(select geom from voxelpt where classID=52));
INSERT INTO voxelmpt(classid, geom) SELECT 53, ST_Collect(ARRAY(select geom from voxelpt where classID=53));
INSERT INTO voxelmpt(classid, geom) SELECT 54, ST_Collect(ARRAY(select geom from voxelpt where classID=54));
INSERT INTO voxelmpt(classid, geom) SELECT 55, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=55 LIMIT 20000000));
INSERT INTO voxelmpt(classid, geom) SELECT 55, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=55 LIMIT 20000000 OFFSET 20000000));
INSERT INTO voxelmpt(classid, geom) SELECT 55, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=55 LIMIT 20000000 OFFSET 40000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 20000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 40000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 60000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 80000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 100000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 120000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 140000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 160000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 180000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 200000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 220000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 240000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 260000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 280000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 300000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 320000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 340000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 360000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 380000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 400000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 420000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 440000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 460000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 480000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 500000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 520000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 540000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 560000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 580000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 600000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 620000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 640000000));
INSERT INTO voxelmpt(classid, geom) SELECT 56, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=56 LIMIT 20000000 OFFSET 660000000));

-- For table "voxelpatch"
INSERT INTO voxelpatch (classID, pa) SELECT 1, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=1) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 2, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=2) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 3, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=3) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 4, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=4) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 5, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=5) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 6, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=6) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 7, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=7) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 8, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=8) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 9, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=9) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 10, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=10) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 11, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=11) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 12, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=12) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 13, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=13) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 14, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=14) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 15, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=15) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 16, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=16) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 17, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=17) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 18, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=18) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 19, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=19) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 20, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=20) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 21, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=21) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 22, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=22) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 23, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=23) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 24, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=24) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 25, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=25) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 27, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=27) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 28, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=28) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 29, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=29) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 30, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=30) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 31, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=31) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 32, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=32) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 33, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=33) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 34, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=34) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 35, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=35) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 36, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=36) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 37, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=37) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 38, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=38) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 39, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=39) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 40, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=40) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 41, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=41) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 42, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=42) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 43, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=43) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 44, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=44) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 45, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=45) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 47, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=47) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 48, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=48) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 49, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=49) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 50, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=50) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 51, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=51) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 52, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=52) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 53, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=53) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 54, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=54) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 55, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=55 LIMIT 20000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 55, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=55 LIMIT 20000000 OFFSET 20000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 55, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=55 LIMIT 20000000 OFFSET 40000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 20000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 40000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 60000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 80000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 100000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 120000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 140000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 160000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 180000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 200000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 220000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 240000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 260000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 280000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 300000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 320000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 340000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 360000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 380000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 400000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 420000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 440000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 460000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 480000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 500000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 520000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 540000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 560000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 580000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 600000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 620000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 640000000) as tmp;
INSERT INTO voxelpatch (classID, pa) SELECT 56, PC_Patch(pt) FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56 LIMIT 20000000 OFFSET 660000000) as tmp;

\COPY ifcclass (ifcID, name) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\ALLCLASSES' DELIMITER ' ';
\COPY objclass (classID, name) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bldnum.txt' DELIMITER ' ';
INSERT INTO objclass (classID, name) VALUES (55, 'tree');
INSERT INTO objclass (classID, name) VALUES (56, 'dtmbot');

/* Create Index */
CREATE INDEX idx_voxel ON voxel(x, y, z, classID);
CREATE INDEX idx_voxelpt ON voxelpt(classID);
CREATE INDEX idx_voxelmpt ON voxelmpt(classID);
CREATE INDEX idx_voxelpatch ON voxelpatch(classID);
CREATE INDEX idx_ifcclass ON ifcclass(ifcID);
CREATE INDEX idx_objclass ON objclass(classID);
