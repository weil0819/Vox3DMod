/* ---------------------------------------------------- */
/*  Created On : 13-July-2020 	             			*/
/*  DBMS       : PostgreSQL 			     			*/
/*  Tables	   : voxel, voxelmpt, voxelpt, voxelpatch   */
/*  Output     : voxeldb=# \o C:/voxeldb_result.log     */
/*  Usage      : voxeldb=# \i C:/voxeldb_query.sql      */
/*  Author     : Wesley      			     			*/
/* ---------------------------------------------------- */

-- 1247611386

-- A. Queries that return subset of voxels
/*
1. Select all voxels in a given MINMAX space (radius). 
Several options for MINMAX: rectangular space, 
very long but narrow space, different size space and at different locations 
(at the beginning, middle and end of the entire voxel space of the campus)  
*/

-- For small rectangle [50*50]
EXPLAIN ANALYZE 
SELECT * FROM voxel WHERE (x BETWEEN 336100 AND 336150) AND (y BETWEEN 6245300 AND 6245350);

EXPLAIN ANALYZE 
SELECT * FROM voxelpt WHERE (ST_Intersects(geom, ST_MakeEnvelope(336100,6245300,336150,6245350,28356)));

EXPLAIN ANALYZE 
SELECT * FROM voxelmpt WHERE (ST_Intersects(geom, ST_MakeEnvelope(336100,6245300,336150,6245350,28356)));

EXPLAIN ANALYZE 
SELECT * FROM voxelpatch WHERE (PC_Intersects(pa, ST_MakeEnvelope(336100,6245300,336150,6245350,28356)));


-- For large rectangle [200*200]
EXPLAIN ANALYZE 
SELECT * FROM voxel WHERE (x BETWEEN 336200 AND 336400) AND (y BETWEEN 6245400 AND 6245600);

EXPLAIN ANALYZE 
SELECT * FROM voxelpt WHERE (ST_Intersects(geom, ST_MakeEnvelope(336200,6245400,336400,6245600,28356)));

EXPLAIN ANALYZE 
SELECT * FROM voxelmpt WHERE (ST_Intersects(geom, ST_MakeEnvelope(336200,6245400,336400,6245600,28356)));

EXPLAIN ANALYZE 
SELECT * FROM voxelpatch WHERE (PC_Intersects(pa, ST_MakeEnvelope(336200,6245400,336400,6245600,28356)));


-- For long, narrow, diagonal rectangle [50*200]
EXPLAIN ANALYZE 
SELECT * FROM voxel WHERE (x BETWEEN 336100 AND 336150) AND (y BETWEEN 6245400 AND 6245600);

EXPLAIN ANALYZE 
SELECT * FROM voxelpt WHERE (ST_Intersects(geom, ST_MakeEnvelope(336100,6245400,336150,6245600,28356)));

EXPLAIN ANALYZE 
SELECT * FROM voxelmpt WHERE (ST_Intersects(geom, ST_MakeEnvelope(336100,6245400,336150,6245600,28356)));

EXPLAIN ANALYZE 
SELECT * FROM voxelpatch WHERE (PC_Intersects(pa, ST_MakeEnvelope(336100,6245400,336150,6245600,28356)));



/*
2.	Select all voxels in a given MINMAX/radius from a voxel (x,y,z)
*/
-- For small cycle at (336300,6245500), radius 20m
EXPLAIN ANALYZE 
SELECT * FROM voxel WHERE (x BETWEEN 336300-20.0 AND 336300+20.0) 
AND (y BETWEEN 6245500-20.0 AND 6245500+20.0) 
AND SQRT(POW(x-336300, 2) + POW(y-6245500, 2)) < 20;

EXPLAIN ANALYZE 
SELECT * FROM voxelpt WHERE (ST_Intersects(geom, ST_Buffer(ST_SetSRID(ST_MakePoint(336300,6245500),28356),20,'quad_segs=8')));

EXPLAIN ANALYZE 
SELECT * FROM voxelmpt WHERE (ST_Intersects(geom, ST_Buffer(ST_SetSRID(ST_MakePoint(336300,6245500),28356),20,'quad_segs=8')));

EXPLAIN ANALYZE 
SELECT * FROM voxelpatch WHERE (PC_Intersects(pa, ST_Buffer(ST_SetSRID(ST_MakePoint(336300,6245500),28356),20,'quad_segs=8')));



