
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
		FOR v_rec IN SELECT id FROM voxel WHERE ifcid IS NOT NULL AND ifc IS NULL AND id > v_curID ORDER BY id LIMIT 10000
		LOOP
			FOR idx in 1..26
			LOOP
				UPDATE voxel SET ifc = (SELECT name FROM ifcclass WHERE ifcid=idx) WHERE id=v_rec.id AND ifcid=idx;
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
-- NOTICE:  The current updating records: 166,946,826

-- ******* Error *******

-- ERROR:  cannot have more than 2^32-2 commands in a transaction
-- CONTEXT:  SQL statement "UPDATE voxel SET ifc = (SELECT name FROM ifcclass WHERE ifcid=idx) WHERE id=v_rec.id AND ifcid=idx"
-- PL/pgSQL function inline_code_block line 14 at SQL statement
-- SQL state: 54000

-- NOTICE:  The current updating records: 946910963
-- NOTICE:  The current updating records: 950408856
-- NOTICE:  The current updating records: 952790673
-- NOTICE:  The current updating records: 954351058
-- NOTICE:  The current updating records: 955336315
-- NOTICE:  The current updating records: 956447952
-- NOTICE:  The current updating records: 957512797
-- NOTICE:  The current updating records: 958428252
-- NOTICE:  The current updating records: 975171446
-- NOTICE:  The current updating records: 975171446
-- DO

-- Query returned successfully in 120 min 8 secs.


-- 关于更新name字段
DO $$
DECLARE 
	v_curID bigint;
	v_rec record;
	v_isok boolean;
BEGIN 
	v_curID := 0;
	LOOP
		v_isok := false;
		FOR v_rec IN SELECT id FROM voxel WHERE classid < 55 AND name IS NULL AND id > v_curID ORDER BY id LIMIT 10000
		LOOP
			UPDATE voxel SET name = 'Rupert Myers-M15' WHERE classid = 1 AND id=v_rec.id;
			UPDATE voxel SET name = 'International House-C6' WHERE classid = 2 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Village-B10' WHERE classid = 3 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Street Carpark-N18' WHERE classid = 4 AND id=v_rec.id;
			UPDATE voxel SET name = 'Law-F8' WHERE classid = 5 AND id=v_rec.id;
			UPDATE voxel SET name = 'Blockhouse-G6' WHERE classid = 6 AND id=v_rec.id;
			UPDATE voxel SET name = 'Sam Cracknell Pavilion-H8' WHERE classid = 7 AND id=v_rec.id;
			UPDATE voxel SET name = 'Science Theatre-F13' WHERE classid = 8 AND id=v_rec.id;
			UPDATE voxel SET name = 'Dalton-F12' WHERE classid = 9 AND id=v_rec.id;
			UPDATE voxel SET name = 'Ainsworth Building-J17 & Computer Science-K17' WHERE classid = 10 AND id=v_rec.id;
			UPDATE voxel SET name = 'Willis Annexe-J18' WHERE classid = 11 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Business School-E12' WHERE classid = 12 AND id=v_rec.id;
			UPDATE voxel SET name = 'Quadrangle-E15' WHERE classid = 13 AND id=v_rec.id;
			UPDATE voxel SET name = 'Electrical Engineering-G17' WHERE classid = 14 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 15 AND id=v_rec.id;
			UPDATE voxel SET name = 'Robert Webster-G14' WHERE classid = 16 AND id=v_rec.id;
			UPDATE voxel SET name = 'Webster Theatres-G15' WHERE classid = 17 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 18 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 19 AND id=v_rec.id;
			UPDATE voxel SET name = 'Newton-J12' WHERE classid = 20 AND id=v_rec.id;
			UPDATE voxel SET name = 'Keith Burrows Theatre-J14' WHERE classid = 21 AND id=v_rec.id;
			UPDATE voxel SET name = 'Physics Theatre-K14' WHERE classid = 22 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Main-K15' WHERE classid = 23 AND id=v_rec.id;
			UPDATE voxel SET name = 'Chemical Sciences-F10' WHERE classid = 25 AND id=v_rec.id;
			UPDATE voxel SET name = 'University Terraces-B8' WHERE classid = 27 AND id=v_rec.id;
			UPDATE voxel SET name = 'Warrane College-M7' WHERE classid = 28 AND id=v_rec.id;
			UPDATE voxel SET name = 'New College-L6' WHERE classid = 29 AND id=v_rec.id;
			UPDATE voxel SET name = 'Shalom College-N9' WHERE classid = 30 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Apartments-N13' WHERE classid = 31 AND id=v_rec.id;
			UPDATE voxel SET name = 'House at Pooh Corner-N8' WHERE classid = 34 AND id=v_rec.id;
			UPDATE voxel SET name = 'Swimming Pool-B4' WHERE classid = 36 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Fitness and Aquatic Centre-B5' WHERE classid = 37 AND id=v_rec.id;
			UPDATE voxel SET name = 'Tyree Energy Technologies-H6' WHERE classid = 38 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein Hall-D16' WHERE classid = 39 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Hall-D14' WHERE classid = 41 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Theatre-B14d' WHERE classid = 42 AND id=v_rec.id;
			UPDATE voxel SET name = 'White House-C15' WHERE classid = 43 AND id=v_rec.id;
			UPDATE voxel SET name = 'Roundhouse-E6' WHERE classid = 44 AND id=v_rec.id;
			UPDATE voxel SET name = 'Squarehouse-E4' WHERE classid = 45 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 47 AND id=v_rec.id;
			UPDATE voxel SET name = 'Colombo House-B16' WHERE classid = 48 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein College-B17' WHERE classid = 49 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Hall-B18' WHERE classid = 50 AND id=v_rec.id;
			UPDATE voxel SET name = 'Philip Baxter College-D18' WHERE classid = 51 AND id=v_rec.id;
			UPDATE voxel SET name = 'Basser College-D17' WHERE classid = 52 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Tote-B15' WHERE classid = 53 AND id=v_rec.id;			
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
-- ERROR:  cannot have more than 2^32-2 commands in a transaction
-- CONTEXT:  SQL statement "UPDATE voxel SET name = 'Willis Annexe-J18' WHERE classid = 11 AND id=v_rec.id"
-- PL/pgSQL function inline_code_block line 22 at SQL statement
-- SQL state: 54000

-- 一共有1,247,611,384个id
-- 采用分段处理，每段80000000条记录，累计大概是2^32-1

-- 第一段
DO $$
DECLARE 
	v_curID bigint;
	v_rec record;
	v_isok boolean;
BEGIN 
	v_curID := 0;
	LOOP
		v_isok := false;
		FOR v_rec IN SELECT id FROM voxel WHERE name IS NULL AND classid IS NOT NULL AND classid < 54 AND id > v_curID AND id <= 80000000 ORDER BY id LIMIT 100000
		LOOP
			UPDATE voxel SET name = 'Rupert Myers-M15' WHERE classid = 1 AND id=v_rec.id;
			UPDATE voxel SET name = 'International House-C6' WHERE classid = 2 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Village-B10' WHERE classid = 3 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Street Carpark-N18' WHERE classid = 4 AND id=v_rec.id;
			UPDATE voxel SET name = 'Law-F8' WHERE classid = 5 AND id=v_rec.id;
			UPDATE voxel SET name = 'Blockhouse-G6' WHERE classid = 6 AND id=v_rec.id;
			UPDATE voxel SET name = 'Sam Cracknell Pavilion-H8' WHERE classid = 7 AND id=v_rec.id;
			UPDATE voxel SET name = 'Science Theatre-F13' WHERE classid = 8 AND id=v_rec.id;
			UPDATE voxel SET name = 'Dalton-F12' WHERE classid = 9 AND id=v_rec.id;
			UPDATE voxel SET name = 'Ainsworth Building-J17 & Computer Science-K17' WHERE classid = 10 AND id=v_rec.id;
			UPDATE voxel SET name = 'Willis Annexe-J18' WHERE classid = 11 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Business School-E12' WHERE classid = 12 AND id=v_rec.id;
			UPDATE voxel SET name = 'Quadrangle-E15' WHERE classid = 13 AND id=v_rec.id;
			UPDATE voxel SET name = 'Electrical Engineering-G17' WHERE classid = 14 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 15 AND id=v_rec.id;
			UPDATE voxel SET name = 'Robert Webster-G14' WHERE classid = 16 AND id=v_rec.id;
			UPDATE voxel SET name = 'Webster Theatres-G15' WHERE classid = 17 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 18 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 19 AND id=v_rec.id;
			UPDATE voxel SET name = 'Newton-J12' WHERE classid = 20 AND id=v_rec.id;
			UPDATE voxel SET name = 'Keith Burrows Theatre-J14' WHERE classid = 21 AND id=v_rec.id;
			UPDATE voxel SET name = 'Physics Theatre-K14' WHERE classid = 22 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Main-K15' WHERE classid = 23 AND id=v_rec.id;
			UPDATE voxel SET name = 'Chemical Sciences-F10' WHERE classid = 25 AND id=v_rec.id;
			UPDATE voxel SET name = 'University Terraces-B8' WHERE classid = 27 AND id=v_rec.id;
			UPDATE voxel SET name = 'Warrane College-M7' WHERE classid = 28 AND id=v_rec.id;
			UPDATE voxel SET name = 'New College-L6' WHERE classid = 29 AND id=v_rec.id;
			UPDATE voxel SET name = 'Shalom College-N9' WHERE classid = 30 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Apartments-N13' WHERE classid = 31 AND id=v_rec.id;
			UPDATE voxel SET name = 'House at Pooh Corner-N8' WHERE classid = 34 AND id=v_rec.id;
			UPDATE voxel SET name = 'Swimming Pool-B4' WHERE classid = 36 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Fitness and Aquatic Centre-B5' WHERE classid = 37 AND id=v_rec.id;
			UPDATE voxel SET name = 'Tyree Energy Technologies-H6' WHERE classid = 38 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein Hall-D16' WHERE classid = 39 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Hall-D14' WHERE classid = 41 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Theatre-B14d' WHERE classid = 42 AND id=v_rec.id;
			UPDATE voxel SET name = 'White House-C15' WHERE classid = 43 AND id=v_rec.id;
			UPDATE voxel SET name = 'Roundhouse-E6' WHERE classid = 44 AND id=v_rec.id;
			UPDATE voxel SET name = 'Squarehouse-E4' WHERE classid = 45 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 47 AND id=v_rec.id;
			UPDATE voxel SET name = 'Colombo House-B16' WHERE classid = 48 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein College-B17' WHERE classid = 49 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Hall-B18' WHERE classid = 50 AND id=v_rec.id;
			UPDATE voxel SET name = 'Philip Baxter College-D18' WHERE classid = 51 AND id=v_rec.id;
			UPDATE voxel SET name = 'Basser College-D17' WHERE classid = 52 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Tote-B15' WHERE classid = 53 AND id=v_rec.id;			
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
-- Query returned successfully in 683 min 38 secs.

