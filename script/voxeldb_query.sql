/* ---------------------------------------------------- */
/*  Created On : 13-July-2020 	             			*/
/*  DBMS       : PostgreSQL 			     			*/
/*  Output     : voxeldb=# \o C:/voxeldb_result.sql    */
/*  Usage      : voxeldb=# \i C:/voxeldb_query.sql     */
/*  Author     : Wesley      			     			*/
/* ---------------------------------------------------- */

/* Q1: Load all voxels that are in a given rectangle 100<x<200 and 100<y<200 and 100<z<200 */
EXPLAIN ANALYZE SELECT * FROM voxel WHERE x > 100 AND x < 200 AND y > 100 AND y < 200 AND z > 100 AND z < 200;
EXPLAIN ANALYZE SELECT 


/* Q2: Load all voxels that are in circle with radius 100 and center (x,y,z) */


/* Q3: Load all voxels that are buildings */


/* Q4: Load all building voxels that are in circle with radius 100 and center (x,y,z) */


/* Q5: Load all details for voxel (x,y,z) */


/* Q6: Return the highest and lowest height of DTM of the 10 building */


/* Q7: Load all voxels that are tree */


/* Q8: Load all building voxels that have door in ifc attribute */


/* Q9: Load all neighbors of a voxel (x,y,z) */


/* Q10: Compute the volume of the 10 building */


/* Q11: Compute the distance between voxel(x,y,z) and voxel(x,y,z) */









