/* ---------------------------------------------------- */
/*  Created On : 26-June-2020 	             			*/
/*  DBMS       : PostgreSQL 			     			*/
/*  Usage      : voxeldb=# \i C:/voxeldb_dump.sql       */
/*  Author     : Wesley      			     			*/
/* ---------------------------------------------------- */

/* Add PostGIS Extension */
CREATE EXTENSION IF NOT EXISTS POSTGIS;
CREATE EXTENSION IF NOT EXISTS pointcloud;
CREATE EXTENSION IF NOT EXISTS pointcloud_postgis;

INSERT INTO pointcloud_formats (pcid, srid, schema) VALUES (1, 28356,
'<?xml version="1.0" encoding="UTF-8"?>
<pc:PointCloudSchema xmlns:pc="http://pointcloud.org/schemas/PC/1.1"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <pc:dimension>
    <pc:position>1</pc:position>
    <pc:size>4</pc:size>
    <pc:description>X coordinate as a long integer. You must use the
                    scale and offset information of the header to
                    determine the double value.</pc:description>
    <pc:name>X</pc:name>
    <pc:interpretation>int32_t</pc:interpretation>
    <pc:scale>0.1</pc:scale>
    <pc:offset>336300</pc:offset>
    <pc:active>true</pc:active>
  </pc:dimension>
  <pc:dimension>
    <pc:position>2</pc:position>
    <pc:size>4</pc:size>
    <pc:description>Y coordinate as a long integer. You must use the
                    scale and offset information of the header to
                    determine the double value.</pc:description>
    <pc:name>Y</pc:name>
    <pc:interpretation>int32_t</pc:interpretation>
    <pc:scale>0.1</pc:scale>
    <pc:offset>6245507</pc:offset>
    <pc:active>true</pc:active>
  </pc:dimension>
  <pc:dimension>
    <pc:position>3</pc:position>
    <pc:size>4</pc:size>
    <pc:description>Z coordinate as a long integer. You must use the
                    scale and offset information of the header to
                    determine the double value.</pc:description>
    <pc:name>Z</pc:name>
    <pc:interpretation>int32_t</pc:interpretation>
    <pc:scale>0.1</pc:scale>
    <pc:offset>25</pc:offset>
    <pc:active>true</pc:active>
  </pc:dimension>
  <pc:dimension>
    <pc:position>4</pc:position>
    <pc:size>2</pc:size>
    <pc:description>The obj calss is the integer representation
                    of the object semantic information. This value is optional
                    and system specific. However, it should always be
                    included if available.</pc:description>
    <pc:name>objID</pc:name>
    <pc:interpretation>uint16_t</pc:interpretation>
    <pc:scale>1</pc:scale>
  </pc:dimension>
  <pc:dimension>
    <pc:position>5</pc:position>
    <pc:size>2</pc:size>
    <pc:description>The ifc calss is the integer representation
                    of the IFC semantic information. This value is optional
                    and system specific. However, it should always be
                    included if available.</pc:description>
    <pc:name>ifcID</pc:name>
    <pc:interpretation>uint16_t</pc:interpretation>
    <pc:scale>1</pc:scale>
  </pc:dimension>
  <pc:metadata>
    <Metadata name="compression">dimensional</Metadata>
  </pc:metadata>
</pc:PointCloudSchema>');


INSERT INTO pointcloud_formats (pcid, srid, schema) VALUES (2, 28356,
'<?xml version="1.0" encoding="UTF-8"?>
<pc:PointCloudSchema xmlns:pc="http://pointcloud.org/schemas/PC/1.1"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <pc:dimension>
    <pc:position>1</pc:position>
    <pc:size>4</pc:size>
    <pc:description>X coordinate as a long integer. You must use the
                    scale and offset information of the header to
                    determine the double value.</pc:description>
    <pc:name>X</pc:name>
    <pc:interpretation>int32_t</pc:interpretation>
    <pc:scale>0.1</pc:scale>
    <pc:offset>336042</pc:offset>
    <pc:active>true</pc:active>
  </pc:dimension>
  <pc:dimension>
    <pc:position>2</pc:position>
    <pc:size>4</pc:size>
    <pc:description>Y coordinate as a long integer. You must use the
                    scale and offset information of the header to
                    determine the double value.</pc:description>
    <pc:name>Y</pc:name>
    <pc:interpretation>int32_t</pc:interpretation>
    <pc:scale>0.1</pc:scale>
    <pc:offset>6245613</pc:offset>
    <pc:active>true</pc:active>
  </pc:dimension>
  <pc:dimension>
    <pc:position>3</pc:position>
    <pc:size>4</pc:size>
    <pc:description>Z coordinate as a long integer. You must use the
                    scale and offset information of the header to
                    determine the double value.</pc:description>
    <pc:name>Z</pc:name>
    <pc:interpretation>int32_t</pc:interpretation>
    <pc:scale>0.1</pc:scale>
    <pc:offset>27</pc:offset>
    <pc:active>true</pc:active>
  </pc:dimension>
  <pc:dimension>
    <pc:position>4</pc:position>
    <pc:size>2</pc:size>
    <pc:description>The obj calss is the integer representation
                    of the object semantic information. This value is optional
                    and system specific. However, it should always be
                    included if available.</pc:description>
    <pc:name>objID</pc:name>
    <pc:interpretation>uint16_t</pc:interpretation>
    <pc:scale>1</pc:scale>
  </pc:dimension>
  <pc:dimension>
    <pc:position>5</pc:position>
    <pc:size>2</pc:size>
    <pc:description>The ifc calss is the integer representation
                    of the IFC semantic information. This value is optional
                    and system specific. However, it should always be
                    included if available.</pc:description>
    <pc:name>ifcID</pc:name>
    <pc:interpretation>uint16_t</pc:interpretation>
    <pc:scale>1</pc:scale>
  </pc:dimension>
  <pc:metadata>
    <Metadata name="compression">dimensional</Metadata>
  </pc:metadata>
</pc:PointCloudSchema>');


INSERT INTO pointcloud_formats (pcid, srid, schema) VALUES (3, 28356,
'<?xml version="1.0" encoding="UTF-8"?>
<pc:PointCloudSchema xmlns:pc="http://pointcloud.org/schemas/PC/1.1"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <pc:dimension>
    <pc:position>1</pc:position>
    <pc:size>4</pc:size>
    <pc:description>X coordinate as a long integer. You must use the
                    scale and offset information of the header to
                    determine the double value.</pc:description>
    <pc:name>X</pc:name>
    <pc:interpretation>int32_t</pc:interpretation>
    <pc:scale>0.1</pc:scale>
    <pc:offset>336305</pc:offset>
    <pc:active>true</pc:active>
  </pc:dimension>
  <pc:dimension>
    <pc:position>2</pc:position>
    <pc:size>4</pc:size>
    <pc:description>Y coordinate as a long integer. You must use the
                    scale and offset information of the header to
                    determine the double value.</pc:description>
    <pc:name>Y</pc:name>
    <pc:interpretation>int32_t</pc:interpretation>
    <pc:scale>0.1</pc:scale>
    <pc:offset>6245569</pc:offset>
    <pc:active>true</pc:active>
  </pc:dimension>
  <pc:dimension>
    <pc:position>3</pc:position>
    <pc:size>4</pc:size>
    <pc:description>Z coordinate as a long integer. You must use the
                    scale and offset information of the header to
                    determine the double value.</pc:description>
    <pc:name>Z</pc:name>
    <pc:interpretation>int32_t</pc:interpretation>
    <pc:scale>0.1</pc:scale>
    <pc:offset>29</pc:offset>
    <pc:active>true</pc:active>
  </pc:dimension>
  <pc:dimension>
    <pc:position>4</pc:position>
    <pc:size>2</pc:size>
    <pc:description>The obj calss is the integer representation
                    of the object semantic information. This value is optional
                    and system specific. However, it should always be
                    included if available.</pc:description>
    <pc:name>objID</pc:name>
    <pc:interpretation>uint16_t</pc:interpretation>
    <pc:scale>1</pc:scale>
  </pc:dimension>
  <pc:dimension>
    <pc:position>5</pc:position>
    <pc:size>2</pc:size>
    <pc:description>The ifc calss is the integer representation
                    of the IFC semantic information. This value is optional
                    and system specific. However, it should always be
                    included if available.</pc:description>
    <pc:name>ifcID</pc:name>
    <pc:interpretation>uint16_t</pc:interpretation>
    <pc:scale>1</pc:scale>
  </pc:dimension>
  <pc:metadata>
    <Metadata name="compression">dimensional</Metadata>
  </pc:metadata>
</pc:PointCloudSchema>');



INSERT INTO pointcloud_formats (pcid, srid, schema) VALUES (4, 28356,
'<?xml version="1.0" encoding="UTF-8"?>
<pc:PointCloudSchema xmlns:pc="http://pointcloud.org/schemas/PC/1.1"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <pc:dimension>
    <pc:position>1</pc:position>
    <pc:size>4</pc:size>
    <pc:description>X coordinate as a long integer. You must use the
                    scale and offset information of the header to
                    determine the double value.</pc:description>
    <pc:name>X</pc:name>
    <pc:interpretation>int32_t</pc:interpretation>
    <pc:scale>0.1</pc:scale>
    <pc:offset>336409</pc:offset>
    <pc:active>true</pc:active>
  </pc:dimension>
  <pc:dimension>
    <pc:position>2</pc:position>
    <pc:size>4</pc:size>
    <pc:description>Y coordinate as a long integer. You must use the
                    scale and offset information of the header to
                    determine the double value.</pc:description>
    <pc:name>Y</pc:name>
    <pc:interpretation>int32_t</pc:interpretation>
    <pc:scale>0.1</pc:scale>
    <pc:offset>6245580</pc:offset>
    <pc:active>true</pc:active>
  </pc:dimension>
  <pc:dimension>
    <pc:position>3</pc:position>
    <pc:size>4</pc:size>
    <pc:description>Z coordinate as a long integer. You must use the
                    scale and offset information of the header to
                    determine the double value.</pc:description>
    <pc:name>Z</pc:name>
    <pc:interpretation>int32_t</pc:interpretation>
    <pc:scale>0.1</pc:scale>
    <pc:offset>31</pc:offset>
    <pc:active>true</pc:active>
  </pc:dimension>
  <pc:dimension>
    <pc:position>4</pc:position>
    <pc:size>2</pc:size>
    <pc:description>The obj calss is the integer representation
                    of the object semantic information. This value is optional
                    and system specific. However, it should always be
                    included if available.</pc:description>
    <pc:name>objID</pc:name>
    <pc:interpretation>uint16_t</pc:interpretation>
    <pc:scale>1</pc:scale>
  </pc:dimension>
  <pc:dimension>
    <pc:position>5</pc:position>
    <pc:size>2</pc:size>
    <pc:description>The ifc calss is the integer representation
                    of the IFC semantic information. This value is optional
                    and system specific. However, it should always be
                    included if available.</pc:description>
    <pc:name>ifcID</pc:name>
    <pc:interpretation>uint16_t</pc:interpretation>
    <pc:scale>1</pc:scale>
  </pc:dimension>
  <pc:metadata>
    <Metadata name="compression">dimensional</Metadata>
  </pc:metadata>
</pc:PointCloudSchema>');



INSERT INTO pointcloud_formats (pcid, srid, schema) VALUES (5, 28356,
'<?xml version="1.0" encoding="UTF-8"?>
<pc:PointCloudSchema xmlns:pc="http://pointcloud.org/schemas/PC/1.1"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <pc:dimension>
    <pc:position>1</pc:position>
    <pc:size>4</pc:size>
    <pc:description>X coordinate as a long integer. You must use the
                    scale and offset information of the header to
                    determine the double value.</pc:description>
    <pc:name>X</pc:name>
    <pc:interpretation>int32_t</pc:interpretation>
    <pc:scale>0.1</pc:scale>
    <pc:offset>336047</pc:offset>
    <pc:active>true</pc:active>
  </pc:dimension>
  <pc:dimension>
    <pc:position>2</pc:position>
    <pc:size>4</pc:size>
    <pc:description>Y coordinate as a long integer. You must use the
                    scale and offset information of the header to
                    determine the double value.</pc:description>
    <pc:name>Y</pc:name>
    <pc:interpretation>int32_t</pc:interpretation>
    <pc:scale>0.1</pc:scale>
    <pc:offset>6245651</pc:offset>
    <pc:active>true</pc:active>
  </pc:dimension>
  <pc:dimension>
    <pc:position>3</pc:position>
    <pc:size>4</pc:size>
    <pc:description>Z coordinate as a long integer. You must use the
                    scale and offset information of the header to
                    determine the double value.</pc:description>
    <pc:name>Z</pc:name>
    <pc:interpretation>int32_t</pc:interpretation>
    <pc:scale>0.1</pc:scale>
    <pc:offset>25</pc:offset>
    <pc:active>true</pc:active>
  </pc:dimension>
  <pc:dimension>
    <pc:position>4</pc:position>
    <pc:size>2</pc:size>
    <pc:description>The obj calss is the integer representation
                    of the object semantic information. This value is optional
                    and system specific. However, it should always be
                    included if available.</pc:description>
    <pc:name>objID</pc:name>
    <pc:interpretation>uint16_t</pc:interpretation>
    <pc:scale>1</pc:scale>
  </pc:dimension>
  <pc:dimension>
    <pc:position>5</pc:position>
    <pc:size>2</pc:size>
    <pc:description>The ifc calss is the integer representation
                    of the IFC semantic information. This value is optional
                    and system specific. However, it should always be
                    included if available.</pc:description>
    <pc:name>ifcID</pc:name>
    <pc:interpretation>uint16_t</pc:interpretation>
    <pc:scale>1</pc:scale>
  </pc:dimension>
  <pc:metadata>
    <Metadata name="compression">dimensional</Metadata>
  </pc:metadata>
</pc:PointCloudSchema>');



INSERT INTO pointcloud_formats (pcid, srid, schema) VALUES (6, 28356,
'<?xml version="1.0" encoding="UTF-8"?>
<pc:PointCloudSchema xmlns:pc="http://pointcloud.org/schemas/PC/1.1"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <pc:dimension>
    <pc:position>1</pc:position>
    <pc:size>4</pc:size>
    <pc:description>X coordinate as a long integer. You must use the
                    scale and offset information of the header to
                    determine the double value.</pc:description>
    <pc:name>X</pc:name>
    <pc:interpretation>int32_t</pc:interpretation>
    <pc:scale>0.1</pc:scale>
    <pc:offset>336325</pc:offset>
    <pc:active>true</pc:active>
  </pc:dimension>
  <pc:dimension>
    <pc:position>2</pc:position>
    <pc:size>4</pc:size>
    <pc:description>Y coordinate as a long integer. You must use the
                    scale and offset information of the header to
                    determine the double value.</pc:description>
    <pc:name>Y</pc:name>
    <pc:interpretation>int32_t</pc:interpretation>
    <pc:scale>0.1</pc:scale>
    <pc:offset>6245582</pc:offset>
    <pc:active>true</pc:active>
  </pc:dimension>
  <pc:dimension>
    <pc:position>3</pc:position>
    <pc:size>4</pc:size>
    <pc:description>Z coordinate as a long integer. You must use the
                    scale and offset information of the header to
                    determine the double value.</pc:description>
    <pc:name>Z</pc:name>
    <pc:interpretation>int32_t</pc:interpretation>
    <pc:scale>0.1</pc:scale>
    <pc:offset>28</pc:offset>
    <pc:active>true</pc:active>
  </pc:dimension>
  <pc:dimension>
    <pc:position>4</pc:position>
    <pc:size>2</pc:size>
    <pc:description>The obj calss is the integer representation
                    of the object semantic information. This value is optional
                    and system specific. However, it should always be
                    included if available.</pc:description>
    <pc:name>objID</pc:name>
    <pc:interpretation>uint16_t</pc:interpretation>
    <pc:scale>1</pc:scale>
  </pc:dimension>
  <pc:dimension>
    <pc:position>5</pc:position>
    <pc:size>2</pc:size>
    <pc:description>The ifc calss is the integer representation
                    of the IFC semantic information. This value is optional
                    and system specific. However, it should always be
                    included if available.</pc:description>
    <pc:name>ifcID</pc:name>
    <pc:interpretation>uint16_t</pc:interpretation>
    <pc:scale>1</pc:scale>
  </pc:dimension>
  <pc:metadata>
    <Metadata name="compression">dimensional</Metadata>
  </pc:metadata>
</pc:PointCloudSchema>');



/* Drop Tables */
DROP TABLE IF EXISTS voxel CASCADE;
DROP TABLE IF EXISTS voxelpt CASCADE;
DROP TABLE IF EXISTS voxelmpt CASCADE;
DROP TABLE IF EXISTS voxelpatch CASCADE;
DROP TABLE IF EXISTS ifcclass CASCADE;
DROP TABLE IF EXISTS objclass CASCADE;

/* Create Tables */
CREATE TABLE voxel
(
	id serial PRIMARY KEY,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	objID INTEGER,
	ifcID INTEGER
);

CREATE TABLE voxelpt
(
	id serial PRIMARY KEY,
	objID INTEGER,
	ifcID INTEGER,
	geom geometry
);

CREATE TABLE voxelmpt
(
	id serial PRIMARY KEY,
	objID INTEGER,
  ifcID INTEGER,
	geom geometry
);

CREATE TABLE voxelpatch (
  id SERIAL PRIMARY KEY,
  paone PCPATCH(1),
  patwo PCPATCH(2),
  pathree PCPATCH(3),
  pafour PCPATCH(4),
  pafive PCPATCH(5),
  pasix PCPATCH(6)
);

CREATE TABLE ifcclass (
  ifcID INTEGER PRIMARY KEY,
  name VARCHAR(50) NULL
);

CREATE TABLE objclass (
  objID INTEGER PRIMARY KEY,
  name VARCHAR(50) NULL
);


/* Drop index */
DROP INDEX IF EXISTS idx_voxel CASCADE;
DROP INDEX IF EXISTS idx_voxelpt CASCADE;
DROP INDEX IF EXISTS idx_voxelmpt CASCADE;
DROP INDEX IF EXISTS idx_voxelpatch CASCADE;
DROP INDEX IF EXISTS idx_ifcclass CASCADE;
DROP INDEX IF EXISTS idx_objclass CASCADE;

/* Import Data */

-- For table "voxelpt"
INSERT INTO voxelpt(classID, ifcID, geom) SELECT classID, ifcID, ST_MakePoint(x,y,z) FROM voxel AS VALUES;

-- For table "voxelmpt"
DO $$  
DECLARE  
    f record;  
BEGIN  
    FOR f in SELECT DISTINCT objID, ifcID   
    FROM voxelpt  
    LOOP  
        INSERT INTO voxelmpt(objID, ifcID, geom)   
        VALUES (f.objID, f.ifcID, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE objID=f.objID AND ifcID=f.ifcID)));  
    END LOOP;  
END;  
$$  

-- For table "voxelpatch"
DO $$  
DECLARE  
    f record;  
BEGIN  
    FOR f in SELECT DISTINCT objID, ifcID   
    FROM voxelpt  
    LOOP  
        INSERT INTO voxelpatch(objID, ifcID)   
        VALUES (f.objID, f.ifcID); 
        IF f.objID = 1 THEN 
          INSERT INTO voxelpatch (paone) 
          SELECT PC_Patch(pt) 
          FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt 
            FROM voxel WHERE objID=f.objID AND ifcID=f.ifcID) as tmp;
        ELSIF f.objID = 2 THEN 
          INSERT INTO voxelpatch (patwo) 
          SELECT PC_Patch(pt) 
          FROM (SELECT PC_MakePoint(2, ARRAY[x,y,z]) as pt 
            FROM voxel WHERE objID=f.objID AND ifcID=f.ifcID) as tmp;
        ELSIF f.objID = 3 THEN 
          INSERT INTO voxelpatch (pathree) 
          SELECT PC_Patch(pt) 
          FROM (SELECT PC_MakePoint(3, ARRAY[x,y,z]) as pt 
            FROM voxel WHERE objID=f.objID AND ifcID=f.ifcID) as tmp;
        ELSIF f.objID = 4 THEN 
          INSERT INTO voxelpatch (pafour) 
          SELECT PC_Patch(pt) 
          FROM (SELECT PC_MakePoint(4, ARRAY[x,y,z]) as pt 
            FROM voxel WHERE objID=f.objID AND ifcID=f.ifcID) as tmp;
        ELSIF f.objID = 5 THEN 
          INSERT INTO voxelpatch (pafive) 
          SELECT PC_Patch(pt) 
          FROM (SELECT PC_MakePoint(5, ARRAY[x,y,z]) as pt 
            FROM voxel WHERE objID=f.objID AND ifcID=f.ifcID) as tmp;
        ELSE 
          INSERT INTO voxelpatch (pasix) 
          SELECT PC_Patch(pt) 
          FROM (SELECT PC_MakePoint(6, ARRAY[x,y,z]) as pt 
            FROM voxel WHERE objID=f.objID AND ifcID=f.ifcID) as tmp;
        END IF;        
    END LOOP;  
END;  
$$ 




/* Create Index */
CREATE INDEX idx_voxel ON voxel(x, y, z, classID);
CREATE INDEX idx_voxelpt ON voxelpt(classID);
CREATE INDEX idx_voxelmpt ON voxelmpt(classID);
CREATE INDEX idx_voxelpatch ON voxelpatch(classID);
CREATE INDEX idx_ifcclass ON ifcclass(ifcID);
CREATE INDEX idx_objclass ON objclass(classID);


\COPY objclass (objID, name, scale, offsetX, offsetY, offsetZ) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\bldnum.txt' DELIMITER ' ';

<pc:dimension>
    <pc:position>1</pc:position>
    <pc:size>4</pc:size>
    <pc:description>
    X coordinate as a long integer. You must use the
    scale and offset information of the header to
    determine the double value.
    </pc:description>
    <pc:name>X</pc:name>
    <pc:interpretation>int32_t</pc:interpretation>
    <pc:scale>0.1</pc:scale>
    <pc:offset>336300</pc:offset>
    <pc:active>true</pc:active>
</pc:dimension>



-- generate geom for each building object
CERATE VIEW box AS 
    SELECT ST_Translate(ST_Scale(ST_SetSRID(ST_MakeBox2D(ST_Point(minX, minY), ST_Point(maxX, maxY)),28356), O.scale, O.scale), O.offsetX, o.offsetY) AS geom
    FROM (SELECT objID, MIN(x) AS minX, MIN(y) AS minY, MAX(x) AS maxX, MAX(y) AS maxY FROM voxel GROUP BY objID) AS tmp 
    JOIN objclass O ON tmp.objID=O.objID;

-- calculate distance
SELECT t1.obj, t2.obj, ST_Distance(t1.geom, t2.geom) as dist
FROM box t1, box t2, objclass O
WHERE t1.obj != t2.obj AND t1.obj = O.objID AND O.name='Built Environment' order by dist;


DO $$  
BEGIN  
    FOR idx in 1..54  
    LOOP  
        IF idx = 26 OR idx = 46 THEN  
            raise notice 'The buidling % could not be found', idx;  
        ELSE    
            INSERT INTO voxelmpt(classID, geom)   
            VALUES (idx, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE classID=idx AND ifcID IS NULL)));  
        END IF;  
    END LOOP;  
END;  
$$  


DO $$  
DECLARE  
    f record;  
BEGIN  
    FOR f in SELECT DISTINCT classID, ifcID   
        FROM voxel WHERE ifcID IS NOT NULL  
    LOOP  
        INSERT INTO voxelmpt(classID, ifcID, geom)   
        VALUES (f.classID, f.ifcID, ST_Collect(ARRAY(SELECT geom FROM voxelpt WHERE ifcID IS NOT NULL AND classID=f.classID  AND ifcID=f.ifcID)));  
    END LOOP;  
END;  
$$  


CERATE VIEW box AS 
SELECT ST_Translate(
    ST_Scale(ST_SetSRID(
    ST_MakeBox2D(
        ST_Point(minX, minY), 
        ST_Point(maxX, maxY)
    ),28356), O.scale, O.scale), 
    O.offsetX, o.offsetY) AS geom
FROM (SELECT objID, 
    MIN(x) AS minX, MIN(y) AS minY, 
    MAX(x) AS maxX, MAX(y) AS maxY 
    FROM voxel GROUP BY objID) AS tmp 
JOIN objclass O ON tmp.objID=O.objID;


CREATE VIEW box AS
SELECT ST_Extent(
    ST_Translate(ST_Scale(
        pa::geometry, O.scale, O.scale), 
    O.offsetX, o.offsetY))::geometry AS geom  
FROM voxelpatch V
JOIN objclass O ON V.objID=O.objID
GROUP BY V.objID;

SELECT ST_Translate(ST_Scale(
        geom, O.scale, O.scale), 
    O.offsetX, o.offsetY)) AS geom