-- 第二段
DO $$
DECLARE 
	v_curID bigint;
	v_rec record;
	v_isok boolean;
BEGIN 
	v_curID := 80000000;
	LOOP
		v_isok := false;
		FOR v_rec IN SELECT id FROM voxel WHERE classid < 55 AND name IS NULL AND id > v_curID AND id <= 160000000 ORDER BY id LIMIT 10000
		LOOP
			UPDATE voxel SET name = 'Rupert Myers-M15' WHERE classid = 1 AND id=v_rec.id;
			UPDATE voxel SET name = 'International House-C6' WHERE classid = 2 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Village-B10' WHERE classid = 3 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Street Carpark-N18' WHERE classid = 4 AND id=v_rec.id;
			UPDATE voxel SET name = 'Law-F8' WHERE classid = 5 AND id=v_rec.id;
			UPDATE voxel SET name = 'Blockhouse-G6' WHERE classid = 6 AND id=v_rec.id;
			UPDATE voxel SET name = 'Sam Cracknell Pavilion-H8' WHERE classid = 7 AND id=v_rec.id;
			UPDATE voxel SET name = 'Science Theatre-F13' WHERE classid = 8 AND id=v_rec.id;
			UPDATE voxel SET name = 'Dalton-F12' WHERE classid = 9 AND id=v_rec.id;
			UPDATE voxel SET name = 'Ainsworth Building-J17 & Computer Science-K17' WHERE classid = 10 AND id=v_rec.id;
			UPDATE voxel SET name = 'Willis Annexe-J18' WHERE classid = 11 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Business School-E12' WHERE classid = 12 AND id=v_rec.id;
			UPDATE voxel SET name = 'Quadrangle-E15' WHERE classid = 13 AND id=v_rec.id;
			UPDATE voxel SET name = 'Electrical Engineering-G17' WHERE classid = 14 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 15 AND id=v_rec.id;
			UPDATE voxel SET name = 'Robert Webster-G14' WHERE classid = 16 AND id=v_rec.id;
			UPDATE voxel SET name = 'Webster Theatres-G15' WHERE classid = 17 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 18 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 19 AND id=v_rec.id;
			UPDATE voxel SET name = 'Newton-J12' WHERE classid = 20 AND id=v_rec.id;
			UPDATE voxel SET name = 'Keith Burrows Theatre-J14' WHERE classid = 21 AND id=v_rec.id;
			UPDATE voxel SET name = 'Physics Theatre-K14' WHERE classid = 22 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Main-K15' WHERE classid = 23 AND id=v_rec.id;
			UPDATE voxel SET name = 'Chemical Sciences-F10' WHERE classid = 25 AND id=v_rec.id;
			UPDATE voxel SET name = 'University Terraces-B8' WHERE classid = 27 AND id=v_rec.id;
			UPDATE voxel SET name = 'Warrane College-M7' WHERE classid = 28 AND id=v_rec.id;
			UPDATE voxel SET name = 'New College-L6' WHERE classid = 29 AND id=v_rec.id;
			UPDATE voxel SET name = 'Shalom College-N9' WHERE classid = 30 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Apartments-N13' WHERE classid = 31 AND id=v_rec.id;
			UPDATE voxel SET name = 'House at Pooh Corner-N8' WHERE classid = 34 AND id=v_rec.id;
			UPDATE voxel SET name = 'Swimming Pool-B4' WHERE classid = 36 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Fitness and Aquatic Centre-B5' WHERE classid = 37 AND id=v_rec.id;
			UPDATE voxel SET name = 'Tyree Energy Technologies-H6' WHERE classid = 38 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein Hall-D16' WHERE classid = 39 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Hall-D14' WHERE classid = 41 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Theatre-B14d' WHERE classid = 42 AND id=v_rec.id;
			UPDATE voxel SET name = 'White House-C15' WHERE classid = 43 AND id=v_rec.id;
			UPDATE voxel SET name = 'Roundhouse-E6' WHERE classid = 44 AND id=v_rec.id;
			UPDATE voxel SET name = 'Squarehouse-E4' WHERE classid = 45 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 47 AND id=v_rec.id;
			UPDATE voxel SET name = 'Colombo House-B16' WHERE classid = 48 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein College-B17' WHERE classid = 49 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Hall-B18' WHERE classid = 50 AND id=v_rec.id;
			UPDATE voxel SET name = 'Philip Baxter College-D18' WHERE classid = 51 AND id=v_rec.id;
			UPDATE voxel SET name = 'Basser College-D17' WHERE classid = 52 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Tote-B15' WHERE classid = 53 AND id=v_rec.id;			
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
-- Query returned successfully in 701 min 4 secs.

-- 第三段
DO $$
DECLARE 
	v_curID bigint;
	v_rec record;
	v_isok boolean;
BEGIN 
	v_curID := 160000000;
	LOOP
		v_isok := false;
		FOR v_rec IN SELECT id FROM voxel WHERE classid < 55 AND name IS NULL AND id > v_curID AND id <= 240000000 ORDER BY id LIMIT 10000
		LOOP
			UPDATE voxel SET name = 'Rupert Myers-M15' WHERE classid = 1 AND id=v_rec.id;
			UPDATE voxel SET name = 'International House-C6' WHERE classid = 2 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Village-B10' WHERE classid = 3 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Street Carpark-N18' WHERE classid = 4 AND id=v_rec.id;
			UPDATE voxel SET name = 'Law-F8' WHERE classid = 5 AND id=v_rec.id;
			UPDATE voxel SET name = 'Blockhouse-G6' WHERE classid = 6 AND id=v_rec.id;
			UPDATE voxel SET name = 'Sam Cracknell Pavilion-H8' WHERE classid = 7 AND id=v_rec.id;
			UPDATE voxel SET name = 'Science Theatre-F13' WHERE classid = 8 AND id=v_rec.id;
			UPDATE voxel SET name = 'Dalton-F12' WHERE classid = 9 AND id=v_rec.id;
			UPDATE voxel SET name = 'Ainsworth Building-J17 & Computer Science-K17' WHERE classid = 10 AND id=v_rec.id;
			UPDATE voxel SET name = 'Willis Annexe-J18' WHERE classid = 11 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Business School-E12' WHERE classid = 12 AND id=v_rec.id;
			UPDATE voxel SET name = 'Quadrangle-E15' WHERE classid = 13 AND id=v_rec.id;
			UPDATE voxel SET name = 'Electrical Engineering-G17' WHERE classid = 14 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 15 AND id=v_rec.id;
			UPDATE voxel SET name = 'Robert Webster-G14' WHERE classid = 16 AND id=v_rec.id;
			UPDATE voxel SET name = 'Webster Theatres-G15' WHERE classid = 17 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 18 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 19 AND id=v_rec.id;
			UPDATE voxel SET name = 'Newton-J12' WHERE classid = 20 AND id=v_rec.id;
			UPDATE voxel SET name = 'Keith Burrows Theatre-J14' WHERE classid = 21 AND id=v_rec.id;
			UPDATE voxel SET name = 'Physics Theatre-K14' WHERE classid = 22 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Main-K15' WHERE classid = 23 AND id=v_rec.id;
			UPDATE voxel SET name = 'Chemical Sciences-F10' WHERE classid = 25 AND id=v_rec.id;
			UPDATE voxel SET name = 'University Terraces-B8' WHERE classid = 27 AND id=v_rec.id;
			UPDATE voxel SET name = 'Warrane College-M7' WHERE classid = 28 AND id=v_rec.id;
			UPDATE voxel SET name = 'New College-L6' WHERE classid = 29 AND id=v_rec.id;
			UPDATE voxel SET name = 'Shalom College-N9' WHERE classid = 30 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Apartments-N13' WHERE classid = 31 AND id=v_rec.id;
			UPDATE voxel SET name = 'House at Pooh Corner-N8' WHERE classid = 34 AND id=v_rec.id;
			UPDATE voxel SET name = 'Swimming Pool-B4' WHERE classid = 36 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Fitness and Aquatic Centre-B5' WHERE classid = 37 AND id=v_rec.id;
			UPDATE voxel SET name = 'Tyree Energy Technologies-H6' WHERE classid = 38 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein Hall-D16' WHERE classid = 39 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Hall-D14' WHERE classid = 41 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Theatre-B14d' WHERE classid = 42 AND id=v_rec.id;
			UPDATE voxel SET name = 'White House-C15' WHERE classid = 43 AND id=v_rec.id;
			UPDATE voxel SET name = 'Roundhouse-E6' WHERE classid = 44 AND id=v_rec.id;
			UPDATE voxel SET name = 'Squarehouse-E4' WHERE classid = 45 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 47 AND id=v_rec.id;
			UPDATE voxel SET name = 'Colombo House-B16' WHERE classid = 48 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein College-B17' WHERE classid = 49 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Hall-B18' WHERE classid = 50 AND id=v_rec.id;
			UPDATE voxel SET name = 'Philip Baxter College-D18' WHERE classid = 51 AND id=v_rec.id;
			UPDATE voxel SET name = 'Basser College-D17' WHERE classid = 52 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Tote-B15' WHERE classid = 53 AND id=v_rec.id;			
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
-- Query returned successfully in 667 min 14 secs.

-- 第四段
DO $$
DECLARE 
	v_curID bigint;
	v_rec record;
	v_isok boolean;
