/* ---------------------------------------------------- */
/*  Created On : 26-June-2020 	             			*/
/*  DBMS       : PostgreSQL 			     			*/
/*  Output     : voxeldb=# \o C:/postgres_result.sql    */
/*  Usage      : voxeldb=# \i C:/postgres_dump.sql      */
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
DROP TABLE IF EXISTS building CASCADE;


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


CREATE TABLE building
(
	id serial PRIMARY KEY,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	objID INTEGER,
	buildID INTEGER NOT NULL
);


/* Drop index */
DROP INDEX IF EXISTS idx_be CASCADE;
DROP INDEX IF EXISTS idx_blockhouse CASCADE;
DROP INDEX IF EXISTS idx_dalton CASCADE;
DROP INDEX IF EXISTS idx_quadrangle CASCADE;
DROP INDEX IF EXISTS idx_roundhouse CASCADE;
DROP INDEX IF EXISTS idx_scithe CASCADE;
DROP INDEX IF EXISTS idx_building CASCADE;
-- DROP INDEX IF EXISTS idx_building_ID CASCADE;


/* Import Data */
\COPY be(x, y, z, objID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\BE\classmodel.xyz' DELIMITER ' ';
\COPY blockhouse(x, y, z, objID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\BlockHouse\classmodel.xyz' DELIMITER ' ';
\COPY dalton(x, y, z, objID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\Dalton\classmodel.xyz' DELIMITER ' ';
\COPY quadrangle(x, y, z, objID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\Quadrangle\classmodel.xyz' DELIMITER ' ';
\COPY roundhouse(x, y, z, objID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\Roundhouse\classmodel.xyz' DELIMITER ' ';
\COPY scithe(x, y, z, objID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\SciThe\classmodel.xyz' DELIMITER ' ';
\COPY building(x, y, z, objID, buildID) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\building.xyz' DELIMITER ' ';


/* Create Index */
CREATE INDEX idx_be ON be(x, y, z);
CREATE INDEX idx_blockhouse ON blockhouse(x, y, z);
CREATE INDEX idx_dalton ON dalton(x, y, z);
CREATE INDEX idx_quadrangle ON quadrangle(x, y, z);
CREATE INDEX idx_roundhouse ON roundhouse(x, y, z);
CREATE INDEX idx_scithe ON scithe(x, y, z);
CREATE INDEX idx_building ON building(x, y, z, buildID);
-- CREATE INDEX idx_building_ID ON building USING hash (buildID);