-- For large cycle at (336300,6245500), radius 100m
EXPLAIN ANALYZE 
SELECT * FROM voxel WHERE (x BETWEEN 336300-20.0 AND 336300+20.0) 
AND (y BETWEEN 6245500-20.0 AND 6245500+20.0) 
AND SQRT(POW(x-336300, 2) + POW(y-6245500, 2)) < 100;

EXPLAIN ANALYZE 
SELECT * FROM voxelpt WHERE (ST_Intersects(geom, ST_Buffer(ST_SetSRID(ST_MakePoint(336300,6245500),28356),100,'quad_segs=8')));

EXPLAIN ANALYZE 
SELECT * FROM voxelmpt WHERE (ST_Intersects(geom, ST_Buffer(ST_SetSRID(ST_MakePoint(336300,6245500),28356),100,'quad_segs=8')));

EXPLAIN ANALYZE 
SELECT * FROM voxelpatch WHERE (PC_Intersects(pa, ST_Buffer(ST_SetSRID(ST_MakePoint(336300,6245500),28356),100,'quad_segs=8')));



/*
3.	Select all voxels that have a specific attribute
*/
EXPLAIN ANALYZE 
SELECT * FROM voxel WHERE category='tree';
-- 
EXPLAIN ANALYZE 
SELECT * FROM voxelpt WHERE category='tree';
-- 
EXPLAIN ANALYZE 
SELECT * FROM voxelmpt WHERE category='tree';
-- Planning Time: 0.149 ms, Execution Time: 942.018 ms
EXPLAIN ANALYZE 
SELECT * FROM voxelpatch WHERE category='tree';
-- Planning Time: 0.267 ms, Execution Time: 178.882 ms


/*
4.	Combination of 3 and 4: e.g. all trees in a given MINMAX/radius around a given location (x,y,z)
*/
EXPLAIN ANALYZE 
SELECT * FROM voxel WHERE (x BETWEEN 336300-20.0 AND 336300+20.0) 
AND (y BETWEEN 6245500-20.0 AND 6245500+20.0) 
AND SQRT(POW(x-336300, 2) + POW(y-6245500, 2)) < 100 AND category='tree';
-- ???
EXPLAIN ANALYZE 
SELECT * FROM voxelpt WHERE category='tree' AND (ST_Intersects(geom, ST_Buffer(ST_SetSRID(ST_MakePoint(336300,6245500),28356),100,'quad_segs=8')));
-- ???
EXPLAIN ANALYZE 
SELECT * FROM voxelmpt WHERE category='tree' AND (ST_Intersects(geom, ST_Buffer(ST_SetSRID(ST_MakePoint(336300,6245500),28356),100,'quad_segs=8')));
-- Planning Time: 0.365 ms, Execution Time: 3606.693 ms
EXPLAIN ANALYZE 
SELECT * FROM voxelpatch WHERE category='tree' AND (PC_Intersects(pa, ST_Buffer(ST_SetSRID(ST_MakePoint(336300,6245500),28356),100,'quad_segs=8')));
-- Planning Time: 0.402 ms, Execution Time: 728.661 ms


/*
5.	Select all the information for a specific voxel (x,y,x).
*/
EXPLAIN ANALYZE 
SELECT * FROM voxel WHERE x=336307.7 AND y=6245536.3 AND z=36.6;
-- 
EXPLAIN ANALYZE 
SELECT * FROM voxelpt WHERE ST_X(geom)=336307.7 AND ST_Y(geom)=6245536.3 AND ST_Z(geom)=36.6;
-- 
EXPLAIN ANALYZE 
SELECT ST_X(POINT_geom) AS x, ST_Y(POINT_geom) AS y, ST_Z(POINT_geom) AS z, category, ifc, name   
FROM (
	SELECT (ST_Dump(geom)).geom AS POINT_geom, category, ifc, name FROM voxelmpt
) AS temp 
WHERE ST_X(POINT_geom)=336307.7 AND ST_Y(POINT_geom)=6245536.3 AND ST_Z(POINT_geom)=36.6;
-- Planning Time: 15.252 ms, Execution Time: 1079634.117 ms
EXPLAIN ANALYZE 
SELECT PC_Get(PCPOINT_geom, 'X') AS x, PC_Get(PCPOINT_geom, 'Y') AS y, PC_Get(PCPOINT_geom, 'Z') AS z, category, ifc, name  
FROM (
	SELECT PC_Explode(pa) AS PCPOINT_geom, category, ifc, name FROM voxelpatch
) AS temp 
WHERE PC_Get(PCPOINT_geom, 'X')=336307.7 AND PC_Get(PCPOINT_geom, 'Y')=6245536.3 AND PC_Get(PCPOINT_geom, 'Z')=36.6;
-- Planning Time: 355.127 ms, Execution Time: 1130303.459 ms