BEGIN 
	v_curID := 240000000;
	LOOP
		v_isok := false;
		FOR v_rec IN SELECT id FROM voxel WHERE classid < 55 AND name IS NULL AND id > v_curID AND id <= 320000000 ORDER BY id LIMIT 10000
		LOOP
			UPDATE voxel SET name = 'Rupert Myers-M15' WHERE classid = 1 AND id=v_rec.id;
			UPDATE voxel SET name = 'International House-C6' WHERE classid = 2 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Village-B10' WHERE classid = 3 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Street Carpark-N18' WHERE classid = 4 AND id=v_rec.id;
			UPDATE voxel SET name = 'Law-F8' WHERE classid = 5 AND id=v_rec.id;
			UPDATE voxel SET name = 'Blockhouse-G6' WHERE classid = 6 AND id=v_rec.id;
			UPDATE voxel SET name = 'Sam Cracknell Pavilion-H8' WHERE classid = 7 AND id=v_rec.id;
			UPDATE voxel SET name = 'Science Theatre-F13' WHERE classid = 8 AND id=v_rec.id;
			UPDATE voxel SET name = 'Dalton-F12' WHERE classid = 9 AND id=v_rec.id;
			UPDATE voxel SET name = 'Ainsworth Building-J17 & Computer Science-K17' WHERE classid = 10 AND id=v_rec.id;
			UPDATE voxel SET name = 'Willis Annexe-J18' WHERE classid = 11 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Business School-E12' WHERE classid = 12 AND id=v_rec.id;
			UPDATE voxel SET name = 'Quadrangle-E15' WHERE classid = 13 AND id=v_rec.id;
			UPDATE voxel SET name = 'Electrical Engineering-G17' WHERE classid = 14 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 15 AND id=v_rec.id;
			UPDATE voxel SET name = 'Robert Webster-G14' WHERE classid = 16 AND id=v_rec.id;
			UPDATE voxel SET name = 'Webster Theatres-G15' WHERE classid = 17 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 18 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 19 AND id=v_rec.id;
			UPDATE voxel SET name = 'Newton-J12' WHERE classid = 20 AND id=v_rec.id;
			UPDATE voxel SET name = 'Keith Burrows Theatre-J14' WHERE classid = 21 AND id=v_rec.id;
			UPDATE voxel SET name = 'Physics Theatre-K14' WHERE classid = 22 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Main-K15' WHERE classid = 23 AND id=v_rec.id;
			UPDATE voxel SET name = 'Chemical Sciences-F10' WHERE classid = 25 AND id=v_rec.id;
			UPDATE voxel SET name = 'University Terraces-B8' WHERE classid = 27 AND id=v_rec.id;
			UPDATE voxel SET name = 'Warrane College-M7' WHERE classid = 28 AND id=v_rec.id;
			UPDATE voxel SET name = 'New College-L6' WHERE classid = 29 AND id=v_rec.id;
			UPDATE voxel SET name = 'Shalom College-N9' WHERE classid = 30 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Apartments-N13' WHERE classid = 31 AND id=v_rec.id;
			UPDATE voxel SET name = 'House at Pooh Corner-N8' WHERE classid = 34 AND id=v_rec.id;
			UPDATE voxel SET name = 'Swimming Pool-B4' WHERE classid = 36 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Fitness and Aquatic Centre-B5' WHERE classid = 37 AND id=v_rec.id;
			UPDATE voxel SET name = 'Tyree Energy Technologies-H6' WHERE classid = 38 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein Hall-D16' WHERE classid = 39 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Hall-D14' WHERE classid = 41 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Theatre-B14d' WHERE classid = 42 AND id=v_rec.id;
			UPDATE voxel SET name = 'White House-C15' WHERE classid = 43 AND id=v_rec.id;
			UPDATE voxel SET name = 'Roundhouse-E6' WHERE classid = 44 AND id=v_rec.id;
			UPDATE voxel SET name = 'Squarehouse-E4' WHERE classid = 45 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 47 AND id=v_rec.id;
			UPDATE voxel SET name = 'Colombo House-B16' WHERE classid = 48 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein College-B17' WHERE classid = 49 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Hall-B18' WHERE classid = 50 AND id=v_rec.id;
			UPDATE voxel SET name = 'Philip Baxter College-D18' WHERE classid = 51 AND id=v_rec.id;
			UPDATE voxel SET name = 'Basser College-D17' WHERE classid = 52 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Tote-B15' WHERE classid = 53 AND id=v_rec.id;			
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
-- Query returned successfully in 130 min 11 secs.
-- 第五段
DO $$
DECLARE 
	v_curID bigint;
	v_rec record;
	v_isok boolean;
BEGIN 
	v_curID := 320000000;
	LOOP
		v_isok := false;
		FOR v_rec IN SELECT id FROM voxel WHERE classid < 55 AND name IS NULL AND id > v_curID AND id <= 400000000 ORDER BY id LIMIT 10000
		LOOP
			UPDATE voxel SET name = 'Rupert Myers-M15' WHERE classid = 1 AND id=v_rec.id;
			UPDATE voxel SET name = 'International House-C6' WHERE classid = 2 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Village-B10' WHERE classid = 3 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Street Carpark-N18' WHERE classid = 4 AND id=v_rec.id;
			UPDATE voxel SET name = 'Law-F8' WHERE classid = 5 AND id=v_rec.id;
			UPDATE voxel SET name = 'Blockhouse-G6' WHERE classid = 6 AND id=v_rec.id;
			UPDATE voxel SET name = 'Sam Cracknell Pavilion-H8' WHERE classid = 7 AND id=v_rec.id;
			UPDATE voxel SET name = 'Science Theatre-F13' WHERE classid = 8 AND id=v_rec.id;
			UPDATE voxel SET name = 'Dalton-F12' WHERE classid = 9 AND id=v_rec.id;
			UPDATE voxel SET name = 'Ainsworth Building-J17 & Computer Science-K17' WHERE classid = 10 AND id=v_rec.id;
			UPDATE voxel SET name = 'Willis Annexe-J18' WHERE classid = 11 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Business School-E12' WHERE classid = 12 AND id=v_rec.id;
			UPDATE voxel SET name = 'Quadrangle-E15' WHERE classid = 13 AND id=v_rec.id;
			UPDATE voxel SET name = 'Electrical Engineering-G17' WHERE classid = 14 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 15 AND id=v_rec.id;
			UPDATE voxel SET name = 'Robert Webster-G14' WHERE classid = 16 AND id=v_rec.id;
			UPDATE voxel SET name = 'Webster Theatres-G15' WHERE classid = 17 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 18 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 19 AND id=v_rec.id;
			UPDATE voxel SET name = 'Newton-J12' WHERE classid = 20 AND id=v_rec.id;
			UPDATE voxel SET name = 'Keith Burrows Theatre-J14' WHERE classid = 21 AND id=v_rec.id;
			UPDATE voxel SET name = 'Physics Theatre-K14' WHERE classid = 22 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Main-K15' WHERE classid = 23 AND id=v_rec.id;
			UPDATE voxel SET name = 'Chemical Sciences-F10' WHERE classid = 25 AND id=v_rec.id;
			UPDATE voxel SET name = 'University Terraces-B8' WHERE classid = 27 AND id=v_rec.id;
			UPDATE voxel SET name = 'Warrane College-M7' WHERE classid = 28 AND id=v_rec.id;
			UPDATE voxel SET name = 'New College-L6' WHERE classid = 29 AND id=v_rec.id;
			UPDATE voxel SET name = 'Shalom College-N9' WHERE classid = 30 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Apartments-N13' WHERE classid = 31 AND id=v_rec.id;
			UPDATE voxel SET name = 'House at Pooh Corner-N8' WHERE classid = 34 AND id=v_rec.id;
			UPDATE voxel SET name = 'Swimming Pool-B4' WHERE classid = 36 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Fitness and Aquatic Centre-B5' WHERE classid = 37 AND id=v_rec.id;
			UPDATE voxel SET name = 'Tyree Energy Technologies-H6' WHERE classid = 38 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein Hall-D16' WHERE classid = 39 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Hall-D14' WHERE classid = 41 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Theatre-B14d' WHERE classid = 42 AND id=v_rec.id;
			UPDATE voxel SET name = 'White House-C15' WHERE classid = 43 AND id=v_rec.id;
			UPDATE voxel SET name = 'Roundhouse-E6' WHERE classid = 44 AND id=v_rec.id;
			UPDATE voxel SET name = 'Squarehouse-E4' WHERE classid = 45 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 47 AND id=v_rec.id;
			UPDATE voxel SET name = 'Colombo House-B16' WHERE classid = 48 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein College-B17' WHERE classid = 49 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Hall-B18' WHERE classid = 50 AND id=v_rec.id;
			UPDATE voxel SET name = 'Philip Baxter College-D18' WHERE classid = 51 AND id=v_rec.id;
			UPDATE voxel SET name = 'Basser College-D17' WHERE classid = 52 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Tote-B15' WHERE classid = 53 AND id=v_rec.id;			
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
-- Query returned successfully in 26 min 12 secs.

-- 第六段
DO $$
DECLARE 
	v_curID bigint;
	v_rec record;
	v_isok boolean;
