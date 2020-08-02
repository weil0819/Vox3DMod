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

INSERT INTO pointcloud_formats (pcid, srid, schema) VALUES (1, 28356,
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
\COPY voxel(x, y, z, ifcID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\BE\classmodel.xyz' DELIMITER ' ';
UPDATE voxel SET classID=57 WHERE classid IS NULL;
\COPY voxel(x, y, z, ifcID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\BlockHouse\classmodel.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, ifcID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\Dalton\classmodel.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, ifcID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\Quadrangle\classmodel.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, ifcID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\Roundhouse\classmodel.xyz' DELIMITER ' ';
\COPY voxel(x, y, z, ifcID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\SciThe\classmodel.xyz' DELIMITER ' ';

-- For table "voxelpt"
INSERT INTO voxelpt(classID, ifcID, geom) SELECT classID, ifcID, ST_MakePoint(x,y,z) FROM voxel AS VALUES;

-- For table "voxelmpt"


/* Create Index */
CREATE INDEX idx_voxel ON voxel(x, y, z, classID);
CREATE INDEX idx_voxelpt ON voxelpt(classID);
CREATE INDEX idx_voxelmpt ON voxelmpt(classID);
CREATE INDEX idx_voxelpatch ON voxelpatch(classID);
CREATE INDEX idx_ifcclass ON ifcclass(ifcID);
CREATE INDEX idx_objclass ON objclass(classID);
