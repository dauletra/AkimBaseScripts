SELECT 
		sum(SKOT_MOL_VSEGO) AS SKOT_MOL_VSEGO, sum(KOROVY_MOL) AS KOROVY_MOL, sum(BYKI_PROIZV) AS BYKI_PROIZV,
		sum(ovcy_vsego) AS OVCY_VSEGO, sum(OVCEMATKI) AS OVCEMATKI, sum(BARANY) AS BARANY,
		sum(KOZY_VSEGO) AS KOZY_VSEGO, sum(KOZOMATKI) AS KOZOMATKI, sum(KOZLY_PROIZV) AS kozly_proizv,
		sum(LOSHADI) AS loshadi, sum(kobyly) AS kobyly, sum(zherebcy) AS zherebcy, sum(meriny) AS MERINY,
		sum(SVINJI) AS SVINJI, sum(hryaki) AS hryaki, sum(svinomatki) AS svinomatki,
		sum(PTITSA) AS PTITSA, sum(KURY) AS KURY, sum(KURY_NESUSHKI) AS KURY_NESUSHKI
	FROM ZHIV
	WHERE 
		id_catal NOT IN (24134, 24141, 24147, 24151, 24156, 24164, 24173, 24177, 24181, 24197, 24203, 24212, 24224, 24237, 24243, 24234, 49324)
		;
		
	
-- TEST Loshadi 74
SELECT zhiv.id_catal, chislo_skm, loshadi, kobyly, zherebcy, meriny
	FROM ZHIV JOIN POSTR_ZHIV ON ZHIV.ID_CATAL = POSTR_ZHIV.ID_CATAL
	WHERE 
		zhiv.id_catal NOT IN (24134, 24141, 24147, 24151, 24156, 24164, 24173, 24177, 24181, 24197, 24203, 24212, 24224, 24237, 24243, 24234, 49324)
		AND spr_postr_zhiv_id=74 AND chislo_skm < loshadi;
	
UPDATE ZHIV
	SET kobyly = KOBYLY - 1
	WHERE ID_CATAL IN (SELECT zhiv.id_catal
							FROM ZHIV JOIN POSTR_ZHIV ON ZHIV.ID_CATAL = POSTR_ZHIV.ID_CATAL
							WHERE 
								zhiv.id_catal NOT IN (24134, 24141, 24147, 24151, 24156, 24164, 24173, 24177, 24181, 24197, 24203, 24212, 24224, 24237, 24243, 24234, 49324)
								AND spr_postr_zhiv_id=74 AND chislo_skm < loshadi)
		
-- TEST Ptitsa 76
SELECT zhiv.id_catal, chislo_skm, ptitsa, kury, kury_nesushki
	FROM ZHIV JOIN POSTR_ZHIV ON ZHIV.ID_CATAL = POSTR_ZHIV.ID_CATAL
	WHERE 
		zhiv.id_catal NOT IN (24134, 24141, 24147, 24151, 24156, 24164, 24173, 24177, 24181, 24197, 24203, 24212, 24224, 24237, 24243, 24234, 49324)
		AND spr_postr_zhiv_id=76 AND chislo_skm < ptitsa;

UPDATE ZHIV
	SET kury = NULL
	WHERE id_catal IN (SELECT id_catal FROM ZHIV
						WHERE
							KURY >= 1
							AND id_catal NOT IN (SELECT id_catal FROM POSTR_ZHIV));