BEGIN 
	v_curID := 400000000;
	LOOP
		v_isok := false;
		FOR v_rec IN SELECT id FROM voxel WHERE classid < 55 AND name IS NULL AND id > v_curID AND id <= 480000000 ORDER BY id LIMIT 10000
		LOOP
			UPDATE voxel SET name = 'Rupert Myers-M15' WHERE classid = 1 AND id=v_rec.id;
			UPDATE voxel SET name = 'International House-C6' WHERE classid = 2 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Village-B10' WHERE classid = 3 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Street Carpark-N18' WHERE classid = 4 AND id=v_rec.id;
			UPDATE voxel SET name = 'Law-F8' WHERE classid = 5 AND id=v_rec.id;
			UPDATE voxel SET name = 'Blockhouse-G6' WHERE classid = 6 AND id=v_rec.id;
			UPDATE voxel SET name = 'Sam Cracknell Pavilion-H8' WHERE classid = 7 AND id=v_rec.id;
			UPDATE voxel SET name = 'Science Theatre-F13' WHERE classid = 8 AND id=v_rec.id;
			UPDATE voxel SET name = 'Dalton-F12' WHERE classid = 9 AND id=v_rec.id;
			UPDATE voxel SET name = 'Ainsworth Building-J17 & Computer Science-K17' WHERE classid = 10 AND id=v_rec.id;
			UPDATE voxel SET name = 'Willis Annexe-J18' WHERE classid = 11 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Business School-E12' WHERE classid = 12 AND id=v_rec.id;
			UPDATE voxel SET name = 'Quadrangle-E15' WHERE classid = 13 AND id=v_rec.id;
			UPDATE voxel SET name = 'Electrical Engineering-G17' WHERE classid = 14 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 15 AND id=v_rec.id;
			UPDATE voxel SET name = 'Robert Webster-G14' WHERE classid = 16 AND id=v_rec.id;
			UPDATE voxel SET name = 'Webster Theatres-G15' WHERE classid = 17 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 18 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 19 AND id=v_rec.id;
			UPDATE voxel SET name = 'Newton-J12' WHERE classid = 20 AND id=v_rec.id;
			UPDATE voxel SET name = 'Keith Burrows Theatre-J14' WHERE classid = 21 AND id=v_rec.id;
			UPDATE voxel SET name = 'Physics Theatre-K14' WHERE classid = 22 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Main-K15' WHERE classid = 23 AND id=v_rec.id;
			UPDATE voxel SET name = 'Chemical Sciences-F10' WHERE classid = 25 AND id=v_rec.id;
			UPDATE voxel SET name = 'University Terraces-B8' WHERE classid = 27 AND id=v_rec.id;
			UPDATE voxel SET name = 'Warrane College-M7' WHERE classid = 28 AND id=v_rec.id;
			UPDATE voxel SET name = 'New College-L6' WHERE classid = 29 AND id=v_rec.id;
			UPDATE voxel SET name = 'Shalom College-N9' WHERE classid = 30 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Apartments-N13' WHERE classid = 31 AND id=v_rec.id;
			UPDATE voxel SET name = 'House at Pooh Corner-N8' WHERE classid = 34 AND id=v_rec.id;
			UPDATE voxel SET name = 'Swimming Pool-B4' WHERE classid = 36 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Fitness and Aquatic Centre-B5' WHERE classid = 37 AND id=v_rec.id;
			UPDATE voxel SET name = 'Tyree Energy Technologies-H6' WHERE classid = 38 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein Hall-D16' WHERE classid = 39 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Hall-D14' WHERE classid = 41 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Theatre-B14d' WHERE classid = 42 AND id=v_rec.id;
			UPDATE voxel SET name = 'White House-C15' WHERE classid = 43 AND id=v_rec.id;
			UPDATE voxel SET name = 'Roundhouse-E6' WHERE classid = 44 AND id=v_rec.id;
			UPDATE voxel SET name = 'Squarehouse-E4' WHERE classid = 45 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 47 AND id=v_rec.id;
			UPDATE voxel SET name = 'Colombo House-B16' WHERE classid = 48 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein College-B17' WHERE classid = 49 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Hall-B18' WHERE classid = 50 AND id=v_rec.id;
			UPDATE voxel SET name = 'Philip Baxter College-D18' WHERE classid = 51 AND id=v_rec.id;
			UPDATE voxel SET name = 'Basser College-D17' WHERE classid = 52 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Tote-B15' WHERE classid = 53 AND id=v_rec.id;			
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
-- Query returned successfully in 77 min 50 secs.

-- 第七段
DO $$
DECLARE 
	v_curID bigint;
	v_rec record;
	v_isok boolean;
BEGIN 
	v_curID := 480000000;
	LOOP
		v_isok := false;
		FOR v_rec IN SELECT id FROM voxel WHERE classid < 55 AND name IS NULL AND id > v_curID AND id <= 560000000 ORDER BY id LIMIT 10000
		LOOP
			UPDATE voxel SET name = 'Rupert Myers-M15' WHERE classid = 1 AND id=v_rec.id;
			UPDATE voxel SET name = 'International House-C6' WHERE classid = 2 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Village-B10' WHERE classid = 3 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Street Carpark-N18' WHERE classid = 4 AND id=v_rec.id;
			UPDATE voxel SET name = 'Law-F8' WHERE classid = 5 AND id=v_rec.id;
			UPDATE voxel SET name = 'Blockhouse-G6' WHERE classid = 6 AND id=v_rec.id;
			UPDATE voxel SET name = 'Sam Cracknell Pavilion-H8' WHERE classid = 7 AND id=v_rec.id;
			UPDATE voxel SET name = 'Science Theatre-F13' WHERE classid = 8 AND id=v_rec.id;
			UPDATE voxel SET name = 'Dalton-F12' WHERE classid = 9 AND id=v_rec.id;
			UPDATE voxel SET name = 'Ainsworth Building-J17 & Computer Science-K17' WHERE classid = 10 AND id=v_rec.id;
			UPDATE voxel SET name = 'Willis Annexe-J18' WHERE classid = 11 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Business School-E12' WHERE classid = 12 AND id=v_rec.id;
			UPDATE voxel SET name = 'Quadrangle-E15' WHERE classid = 13 AND id=v_rec.id;
			UPDATE voxel SET name = 'Electrical Engineering-G17' WHERE classid = 14 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 15 AND id=v_rec.id;
			UPDATE voxel SET name = 'Robert Webster-G14' WHERE classid = 16 AND id=v_rec.id;
			UPDATE voxel SET name = 'Webster Theatres-G15' WHERE classid = 17 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 18 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 19 AND id=v_rec.id;
			UPDATE voxel SET name = 'Newton-J12' WHERE classid = 20 AND id=v_rec.id;
			UPDATE voxel SET name = 'Keith Burrows Theatre-J14' WHERE classid = 21 AND id=v_rec.id;
			UPDATE voxel SET name = 'Physics Theatre-K14' WHERE classid = 22 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Main-K15' WHERE classid = 23 AND id=v_rec.id;
			UPDATE voxel SET name = 'Chemical Sciences-F10' WHERE classid = 25 AND id=v_rec.id;
			UPDATE voxel SET name = 'University Terraces-B8' WHERE classid = 27 AND id=v_rec.id;
			UPDATE voxel SET name = 'Warrane College-M7' WHERE classid = 28 AND id=v_rec.id;
			UPDATE voxel SET name = 'New College-L6' WHERE classid = 29 AND id=v_rec.id;
			UPDATE voxel SET name = 'Shalom College-N9' WHERE classid = 30 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Apartments-N13' WHERE classid = 31 AND id=v_rec.id;
			UPDATE voxel SET name = 'House at Pooh Corner-N8' WHERE classid = 34 AND id=v_rec.id;
			UPDATE voxel SET name = 'Swimming Pool-B4' WHERE classid = 36 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Fitness and Aquatic Centre-B5' WHERE classid = 37 AND id=v_rec.id;
			UPDATE voxel SET name = 'Tyree Energy Technologies-H6' WHERE classid = 38 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein Hall-D16' WHERE classid = 39 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Hall-D14' WHERE classid = 41 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Theatre-B14d' WHERE classid = 42 AND id=v_rec.id;
			UPDATE voxel SET name = 'White House-C15' WHERE classid = 43 AND id=v_rec.id;
			UPDATE voxel SET name = 'Roundhouse-E6' WHERE classid = 44 AND id=v_rec.id;
			UPDATE voxel SET name = 'Squarehouse-E4' WHERE classid = 45 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 47 AND id=v_rec.id;
			UPDATE voxel SET name = 'Colombo House-B16' WHERE classid = 48 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein College-B17' WHERE classid = 49 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Hall-B18' WHERE classid = 50 AND id=v_rec.id;
			UPDATE voxel SET name = 'Philip Baxter College-D18' WHERE classid = 51 AND id=v_rec.id;
			UPDATE voxel SET name = 'Basser College-D17' WHERE classid = 52 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Tote-B15' WHERE classid = 53 AND id=v_rec.id;			
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
-- Query returned successfully in 75 min 24 secs.

-- 第八段
DO $$
DECLARE 
	v_curID bigint;
	v_rec record;
	v_isok boolean;
