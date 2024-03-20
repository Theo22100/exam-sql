
use exam_sql_bus;

-- Exercice 1
SELECT horaires.horaire AS "Horaires à l'arrêt Madeleine (Lundi)"
FROM arrets
JOIN arretshoraires ON arrets.id_Arret = arretshoraires.id_Arret
JOIN horaires ON arretshoraires.id_horaire = Horaires.id_horaire
WHERE arrets.nom ='Madeleine';

SELECT Horaires.horaire AS "Horaires à l'arrêt République (Lundi)"
FROM arrets
JOIN arretshoraires ON Arrets.ID_Arret = arretshoraires.ID_Arret
JOIN horaires ON arretshoraires.ID_Horaire = Horaires.ID_Horaire
WHERE arrets.nom ='République';




-- Exercice 2
SELECT arrets.nom AS "Parcours de la ligne 2 Direction Kersec"
FROM arrets
JOIN arretsdirection ON arrets.id_Arret = arretsdirection.id_Arret
JOIN direction ON arretsdirection.id_Direction = direction.id_Direction
WHERE direction.nom = 'Direction Kersec'
ORDER BY arretsdirection.direction;




-- Exercice 4 et 5
SELECT
    CASE
        WHEN arrets.nom = 'Petit Tohannic' THEN CONCAT('L\'arrêt n\'est pas desservi. Veuillez vous reporter à "', arretredirection.nom, '".')
        ELSE horaires.horaire
    END AS "Horaires à l'arrêt Petit Tohannic (Lundi)"
FROM
    arrets
LEFT JOIN redirectionstempo ON arrets.id_Arret = redirectionstempo.id_Arret_NonDesservi
LEFT JOIN arrets AS arretredirection ON redirectionstempo.id_Arret_Redirection = arretredirection.id_Arret
LEFT JOIN arretshoraires ON arrets.id_Arret = arretshoraires.id_Arret
LEFT JOIN horaires ON arretshoraires.id_Horaire = horaires.id_Horaire
WHERE
    arrets.nom = 'Petit Tohannic';





-- Exercice 6 et 7
SELECT 
    CONCAT('Ligne 2', ' ', direction.nom) AS Ligne,
    GROUP_CONCAT(arrets.nom ORDER BY arretsdirection.direction SEPARATOR ',') AS "Arrêts desservis"
FROM 
    direction
LEFT JOIN 
    arretsdirection ON direction.id_Direction = arretsdirection.id_Direction
LEFT JOIN 
    arrets ON arretsdirection.id_Arret = Arrets.id_Arret
GROUP BY 
    direction.id_Direction, direction.nom;

-- Exercice 10
CALL insert_horaire('06:32', '06:41', '00:01');
SELECT horaire FROM horaire
