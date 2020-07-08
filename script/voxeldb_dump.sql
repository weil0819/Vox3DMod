/* ---------------------------------------------------- */
/*  Created On : 26-June-2020 	             			*/
/*  DBMS       : PostgreSQL 			     			*/
/*  Usage      : voxeldb=# \i C:/voxeldb_dump.sql       */
/*  Author     : Wesley      			     			*/
/* ---------------------------------------------------- */

/* Add PostGIS Extension */
CREATE EXTENSION IF NOT EXISTS POSTGIS;


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
	objID INTEGER,
	octPath VARCHAR
);


CREATE TABLE blockhouse
(
	id serial PRIMARY KEY,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	objID INTEGER,
	octPath VARCHAR
);


CREATE TABLE dalton
(
	id serial PRIMARY KEY,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	objID INTEGER,
	octPath VARCHAR
);


CREATE TABLE quadrangle
(
	id serial PRIMARY KEY,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	objID INTEGER,
	octPath VARCHAR
);


CREATE TABLE roundhouse
(
	id serial PRIMARY KEY,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	objID INTEGER,
	octPath VARCHAR
);


CREATE TABLE scithe
(
	id serial PRIMARY KEY,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	objID INTEGER,
	octPath VARCHAR
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
	objID INTEGER,
	octPath VARCHAR
);


CREATE TABLE dtm
(
	id serial PRIMARY KEY,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	objID INTEGER,
	octPath VARCHAR
);


CREATE TABLE dtmbot
(
	id serial PRIMARY KEY,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	objID INTEGER,
	octPath VARCHAR
);


CREATE TABLE build
(
	id serial PRIMARY KEY,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	buildID INTEGER,
	octPath VARCHAR
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
\COPY be(x, y, z, objID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\BE\classmodel.oct' DELIMITER ' ';
\COPY blockhouse(x, y, z, objID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\BlockHouse\classmodel.oct' DELIMITER ' ';
\COPY dalton(x, y, z, objID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\Dalton\classmodel.oct' DELIMITER ' ';
\COPY quadrangle(x, y, z, objID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\Quadrangle\classmodel.oct' DELIMITER ' ';
\COPY roundhouse(x, y, z, objID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\Roundhouse\classmodel.oct' DELIMITER ' ';
\COPY scithe(x, y, z, objID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\SciThe\classmodel.oct' DELIMITER ' ';
\COPY ifcobject(id, name) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\ifcobject' DELIMITER ' ';
\COPY tree(x, y, z, objID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\tree\tree.oct' DELIMITER ' ';
\COPY dtm(x, y, z, objID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\dtm\dtm.oct' DELIMITER ' ';
\COPY dtmbot(x, y, z, objID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\dtm\dtmbot.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld1.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld2.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld3.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld4.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld5.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld6.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld7.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld8.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld9.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld10.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld11.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld12.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld13.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld14.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld15.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld16.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld17.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld18.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld19.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld20.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld21.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld22.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld23.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld24.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld25.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld27.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld28.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld29.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld30.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld31.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld32.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld33.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld34.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld35.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld36.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld37.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld38.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld39.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld40.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld41.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld42.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld43.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld44.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld45.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld47.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld48.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld49.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld50.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld51.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld52.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld53.oct' DELIMITER ' ';
\COPY build(x, y, z, buildID, octPath) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\build\bld54.oct' DELIMITER ' ';


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
