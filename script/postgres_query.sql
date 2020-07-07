/* ---------------------------------------------------- */
/*  Created On : 26-June-2020 	             			*/
/*  DBMS       : PostgreSQL 			     			*/
/*  Output     : voxeldb=# \o C:/postgres_result.sql    */
/*  Usage      : voxeldb=# \i C:/postgres_query.sql     */
/*  Author     : Wesley      			     			*/
/* ---------------------------------------------------- */


/* Query 1 */
EXPLAIN ANALYZE SELECT * FROM building WHERE buildID=1;
EXPLAIN ANALYZE SELECT * FROM building WHERE buildID=1;
EXPLAIN ANALYZE SELECT * FROM building WHERE buildID=1;
EXPLAIN ANALYZE SELECT * FROM be;
EXPLAIN ANALYZE SELECT * FROM be;
EXPLAIN ANALYZE SELECT * FROM be;


/* Query 2 */
EXPLAIN ANALYZE SELECT * FROM building WHERE buildID=1 AND objID=8;
EXPLAIN ANALYZE SELECT * FROM building WHERE buildID=1 AND objID=8;
EXPLAIN ANALYZE SELECT * FROM building WHERE buildID=1 AND objID=8;
EXPLAIN ANALYZE SELECT * FROM be WHERE objID=8;
EXPLAIN ANALYZE SELECT * FROM be WHERE objID=8;
EXPLAIN ANALYZE SELECT * FROM be WHERE objID=8;

/* Query Indices */
-- DROP INDEX IF EXISTS idx_be_obj CASCADE;
-- CREATE INDEX idx_be_obj ON be USING hash (objID);
-- EXPLAIN ANALYZE SELECT * FROM be WHERE objID=8;
-- EXPLAIN ANALYZE SELECT * FROM be WHERE objID=8;
-- EXPLAIN ANALYZE SELECT * FROM be WHERE objID=8;


/* Query 3 */
EXPLAIN ANALYZE SELECT * FROM building WHERE buildID=1 AND x > 100 AND x < 500 AND y > 30 AND y < 330;
EXPLAIN ANALYZE SELECT * FROM building WHERE buildID=1 AND x > 100 AND x < 500 AND y > 30 AND y < 330;
EXPLAIN ANALYZE SELECT * FROM building WHERE buildID=1 AND x > 100 AND x < 500 AND y > 30 AND y < 330;
EXPLAIN ANALYZE SELECT * FROM be WHERE x > 100 AND x < 500 AND y > 30 AND y < 330;
EXPLAIN ANALYZE SELECT * FROM be WHERE x > 100 AND x < 500 AND y > 30 AND y < 330;
EXPLAIN ANALYZE SELECT * FROM be WHERE x > 100 AND x < 500 AND y > 30 AND y < 330;


/* Query 4 */
EXPLAIN ANALYZE SELECT * FROM building WHERE buildID=1 AND SQRT(POW(x-100, 2) + POW(y-200, 2)) < 100;
EXPLAIN ANALYZE SELECT * FROM building WHERE buildID=1 AND SQRT(POW(x-100, 2) + POW(y-200, 2)) < 100;
EXPLAIN ANALYZE SELECT * FROM building WHERE buildID=1 AND SQRT(POW(x-100, 2) + POW(y-200, 2)) < 100;
EXPLAIN ANALYZE SELECT * FROM be WHERE SQRT(POW(x-100, 2) + POW(y-200, 2)) < 100;
EXPLAIN ANALYZE SELECT * FROM be WHERE SQRT(POW(x-100, 2) + POW(y-200, 2)) < 100;
EXPLAIN ANALYZE SELECT * FROM be WHERE SQRT(POW(x-100, 2) + POW(y-200, 2)) < 100;


/* Query 5 */
-- EXPLAIN ANALYZE SELECT MAX(z) FROM be WHERE x > 30 AND y < 130 GROUP BY objID;