FROM voxelmpt V
JOIN objclass O ON V.objID=O.objID
GROUP BY V.objID;

SELECT geom 
FROM voxelmptnumeric V
JOIN objclass O ON V.objID=O.objID
GROUP BY V.objID;


INSERT INTO ifcclass(ifcid, name) VALUES (30, 'tree');  
DO $$    
BEGIN    
    FOR idx in 1..1345    
    LOOP   
        INSERT INTO voxelmpt(classID, ifcID, geom)     
        VALUES (55, 30, ST_Collect(ARRAY(  
            SELECT V.geom   
            FROM voxelpt V   
            JOIN tree T ON ST_WITHIN(V.geom, ST_Buffer(T.geom, 4, 'quad_segs=8'))   
            WHERE V.classid=55 AND T.id=idx))); 
        DELETE FROM voxelmpt WHERE classID=55 AND ifcID=30 AND geom IS NULL; 
    END LOOP;    
END;    
$$  



DO $$  
BEGIN  
    FOR idx in 1..118  
    LOOP 
        INSERT INTO voxelmpt(classID, ifcID, geom)   
        VALUES (56, 27, ST_Collect(ARRAY(
            SELECT V.geom 
            FROM voxelpt V 
            JOIN road R ON ST_WITHIN(V.geom, R.geom) 
            WHERE V.classid=56 AND R.id=idx))); 
        DELETE FROM voxelmpt WHERE classID=56 AND ifcID=27 AND geom IS NULL;   
    END LOOP;  
