/* ---------------------------------------------------- */
/*  Created On : 26-June-2020 	             			*/
/*  DBMS       : MonetDB    			     			*/
/*  Usage      : sql>\< C:/monetdb_dump.sql             */
/*  Author     : Wesley      			     			*/
/* ---------------------------------------------------- */


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
	id SERIAL,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	objID INTEGER
);


CREATE TABLE blockhouse
(
	id SERIAL,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	objID INTEGER
);


CREATE TABLE dalton
(
	id SERIAL,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	objID INTEGER
);


CREATE TABLE quadrangle
(
	id SERIAL,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	objID INTEGER
);


CREATE TABLE roundhouse
(
	id SERIAL,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	objID INTEGER
);


CREATE TABLE scithe
(
	id SERIAL,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	objID INTEGER
);


CREATE TABLE building
(
	id SERIAL,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	objID INTEGER,
	buildID INTEGER
);


/* Drop index */
DROP INDEX idx_be;
DROP INDEX idx_blockhouse;
DROP INDEX idx_dalton;
DROP INDEX idx_quadrangle;
DROP INDEX idx_roundhouse;
DROP INDEX idx_scithe;
DROP INDEX idx_building;


/* Create Index */
CREATE INDEX idx_be ON be(x, y, z);
CREATE INDEX idx_blockhouse ON blockhouse(x, y, z);
CREATE INDEX idx_dalton ON dalton(x, y, z);
CREATE INDEX idx_quadrangle ON quadrangle(x, y, z);
CREATE INDEX idx_roundhouse ON roundhouse(x, y, z);
CREATE INDEX idx_scithe ON scithe(x, y, z);
CREATE INDEX idx_building ON building(x, y, z);


/* Import Data */
COPY INTO be(x, y, z, objID) FROM 'C:/Users/z5039792/Documents/Vox3DMod/data/bim/BE/classmodel.xyz'(x,y,z,objID) DELIMITERS ' ';
COPY INTO blockhouse(x, y, z, objID) FROM 'C:/Users/z5039792/Documents/Vox3DMod/data/bim/BlockHouse/classmodel.xyz'(x,y,z,objID) DELIMITERS ' ';
COPY INTO dalton(x, y, z, objID) FROM 'C:/Users/z5039792/Documents/Vox3DMod/data/bim/Dalton/classmodel.xyz'(x,y,z,objID) DELIMITERS ' ';
COPY INTO quadrangle(x, y, z, objID) FROM 'C:/Users/z5039792/Documents/Vox3DMod/data/bim/Quadrangle/classmodel.xyz'(x,y,z,objID) DELIMITERS ' ';
COPY INTO roundhouse(x, y, z, objID) FROM 'C:/Users/z5039792/Documents/Vox3DMod/data/bim/Roundhouse/classmodel.xyz'(x,y,z,objID) DELIMITERS ' ';
COPY INTO scithe(x, y, z, objID) FROM 'C:/Users/z5039792/Documents/Vox3DMod/data/bim/SciThe/classmodel.xyz'(x,y,z,objID) DELIMITERS ' ';
COPY INTO building(x, y, z, objID, buildID) FROM 'C:/Users/z5039792/Documents/Vox3DMod/data/bim/building.xyz'(x,y,z,objID,buildID) DELIMITERS ' ';
