/* ---------------------------------------------------- */
/*  Created On : 26-June-2020 	             			*/
/*  DBMS       : PostgreSQL 			     			*/
/*  Usage      : voxeldb=# \i C:/postgres_query.sql     */
/*  Author     : Wesley      			     			*/
/* ---------------------------------------------------- */


/* Query 1 */
EXPLAIN ANALYZE SELECT * FROM be;

DROP INDEX IF EXISTS idx_building_ID CASCADE;
CREATE INDEX idx_building_ID ON building(buildID);
EXPLAIN ANALYZE SELECT x,y,z,objID FROM building WHERE buildID=1;

DROP INDEX IF EXISTS idx_building_ID CASCADE;
CREATE INDEX idx_building_ID ON building USING hash (buildID);
EXPLAIN ANALYZE SELECT x,y,z,objID FROM building WHERE buildID=1;


/* Query 2 */
EXPLAIN ANALYZE SELECT x,y,z FROM be WHERE objID=5;

DROP INDEX IF EXISTS idx_be_obj CASCADE;
CREATE INDEX idx_be_obj ON be USING hash (objID);
EXPLAIN ANALYZE SELECT x,y,z FROM be WHERE objID=5;

-- EXPLAIN ANALYZE SELECT x,y,z FROM building WHERE buildID=1 and objID=5;

/* Query 3 */
EXPLAIN ANALYZE SELECT x,y,z FROM be WHERE x > 100 AND x < 500 AND y > 30 AND y < 330;
EXPLAIN ANALYZE SELECT x,y,z FROM be WHERE x > 100 AND x < 500 AND y > 30 AND y < 330 AND z > 40 AND z < 240;

/* Query 4 */
EXPLAIN ANALYZE SELECT x,y,z FROM be WHERE SQRT(POW(x-100, 2) + POW(y-200, 2)) < 100;

/* Query 5 */
-- EXPLAIN ANALYZE SELECT MAX(z) FROM be WHERE x > 30 AND y < 130 GROUP BY objID;


