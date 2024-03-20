-- Exam SQL Théo Guérin

use exam_sql_bus;

-- Supprime la table Arrets si elle existe
DROP TABLE IF EXISTS arrets;
-- Creation Arrets
CREATE TABLE arrets (
    id_Arret INT NOT NULL, 
    nom VARCHAR(150), 
    PRIMARY KEY (id_Arret)
);

-- Supprime la table Ligne si elle existe
DROP TABLE IF EXISTS ligne;
-- Creation Table Ligne
CREATE TABLE ligne (
    id_Ligne INT NOT NULL, 
    nom VARCHAR(100), 
    PRIMARY KEY (id_Ligne)
);

-- Supprime la table Horaires si elle existe
DROP TABLE IF EXISTS horaires;
-- Creation Table Horaires
CREATE TABLE horaires (
    id_Horaire INT NOT NULL, 
    horaire TIME, 
    PRIMARY KEY (id_Horaire)
);


-- Supprime la table Direction si elle existe
DROP TABLE IF EXISTS direction;
-- Creation Table Direction
CREATE TABLE direction (
    id_Direction INT NOT NULL, 
    nom VARCHAR(100), 
    PRIMARY KEY (id_Direction)
);

-- Supprime la table ArretsDirection si elle existe
DROP TABLE IF EXISTS arretsdirection;
-- Creation Table ArretsDirection
CREATE TABLE arretsdirection (
    id_Arret INT NOT NULL,
    id_Direction INT NOT NULL,
    direction INT NOT NULL,
    PRIMARY KEY (id_Arret, id_Direction)
);

-- Supprime la table LigneArret si elle existe
DROP TABLE IF EXISTS lignearret; 
-- Creation Table LigneArret
CREATE TABLE lignearret (
    id_Ligne INT NOT NULL, 
    id_Arret INT NOT NULL, 
    PRIMARY KEY (id_Ligne, id_Arret)
);

-- Supprime la table LigneDirection si elle existe
DROP TABLE IF EXISTS lignedirection;
-- Creation Table LigneDirection 
CREATE TABLE lignedirection (
    id_Direction INT NOT NULL, 
    id_Ligne INT NOT NULL, 
    PRIMARY KEY (id_Direction,  id_Ligne)
);

-- Supprime la table ArretsHoraires si elle existe
DROP TABLE IF EXISTS arretshoraires; 
-- Creation Table ArretsHoraires
CREATE TABLE arretshoraires (
    id_Arret INT NOT NULL, 
    id_Horaire INT NOT NULL, 
    PRIMARY KEY (id_Arret,  id_Horaire)
);

-- Procédure Exercice 3

-- Supprime la table RedirectionsTempo si elle existe
DROP TABLE IF EXISTS redirectionstempo;
CREATE TABLE redirectionstempo (
    id_Redirection INT NOT NULL AUTO_INCREMENT, 
    id_Arret_NonDesservi INT NOT NULL, 
    id_Arret_Redirection INT NOT NULL, 
    PRIMARY KEY (id_Redirection)
);

-- Exercice 10
CREATE TABLE horaire (
    horaire TIME
);

-- Ajout clés étrangères
ALTER TABLE lignearret ADD CONSTRAINT FK_LigneArret_id_Ligne FOREIGN KEY (id_Ligne) REFERENCES ligne (id_Ligne);
ALTER TABLE lignearret ADD CONSTRAINT FK_LigneArret_id_Arret FOREIGN KEY (id_Arret) REFERENCES arrets (id_Arret);
ALTER TABLE lignedirection ADD CONSTRAINT FK_LigneDirection_id_Direction FOREIGN KEY (id_Direction) REFERENCES direction (id_Direction);
ALTER TABLE lignedirection ADD CONSTRAINT FK_LigneDirection_id_Ligne FOREIGN KEY (id_Ligne) REFERENCES ligne (id_Ligne);
ALTER TABLE arretsdirection ADD CONSTRAINT FK_ArretsDirection_id_Arret FOREIGN KEY (id_Arret) REFERENCES arrets (id_Arret);
ALTER TABLE arretsdirection ADD CONSTRAINT FK_ArretsDirection_id_Direction FOREIGN KEY (id_Direction) REFERENCES direction (id_Direction);
ALTER TABLE arretshoraires ADD CONSTRAINT FK_ArretsHoraires_id_Arret FOREIGN KEY (id_Arret) REFERENCES arrets (id_Arret);
ALTER TABLE arretshoraires ADD CONSTRAINT FK_ArretsHoraires_id_Horaire FOREIGN KEY (id_Horaire) REFERENCES horaires (id_Horaire);
ALTER TABLE redirectionstempo ADD CONSTRAINT FK_RedirectionsTempo_id_Arret_NonDesservi FOREIGN KEY (id_Arret_NonDesservi) REFERENCES arrets (id_Arret);
ALTER TABLE redirectionstempo ADD CONSTRAINT FK_RedirectionsTempo_id_Arret_Redirection FOREIGN KEY (id_Arret_Redirection) REFERENCES arrets (id_Arret);


-- Exercice 10 Procédure
DELIMITER //

CREATE PROCEDURE insert_horaire(
    IN heure_depart TIME,
    IN heure_fin TIME,
    IN nbEtape TIME
)
BEGIN
    DECLARE heure_actuelle TIME;
    
    SET heure_actuelle = heure_depart;
    
    WHILE heure_actuelle <= heure_fin DO
        INSERT INTO horaire (horaire) VALUES (heure_actuelle);
        SET heure_actuelle = ADDTIME(heure_actuelle, nbEtape);
    END WHILE;
    
END//

DELIMITER ;
