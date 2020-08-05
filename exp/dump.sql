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


\COPY objclass (objID, name) FROM 'C:\Users\z5039792\Documents\Vox3DMod\data\bim\bldnum.txt' DELIMITER ' ';

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