END;  
$$   


INSERT INTO ifcclass(ifcid, name) VALUES (28, 'greenarea');  
DO $$    
BEGIN    
    FOR idx in 1..120    
    LOOP   
        INSERT INTO voxelmpt(classID, ifcID, geom)     
        VALUES (56, 28, ST_Collect(ARRAY(  
            SELECT V.geom   
            FROM voxelpt V   
            JOIN greenareas G ON ST_WITHIN(V.geom, G.geom)   
            WHERE V.classid=56 AND G.gid=idx)));
        DELETE FROM voxelmpt WHERE classID=56 AND ifcID=28 AND geom IS NULL;   
    END LOOP;    
END;    
$$  


INSERT INTO ifcclass(ifcid, name) VALUES (29, 'building');  
DO $$    
BEGIN    
    FOR idx in 1..121    
    LOOP   
       INSERT INTO voxelmpt(classID, ifcID, geom)     
        VALUES (56, 29, ST_Collect(ARRAY(  
            SELECT V.geom   
            FROM voxelpt V   
            JOIN building B ON ST_WITHIN(V.geom, B.geom)   
            WHERE V.classid=56 AND B.id=idx)));
        DELETE FROM voxelmpt WHERE classID=56 AND ifcID=29 AND geom IS NULL;
    END LOOP;    
