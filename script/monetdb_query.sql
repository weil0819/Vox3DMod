/* ---------------------------------------------------- */
/*  Created On : 26-June-2020 	             			*/
/*  DBMS       : MonetDB	 			     			*/
/*  Usage      : sql>\< C:/monetdb_query.sql            */
/*  Author     : Wesley      			     			*/
/* ---------------------------------------------------- */


\t performance

/* Query 1 */
EXPLAIN SELECT * FROM be;

DROP INDEX idx_building_ID;
CREATE IMPRINTS INDEX idx_building_ID ON building (buildID);
EXPLAIN SELECT x,y,z,objID FROM building WHERE buildID=1;


/* Query 2 */
EXPLAIN SELECT x,y,z FROM be WHERE objID=5;

DROP INDEX idx_be_obj;
CREATE IMPRINTS INDEX idx_be_obj ON be (objID);
EXPLAIN SELECT x,y,z FROM be WHERE objID=5;

-- EXPLAIN  SELECT x,y,z FROM building WHERE buildID=1 and objID=5;

/* Query 3 */
EXPLAIN SELECT x,y,z FROM be WHERE x > 100 AND x < 500 AND y > 30 AND y < 330;
EXPLAIN SELECT x,y,z FROM be WHERE x > 100 AND x < 500 AND y > 30 AND y < 330 AND z > 40 AND z < 240;

/* Query 4 */
EXPLAIN SELECT x,y,z FROM be WHERE sqrt(power(x-100, 2) + power(y-200, 2)) < 100;

/* Query 5 */
-- EXPLAIN  SELECT MAX(z) FROM be WHERE x > 30 AND y < 130 GROUP BY objID;


