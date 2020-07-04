USE expressfood;
SELECT pdt.p_nom AS 'Produits', pdt.p_prix AS 'PRIX UNITAIRE', menu.m_quantite AS 'QUANTITE', (pdt.p_prix * menu.m_quantite) AS 'PRIX TOTAL'
FROM commande AS cde
INNER JOIN menu AS menu
	ON cde.c_id = menu.m_commande_pk
INNER JOIN produit AS pdt
	ON menu.m_produit_pk = pdt.p_id
WHERE cde.c_id = 1