BEGIN 
	v_curID := 560000000;
	LOOP
		v_isok := false;
		FOR v_rec IN SELECT id FROM voxel WHERE classid < 55 AND name IS NULL AND id > v_curID AND id <= 640000000 ORDER BY id LIMIT 10000
		LOOP
			UPDATE voxel SET name = 'Rupert Myers-M15' WHERE classid = 1 AND id=v_rec.id;
			UPDATE voxel SET name = 'International House-C6' WHERE classid = 2 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Village-B10' WHERE classid = 3 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Street Carpark-N18' WHERE classid = 4 AND id=v_rec.id;
			UPDATE voxel SET name = 'Law-F8' WHERE classid = 5 AND id=v_rec.id;
			UPDATE voxel SET name = 'Blockhouse-G6' WHERE classid = 6 AND id=v_rec.id;
			UPDATE voxel SET name = 'Sam Cracknell Pavilion-H8' WHERE classid = 7 AND id=v_rec.id;
			UPDATE voxel SET name = 'Science Theatre-F13' WHERE classid = 8 AND id=v_rec.id;
			UPDATE voxel SET name = 'Dalton-F12' WHERE classid = 9 AND id=v_rec.id;
			UPDATE voxel SET name = 'Ainsworth Building-J17 & Computer Science-K17' WHERE classid = 10 AND id=v_rec.id;
			UPDATE voxel SET name = 'Willis Annexe-J18' WHERE classid = 11 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Business School-E12' WHERE classid = 12 AND id=v_rec.id;
			UPDATE voxel SET name = 'Quadrangle-E15' WHERE classid = 13 AND id=v_rec.id;
			UPDATE voxel SET name = 'Electrical Engineering-G17' WHERE classid = 14 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 15 AND id=v_rec.id;
			UPDATE voxel SET name = 'Robert Webster-G14' WHERE classid = 16 AND id=v_rec.id;
			UPDATE voxel SET name = 'Webster Theatres-G15' WHERE classid = 17 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 18 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 19 AND id=v_rec.id;
			UPDATE voxel SET name = 'Newton-J12' WHERE classid = 20 AND id=v_rec.id;
			UPDATE voxel SET name = 'Keith Burrows Theatre-J14' WHERE classid = 21 AND id=v_rec.id;
			UPDATE voxel SET name = 'Physics Theatre-K14' WHERE classid = 22 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Main-K15' WHERE classid = 23 AND id=v_rec.id;
			UPDATE voxel SET name = 'Chemical Sciences-F10' WHERE classid = 25 AND id=v_rec.id;
			UPDATE voxel SET name = 'University Terraces-B8' WHERE classid = 27 AND id=v_rec.id;
			UPDATE voxel SET name = 'Warrane College-M7' WHERE classid = 28 AND id=v_rec.id;
			UPDATE voxel SET name = 'New College-L6' WHERE classid = 29 AND id=v_rec.id;
			UPDATE voxel SET name = 'Shalom College-N9' WHERE classid = 30 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Apartments-N13' WHERE classid = 31 AND id=v_rec.id;
			UPDATE voxel SET name = 'House at Pooh Corner-N8' WHERE classid = 34 AND id=v_rec.id;
			UPDATE voxel SET name = 'Swimming Pool-B4' WHERE classid = 36 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Fitness and Aquatic Centre-B5' WHERE classid = 37 AND id=v_rec.id;
			UPDATE voxel SET name = 'Tyree Energy Technologies-H6' WHERE classid = 38 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein Hall-D16' WHERE classid = 39 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Hall-D14' WHERE classid = 41 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Theatre-B14d' WHERE classid = 42 AND id=v_rec.id;
			UPDATE voxel SET name = 'White House-C15' WHERE classid = 43 AND id=v_rec.id;
			UPDATE voxel SET name = 'Roundhouse-E6' WHERE classid = 44 AND id=v_rec.id;
			UPDATE voxel SET name = 'Squarehouse-E4' WHERE classid = 45 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 47 AND id=v_rec.id;
			UPDATE voxel SET name = 'Colombo House-B16' WHERE classid = 48 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein College-B17' WHERE classid = 49 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Hall-B18' WHERE classid = 50 AND id=v_rec.id;
			UPDATE voxel SET name = 'Philip Baxter College-D18' WHERE classid = 51 AND id=v_rec.id;
			UPDATE voxel SET name = 'Basser College-D17' WHERE classid = 52 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Tote-B15' WHERE classid = 53 AND id=v_rec.id;			
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
-- Query returned successfully in 79 min 4 secs.

-- 第九段
DO $$
DECLARE 
	v_curID bigint;
	v_rec record;
	v_isok boolean;
BEGIN 
	v_curID := 640000000;
	LOOP
		v_isok := false;
		FOR v_rec IN SELECT id FROM voxel WHERE classid < 55 AND name IS NULL AND id > v_curID AND id <= 720000000 ORDER BY id LIMIT 10000
		LOOP
			UPDATE voxel SET name = 'Rupert Myers-M15' WHERE classid = 1 AND id=v_rec.id;
			UPDATE voxel SET name = 'International House-C6' WHERE classid = 2 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Village-B10' WHERE classid = 3 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Street Carpark-N18' WHERE classid = 4 AND id=v_rec.id;
			UPDATE voxel SET name = 'Law-F8' WHERE classid = 5 AND id=v_rec.id;
			UPDATE voxel SET name = 'Blockhouse-G6' WHERE classid = 6 AND id=v_rec.id;
			UPDATE voxel SET name = 'Sam Cracknell Pavilion-H8' WHERE classid = 7 AND id=v_rec.id;
			UPDATE voxel SET name = 'Science Theatre-F13' WHERE classid = 8 AND id=v_rec.id;
			UPDATE voxel SET name = 'Dalton-F12' WHERE classid = 9 AND id=v_rec.id;
			UPDATE voxel SET name = 'Ainsworth Building-J17 & Computer Science-K17' WHERE classid = 10 AND id=v_rec.id;
			UPDATE voxel SET name = 'Willis Annexe-J18' WHERE classid = 11 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Business School-E12' WHERE classid = 12 AND id=v_rec.id;
			UPDATE voxel SET name = 'Quadrangle-E15' WHERE classid = 13 AND id=v_rec.id;
			UPDATE voxel SET name = 'Electrical Engineering-G17' WHERE classid = 14 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 15 AND id=v_rec.id;
			UPDATE voxel SET name = 'Robert Webster-G14' WHERE classid = 16 AND id=v_rec.id;
			UPDATE voxel SET name = 'Webster Theatres-G15' WHERE classid = 17 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 18 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 19 AND id=v_rec.id;
			UPDATE voxel SET name = 'Newton-J12' WHERE classid = 20 AND id=v_rec.id;
			UPDATE voxel SET name = 'Keith Burrows Theatre-J14' WHERE classid = 21 AND id=v_rec.id;
			UPDATE voxel SET name = 'Physics Theatre-K14' WHERE classid = 22 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Main-K15' WHERE classid = 23 AND id=v_rec.id;
			UPDATE voxel SET name = 'Chemical Sciences-F10' WHERE classid = 25 AND id=v_rec.id;
			UPDATE voxel SET name = 'University Terraces-B8' WHERE classid = 27 AND id=v_rec.id;
			UPDATE voxel SET name = 'Warrane College-M7' WHERE classid = 28 AND id=v_rec.id;
			UPDATE voxel SET name = 'New College-L6' WHERE classid = 29 AND id=v_rec.id;
			UPDATE voxel SET name = 'Shalom College-N9' WHERE classid = 30 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Apartments-N13' WHERE classid = 31 AND id=v_rec.id;
			UPDATE voxel SET name = 'House at Pooh Corner-N8' WHERE classid = 34 AND id=v_rec.id;
			UPDATE voxel SET name = 'Swimming Pool-B4' WHERE classid = 36 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Fitness and Aquatic Centre-B5' WHERE classid = 37 AND id=v_rec.id;
			UPDATE voxel SET name = 'Tyree Energy Technologies-H6' WHERE classid = 38 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein Hall-D16' WHERE classid = 39 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Hall-D14' WHERE classid = 41 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Theatre-B14d' WHERE classid = 42 AND id=v_rec.id;
			UPDATE voxel SET name = 'White House-C15' WHERE classid = 43 AND id=v_rec.id;
			UPDATE voxel SET name = 'Roundhouse-E6' WHERE classid = 44 AND id=v_rec.id;
			UPDATE voxel SET name = 'Squarehouse-E4' WHERE classid = 45 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 47 AND id=v_rec.id;
			UPDATE voxel SET name = 'Colombo House-B16' WHERE classid = 48 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein College-B17' WHERE classid = 49 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Hall-B18' WHERE classid = 50 AND id=v_rec.id;
			UPDATE voxel SET name = 'Philip Baxter College-D18' WHERE classid = 51 AND id=v_rec.id;
			UPDATE voxel SET name = 'Basser College-D17' WHERE classid = 52 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Tote-B15' WHERE classid = 53 AND id=v_rec.id;			
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
-- Query returned successfully in 80 min 8 secs.

-- 第十段
DO $$
DECLARE 
	v_curID bigint;
	v_rec record;
	v_isok boolean;
BEGIN 
	v_curID := 720000000;
	LOOP
		v_isok := false;
		FOR v_rec IN SELECT id FROM voxel WHERE classid < 55 AND name IS NULL AND id > v_curID AND id <= 800000000 ORDER BY id LIMIT 10000
		LOOP
			UPDATE voxel SET name = 'Rupert Myers-M15' WHERE classid = 1 AND id=v_rec.id;
			UPDATE voxel SET name = 'International House-C6' WHERE classid = 2 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Village-B10' WHERE classid = 3 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Street Carpark-N18' WHERE classid = 4 AND id=v_rec.id;
			UPDATE voxel SET name = 'Law-F8' WHERE classid = 5 AND id=v_rec.id;
			UPDATE voxel SET name = 'Blockhouse-G6' WHERE classid = 6 AND id=v_rec.id;
			UPDATE voxel SET name = 'Sam Cracknell Pavilion-H8' WHERE classid = 7 AND id=v_rec.id;
			UPDATE voxel SET name = 'Science Theatre-F13' WHERE classid = 8 AND id=v_rec.id;
			UPDATE voxel SET name = 'Dalton-F12' WHERE classid = 9 AND id=v_rec.id;
			UPDATE voxel SET name = 'Ainsworth Building-J17 & Computer Science-K17' WHERE classid = 10 AND id=v_rec.id;
			UPDATE voxel SET name = 'Willis Annexe-J18' WHERE classid = 11 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Business School-E12' WHERE classid = 12 AND id=v_rec.id;
			UPDATE voxel SET name = 'Quadrangle-E15' WHERE classid = 13 AND id=v_rec.id;
			UPDATE voxel SET name = 'Electrical Engineering-G17' WHERE classid = 14 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 15 AND id=v_rec.id;
			UPDATE voxel SET name = 'Robert Webster-G14' WHERE classid = 16 AND id=v_rec.id;
			UPDATE voxel SET name = 'Webster Theatres-G15' WHERE classid = 17 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 18 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 19 AND id=v_rec.id;
			UPDATE voxel SET name = 'Newton-J12' WHERE classid = 20 AND id=v_rec.id;
			UPDATE voxel SET name = 'Keith Burrows Theatre-J14' WHERE classid = 21 AND id=v_rec.id;
			UPDATE voxel SET name = 'Physics Theatre-K14' WHERE classid = 22 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Main-K15' WHERE classid = 23 AND id=v_rec.id;
			UPDATE voxel SET name = 'Chemical Sciences-F10' WHERE classid = 25 AND id=v_rec.id;
			UPDATE voxel SET name = 'University Terraces-B8' WHERE classid = 27 AND id=v_rec.id;
			UPDATE voxel SET name = 'Warrane College-M7' WHERE classid = 28 AND id=v_rec.id;
			UPDATE voxel SET name = 'New College-L6' WHERE classid = 29 AND id=v_rec.id;
			UPDATE voxel SET name = 'Shalom College-N9' WHERE classid = 30 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Apartments-N13' WHERE classid = 31 AND id=v_rec.id;
			UPDATE voxel SET name = 'House at Pooh Corner-N8' WHERE classid = 34 AND id=v_rec.id;
			UPDATE voxel SET name = 'Swimming Pool-B4' WHERE classid = 36 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Fitness and Aquatic Centre-B5' WHERE classid = 37 AND id=v_rec.id;
			UPDATE voxel SET name = 'Tyree Energy Technologies-H6' WHERE classid = 38 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein Hall-D16' WHERE classid = 39 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Hall-D14' WHERE classid = 41 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Theatre-B14d' WHERE classid = 42 AND id=v_rec.id;
			UPDATE voxel SET name = 'White House-C15' WHERE classid = 43 AND id=v_rec.id;
			UPDATE voxel SET name = 'Roundhouse-E6' WHERE classid = 44 AND id=v_rec.id;
			UPDATE voxel SET name = 'Squarehouse-E4' WHERE classid = 45 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 47 AND id=v_rec.id;
			UPDATE voxel SET name = 'Colombo House-B16' WHERE classid = 48 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein College-B17' WHERE classid = 49 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Hall-B18' WHERE classid = 50 AND id=v_rec.id;
			UPDATE voxel SET name = 'Philip Baxter College-D18' WHERE classid = 51 AND id=v_rec.id;
			UPDATE voxel SET name = 'Basser College-D17' WHERE classid = 52 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Tote-B15' WHERE classid = 53 AND id=v_rec.id;			
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
-- Query returned successfully in 84 min 58 secs.

