/* ---------------------------------------------------- */
/*  Created On : 13-July-2020 	             			*/
/*  DBMS       : PostgreSQL 			     			*/
/*  Tables	   : voxel, voxelmpt, voxelpt, voxelpatch   */
/*  Output     : voxeldb=# \o C:/voxeldb_result.log     */
/*  Usage      : voxeldb=# \i C:/voxeldb_query.sql      */
/*  Author     : Wesley      			     			*/
/* ---------------------------------------------------- */

/* Q1: Load all voxels that are in a given rectangle 100<x<200 and 100<y<200 and 100<z<200 */
EXPLAIN ANALYZE 
SELECT x, y, z 
FROM voxel 
WHERE x > 100 AND x < 200 AND y > 100 AND y < 200 AND z > 100 AND z < 200;

EXPLAIN ANALYZE 
SELECT ST_X(geom) AS x, ST_Y(geom) AS y, ST_Z(geom) AS z 
FROM voxelpt 
WHERE ST_X(geom) > 100 AND ST_X(geom) < 200 AND 
ST_Y(geom) > 100 AND ST_Y(geom) < 200 AND 
ST_Z(geom) > 100 AND ST_Z(geom) < 200;

EXPLAIN ANALYZE 
SELECT ST_X(POINT_geom) AS x, ST_Y(POINT_geom) AS y, ST_Z(POINT_geom) AS z 
FROM (
	SELECT (ST_Dump(geom)).geom AS POINT_geom FROM voxelmpt
) AS temp 
WHERE ST_X(POINT_geom) > 100 AND ST_X(POINT_geom) < 200 AND 
ST_Y(POINT_geom) > 100 AND ST_Y(POINT_geom) < 200 AND 
ST_Z(POINT_geom) > 100 AND ST_Z(POINT_geom) < 200;

EXPLAIN ANALYZE 
SELECT PC_Get(PCPOINT_geom, 'X') AS x, PC_Get(PCPOINT_geom, 'Y') AS y, PC_Get(PCPOINT_geom, 'Z') AS z 
FROM (
	SELECT PC_Explode(pa) AS PCPOINT_geom FROM voxelpatch
) AS temp 
WHERE PC_Get(PCPOINT_geom, 'X') > 100 AND PC_Get(PCPOINT_geom, 'X') < 200 AND 
PC_Get(PCPOINT_geom, 'Y') > 100 AND PC_Get(PCPOINT_geom, 'Y') < 200 AND 
PC_Get(PCPOINT_geom, 'Z') > 100 AND PC_Get(PCPOINT_geom, 'Z') < 200;


/* Q2: Load all voxels that are in circle with radius 100 and center (x,y,z) */
EXPLAIN ANALYZE 
SELECT x, y, z 
FROM voxel 
WHERE SQRT(POW(x-100, 2) + POW(y-200, 2) + POW(z-300, 2)) < 100;

EXPLAIN ANALYZE 
SELECT ST_X(geom) AS x, ST_Y(geom) AS y, ST_Z(geom) AS z 
FROM voxelpt 
WHERE SQRT(POW(ST_X(geom)-100, 2) + POW(ST_Y(geom)-200, 2) + POW(ST_Z(geom)-300, 2)) < 100;

EXPLAIN ANALYZE 
SELECT ST_X(POINT_geom) AS x, ST_Y(POINT_geom) AS y, ST_Z(POINT_geom) AS z 
FROM (
	SELECT (ST_Dump(geom)).geom AS POINT_geom FROM voxelmpt
) AS temp 
WHERE SQRT(POW(ST_X(POINT_geom)-100, 2) + POW(ST_Y(POINT_geom)-200, 2) + POW(ST_Z(POINT_geom)-300, 2)) < 100;

EXPLAIN ANALYZE 
SELECT PC_Get(PCPOINT_geom, 'X') AS x, PC_Get(PCPOINT_geom, 'Y') AS y, PC_Get(PCPOINT_geom, 'Z') AS z 
FROM (
	SELECT PC_Explode(pa) AS PCPOINT_geom FROM voxelpatch
) AS temp 
WHERE SQRT(POW(PC_Get(PCPOINT_geom, 'X')-100, 2) + POW(PC_Get(PCPOINT_geom, 'Y')-200, 2) + POW(PC_Get(PCPOINT_geom, 'Z')-300, 2)) < 100;


/* Q3: Load all voxels that are buildings */
EXPLAIN ANALYZE 
SELECT x, y, z 
FROM voxel 
WHERE classid >= 1 AND classid <= 54;