END;    
$$ 


DROP INDEX IF EXISTS idx_voxelmpt CASCADE;  
DROP INDEX IF EXISTS geom_voxelmpt CASCADE;  
CREATE INDEX idx_voxelmpt ON voxelmpt(classID, ifcID);  
CREATE INDEX geom_voxelmpt ON voxelmpt USING GIST (geom);  



-- voxelpatch table
DO $$  
BEGIN  
    FOR idx in 1..54  
    LOOP  
        IF idx = 26 OR idx = 46 THEN  
            raise notice 'The buidling % could not be found', idx;  
        ELSE    
            INSERT INTO voxelpatch(classID, pa)   
            VALUES (idx, PC_Patch(ARRAY(SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=idx AND ifcID IS NULL)));
        END IF;
    END LOOP;
END;
$$  


DO $$  
DECLARE  
    f record;  
BEGIN  
    FOR f in SELECT DISTINCT classID, ifcID   
        FROM voxel WHERE ifcID IS NOT NULL  
    LOOP  
        INSERT INTO voxelpatch(classID, ifcID, geom)   
        VALUES (f.classID, f.ifcID, PC_Patch(ARRAY(SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE ifcID IS NOT NULL AND classID=f.classID  AND ifcID=f.ifcID)));  
    END LOOP;  
