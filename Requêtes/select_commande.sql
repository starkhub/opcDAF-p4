USE expressfood;
SELECT clt.c_nom AS 'NOM', clt.c_prenom AS 'PRENOM', clt.c_email AS 'EMAIL', clt.c_tel AS 'TEL', cde.c_id AS 'NUM COMMANDE', cde.c_date AS 'DATE', CONCAT(l.l_prenom, ' ', l.l_nom) AS 'LIVREUR' , cde.c_etat AS 'STATUT COMMANDE', pdt.p_type AS 'TYPE', pdt.p_nom AS 'NOM', pdt.p_prix AS 'PRIX UNITAIRE', menu.m_quantite AS 'Quantite commandée', (pdt.p_prix * menu.m_quantite) AS 'PRIX TTC'
FROM client AS clt
INNER JOIN adresse AS adrs -- ON RELIE LE CLIENT A L'ADRESSE
	on clt.c_id = adrs.a_fk_client_id
INNER JOIN commande AS cde -- ON RELIE LA COMMANDE AU CLIENT
	ON clt.c_id = cde.c_fk_client_id
INNER JOIN livreur AS l -- ON RELIE LA COMMANDE AU LIVREUR
	ON cde.c_fk_livreur_id = l.l_id
INNER JOIN menu as menu -- ON RELIE LE MENU A LA COMMANDE
	ON cde.c_id = menu.m_commande_pk
INNER JOIN produit as pdt -- ON RELIE LES PRODUITS AU MENU
	ON menu.m_produit_pk = pdt.p_id
WHERE clt.c_id = 1 -- ON SELECTIONNE JUSTE L'ID DU CLIENT POUR CONNAITRE SES COMMANDES