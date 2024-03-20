-- Choix table exam_sql_bus
use exam_sql_bus;

-- Supprime les données insérées dans les tables lors du lancement du script
DELETE FROM arrets;
DELETE FROM horaires;
DELETE FROM ligne;
DELETE FROM direction;
DELETE FROM arretshoraires;
DELETE FROM lignedirection;
DELETE FROM lignearret;
DELETE FROM arretsdirection;

-- Ajout arrets bus
INSERT INTO arrets (id_Arret, nom) VALUES (1, 'P+R Ouest'), (2, 'Fourchène1'), (3, 'Madeleine'), (4, 'République'), (5, 'PIBS2'), (6, 'Petit Tohannic'), (7, 'Delestraint'), (8, 'Kersec');

-- Ajout horaires bus 
INSERT INTO horaires (id_Horaire, horaire) VALUES 
(1, '6:32:00'), (2, '6:42:00'), (3, '6:52:00'), (4, '7:00:00'), (5, '7:10:00'), (6, '6:34:00'), (7, '6:44:00'), (8, '6:54:00'), (9, '7:02:00'), (10, '7:12:00'), (11, '6:37:00'), (12, '6:47:00'), (13, '6:57:00'), (14, '7:06:00'), (15, '7:16:00'), (16, '7:22:00'), (17, '7:07:00'), (18, '7:17:00'), (19, '6:46:00'), (20, '6:56:00'), (21, '7:27:00'), (22, '6:50:00'), (23, '7:11:00'), (24, '7:21:00'), (25, '7:31:00'), (26, '6:51:00'), (27, '7:01:00'), (28, '7:32:00'), (29, '6:55:00'), (30, '7:05:00'),(31, '7:26:00'), (32, '7:36:00');

-- Ajout de la ligne 2 
INSERT INTO ligne (id_ligne, nom) VALUES (1, 'ligne 2');

-- Ajout directions
INSERT INTO direction (id_Direction, nom) VALUES (1, 'direction Kersec'), (2, 'direction P+R Ouest');

-- Stocker et associer les identifiants des arrêts de bus et des horaires 
INSERT INTO arretshoraires (id_Arret, id_Horaire) VALUES (3,11), (3,12), (3,13), (3,14), (3,15), (4,2), (4,3), (4,9), (4,10), (4,16);

-- Stocker et associer les arrêts de bus et les directions de bus
INSERT INTO arretsdirection (id_Arret, id_Direction, direction) VALUES (1,1,1), (2,1,2), (3,1,3), (4,1,4), (5,1,5), (6,1,6), (7,1,7), (8,1,8), (8,2,1), (7,2,2), (6,2,3), (5,2,4), (4,2,5), (3,2,6), (2,2,7), (1,2,8);

-- Utilisé pour indiquer qu'un arrêt de bus est indisponible et y associer un arrêt de bus de redirection
INSERT INTO redirectionstempo (id_Arret_NonDesservi, id_Arret_Redirection) VALUES (6, 7);