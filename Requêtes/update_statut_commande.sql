USE expressfood;
UPDATE commande
SET c_etat = 'En préparation' -- ON CHANGE LE STATUT DE LA COMMANDE
WHERE c_id = 3 -- ON CHANGE L'ID DE LA COMMANDE