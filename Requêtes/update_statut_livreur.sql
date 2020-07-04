USE expressfood;
UPDATE livreur
SET l_statut = 'Libre' -- ON CHANGE LE STATUT DE LA COMMANDE
WHERE l_id = 1 -- ON CHANGE L'ID DE LA COMMANDE