-- 第十一段
DO $$
DECLARE 
	v_curID bigint;
	v_rec record;
	v_isok boolean;
BEGIN 
	v_curID := 800000000;
	LOOP
		v_isok := false;
		FOR v_rec IN SELECT id FROM voxel WHERE classid < 55 AND name IS NULL AND id > v_curID AND id <= 880000000 ORDER BY id LIMIT 10000
		LOOP
			UPDATE voxel SET name = 'Rupert Myers-M15' WHERE classid = 1 AND id=v_rec.id;
			UPDATE voxel SET name = 'International House-C6' WHERE classid = 2 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Village-B10' WHERE classid = 3 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Street Carpark-N18' WHERE classid = 4 AND id=v_rec.id;
			UPDATE voxel SET name = 'Law-F8' WHERE classid = 5 AND id=v_rec.id;
			UPDATE voxel SET name = 'Blockhouse-G6' WHERE classid = 6 AND id=v_rec.id;
			UPDATE voxel SET name = 'Sam Cracknell Pavilion-H8' WHERE classid = 7 AND id=v_rec.id;
			UPDATE voxel SET name = 'Science Theatre-F13' WHERE classid = 8 AND id=v_rec.id;
			UPDATE voxel SET name = 'Dalton-F12' WHERE classid = 9 AND id=v_rec.id;
			UPDATE voxel SET name = 'Ainsworth Building-J17 & Computer Science-K17' WHERE classid = 10 AND id=v_rec.id;
			UPDATE voxel SET name = 'Willis Annexe-J18' WHERE classid = 11 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Business School-E12' WHERE classid = 12 AND id=v_rec.id;
			UPDATE voxel SET name = 'Quadrangle-E15' WHERE classid = 13 AND id=v_rec.id;
			UPDATE voxel SET name = 'Electrical Engineering-G17' WHERE classid = 14 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 15 AND id=v_rec.id;
			UPDATE voxel SET name = 'Robert Webster-G14' WHERE classid = 16 AND id=v_rec.id;
			UPDATE voxel SET name = 'Webster Theatres-G15' WHERE classid = 17 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 18 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 19 AND id=v_rec.id;
			UPDATE voxel SET name = 'Newton-J12' WHERE classid = 20 AND id=v_rec.id;
			UPDATE voxel SET name = 'Keith Burrows Theatre-J14' WHERE classid = 21 AND id=v_rec.id;
			UPDATE voxel SET name = 'Physics Theatre-K14' WHERE classid = 22 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Main-K15' WHERE classid = 23 AND id=v_rec.id;
			UPDATE voxel SET name = 'Chemical Sciences-F10' WHERE classid = 25 AND id=v_rec.id;
			UPDATE voxel SET name = 'University Terraces-B8' WHERE classid = 27 AND id=v_rec.id;
			UPDATE voxel SET name = 'Warrane College-M7' WHERE classid = 28 AND id=v_rec.id;
			UPDATE voxel SET name = 'New College-L6' WHERE classid = 29 AND id=v_rec.id;
			UPDATE voxel SET name = 'Shalom College-N9' WHERE classid = 30 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Apartments-N13' WHERE classid = 31 AND id=v_rec.id;
			UPDATE voxel SET name = 'House at Pooh Corner-N8' WHERE classid = 34 AND id=v_rec.id;
			UPDATE voxel SET name = 'Swimming Pool-B4' WHERE classid = 36 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Fitness and Aquatic Centre-B5' WHERE classid = 37 AND id=v_rec.id;
			UPDATE voxel SET name = 'Tyree Energy Technologies-H6' WHERE classid = 38 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein Hall-D16' WHERE classid = 39 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Hall-D14' WHERE classid = 41 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Theatre-B14d' WHERE classid = 42 AND id=v_rec.id;
			UPDATE voxel SET name = 'White House-C15' WHERE classid = 43 AND id=v_rec.id;
			UPDATE voxel SET name = 'Roundhouse-E6' WHERE classid = 44 AND id=v_rec.id;
			UPDATE voxel SET name = 'Squarehouse-E4' WHERE classid = 45 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 47 AND id=v_rec.id;
			UPDATE voxel SET name = 'Colombo House-B16' WHERE classid = 48 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein College-B17' WHERE classid = 49 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Hall-B18' WHERE classid = 50 AND id=v_rec.id;
			UPDATE voxel SET name = 'Philip Baxter College-D18' WHERE classid = 51 AND id=v_rec.id;
			UPDATE voxel SET name = 'Basser College-D17' WHERE classid = 52 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Tote-B15' WHERE classid = 53 AND id=v_rec.id;			
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
-- Query returned successfully in 87 min 52 secs.

-- 第十二段
DO $$
DECLARE 
	v_curID bigint;
	v_rec record;
	v_isok boolean;
BEGIN 
	v_curID := 880000000;
	LOOP
		v_isok := false;
		FOR v_rec IN SELECT id FROM voxel WHERE classid < 55 AND name IS NULL AND id > v_curID AND id <= 960000000 ORDER BY id LIMIT 10000
		LOOP
			UPDATE voxel SET name = 'Rupert Myers-M15' WHERE classid = 1 AND id=v_rec.id;
			UPDATE voxel SET name = 'International House-C6' WHERE classid = 2 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Village-B10' WHERE classid = 3 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Street Carpark-N18' WHERE classid = 4 AND id=v_rec.id;
			UPDATE voxel SET name = 'Law-F8' WHERE classid = 5 AND id=v_rec.id;
			UPDATE voxel SET name = 'Blockhouse-G6' WHERE classid = 6 AND id=v_rec.id;
			UPDATE voxel SET name = 'Sam Cracknell Pavilion-H8' WHERE classid = 7 AND id=v_rec.id;
			UPDATE voxel SET name = 'Science Theatre-F13' WHERE classid = 8 AND id=v_rec.id;
			UPDATE voxel SET name = 'Dalton-F12' WHERE classid = 9 AND id=v_rec.id;
			UPDATE voxel SET name = 'Ainsworth Building-J17 & Computer Science-K17' WHERE classid = 10 AND id=v_rec.id;
			UPDATE voxel SET name = 'Willis Annexe-J18' WHERE classid = 11 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Business School-E12' WHERE classid = 12 AND id=v_rec.id;
			UPDATE voxel SET name = 'Quadrangle-E15' WHERE classid = 13 AND id=v_rec.id;
			UPDATE voxel SET name = 'Electrical Engineering-G17' WHERE classid = 14 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 15 AND id=v_rec.id;
			UPDATE voxel SET name = 'Robert Webster-G14' WHERE classid = 16 AND id=v_rec.id;
			UPDATE voxel SET name = 'Webster Theatres-G15' WHERE classid = 17 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 18 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 19 AND id=v_rec.id;
			UPDATE voxel SET name = 'Newton-J12' WHERE classid = 20 AND id=v_rec.id;
			UPDATE voxel SET name = 'Keith Burrows Theatre-J14' WHERE classid = 21 AND id=v_rec.id;
			UPDATE voxel SET name = 'Physics Theatre-K14' WHERE classid = 22 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Main-K15' WHERE classid = 23 AND id=v_rec.id;
			UPDATE voxel SET name = 'Chemical Sciences-F10' WHERE classid = 25 AND id=v_rec.id;
			UPDATE voxel SET name = 'University Terraces-B8' WHERE classid = 27 AND id=v_rec.id;
			UPDATE voxel SET name = 'Warrane College-M7' WHERE classid = 28 AND id=v_rec.id;
			UPDATE voxel SET name = 'New College-L6' WHERE classid = 29 AND id=v_rec.id;
			UPDATE voxel SET name = 'Shalom College-N9' WHERE classid = 30 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Apartments-N13' WHERE classid = 31 AND id=v_rec.id;
			UPDATE voxel SET name = 'House at Pooh Corner-N8' WHERE classid = 34 AND id=v_rec.id;
			UPDATE voxel SET name = 'Swimming Pool-B4' WHERE classid = 36 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Fitness and Aquatic Centre-B5' WHERE classid = 37 AND id=v_rec.id;
			UPDATE voxel SET name = 'Tyree Energy Technologies-H6' WHERE classid = 38 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein Hall-D16' WHERE classid = 39 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Hall-D14' WHERE classid = 41 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Theatre-B14d' WHERE classid = 42 AND id=v_rec.id;
			UPDATE voxel SET name = 'White House-C15' WHERE classid = 43 AND id=v_rec.id;
			UPDATE voxel SET name = 'Roundhouse-E6' WHERE classid = 44 AND id=v_rec.id;
			UPDATE voxel SET name = 'Squarehouse-E4' WHERE classid = 45 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 47 AND id=v_rec.id;
			UPDATE voxel SET name = 'Colombo House-B16' WHERE classid = 48 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein College-B17' WHERE classid = 49 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Hall-B18' WHERE classid = 50 AND id=v_rec.id;
			UPDATE voxel SET name = 'Philip Baxter College-D18' WHERE classid = 51 AND id=v_rec.id;
			UPDATE voxel SET name = 'Basser College-D17' WHERE classid = 52 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Tote-B15' WHERE classid = 53 AND id=v_rec.id;			
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
-- Query returned successfully in 247 min 50 secs.