END;  
$$


-- ************ tree ************
DO $$    
BEGIN    
    FOR idx in 1..1345    
    LOOP   
        INSERT INTO voxelpatch(classID, ifcID, pa)     
        VALUES (55, 30, PC_Patch(ARRAY(
            SELECT V.pt
            FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=55) AS V 
            JOIN tree T ON ST_WITHIN(V.pt::geometry, ST_Buffer(T.geom, 4, 'quad_segs=8'))   
            WHERE T.id=idx)));
        DELETE FROM voxelpatch WHERE classID=55 AND ifcID=30 AND PC_NumPoints(pa) < 1;   
    END LOOP;    
END;    
$$


SELECT count(PC_MakePoint(1, ARRAY[x,y,z])) 
FROM (
    SELECT ST_X((ST_DumpPoints(f.geom)).geom) AS x, 
    ST_Y((ST_DumpPoints(f.geom)).geom) AS y, 
    ST_Z((ST_DumpPoints(f.geom)).geom) AS z 
    FROM (SELECT geom FROM voxelmpt WHERE classID=55 AND ifcID=30 AND geom IS NOT NULL limit 1) AS f
) AS g;

SELECT ST_NumGeometries(geom) from voxelmpt WHERE classID=55 AND ifcID=30 AND geom IS NOT NULL limit 1;