/*
6.	Select MAX or MIN on the basis of value (for example ‘ the highest point of DTM of a building X).
*/

EXPLAIN ANALYZE 
SELECT MAX(z) 
FROM voxel 
WHERE category='building' AND name LIKE 'Red%' AND ifc IS NULL;
-- 
EXPLAIN ANALYZE 
SELECT ST_ZMax(geom)
FROM voxelpt 
WHERE category='building' AND name LIKE 'Red%' AND ifc IS NULL;
-- 
EXPLAIN ANALYZE 
SELECT ST_ZMax(geom) 
FROM voxelmpt 
WHERE category='building' AND name LIKE 'Red%' AND ifc IS NULL;
-- Planning Time: 0.140 ms, Execution Time: 1781.768 ms
EXPLAIN ANALYZE 
SELECT PC_PatchMax(pa, 'z')
FROM voxelpatch 
WHERE category='building' AND name LIKE 'Red%' AND ifc IS NULL;
-- Planning Time: 0.115 ms, Execution Time: 0.314 ms


/*
7.	Select a specific object (e.g. Building X, DTM, Vegetation)
*/
EXPLAIN ANALYZE 
SELECT * 
FROM voxel WHERE category='building' AND name LIKE 'Red%' AND ifc='IfcStair';
-- 
EXPLAIN ANALYZE 
SELECT * 
FROM voxelpt WHERE category='building' AND name LIKE 'Red%' AND ifc='IfcStair';
-- 
EXPLAIN ANALYZE 
SELECT * 
FROM voxelmpt WHERE category='building' AND name LIKE 'Red%' AND ifc='IfcStair';
-- Planning Time: 0.202 ms, Execution Time: 0.081 ms
EXPLAIN ANALYZE 
SELECT * 
FROM voxelpatch WHERE category='building' AND name LIKE 'Red%' AND ifc='IfcStair';
-- Planning Time: 0.231 ms, Execution Time: 68.111 ms


/*
8.	Select all objects (e.g. buildings) with a given attribute (e.g. have indoor)
*/
EXPLAIN ANALYZE 
SELECT * 
FROM voxel WHERE category='building' AND ifc='IfcDoor';
-- 
EXPLAIN ANALYZE 
SELECT * 
FROM voxelpt WHERE category='building' AND ifc='IfcDoor';
-- 
EXPLAIN ANALYZE 
SELECT * 
FROM voxelmpt WHERE category='building' AND ifc='IfcDoor';
-- Planning Time: 0.121 ms, Execution Time: 0.132 ms
EXPLAIN ANALYZE 
SELECT * 
FROM voxelpatch WHERE category='building' AND ifc='IfcDoor';
-- Planning Time: 0.660 ms, Execution Time: 0.078 ms


/*
B.	Some more complicated selections
*/

/*
1.	Give all neighbours of a voxel (x,y,z)
*/
EXPLAIN ANALYZE 
SELECT * FROM voxel WHERE (x BETWEEN 336307.7-0.2 AND 336307.7+0.2) 
AND (y BETWEEN 6245536.3-0.2 AND 6245536.3+0.2) AND (z BETWEEN 36.6-0.2 AND 36.6+0.2)
ORDER BY POW(x-336307.7, 2) + POW(y-6245536.3, 2) + POW(z-36.6, 2) 
LIMIT 100;
-- 
EXPLAIN ANALYZE 
SELECT * FROM voxept WHERE (ST_X(geom) BETWEEN 336307.7-0.2 AND 336307.7+0.2) 
AND (ST_Y(geom) BETWEEN 6245536.3-0.2 AND 6245536.3+0.2) AND (ST_Z(geom) BETWEEN 36.6-0.2 AND 36.6+0.2)
ORDER BY POW(ST_X(geom)-336307.7, 2) + POW(ST_Y(geom)-6245536.3, 2) + POW(ST_Z(geom)-36.6, 2) 
LIMIT 100;
-- 
EXPLAIN ANALYZE 
SELECT *   
FROM (
	SELECT (ST_Dump(geom)).geom AS POINT_geom, category, ifc, name FROM voxelmpt
) AS temp 
WHERE (ST_X(POINT_geom) BETWEEN 336307.7-0.2 AND 336307.7+0.2) 
AND (ST_Y(POINT_geom) BETWEEN 6245536.3-0.2 AND 6245536.3+0.2) AND (ST_Z(POINT_geom) BETWEEN 36.6-0.2 AND 36.6+0.2)
ORDER BY POW(ST_X(POINT_geom)-336307.7, 2) + POW(ST_Y(POINT_geom)-6245536.3, 2) + POW(ST_Z(POINT_geom)-36.6, 2) 
LIMIT 100;
-- Planning Time: 123.801 ms, Execution Time: 1368820.031 ms
EXPLAIN ANALYZE 
SELECT *  
FROM (
	SELECT PC_Explode(pa) AS PCPOINT_geom, category, ifc, name FROM voxelpatch
) AS temp 
WHERE (PC_Get(PCPOINT_geom, 'X') BETWEEN 336307.7-0.2 AND 336307.7+0.2) 
AND (PC_Get(PCPOINT_geom, 'Y') BETWEEN 6245536.3-0.2 AND 6245536.3+0.2) AND (PC_Get(PCPOINT_geom, 'Z') BETWEEN 36.6-0.2 AND 36.6+0.2)
ORDER BY POW(PC_Get(PCPOINT_geom, 'X')-336307.7, 2) + POW(PC_Get(PCPOINT_geom, 'Y')-6245536.3, 2) + POW(PC_Get(PCPOINT_geom, 'Z')-36.6, 2) 
LIMIT 100;
-- Planning Time: 0.274 ms, Execution Time: 1346197.354 ms



