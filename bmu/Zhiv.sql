SELECT count(*) FROM ZHIV
	WHERE SKOT_MOL_VSEGO >= 1
		AND id_catal NOT IN (24134, 24141, 24147, 24151, 24156, 24164, 24173, 24177, 24181, 24197, 24203, 24212, 24224, 24237, 24243, 24234, 49324);

UPDATE ZHIV
	SET BYKI_PROIZV = COALESCE(BYKI_PROIZV, 0) + 2
	WHERE 
		id_catal NOT IN (24134, 24141, 24147, 24151, 24156, 24164, 24173, 24177, 24181, 24197, 24203, 24212, 24224, 24237, 24243, 24234, 49324)
		AND BYKI_PROIZV >= 1
	ROWS 1;


SELECT count(*) FROM POSTR_ZHIV
	WHERE SPR_POSTR_ZHIV_ID=71;

UPDATE ZHIV
	SET SKOT_MOL_VSEGO = COALESCE(SKOT_MOL_VSEGO, 0) + 2
	WHERE
		id_catal NOT IN (24134, 24141, 24147, 24151, 24156, 24164, 24173, 24177, 24181, 24197, 24203, 24212, 24224, 24237, 24243, 24234, 49324)
		--AND id_catal IN (SELECT id_catal FROM POSTR_ZHIV WHERE spr_postr_zhiv_id=71)
		AND SKOT_MOL_VSEGO >= 1
	ROWS 1;
------------------------------------

SELECT count(*) FROM ZHIV
	WHERE BARANY >= 1
		AND id_catal NOT IN (24134, 24141, 24147, 24151, 24156, 24164, 24173, 24177, 24181, 24197, 24203, 24212, 24224, 24237, 24243, 24234, 49324);

UPDATE ZHIV
	SET BARANY = BARANY + 4
	WHERE
		id_catal NOT IN (24134, 24141, 24147, 24151, 24156, 24164, 24173, 24177, 24181, 24197, 24203, 24212, 24224, 24237, 24243, 24234, 49324)
		AND BARANY >= 1
	ROWS 1;

UPDATE ZHIV
	SET OVCY_VSEGO = COALESCE(OVCEMATKI, 0) + COALESCE(BARANY, 0)
	WHERE 
		id_catal NOT IN (24134, 24141, 24147, 24151, 24156, 24164, 24173, 24177, 24181, 24197, 24203, 24212, 24224, 24237, 24243, 24234, 49324);
-------------------------------------------

SELECT count(*) FROM ZHIV
	WHERE KOZLY_PROIZV >= 1
		AND id_catal NOT IN (24134, 24141, 24147, 24151, 24156, 24164, 24173, 24177, 24181, 24197, 24203, 24212, 24224, 24237, 24243, 24234, 49324);

UPDATE ZHIV
	SET KOZLY_PROIZV = KOZLY_PROIZV - 2
	WHERE
		id_catal NOT IN (24134, 24141, 24147, 24151, 24156, 24164, 24173, 24177, 24181, 24197, 24203, 24212, 24224, 24237, 24243, 24234, 49324)
		AND KOZLY_PROIZV >= 4
	ROWS 1;

UPDATE ZHIV
	SET KOZY_VSEGO = COALESCE(KOZOMATKI, 0) + COALESCE(KOZLY_PROIZV, 0)
	WHERE 
		id_catal NOT IN (24134, 24141, 24147, 24151, 24156, 24164, 24173, 24177, 24181, 24197, 24203, 24212, 24224, 24237, 24243, 24234, 49324);
---------------------------------------

SELECT count(MERINY)
	FROM ZHIV
	WHERE MERINY >= 1
		AND id_catal NOT IN (24134, 24141, 24147, 24151, 24156, 24164, 24173, 24177, 24181, 24197, 24203, 24212, 24224, 24237, 24243, 24234, 49324);


UPDATE ZHIV
	SET ZHEREBCY = ZHEREBCY + 1
	WHERE zherebcy >= 1
	AND id_catal NOT IN (24134, 24141, 24147, 24151, 24156, 24164, 24173, 24177, 24181, 24197, 24203, 24212, 24224, 24237, 24243, 24234, 49324)
	AND ID_CATAL IN (SELECT ID_CATAL FROM postr_zhiv WHERE spr_postr_zhiv_id=74 AND chislo_skm > LOSHADI + 1)
	ROWS 3;
	
UPDATE ZHIV
	SET MERINY = 0
	WHERE MERINY = 1
	AND id_catal NOT IN (24134, 24141, 24147, 24151, 24156, 24164, 24173, 24177, 24181, 24197, 24203, 24212, 24224, 24237, 24243, 24234, 49324)
	ROWS 7;

UPDATE ZHIV
	SET LOSHADI = COALESCE(KOBYLY, 0) + COALESCE(ZHEREBCY, 0) + COALESCE(MERINY, 0)
	WHERE id_catal NOT IN (24134, 24141, 24147, 24151, 24156, 24164, 24173, 24177, 24181, 24197, 24203, 24212, 24224, 24237, 24243, 24234, 49324);
	
-----------------------------------

SELECT count(hryaki) FROM ZHIV
	WHERE hryaki = 2
	AND id_catal NOT IN (24134, 24141, 24147, 24151, 24156, 24164, 24173, 24177, 24181, 24197, 24203, 24212, 24224, 24237, 24243, 24234, 49324);

UPDATE ZHIV
	SET SVINOMATKI = SVINOMATKI - 1
	WHERE svinomatki >= 2
	AND id_catal NOT IN (24134, 24141, 24147, 24151, 24156, 24164, 24173, 24177, 24181, 24197, 24203, 24212, 24224, 24237, 24243, 24234, 49324)
	ROWS 3;

UPDATE ZHIV
	SET SVINJI = COALESCE(HRYAKI, 0) + COALESCE(SVINOMATKI, 0)
	WHERE id_catal NOT IN (24134, 24141, 24147, 24151, 24156, 24164, 24173, 24177, 24181, 24197, 24203, 24212, 24224, 24237, 24243, 24234, 49324);

------------------------------------

SELECT count(*) FROM ZHIV
	WHERE KURY_NESUSHKI >= 1
	AND id_catal NOT IN (24134, 24141, 24147, 24151, 24156, 24164, 24173, 24177, 24181, 24197, 24203, 24212, 24224, 24237, 24243, 24234, 49324)
		AND KURY > KURY_NESUSHKI + 10;

UPDATE ZHIV
	SET KURY = COALESCE(KURY, 0) + 6
	WHERE
		id_catal NOT IN (24134, 24141, 24147, 24151, 24156, 24164, 24173, 24177, 24181, 24197, 24203, 24212, 24224, 24237, 24243, 24234, 49324)
		AND ID_CATAL IN (SELECT ID_CATAL FROM postr_zhiv)
	ROWS 6;
	
UPDATE ZHIV
	SET KURY = KURY - 1
	WHERE 
		kury > 2
		AND id_catal NOT IN (24134, 24141, 24147, 24151, 24156, 24164, 24173, 24177, 24181, 24197, 24203, 24212, 24224, 24237, 24243, 24234, 49324)
	ROWS 9;

UPDATE ZHIV
	SET PTITSA = KURY
	WHERE id_catal NOT IN (24134, 24141, 24147, 24151, 24156, 24164, 24173, 24177, 24181, 24197, 24203, 24212, 24224, 24237, 24243, 24234, 49324);
