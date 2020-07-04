USE expressfood;
SELECT clt.c_prenom AS 'PRENOM', clt.c_nom AS 'NOM', clt.c_email AS 'EMAIL', clt.c_tel AS 'TELEPHONE', CONCAT(adr.a_adresse, ' ', adr.a_adresse_ligne_2) AS 'ADRESSE', adr.a_code_postal AS 'CP', adr.a_ville AS 'VILLE'
FROM client AS clt
INNER JOIN adresse AS adr
	ON clt.c_id = adr.a_fk_client_id
WHERE clt.c_id = 1 -- ON CHANGE JUSTE L'ID DU CLIENT