DO $$  
DECLARE  
    f record;  
BEGIN  
    FOR f in SELECT geom   
        FROM voxelmpt WHERE classID=55 AND ifcID=30 AND geom IS NOT NULL 
    LOOP  
        INSERT INTO voxelpatch(classID, ifcID, pa)   
        VALUES (55, 30, PC_Patch(ARRAY(
            SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM (
                SELECT ST_X((ST_DumpPoints(f.geom)).geom) AS x, 
                ST_Y((ST_DumpPoints(f.geom)).geom) AS y, 
                ST_Z((ST_DumpPoints(f.geom)).geom) AS z
                ) AS g
            )));
    END LOOP;  
END;  
$$


-- ************ road ************
DO $$  
BEGIN  
    FOR idx in 1..118  
    LOOP 
        INSERT INTO voxelpatch(classID, ifcID, pa)   
        VALUES (56, 27, PC_Patch(ARRAY(
            SELECT V.pt
            FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56) AS V 
            JOIN road R ON ST_WITHIN(V.pt::geometry, R.geom) 
            WHERE R.id=idx)));
        DELETE FROM voxelpatch WHERE classID=56 AND ifcID=27 AND PC_NumPoints(pa) < 1;  
    END LOOP;  
END;  
$$


DO $$  
DECLARE  
    f record;  