-- 第十三段
DO $$
DECLARE 
	v_curID bigint;
	v_rec record;
	v_isok boolean;
BEGIN 
	v_curID := 960000000;
	LOOP
		v_isok := false;
		FOR v_rec IN SELECT id FROM voxel WHERE classid < 55 AND name IS NULL AND id > v_curID AND id <= 1040000000 ORDER BY id LIMIT 10000
		LOOP
			UPDATE voxel SET name = 'Rupert Myers-M15' WHERE classid = 1 AND id=v_rec.id;
			UPDATE voxel SET name = 'International House-C6' WHERE classid = 2 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Village-B10' WHERE classid = 3 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Street Carpark-N18' WHERE classid = 4 AND id=v_rec.id;
			UPDATE voxel SET name = 'Law-F8' WHERE classid = 5 AND id=v_rec.id;
			UPDATE voxel SET name = 'Blockhouse-G6' WHERE classid = 6 AND id=v_rec.id;
			UPDATE voxel SET name = 'Sam Cracknell Pavilion-H8' WHERE classid = 7 AND id=v_rec.id;
			UPDATE voxel SET name = 'Science Theatre-F13' WHERE classid = 8 AND id=v_rec.id;
			UPDATE voxel SET name = 'Dalton-F12' WHERE classid = 9 AND id=v_rec.id;
			UPDATE voxel SET name = 'Ainsworth Building-J17 & Computer Science-K17' WHERE classid = 10 AND id=v_rec.id;
			UPDATE voxel SET name = 'Willis Annexe-J18' WHERE classid = 11 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Business School-E12' WHERE classid = 12 AND id=v_rec.id;
			UPDATE voxel SET name = 'Quadrangle-E15' WHERE classid = 13 AND id=v_rec.id;
			UPDATE voxel SET name = 'Electrical Engineering-G17' WHERE classid = 14 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 15 AND id=v_rec.id;
			UPDATE voxel SET name = 'Robert Webster-G14' WHERE classid = 16 AND id=v_rec.id;
			UPDATE voxel SET name = 'Webster Theatres-G15' WHERE classid = 17 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 18 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 19 AND id=v_rec.id;
			UPDATE voxel SET name = 'Newton-J12' WHERE classid = 20 AND id=v_rec.id;
			UPDATE voxel SET name = 'Keith Burrows Theatre-J14' WHERE classid = 21 AND id=v_rec.id;
			UPDATE voxel SET name = 'Physics Theatre-K14' WHERE classid = 22 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Main-K15' WHERE classid = 23 AND id=v_rec.id;
			UPDATE voxel SET name = 'Chemical Sciences-F10' WHERE classid = 25 AND id=v_rec.id;
			UPDATE voxel SET name = 'University Terraces-B8' WHERE classid = 27 AND id=v_rec.id;
			UPDATE voxel SET name = 'Warrane College-M7' WHERE classid = 28 AND id=v_rec.id;
			UPDATE voxel SET name = 'New College-L6' WHERE classid = 29 AND id=v_rec.id;
			UPDATE voxel SET name = 'Shalom College-N9' WHERE classid = 30 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Apartments-N13' WHERE classid = 31 AND id=v_rec.id;
			UPDATE voxel SET name = 'House at Pooh Corner-N8' WHERE classid = 34 AND id=v_rec.id;
			UPDATE voxel SET name = 'Swimming Pool-B4' WHERE classid = 36 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Fitness and Aquatic Centre-B5' WHERE classid = 37 AND id=v_rec.id;
			UPDATE voxel SET name = 'Tyree Energy Technologies-H6' WHERE classid = 38 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein Hall-D16' WHERE classid = 39 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Hall-D14' WHERE classid = 41 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Theatre-B14d' WHERE classid = 42 AND id=v_rec.id;
			UPDATE voxel SET name = 'White House-C15' WHERE classid = 43 AND id=v_rec.id;
			UPDATE voxel SET name = 'Roundhouse-E6' WHERE classid = 44 AND id=v_rec.id;
			UPDATE voxel SET name = 'Squarehouse-E4' WHERE classid = 45 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 47 AND id=v_rec.id;
			UPDATE voxel SET name = 'Colombo House-B16' WHERE classid = 48 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein College-B17' WHERE classid = 49 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Hall-B18' WHERE classid = 50 AND id=v_rec.id;
			UPDATE voxel SET name = 'Philip Baxter College-D18' WHERE classid = 51 AND id=v_rec.id;
			UPDATE voxel SET name = 'Basser College-D17' WHERE classid = 52 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Tote-B15' WHERE classid = 53 AND id=v_rec.id;			
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
-- Query returned successfully in 227 min 31 secs.

-- 第十四段
DO $$
DECLARE 
	v_curID bigint;
	v_rec record;
	v_isok boolean;
BEGIN 
	v_curID := 1040000000;
	LOOP
		v_isok := false;
		FOR v_rec IN SELECT id FROM voxel WHERE classid < 55 AND name IS NULL AND id > v_curID AND id <= 1120000000 ORDER BY id LIMIT 10000
		LOOP
			UPDATE voxel SET name = 'Rupert Myers-M15' WHERE classid = 1 AND id=v_rec.id;
			UPDATE voxel SET name = 'International House-C6' WHERE classid = 2 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Village-B10' WHERE classid = 3 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Street Carpark-N18' WHERE classid = 4 AND id=v_rec.id;
			UPDATE voxel SET name = 'Law-F8' WHERE classid = 5 AND id=v_rec.id;
			UPDATE voxel SET name = 'Blockhouse-G6' WHERE classid = 6 AND id=v_rec.id;
			UPDATE voxel SET name = 'Sam Cracknell Pavilion-H8' WHERE classid = 7 AND id=v_rec.id;
			UPDATE voxel SET name = 'Science Theatre-F13' WHERE classid = 8 AND id=v_rec.id;
			UPDATE voxel SET name = 'Dalton-F12' WHERE classid = 9 AND id=v_rec.id;
			UPDATE voxel SET name = 'Ainsworth Building-J17 & Computer Science-K17' WHERE classid = 10 AND id=v_rec.id;
			UPDATE voxel SET name = 'Willis Annexe-J18' WHERE classid = 11 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Business School-E12' WHERE classid = 12 AND id=v_rec.id;
			UPDATE voxel SET name = 'Quadrangle-E15' WHERE classid = 13 AND id=v_rec.id;
			UPDATE voxel SET name = 'Electrical Engineering-G17' WHERE classid = 14 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 15 AND id=v_rec.id;
			UPDATE voxel SET name = 'Robert Webster-G14' WHERE classid = 16 AND id=v_rec.id;
			UPDATE voxel SET name = 'Webster Theatres-G15' WHERE classid = 17 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 18 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 19 AND id=v_rec.id;
			UPDATE voxel SET name = 'Newton-J12' WHERE classid = 20 AND id=v_rec.id;
			UPDATE voxel SET name = 'Keith Burrows Theatre-J14' WHERE classid = 21 AND id=v_rec.id;
			UPDATE voxel SET name = 'Physics Theatre-K14' WHERE classid = 22 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Main-K15' WHERE classid = 23 AND id=v_rec.id;
			UPDATE voxel SET name = 'Chemical Sciences-F10' WHERE classid = 25 AND id=v_rec.id;
			UPDATE voxel SET name = 'University Terraces-B8' WHERE classid = 27 AND id=v_rec.id;
			UPDATE voxel SET name = 'Warrane College-M7' WHERE classid = 28 AND id=v_rec.id;
			UPDATE voxel SET name = 'New College-L6' WHERE classid = 29 AND id=v_rec.id;
			UPDATE voxel SET name = 'Shalom College-N9' WHERE classid = 30 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Apartments-N13' WHERE classid = 31 AND id=v_rec.id;
			UPDATE voxel SET name = 'House at Pooh Corner-N8' WHERE classid = 34 AND id=v_rec.id;
			UPDATE voxel SET name = 'Swimming Pool-B4' WHERE classid = 36 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Fitness and Aquatic Centre-B5' WHERE classid = 37 AND id=v_rec.id;
			UPDATE voxel SET name = 'Tyree Energy Technologies-H6' WHERE classid = 38 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein Hall-D16' WHERE classid = 39 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Hall-D14' WHERE classid = 41 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Theatre-B14d' WHERE classid = 42 AND id=v_rec.id;
			UPDATE voxel SET name = 'White House-C15' WHERE classid = 43 AND id=v_rec.id;
			UPDATE voxel SET name = 'Roundhouse-E6' WHERE classid = 44 AND id=v_rec.id;
			UPDATE voxel SET name = 'Squarehouse-E4' WHERE classid = 45 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 47 AND id=v_rec.id;
			UPDATE voxel SET name = 'Colombo House-B16' WHERE classid = 48 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein College-B17' WHERE classid = 49 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Hall-B18' WHERE classid = 50 AND id=v_rec.id;
			UPDATE voxel SET name = 'Philip Baxter College-D18' WHERE classid = 51 AND id=v_rec.id;
			UPDATE voxel SET name = 'Basser College-D17' WHERE classid = 52 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Tote-B15' WHERE classid = 53 AND id=v_rec.id;			
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
-- Query returned successfully in 86 min 31 secs.

-- 第十五段
DO $$
DECLARE 
	v_curID bigint;
	v_rec record;
	v_isok boolean;
