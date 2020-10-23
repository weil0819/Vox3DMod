VACUUM FULL ANALYZE voxelpt;
-- VACUUM
-- Query returned successfully in 946 min 41 secs.

-- 关于更新ifc字段
-- TRANSACTION
-- MULTITHREADING
-- BATCH UPDATE
DO $$
DECLARE 
	v_curID bigint;
	v_rec record;
	v_isok boolean;
BEGIN 
	v_curID := 0;
	LOOP
		v_isok := false;
		FOR v_rec IN SELECT id FROM voxelpt WHERE ifcid IS NOT NULL AND ifc IS NULL AND id > v_curID ORDER BY id LIMIT 10000
		LOOP
			FOR idx in 1..26
			LOOP
				UPDATE voxelpt SET ifc = (SELECT name FROM ifcclass WHERE ifcid=idx) WHERE id=v_rec.id AND ifcid=idx;
			END LOOP;
			v_isok := true;
			v_curID := v_rec.id;			
		END LOOP;
		RAISE NOTICE 'The current updating records: %', v_curID;
		IF (v_isok = false) THEN
			RETURN;
		END IF;
	END LOOP;
END;    
$$ 
-- NOTICE:  The current updating records: 165190001

-- ******* Error *******

-- ERROR:  cannot have more than 2^32-2 commands in a transaction
-- CONTEXT:  SQL statement "UPDATE voxelpt SET ifc = (SELECT name FROM ifcclass WHERE ifcid=idx) WHERE id=v_rec.id AND ifcid=idx"
-- PL/pgSQL function inline_code_block line 14 at SQL statement
-- SQL state: 54000

-- NOTICE:  The current updating records: 375655501
-- NOTICE:  The current updating records: 379153394
-- NOTICE:  The current updating records: 381535211
-- NOTICE:  The current updating records: 383095596
-- NOTICE:  The current updating records: 384080853
-- NOTICE:  The current updating records: 385192490
-- NOTICE:  The current updating records: 386257335
-- NOTICE:  The current updating records: 387172790
-- NOTICE:  The current updating records: 403915984
-- NOTICE:  The current updating records: 403915984
-- DO

-- Query returned successfully in 73 min 47 secs.

-- 关于移除classid和ifcid
ALTER TABLE voxelpt DROP COLUMN classid, DROP COLUMN ifcid;
-- Query returned successfully in 979 msec.


-- 关于添加索引
DROP INDEX IF EXISTS idx_voxelpt CASCADE;
DROP INDEX IF EXISTS geom_voxelpt CASCADE;
CREATE INDEX idx_voxelpt ON voxelpt(category, name, ifc);
CREATE INDEX geom_voxelpt ON voxelpt USING GIST (geom);
-- Query returned successfully in 647 min 31 secs.


VACUUM FULL ANALYZE voxelpt;
-- Query returned successfully in 839 min 10 secs.