BEGIN  
    FOR f in SELECT geom   
        FROM voxelmpt WHERE classID=56 AND ifcID=27 AND geom IS NOT NULL 
    LOOP  
        INSERT INTO voxelpatch(classID, ifcID, pa)   
        VALUES (56, 27, PC_Patch(ARRAY(
            SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM (
                SELECT ST_X((ST_DumpPoints(f.geom)).geom) AS x, 
                ST_Y((ST_DumpPoints(f.geom)).geom) AS y, 
                ST_Z((ST_DumpPoints(f.geom)).geom) AS z
                ) AS g
            )));
    END LOOP;  
END;  
$$


-- ************ greenarea ************
DO $$  
BEGIN  
    FOR idx in 1..120  
    LOOP 
        INSERT INTO voxelpatch(classID, ifcID, pa)   
        VALUES (56, 28, PC_Patch(ARRAY(
            SELECT V.pt
            FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56) AS V 
            JOIN greenareas G ON ST_WITHIN(V.pt::geometry, G.geom) 
            WHERE G.gid=idx)));
        DELETE FROM voxelpatch WHERE classID=56 AND ifcID=28 AND PC_NumPoints(pa) < 1;
    END LOOP;  
END;  
$$


DO $$  
DECLARE  
    f record;  
BEGIN  
    FOR f in SELECT geom   
        FROM voxelmpt WHERE classID=56 AND ifcID=28 AND geom IS NOT NULL 
    LOOP  
        INSERT INTO voxelpatch(classID, ifcID, pa)   
        VALUES (56, 28, PC_Patch(ARRAY(
            SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM (
                SELECT ST_X((ST_DumpPoints(f.geom)).geom) AS x, 
                ST_Y((ST_DumpPoints(f.geom)).geom) AS y, 
                ST_Z((ST_DumpPoints(f.geom)).geom) AS z
                ) AS g
            )));
    END LOOP;  