/*
2.	Give the outer shell of an object
*/






/*
3.	Give the buffer of an object
*/
-- Returns a geometry/geography that represents all trees 
-- whose distance from 'Red Centre' is less than or equal to 20m
EXPLAIN ANALYZE 
SELECT * FROM voxel 
WHERE ;
-- 
EXPLAIN ANALYZE 
SELECT V2.* FROM voxelpt V1, voxelpt V2;
-- 
EXPLAIN ANALYZE 
SELECT V2.* FROM voxelmpt V1, voxelmpt V2
WHERE V1.category='building' AND v2.category='tree' AND V1.name LIKE 'Red%' AND V1.ifc IS NULL  
AND (ST_Intersects(V2.geom, ST_Buffer(ST_Envelope(V1.geom),20,'quad_segs=8')));
-- Planning Time: 0.211 ms, Execution Time: 32953.416 ms
EXPLAIN ANALYZE 
SELECT V2.* FROM voxelpatch V1, voxelpatch V2
WHERE V1.category='building' AND v2.category='tree' AND V1.name LIKE 'Red%' AND V1.ifc IS NULL 
AND (PC_Intersects(V2.pa, ST_Buffer(PC_EnvelopeGeometry(V1.pa),20,'quad_segs=8')));
-- Planning Time: 0.306 ms, Execution Time: 5.720 ms



/*
C.	Queries that return a result of computation
*/

/*
1.	Give the volume of an object (objects)
*/
-- volume of 'Red Centre'
CREATE EXTENSION postgis_sfcgal;


EXPLAIN ANALYZE 
SELECT (ST_XMax(box)-ST_XMin(box))*(ST_YMax(box)-ST_YMin(box))*(ST_ZMax(box)-ST_ZMin(box)) AS volume
FROM (SELECT ST_3DExtent(geom) AS box FROM voxelmpt 
WHERE category='building' AND name LIKE 'Red%' AND ifc IS NULL) AS tmp;
-- Planning Time: 0.160 ms, Execution Time: 1982.632 ms
EXPLAIN ANALYZE 
SELECT (PC_PatchMax(pa, 'x')-PC_PatchMin(pa, 'x'))*(PC_PatchMax(pa, 'y')-PC_PatchMin(pa, 'y'))*(PC_PatchMax(pa, 'z')-PC_PatchMin(pa, 'z')) AS volume
FROM voxelpatch 
WHERE category='building' AND name LIKE 'Red%' AND ifc IS NULL;
-- Planning Time: 0.218 ms, Execution Time: 11.503 ms


/*
2.	Give the area of the footprint of an object
*/
-- area of the footprint of Red Centre building

EXPLAIN ANALYZE 
SELECT ST_Area(ST_Envelope(geom)) 
FROM voxelmpt 
WHERE category='building' AND name LIKE 'Red%' AND ifc IS NULL;
-- Planning Time: 0.272 ms, Execution Time: 1682.396 ms
EXPLAIN ANALYZE 
SELECT ST_Area(PC_EnvelopeGeometry(pa)) 
FROM voxelpatch 
WHERE category='building' AND name LIKE 'Red%' AND ifc IS NULL;
-- Planning Time: 0.195 ms, Execution Time: 0.573 ms



