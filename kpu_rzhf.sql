SELECT kpu_rzhf.id, kpu_rzhf.ikd, kpu_rzhf.ar, kpu_catal.house, kpu_catal.flat, kpu_rzhf.FULL_SQ, kpu_rzhf.LIVING_SQ
	FROM KPU_RZHF JOIN KPU_CATAL ON kpu_rzhf.ID_KPU_CATAL = kpu_catal.id
	WHERE kpu_rzhf.ikd = 4446690;

SELECT count(*)
	FROM kpu_rzhf
	WHERE ar IS not NULL;
	
SELECT sum(korm_seno)
	FROM zem;
	
SELECT count(id_catal)
	FROM zem JOIN kpu_catal ON zem.id_catal = kpu_catal.id
	WHERE kpu_catal.KATO_ID = 255784 AND pashnya > 100;

UPDATE ZEM
	SET korm_seno = NULL
	WHERE id_catal IN (SELECT id FROM kpu_catal WHERE kato_id = 255784) AND
		PASHNYA >= 100
	ROWS 1;
	
-- с. Кайрат ID=255784 больше
-- с. Дехкан ID=255785 меньше

UPDATE ZEM
	SET kapusta = 50
	WHERE ID_CATAL IN (SELECT id FROM KPU_CATAL WHERE kato_id = 255784) AND 
		PASHNYA >= COALESCE(semena_masl, 0) + coalesce(ovoshi, 0) + coalesce(soloma, 0)
	ROWS 131
	