END;  
$$

-- ************ building ************
DO $$  
BEGIN  
    FOR idx in 1..121  
    LOOP 
        INSERT INTO voxelpatch(classID, ifcID, geom)   
        VALUES (56, 29, PC_Patch(ARRAY(
            SELECT V.pt
            FROM (SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM voxel WHERE classID=56) AS V 
            JOIN building B ON ST_WITHIN(V.pt::geometry, B.geom)
            WHERE B.id=idx))); 
        DELETE FROM voxelpatch WHERE classID=56 AND ifcID=29 AND PC_NumPoints(pa) < 1;  
    END LOOP;  
END;  
$$
 

DO $$  
DECLARE  
    f record;  
BEGIN  
    FOR f in SELECT geom   
        FROM voxelmpt WHERE classID=56 AND ifcID=29 AND geom IS NOT NULL 
    LOOP  
        INSERT INTO voxelpatch(classID, ifcID, pa)   
        VALUES (56, 29, PC_Patch(ARRAY(
            SELECT PC_MakePoint(1, ARRAY[x,y,z]) as pt FROM (
                SELECT ST_X((ST_DumpPoints(f.geom)).geom) AS x, 
                ST_Y((ST_DumpPoints(f.geom)).geom) AS y, 
                ST_Z((ST_DumpPoints(f.geom)).geom) AS z
                ) AS g
            )));
    END LOOP;  
END;  
$$
   

DROP INDEX IF EXISTS idx_voxelpatch CASCADE;
DROP INDEX IF EXISTS geom_voxelpatch CASCADE;
CREATE INDEX idx_voxelpatch ON voxelpatch(classID, ifcID);
CREATE INDEX geom_voxelpatch ON voxelpatch USING GIST(PC_EnvelopeGeometry(pa));