/*
3.	Give the distance between voxel 1 and voxel 2
*/
-- Distance between (336057.2, 6245674.5, 35.6) and (336307.7, 6245536.3, 36.6)
EXPLAIN ANALYZE 
SELECT SQRT(POW(336057.2-336307.7, 2) + POW(6245674.5-6245536.3, 2) + POW(35.6-36.6, 2)) FROM voxel;

EXPLAIN ANALYZE 
SELECT SQRT(POW(336057.2-336307.7, 2) + POW(6245674.5-6245536.3, 2) + POW(35.6-36.6, 2)) FROM voxelpt;

EXPLAIN ANALYZE 
SELECT SQRT(POW(336057.2-336307.7, 2) + POW(6245674.5-6245536.3, 2) + POW(35.6-36.6, 2)) FROM voxelmpt;

EXPLAIN ANALYZE 
SELECT SQRT(POW(336057.2-336307.7, 2) + POW(6245674.5-6245536.3, 2) + POW(35.6-36.6, 2)) FROM voxelpatch;




-- *****************************************************************************************
EXPLAIN ANALYZE 
SELECT x, y, z 
FROM voxel 
WHERE x > 100 AND x < 200 AND y > 100 AND y < 200;

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
WHERE classid = 56 AND ST_X(geom) >= minX AND ST_X(geom) <= maxX AND ST_Y(geom) >= minY AND ST_Y(geom) <= maxY; 

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


/* Q9: Compute the volume of the 10 building (cubic metres) */
EXPLAIN ANALYZE 
SELECT 0.008*COUNT(*) AS volume
FROM voxel 
WHERE classid = 10;

EXPLAIN ANALYZE 
SELECT 0.008*COUNT(*) AS volume 
FROM voxelpt 
WHERE classid=10;

EXPLAIN ANALYZE 
SELECT 0.008*ST_NumGeometries(geom) AS volume 
FROM voxelmpt 
WHERE classid=10;

EXPLAIN ANALYZE 
SELECT 0.008*PC_NumPoints(pa) AS volume 
FROM voxelpatch 
WHERE classid=10;


/* Q10: Compute the distance between voxel(x,y,z) and voxel(x,y,z) */
EXPLAIN ANALYZE 
SELECT SQRT(POW(200-100, 2) + POW(300-200, 2) + POW(400-300, 2)) AS distance;

EXPLAIN ANALYZE 
SELECT ST_3DDistance(V1.geom, V2.geom) AS distance 
FROM voxelpt V1, voxelpt V2 
WHERE ST_X(V1.geom) = 100 AND ST_Y(V1.geom) = 200 AND ST_Z(V1.geom) = 300 AND 
ST_X(V2.geom) = 200 AND ST_Y(V2.geom) = 300 AND ST_Z(V2.geom) = 400;

EXPLAIN ANALYZE 
SELECT ST_3DDistance(V1.geom, V2.geom) AS distance   
FROM (SELECT (ST_Dump(geom)).geom AS POINT_geom FROM voxelmpt) AS V1, 
(SELECT (ST_Dump(geom)).geom AS POINT_geom FROM voxelmpt) AS V2
WHERE ST_X(V1.POINT_geom)= 100 AND ST_Y(V1.POINT_geom) = 200 AND ST_Z(V1.POINT_geom) = 300 AND 
ST_X(V2.POINT_geom)= 200 AND ST_Y(V2.POINT_geom) = 300 AND ST_Z(V2.POINT_geom) = 400;

EXPLAIN ANALYZE 
SELECT ST_3DDistance(V1.PCPOINT_geom::geometry, V2.PCPOINT_geom::geometry) AS distance   
FROM (SELECT PC_Explode(pa) AS PCPOINT_geom FROM voxelpatch) AS V1, 
(SELECT PC_Explode(pa) AS PCPOINT_geom FROM voxelpatch) AS V2 
WHERE PC_Get(V1.PCPOINT_geom, 'X') = 100 AND PC_Get(V1.PCPOINT_geom, 'Y') = 200 AND PC_Get(V1.PCPOINT_geom, 'Z') = 300 AND 
PC_Get(V2.PCPOINT_geom, 'X') = 200 AND PC_Get(V2.PCPOINT_geom, 'Y') = 300 AND PC_Get(V2.PCPOINT_geom, 'Z') = 400;

/* Q11: Load all neighbors of a voxel (x,y,z) */