EXPLAIN ANALYZE 
SELECT ST_X(geom) AS x, ST_Y(geom) AS y, ST_Z(geom) AS z  
FROM voxelpt 
WHERE classid >= 1 AND classid <= 54;

EXPLAIN ANALYZE 
SELECT ST_X(POINT_geom) AS x, ST_Y(POINT_geom) AS y, ST_Z(POINT_geom) AS z 
FROM (
	SELECT (ST_Dump(geom)).geom AS POINT_geom FROM voxelmpt 
	WHERE classid >= 1 AND classid <= 54
) AS temp;

EXPLAIN ANALYZE 
SELECT PC_Get(PCPOINT_geom, 'X') AS x, PC_Get(PCPOINT_geom, 'Y') AS y, PC_Get(PCPOINT_geom, 'Z') AS z 
FROM (
	SELECT PC_Explode(pa) AS PCPOINT_geom FROM voxelpatch 
	WHERE classid >= 1 AND classid <= 54
) AS temp; 


/* Q4: Load all building voxels that are in circle with radius 100 and center (x,y,z) */
EXPLAIN ANALYZE 
SELECT x, y, z 
FROM voxel 
WHERE classid >= 1 AND classid <= 54 AND SQRT(POW(x-100, 2) + POW(y-200, 2) + POW(z-300, 2)) < 100;

EXPLAIN ANALYZE 
SELECT ST_X(geom) AS x, ST_Y(geom) AS y, ST_Z(geom) AS z 
FROM voxelpt 
WHERE classid >= 1 AND classid <= 54 AND 
SQRT(POW(ST_X(geom)-100, 2) + POW(ST_Y(geom)-200, 2) + POW(ST_Z(geom)-300, 2)) < 100;

EXPLAIN ANALYZE 
SELECT ST_X(POINT_geom) AS x, ST_Y(POINT_geom) AS y, ST_Z(POINT_geom) AS z  
FROM (
	SELECT id, classid, (ST_Dump(geom)).geom AS POINT_geom 
	FROM voxelmpt 
	WHERE classid >= 1 AND classid <= 54
) AS temp 
WHERE SQRT(POW(ST_X(POINT_geom)-100, 2) + POW(ST_Y(POINT_geom)-200, 2) + POW(ST_Z(POINT_geom)-300, 2)) < 100;

EXPLAIN ANALYZE 
SELECT PC_Get(PCPOINT_geom, 'X') AS x, PC_Get(PCPOINT_geom, 'Y') AS y, PC_Get(PCPOINT_geom, 'Z') AS z  
FROM (
	SELECT id, classid, PC_Explode(pa) AS PCPOINT_geom 
	FROM voxelpatch 
	WHERE classid >= 1 AND classid <= 54
) AS temp 
WHERE SQRT(POW(PC_Get(PCPOINT_geom, 'X')-100, 2) + POW(PC_Get(PCPOINT_geom, 'Y')-200, 2) + POW(PC_Get(PCPOINT_geom, 'Z')-300, 2)) < 100;


/* Q5: Load all details for voxel (x,y,z) */
EXPLAIN ANALYZE 
SELECT x, y, z 
FROM voxel 
WHERE x = 100 AND y = 200 AND Z = 300;

EXPLAIN ANALYZE 
SELECT ST_X(geom) AS x, ST_Y(geom) AS y, ST_Z(geom) AS z  
FROM voxelpt 
WHERE ST_X(geom) = 100 AND ST_Y(geom) = 200 AND ST_Z(geom) = 300;

EXPLAIN ANALYZE 
SELECT ST_X(POINT_geom) AS x, ST_Y(POINT_geom) AS y, ST_Z(POINT_geom) AS z   
FROM (
	SELECT (ST_Dump(geom)).geom AS POINT_geom FROM voxelmpt
) AS temp 
WHERE ST_X(POINT_geom)= 100 AND ST_Y(POINT_geom) = 200 AND ST_Z(POINT_geom) = 300;

EXPLAIN ANALYZE 
SELECT PC_Get(PCPOINT_geom, 'X') AS x, PC_Get(PCPOINT_geom, 'Y') AS y, PC_Get(PCPOINT_geom, 'Z') AS z  
FROM (
	SELECT PC_Explode(pa) AS PCPOINT_geom FROM voxelpatch
) AS temp 
WHERE PC_Get(PCPOINT_geom, 'X') = 100 AND PC_Get(PCPOINT_geom, 'Y') = 200 AND PC_Get(PCPOINT_geom, 'Z') = 300;


