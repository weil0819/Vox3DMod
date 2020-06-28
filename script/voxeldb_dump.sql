/* ---------------------------------------------------- */
/*  Created On : 26-June-2020 	             			*/
/*  DBMS       : PostgreSQL 			     			*/
/*  Usage      : voxeldb=# \i C:/voxeldb_dump.sql       */
/*  Author     : Wesley      			     			*/
/* ---------------------------------------------------- */

/* Add PostGIS Extension */
-- CREATE EXTENSION IF NOT EXISTS POSTGIS;


/* Drop Tables */
DROP TABLE IF EXISTS be CASCADE;
DROP TABLE IF EXISTS blockhouse CASCADE;
DROP TABLE IF EXISTS dalton CASCADE;
DROP TABLE IF EXISTS quadrangle CASCADE;
DROP TABLE IF EXISTS roundhouse CASCADE;
DROP TABLE IF EXISTS scithe CASCADE;
DROP TABLE IF EXISTS tree CASCADE;
DROP TABLE IF EXISTS dtm CASCADE;
DROP TABLE IF EXISTS dtmbot CASCADE;
DROP TABLE IF EXISTS build CASCADE;


/* Create Tables */
CREATE TABLE be
(
	id serial PRIMARY KEY,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	objID INTEGER
);


CREATE TABLE blockhouse
(
	id serial PRIMARY KEY,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	objID INTEGER
);


CREATE TABLE dalton
(
	id serial PRIMARY KEY,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	objID INTEGER
);


CREATE TABLE quadrangle
(
	id serial PRIMARY KEY,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	objID INTEGER
);


CREATE TABLE roundhouse
(
	id serial PRIMARY KEY,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	objID INTEGER
);


CREATE TABLE scithe
(
	id serial PRIMARY KEY,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	objID INTEGER
);


CREATE TABLE ifcobject
(
	id INTEGER UNIQUE,
	name varchar(50) 
);


CREATE TABLE tree
(
	id serial PRIMARY KEY,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	objID INTEGER
);


CREATE TABLE dtm
(
	id serial PRIMARY KEY,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	objID INTEGER
);


CREATE TABLE dtmbot
(
	id serial PRIMARY KEY,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	objID INTEGER
);


CREATE TABLE build
(
	id serial PRIMARY KEY,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	buildID INTEGER
);


/* Drop index */
DROP INDEX IF EXISTS idx_be CASCADE;
DROP INDEX IF EXISTS idx_blockhouse CASCADE;
DROP INDEX IF EXISTS idx_dalton CASCADE;
DROP INDEX IF EXISTS idx_quadrangle CASCADE;
DROP INDEX IF EXISTS idx_roundhouse CASCADE;
DROP INDEX IF EXISTS idx_scithe CASCADE;
DROP INDEX IF EXISTS idx_ifcobject CASCADE;
DROP INDEX IF EXISTS idx_tree CASCADE;
DROP INDEX IF EXISTS idx_dtm CASCADE;
DROP INDEX IF EXISTS idx_dtmbot CASCADE;
DROP INDEX IF EXISTS idx_build CASCADE;


/* Import Data */
\COPY be(x, y, z, objID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\BE\classmodel.xyz' DELIMITER ' ';
\COPY blockhouse(x, y, z, objID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\BlockHouse\classmodel.xyz' DELIMITER ' ';
\COPY dalton(x, y, z, objID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\Dalton\classmodel.xyz' DELIMITER ' ';
\COPY quadrangle(x, y, z, objID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\Quadrangle\classmodel.xyz' DELIMITER ' ';
\COPY roundhouse(x, y, z, objID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\Roundhouse\classmodel.xyz' DELIMITER ' ';
\COPY scithe(x, y, z, objID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\SciThe\classmodel.xyz' DELIMITER ' ';
\COPY ifcobject(id, name) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\ifcobject' DELIMITER ' ';
\COPY tree(x, y, z, objID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\tree\tree.xyz' DELIMITER ' ';
\COPY dtm(x, y, z, objID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\dtm\dtm.xyz' DELIMITER ' ';
\COPY dtmbot(x, y, z, objID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\dtm\dtmbot.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld1.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld2.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld3.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld4.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld5.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld6.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld7.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld8.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld9.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld10.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld11.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld12.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld13.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld14.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld15.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld16.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld17.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld18.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld19.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld20.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld21.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld22.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld23.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld24.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld25.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld27.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld28.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld29.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld30.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld31.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld32.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld33.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld34.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld35.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld36.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld37.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld38.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld39.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld40.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld41.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld42.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld43.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld44.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld45.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld47.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld48.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld49.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld50.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld51.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld52.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld53.xyz' DELIMITER ' ';
\COPY build(x, y, z, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld54.xyz' DELIMITER ' ';


/* Create Index */
CREATE INDEX idx_be ON be(x, y, z, objID);
CREATE INDEX idx_blockhouse ON blockhouse(x, y, z, objID);
CREATE INDEX idx_dalton ON dalton(x, y, z, objID);
CREATE INDEX idx_quadrangle ON quadrangle(x, y, z, objID);
CREATE INDEX idx_roundhouse ON roundhouse(x, y, z, objID);
CREATE INDEX idx_scithe ON scithe(x, y, z, objID);
CREATE INDEX idx_ifcobject ON ifcobject(id);
CREATE INDEX idx_tree ON tree(x, y, z);
CREATE INDEX idx_dtm ON dtm(x, y, z);
CREATE INDEX idx_dtmbot ON dtmbot(x, y, z);
CREATE INDEX idx_build ON build(x, y, z, buildID);
