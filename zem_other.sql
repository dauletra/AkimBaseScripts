-- с. Кайрат ID=255784 больше
-- с. Дехкан ID=255785 меньше

SELECT id, posev, semena_masl, ovoshi, soloma
	FROM ZEM
	WHERE id_catal IN (SELECT id FROM kpu_catal WHERE kato_id IN (255785))
		AND posev > 0
	ORDER BY posev;

SELECT sum(ZEM_OTHER)
	FROM zem
	WHERE id_catal IN (SELECT id FROM kpu_catal WHERE kato_id IN (255784, 255785));

	
UPDATE ZEM
	SET ZEM_OTHER = VSEGO - COALESCE(POSTROYKI, 0) - COALESCE(KFH_SHU, 0);


UPDATE ZEM
	SET KFH_SHU = COALESCE(PASHNYA, 0) + COALESCE(MNOGOLETNIE, 0);
	
	
SELECT sum(PASHNYA)
	FROM ZEM
	WHERE id_catal IN (SELECT id FROM kpu_catal WHERE kato_id IN (255784, 255785));

SELECT count(*)
	FROM ZEM
	WHERE id_catal IN (SELECT id FROM kpu_catal WHERE kato_id IN (255784, 255785))
		AND PASHNYA > POSEV + 10;

UPDATE ZEM
	SET PASHNYA = PASHNYA - 10
	WHERE id_catal IN (SELECT id FROM kpu_catal WHERE kato_id IN (255784, 255785))
		AND PASHNYA > POSEV + 10;

UPDATE ZEM
	SET SOLOMA = SOLOMA - 37
	WHERE id_catal IN (SELECT id FROM kpu_catal WHERE kato_id IN (255784, 255785))
		AND SOLOMA > 500
	ROWS 1;

-------null

UPDATE ZEM
	SET KARTOFEL = NULL;
		
UPDATE ZEM
	SET soloma = NULL
	WHERE id_catal IN (SELECT id FROM kpu_catal WHERE kato_id IN (255784, 255785));

-------check

SELECT kapusta, pertsy, ogurcy, BAKLAZHAN, POMIDOR, MORKOV, LUK, KARTOFEL
	FROM zem;

SELECT id, vsego, PASHNYA, posev, SEMENA_MASL, ovoshi, soloma, KARTOFEL
	FROM zem
	WHERE id_catal IN (SELECT id FROM kpu_catal WHERE kato_id IN (255784, 255785))
		AND pashnya < posev;

-------sum

UPDATE ZEM
	SET posev = COALESCE(semena_pods, 0) + COALESCE(ovoshi, 0) + COALESCE(soloma, 0)
	WHERE id_catal IN (SELECT id FROM kpu_catal WHERE kato_id IN (255784, 255785));

UPDATE zem
	SET ovoshi = COALESCE(KAPUSTA, 0) + COALESCE(pertsy, 0) + COALESCE(OGURCY, 0) + COALESCE(BAKLAZHAN, 0) + COALESCE(POMIDOR, 0) + COALESCE(MORKOV, 0) + COALESCE(LUK, 0) + COALESCE(KARTOFEL, 0)
	WHERE id_catal IN (SELECT id FROM kpu_catal WHERE kato_id IN (255784, 255785));
	
-----------------

UPDATE zem 
	SET korm_seno = SOLOMA;
	
SELECT sum(zerno), sum(KUKURUZA), sum(soloma)
	FROM ZEM
	WHERE id_catal IN (SELECT id FROM KPU_CATAL WHERE kato_id IN (255827, 255829, 255830, 255831));

SELECT count(*)
	FROM ZEM
	WHERE id_catal IN (SELECT id FROM KPU_CATAL WHERE kato_id IN (255827, 255829, 255830, 255831))
		AND pashnya - 50 > COALESCE(semena_masl, 0) + COALESCE(ovoshi, 0) + COALESCE(KORM_KUKURUZA, 0) + COALESCE(korm_seno, 0)
		AND pashnya > 0;

UPDATE ZEM
	SET zerno = KUKURUZA -- round(rand() * 100)
	WHERE id_catal IN (SELECT id FROM KPU_CATAL WHERE kato_id IN (255827, 255829, 255830, 255831));

UPDATE ZEM
	SET soloma = korm_seno
	WHERE id_catal IN (SELECT id FROM KPU_CATAL WHERE kato_id IN (255827, 255829, 255830, 255831));

	
	
UPDATE ZEM
	SET ovoshi = COALESCE(KAPUSTA, 0) + COALESCE(OGURCY, 0) + COALESCE(POMIDOR, 0) + COALESCE(MORKOV, 0) + COALESCE(CHESNOK, 0) + COALESCE(KARTOFEL, 0)
	WHERE id_catal IN (SELECT id FROM KPU_CATAL WHERE kato_id IN (255827, 255829, 255830, 255831));

UPDATE ZEM
	SET POSEV = COALESCE(SEMENA_MASL, 0) + COALESCE(OVOSHI, 0) + COALESCE(SOLOMA, 0)
	WHERE ID_CATAL IN (SELECT id FROM KPU_CATAL WHERE kato_id IN (255827, 255829, 255830, 255831));
	
SELECT id, pashnya, semena_pods, ovoshi, korm_kukuruza, korm_seno
	FROM ZEM
	WHERE PASHNYA < COALESCE(semena_pods, 0) + COALESCE(ovoshi, 0) + COALESCE(KORM_KUKURUZA, 0) + COALESCE(korm_seno, 0)
		AND ID_CATAL IN (SELECT id FROM KPU_CATAL WHERE kato_id IN (255827, 255829, 255830, 255831));

SELECT sum(semena_masl), sum(semena_pods), sum(ovoshi), sum(korm_kukuruza), sum(korm_seno)
	FROM zem
	WHERE ID_CATAL IN (SELECT id FROM KPU_CATAL WHERE kato_id IN (255827, 255829, 255830, 255831));

SELECT sum(KAPUSTA), sum(OGURCY), sum(POMIDOR), sum(MORKOV), sum(CHESNOK), sum(luk), sum(KARTOFEL)
	FROM zem
	WHERE ID_CATAL IN (SELECT id FROM KPU_CATAL WHERE kato_id IN (255827, 255829, 255830, 255831));