/* Q6: Return the highest and lowest height of DTM of the 10 building */
EXPLAIN ANALYZE 
SELECT MIN(z) AS lowest, MAX(z) AS highest 
FROM (
	SELECT MIN(x) AS minX, MAX(x) AS maxX, MIN(y) AS minY, MAX(y) AS maxY FROM voxel WHERE classid = 10
) AS temp, voxel  
WHERE classid = 56 AND x >= minX AND x <= maxX AND y >= minY AND y <= maxY; 

EXPLAIN ANALYZE 
SELECT ST_ZMin(geom) AS lowest, ST_ZMax(geom) AS highest 
FROM (
	SELECT ST_XMin(geom) AS minX, ST_XMax(geom) AS maxX, ST_YMin(geom) AS minY, ST_YMax(geom) AS maxY 
	FROM voxelpt 
	WHERE classid = 10
) AS temp, voxelpt 
WHERE classid = 56 AND x >= minX AND x <= maxX AND y >= minY AND y <= maxY; 

EXPLAIN ANALYZE 
SELECT ST_ZMin(POINT_geom) AS lowest, ST_ZMax(POINT_geom) AS highest 
FROM (
	SELECT ST_XMin(geom) AS minX, ST_XMax(geom) AS maxX, ST_YMin(geom) AS minY, ST_YMax(geom) AS maxY 
	FROM voxelmpt 
	WHERE classid = 10
) AS temp1, (SELECT id, classid, (ST_Dump(geom)).geom AS POINT_geom FROM voxelmpt WHERE classid = 56) AS temp2  
WHERE ST_X(POINT_geom) >= minX AND ST_X(POINT_geom) <= maxX AND ST_Y(POINT_geom) >= minY AND ST_Y(POINT_geom) <= maxY; 

EXPLAIN ANALYZE 
SELECT MIN(PC_Get(PCPOINT_geom, 'Z')) AS lowest, MAX(PC_Get(PCPOINT_geom, 'Z')) AS highest 
FROM (
	SELECT PC_PatchMin(pa, 'X') AS minX, PC_PatchMax(pa, 'X') AS maxX, 
	PC_PatchMin(pa, 'Y') AS minY, PC_PatchMax(pa, 'Y') AS maxY 
	FROM voxelpatch 
	WHERE classid = 10
) AS temp1, (SELECT id, classid, PC_Explode(pa) AS PCPOINT_geom FROM voxelpatch WHERE classid = 56) AS temp2 
WHERE PC_Get(PCPOINT_geom, 'X') >= minX AND PC_Get(PCPOINT_geom, 'X') <= maxX AND 
PC_Get(PCPOINT_geom, 'Y') >= minY AND PC_Get(PCPOINT_geom, 'Y') <= maxY; 


/* Q7: Load all voxels that are tree */
EXPLAIN ANALYZE 
SELECT x, y, z 
FROM voxel 
WHERE classid = 55;

EXPLAIN ANALYZE 
SELECT ST_X(geom) AS x, ST_Y(geom) AS y, ST_Z(geom) AS z 
FROM voxelpt 
WHERE classid = 55;

EXPLAIN ANALYZE 
SELECT ST_X(POINT_geom) AS x, ST_Y(POINT_geom) AS y, ST_Z(POINT_geom) AS z   
FROM (
	SELECT (ST_Dump(geom)).geom AS POINT_geom FROM voxelmpt WHERE classid = 55
) AS temp;

EXPLAIN ANALYZE 
SELECT PC_Get(PCPOINT_geom, 'X') AS x, PC_Get(PCPOINT_geom, 'Y') AS y, PC_Get(PCPOINT_geom, 'Z') AS z  
FROM (
	SELECT PC_Explode(pa) AS PCPOINT_geom FROM voxelpatch WHERE classid = 55
) AS temp;


/* Q8: Load all building voxels that have door in ifc attribute */
EXPLAIN ANALYZE 
SELECT x, y, z 
FROM voxel 
WHERE ifcid = 8;

EXPLAIN ANALYZE 
SELECT ST_X(geom) AS x, ST_Y(geom) AS y, ST_Z(geom) AS z 
FROM voxelpt 
WHERE ifcid = 8;


/* Q9: Load all neighbors of a voxel (x,y,z) */



/* Q10: Compute the volume of the 10 building */



/* Q11: Compute the distance between voxel(x,y,z) and voxel(x,y,z) */