BEGIN 
	v_curID := 1120000000;
	LOOP
		v_isok := false;
		FOR v_rec IN SELECT id FROM voxel WHERE classid < 55 AND name IS NULL AND id > v_curID AND id <= 1200000000 ORDER BY id LIMIT 10000
		LOOP
			UPDATE voxel SET name = 'Rupert Myers-M15' WHERE classid = 1 AND id=v_rec.id;
			UPDATE voxel SET name = 'International House-C6' WHERE classid = 2 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Village-B10' WHERE classid = 3 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Street Carpark-N18' WHERE classid = 4 AND id=v_rec.id;
			UPDATE voxel SET name = 'Law-F8' WHERE classid = 5 AND id=v_rec.id;
			UPDATE voxel SET name = 'Blockhouse-G6' WHERE classid = 6 AND id=v_rec.id;
			UPDATE voxel SET name = 'Sam Cracknell Pavilion-H8' WHERE classid = 7 AND id=v_rec.id;
			UPDATE voxel SET name = 'Science Theatre-F13' WHERE classid = 8 AND id=v_rec.id;
			UPDATE voxel SET name = 'Dalton-F12' WHERE classid = 9 AND id=v_rec.id;
			UPDATE voxel SET name = 'Ainsworth Building-J17 & Computer Science-K17' WHERE classid = 10 AND id=v_rec.id;
			UPDATE voxel SET name = 'Willis Annexe-J18' WHERE classid = 11 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Business School-E12' WHERE classid = 12 AND id=v_rec.id;
			UPDATE voxel SET name = 'Quadrangle-E15' WHERE classid = 13 AND id=v_rec.id;
			UPDATE voxel SET name = 'Electrical Engineering-G17' WHERE classid = 14 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 15 AND id=v_rec.id;
			UPDATE voxel SET name = 'Robert Webster-G14' WHERE classid = 16 AND id=v_rec.id;
			UPDATE voxel SET name = 'Webster Theatres-G15' WHERE classid = 17 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 18 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 19 AND id=v_rec.id;
			UPDATE voxel SET name = 'Newton-J12' WHERE classid = 20 AND id=v_rec.id;
			UPDATE voxel SET name = 'Keith Burrows Theatre-J14' WHERE classid = 21 AND id=v_rec.id;
			UPDATE voxel SET name = 'Physics Theatre-K14' WHERE classid = 22 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Main-K15' WHERE classid = 23 AND id=v_rec.id;
			UPDATE voxel SET name = 'Chemical Sciences-F10' WHERE classid = 25 AND id=v_rec.id;
			UPDATE voxel SET name = 'University Terraces-B8' WHERE classid = 27 AND id=v_rec.id;
			UPDATE voxel SET name = 'Warrane College-M7' WHERE classid = 28 AND id=v_rec.id;
			UPDATE voxel SET name = 'New College-L6' WHERE classid = 29 AND id=v_rec.id;
			UPDATE voxel SET name = 'Shalom College-N9' WHERE classid = 30 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Apartments-N13' WHERE classid = 31 AND id=v_rec.id;
			UPDATE voxel SET name = 'House at Pooh Corner-N8' WHERE classid = 34 AND id=v_rec.id;
			UPDATE voxel SET name = 'Swimming Pool-B4' WHERE classid = 36 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Fitness and Aquatic Centre-B5' WHERE classid = 37 AND id=v_rec.id;
			UPDATE voxel SET name = 'Tyree Energy Technologies-H6' WHERE classid = 38 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein Hall-D16' WHERE classid = 39 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Hall-D14' WHERE classid = 41 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Theatre-B14d' WHERE classid = 42 AND id=v_rec.id;
			UPDATE voxel SET name = 'White House-C15' WHERE classid = 43 AND id=v_rec.id;
			UPDATE voxel SET name = 'Roundhouse-E6' WHERE classid = 44 AND id=v_rec.id;
			UPDATE voxel SET name = 'Squarehouse-E4' WHERE classid = 45 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 47 AND id=v_rec.id;
			UPDATE voxel SET name = 'Colombo House-B16' WHERE classid = 48 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein College-B17' WHERE classid = 49 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Hall-B18' WHERE classid = 50 AND id=v_rec.id;
			UPDATE voxel SET name = 'Philip Baxter College-D18' WHERE classid = 51 AND id=v_rec.id;
			UPDATE voxel SET name = 'Basser College-D17' WHERE classid = 52 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Tote-B15' WHERE classid = 53 AND id=v_rec.id;			
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
-- Query returned successfully in 126 min 5 secs.

-- 第十六段
DO $$
DECLARE 
	v_curID bigint;
	v_rec record;
	v_isok boolean;
BEGIN 
	v_curID := 1200000000;
	LOOP
		v_isok := false;
		FOR v_rec IN SELECT id FROM voxel WHERE classid < 55 AND name IS NULL AND id > v_curID AND id <= 1280000000 ORDER BY id LIMIT 10000
		LOOP
			UPDATE voxel SET name = 'Rupert Myers-M15' WHERE classid = 1 AND id=v_rec.id;
			UPDATE voxel SET name = 'International House-C6' WHERE classid = 2 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Village-B10' WHERE classid = 3 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Street Carpark-N18' WHERE classid = 4 AND id=v_rec.id;
			UPDATE voxel SET name = 'Law-F8' WHERE classid = 5 AND id=v_rec.id;
			UPDATE voxel SET name = 'Blockhouse-G6' WHERE classid = 6 AND id=v_rec.id;
			UPDATE voxel SET name = 'Sam Cracknell Pavilion-H8' WHERE classid = 7 AND id=v_rec.id;
			UPDATE voxel SET name = 'Science Theatre-F13' WHERE classid = 8 AND id=v_rec.id;
			UPDATE voxel SET name = 'Dalton-F12' WHERE classid = 9 AND id=v_rec.id;
			UPDATE voxel SET name = 'Ainsworth Building-J17 & Computer Science-K17' WHERE classid = 10 AND id=v_rec.id;
			UPDATE voxel SET name = 'Willis Annexe-J18' WHERE classid = 11 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Business School-E12' WHERE classid = 12 AND id=v_rec.id;
			UPDATE voxel SET name = 'Quadrangle-E15' WHERE classid = 13 AND id=v_rec.id;
			UPDATE voxel SET name = 'Electrical Engineering-G17' WHERE classid = 14 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 15 AND id=v_rec.id;
			UPDATE voxel SET name = 'Robert Webster-G14' WHERE classid = 16 AND id=v_rec.id;
			UPDATE voxel SET name = 'Webster Theatres-G15' WHERE classid = 17 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 18 AND id=v_rec.id;
			UPDATE voxel SET name = 'Red Centre-H13' WHERE classid = 19 AND id=v_rec.id;
			UPDATE voxel SET name = 'Newton-J12' WHERE classid = 20 AND id=v_rec.id;
			UPDATE voxel SET name = 'Keith Burrows Theatre-J14' WHERE classid = 21 AND id=v_rec.id;
			UPDATE voxel SET name = 'Physics Theatre-K14' WHERE classid = 22 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Main-K15' WHERE classid = 23 AND id=v_rec.id;
			UPDATE voxel SET name = 'Chemical Sciences-F10' WHERE classid = 25 AND id=v_rec.id;
			UPDATE voxel SET name = 'University Terraces-B8' WHERE classid = 27 AND id=v_rec.id;
			UPDATE voxel SET name = 'Warrane College-M7' WHERE classid = 28 AND id=v_rec.id;
			UPDATE voxel SET name = 'New College-L6' WHERE classid = 29 AND id=v_rec.id;
			UPDATE voxel SET name = 'Shalom College-N9' WHERE classid = 30 AND id=v_rec.id;
			UPDATE voxel SET name = 'Barker Apartments-N13' WHERE classid = 31 AND id=v_rec.id;
			UPDATE voxel SET name = 'House at Pooh Corner-N8' WHERE classid = 34 AND id=v_rec.id;
			UPDATE voxel SET name = 'Swimming Pool-B4' WHERE classid = 36 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Fitness and Aquatic Centre-B5' WHERE classid = 37 AND id=v_rec.id;
			UPDATE voxel SET name = 'Tyree Energy Technologies-H6' WHERE classid = 38 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein Hall-D16' WHERE classid = 39 AND id=v_rec.id;
			UPDATE voxel SET name = 'UNSW Hall-D14' WHERE classid = 41 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Theatre-B14d' WHERE classid = 42 AND id=v_rec.id;
			UPDATE voxel SET name = 'White House-C15' WHERE classid = 43 AND id=v_rec.id;
			UPDATE voxel SET name = 'Roundhouse-E6' WHERE classid = 44 AND id=v_rec.id;
			UPDATE voxel SET name = 'Squarehouse-E4' WHERE classid = 45 AND id=v_rec.id;
			UPDATE voxel SET name = 'Rex Vowels Theatre-F17' WHERE classid = 47 AND id=v_rec.id;
			UPDATE voxel SET name = 'Colombo House-B16' WHERE classid = 48 AND id=v_rec.id;
			UPDATE voxel SET name = 'Goldstein College-B17' WHERE classid = 49 AND id=v_rec.id;
			UPDATE voxel SET name = 'Fig Tree Hall-B18' WHERE classid = 50 AND id=v_rec.id;
			UPDATE voxel SET name = 'Philip Baxter College-D18' WHERE classid = 51 AND id=v_rec.id;
			UPDATE voxel SET name = 'Basser College-D17' WHERE classid = 52 AND id=v_rec.id;
			UPDATE voxel SET name = 'Old Tote-B15' WHERE classid = 53 AND id=v_rec.id;			
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
-- Query returned successfully in 54 min 16 secs.



-- 关于移除classid和ifcid字段
ALTER TABLE voxel DROP COLUMN classid, DROP COLUMN ifcid;
-- Query returned successfully in 1 secs 393 msec.

-- 关于添加索引
DROP INDEX IF EXISTS idx_voxel CASCADE;
CREATE INDEX idx_voxel ON voxel(category, name, ifc, x, y, z);
-- Query returned successfully in 186 min 36 secs.

VACUUM FULL ANALYZE voxel;
-- Query returned successfully in 301 min 4 secs.
