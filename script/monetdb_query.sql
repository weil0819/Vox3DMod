/x,y,z ---------------------------------------------------- x,y,z/
/x,y,z  Created On : 26-June-2020 	             			x,y,z/
/x,y,z  DBMS       : MonetDB	 			     			x,y,z/
/x,y,z  Output     : sql>\> C:/monetdb_result.log           x,y,z/
/x,y,z  Output     : sql>\t performance						x,y,z/
/x,y,z  Usage      : sql>\< C:/monetdb_query.sql            x,y,z/
/x,y,z  Author     : Wesley      			     			x,y,z/
/x,y,z ---------------------------------------------------- x,y,z/


-- \t performance

/* Query 1 */
EXPLAIN SELECT x,y,z FROM building WHERE buildID=1;
EXPLAIN SELECT x,y,z FROM building WHERE buildID=1;
EXPLAIN SELECT x,y,z FROM building WHERE buildID=1;
EXPLAIN SELECT x,y,z FROM be;
EXPLAIN SELECT x,y,z FROM be;
EXPLAIN SELECT x,y,z FROM be;

-- DROP INDEX idx_building_ID;
-- CREATE IMPRINTS INDEX idx_building_ID ON building (buildID);
-- EXPLAIN SELECT x,y,z,objID FROM building WHERE buildID=1;


/* Query 2 */
EXPLAIN SELECT x,y,z FROM building WHERE buildID=1 AND objID=8;
EXPLAIN SELECT x,y,z FROM building WHERE buildID=1 AND objID=8;
EXPLAIN SELECT x,y,z FROM building WHERE buildID=1 AND objID=8;
EXPLAIN SELECT x,y,z FROM be WHERE objID=8;
EXPLAIN SELECT x,y,z FROM be WHERE objID=8;
EXPLAIN SELECT x,y,z FROM be WHERE objID=8;

-- DROP INDEX idx_be_obj;
-- CREATE IMPRINTS INDEX idx_be_obj ON be (objID);
-- EXPLAIN SELECT x,y,z FROM be WHERE objID=8;
-- EXPLAIN SELECT x,y,z FROM be WHERE objID=8;
-- EXPLAIN SELECT x,y,z FROM be WHERE objID=8;

-- EXPLAIN  SELECT x,y,z FROM building WHERE buildID=1 and objID=5;

/* Query 3 */
EXPLAIN SELECT x,y,z FROM building WHERE buildID=1 AND x > 100 AND x < 500 AND y > 30 AND y < 330;
EXPLAIN SELECT x,y,z FROM building WHERE buildID=1 AND x > 100 AND x < 500 AND y > 30 AND y < 330;
EXPLAIN SELECT x,y,z FROM building WHERE buildID=1 AND x > 100 AND x < 500 AND y > 30 AND y < 330;
EXPLAIN SELECT x,y,z FROM be WHERE x > 100 AND x < 500 AND y > 30 AND y < 330;
EXPLAIN SELECT x,y,z FROM be WHERE x > 100 AND x < 500 AND y > 30 AND y < 330;
EXPLAIN SELECT x,y,z FROM be WHERE x > 100 AND x < 500 AND y > 30 AND y < 330;


/* Query 4 */
EXPLAIN SELECT x,y,z FROM building WHERE buildID=1 AND sqrt(power(x-100, 2) + power(y-200, 2)) < 100;
EXPLAIN SELECT x,y,z FROM building WHERE buildID=1 AND sqrt(power(x-100, 2) + power(y-200, 2)) < 100;
EXPLAIN SELECT x,y,z FROM building WHERE buildID=1 AND sqrt(power(x-100, 2) + power(y-200, 2)) < 100;
EXPLAIN SELECT x,y,z FROM be WHERE sqrt(power(x-100, 2) + power(y-200, 2)) < 100;
EXPLAIN SELECT x,y,z FROM be WHERE sqrt(power(x-100, 2) + power(y-200, 2)) < 100;
EXPLAIN SELECT x,y,z FROM be WHERE sqrt(power(x-100, 2) + power(y-200, 2)) < 100;

/* Query 5 */
-- EXPLAIN  SELECT MAX(z) FROM be WHERE x > 30 AND y < 130 GROUP BY objID;


