-- Destruction de la BD si elle existe pour assurer la mise à jour.
DROP DATABASE IF EXISTS godel_lore_deva1a_db;

-- Création de la base de données
CREATE DATABASE IF NOT EXISTS godel_lore_deva1a_db;
USE godel_lore_deva1a_db;

-- Création de la table `t_plante` pour les informations sur les plantes.
CREATE TABLE t_plante (
    id_plante INT AUTO_INCREMENT PRIMARY KEY,
    espece VARCHAR(255) NOT NULL,
    nom_commun VARCHAR(255) NOT NULL,
    date_plantation DATE
);

-- Création de la table `t_conditions` pour stocker les informations environnementales.
CREATE TABLE t_conditions (
    id_conditions INT AUTO_INCREMENT PRIMARY KEY,
    temperature DECIMAL(5,2) NOT NULL,
    concentration_nutriment DECIMAL(5,2) NOT NULL,
    humidite DECIMAL(5,2) NOT NULL,
    luminosite DECIMAL(5,2) NOT NULL,
    cout_total DECIMAL(10,2) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Création de la table `t_conditions_optimales` pour les conditions de croissance optimales des plantes.
CREATE TABLE t_conditions_optimales (
    id_conditions_optimales INT AUTO_INCREMENT PRIMARY KEY,
    temperature DECIMAL(5,2) NOT NULL,
    concentration_nutriment DECIMAL(5,2) NOT NULL,
    humidite DECIMAL(5,2) NOT NULL,
    luminosite DECIMAL(5,2) NOT NULL,
    cout_total DECIMAL(10,2) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Création de la table `t_utilisateur` pour les informations des utilisateurs.
CREATE TABLE t_utilisateur (
    id_utilisateur INT AUTO_INCREMENT PRIMARY KEY,
    nom_utilisateur VARCHAR(255) NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,
    date_naissance DATE,
    adresse_mail VARCHAR(255) NOT NULL,
    UNIQUE (adresse_mail) -- Assure une adresse email unique.
);

-- Création de la table `t_boite` pour les informations sur les boîtes ou armoires.
CREATE TABLE t_boite (
    id_boite INT AUTO_INCREMENT PRIMARY KEY,
    localisation VARCHAR(255) NOT NULL
);

-- Création de la table `t_capteur` pour les informations sur les capteurs.
CREATE TABLE t_capteur (
    id_capteur INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(255) NOT NULL,
    id_boite INT,
    FOREIGN KEY (id_boite) REFERENCES t_boite(id_boite)
        ON DELETE CASCADE -- Assurer une integrité référentielle
        ON UPDATE CASCADE
);

-- Création de la table `t_actions_correctives` pour documenter les interventions effectuées pour maintenir ou améliorer les conditions de culture.
CREATE TABLE t_actions_correctives (
    id_actions_correctives INT AUTO_INCREMENT PRIMARY KEY,
    description TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Création de la table `t_assoc_actions_conditions` pour suivre quelles actions ont été prises en réponse à quelles conditions.
CREATE TABLE t_assoc_actions_conditions (
    id_actions_correctives INT,
    id_conditions INT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_actions_correctives, id_conditions),
    FOREIGN KEY (id_actions_correctives) REFERENCES t_actions_correctives(id_actions_correctives)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_conditions) REFERENCES t_conditions(id_conditions)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Création de la table `t_assoc_actions_utilisateur` 
CREATE TABLE t_assoc_actions_utilisateur (
    id_actions_correctives INT,
    id_utilisateur INT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_actions_correctives, id_utilisateur),
    FOREIGN KEY (id_actions_correctives) REFERENCES t_actions_correctives(id_actions_correctives)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_utilisateur) REFERENCES t_utilisateur(id_utilisateur)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Création de la table `t_assoc_boite_plante` 
CREATE TABLE t_assoc_boite_plante (
    id_boite INT,
    id_plante INT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_boite, id_plante),
    FOREIGN KEY (id_boite) REFERENCES t_boite(id_boite)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_plante) REFERENCES t_plante(id_plante)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Création de la table `t_assoc_boite_capteur` pour suivre quels capteurs sont installés dans quelles boîtes.
CREATE TABLE t_assoc_boite_capteur (
    id_capteur INT,
    id_boite INT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_capteur, id_boite),
    FOREIGN KEY (id_capteur) REFERENCES t_capteur(id_capteur)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_boite) REFERENCES t_boite(id_boite)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Création de la table `t_assoc_capteurs_conditions` 
CREATE TABLE t_assoc_capteurs_conditions (
    id_conditions INT,
    id_capteur INT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_conditions, id_capteur),
    FOREIGN KEY (id_conditions) REFERENCES t_conditions(id_conditions)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_capteur) REFERENCES t_capteur(id_capteur)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Création de la table `t_assoc_plante_conditions_optimales` pour définir quelles plantes nécessitent quelles conditions optimales.
CREATE TABLE t_assoc_plante_conditions_optimales (
    id_conditions_optimales INT,
    id_plante INT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_conditions_optimales, id_plante),
    FOREIGN KEY (id_conditions_optimales) REFERENCES t_conditions_optimales(id_conditions_optimales)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_plante) REFERENCES t_plante(id_plante)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Insertion de données dans la base de donnée

-- Insertion de données dans `t_plante` 
INSERT INTO `t_plante` (`espece`, `nom_commun`, `date_plantation`) VALUES
('Cannabis', 'CBD Kush', '2020-04-20'),
('Cannabis', 'THC Bomb', '2020-04-20'),
('Cannabis', 'OG Kush', '2020-05-15'),
('Cannabis', 'Sour Diesel', '2020-06-01'),
('Cannabis', 'Purple Haze', '2020-06-10'),
('Cannabis', 'Blue Dream', '2020-07-20'),
('Cannabis', 'White Widow', '2020-08-30'),
('Cannabis', 'Gorilla Glue', '2020-09-25'),
('Cannabis', 'Amnesia Haze', '2020-10-10'),
('Cannabis', 'Northern Lights', '2020-11-01');

-- Insertion de données dans `t_conditions`
INSERT INTO `t_conditions` (`temperature`, `humidite`, `luminosite`, `concentration_nutriment`, `cout_total`, `timestamp`) VALUES
(23.5, 50.0, 300.0, 20.0, 100.0, NOW()),
(24.0, 55.0, 350.0, 22.0, 120.0, NOW()),
(22.0, 60.0, 320.0, 21.0, 110.0, NOW()),
(25.0, 45.0, 310.0, 19.0, 130.0, NOW()),
(23.0, 50.0, 340.0, 20.0, 115.0, NOW()),
(24.5, 55.0, 330.0, 22.5, 125.0, NOW()),
(23.5, 52.0, 310.0, 21.5, 135.0, NOW()),
(24.0, 53.0, 320.0, 22.0, 105.0, NOW()),
(23.0, 54.0, 330.0, 21.0, 140.0, NOW()),
(24.5, 50.0, 340.0, 22.5, 145.0, NOW());

INSERT INTO `t_conditions_optimales` (`temperature`, `concentration_nutriment`, `humidite`, `luminosite`, `cout_total`, `timestamp`) VALUES
(25.0, 25.0, 60.0, 300.0, 100.0, NOW()),
(26.0, 27.0, 65.0, 320.0, 120.0, NOW()),
(24.0, 24.0, 55.0, 310.0, 110.0, NOW()),
(25.5, 26.5, 62.0, 330.0, 130.0, NOW()),
(26.5, 28.0, 64.0, 315.0, 115.0, NOW()),
(24.5, 23.5, 57.0, 305.0, 125.0, NOW()),
(25.0, 25.0, 60.0, 320.0, 135.0, NOW()),
(26.0, 27.0, 63.0, 330.0, 105.0, NOW()),
(24.5, 24.5, 56.0, 310.0, 140.0, NOW()),
(25.5, 26.0, 61.0, 325.0, 145.0, NOW());

INSERT INTO `t_utilisateur` (`nom_utilisateur`, `mot_de_passe`, `date_naissance`, `adresse_mail`) VALUES
('Dupont', 'password123', '1980-05-10', 'jean.dupont@example.com'),
('Doe', 'password456', '1990-07-15', 'jane.doe@example.com'),
('Smith', 'password789', '1985-03-25', 'john.smith@example.com'),
('Johnson', 'password101', '1975-12-20', 'alice.johnson@example.com'),
('Williams', 'password102', '1982-07-30', 'bob.williams@example.com'),
('Brown', 'password103', '1995-01-10', 'charlie.brown@example.com'),
('Jones', 'password104', '1988-09-15', 'david.jones@example.com'),
('Garcia', 'password105', '1972-11-05', 'eva.garcia@example.com'),
('Martinez', 'password106', '1992-02-20', 'frank.martinez@example.com'),
('Hernandez', 'password107', '1980-10-10', 'gina.hernandez@example.com');

INSERT INTO `t_boite` (`localisation`) VALUES
('Serre A'),
('Serre B'),
('Serre C'),
('Serre D'),
('Serre E'),
('Serre F'),
('Serre G'),
('Serre H'),
('Serre I'),
('Serre J');

-- Insertion de données dans `t_capteur`
INSERT INTO `t_capteur` (`type`, `id_boite`) VALUES
('Humidité', 1),
('Température', 2),
('Lumière', 3),
('pH', 4),
('EC', 5),
('CO2', 6),
('Oxygène', 7),
('Humidité du sol', 8),
('Son', 9),
('Vibration', 10);

-- Insertion de données dans `t_actions_correctives`
INSERT INTO `t_actions_correctives` (`description`, `timestamp`) VALUES
('Ajustement de l\'arrosage', NOW()),
('Modification de l\'éclairage', NOW()),
('Réparation du système d\'irrigation', NOW() - INTERVAL 1 DAY),
('Augmentation de la concentration en nutriments', NOW() - INTERVAL 2 DAY),
('Réduction de l\'humidification', NOW() - INTERVAL 3 DAY),
('Changement des lampes de croissance', NOW() - INTERVAL 4 DAY),
('Calibration des capteurs', NOW() - INTERVAL 5 DAY),
('Nettoyage des filtres d\'air', NOW() - INTERVAL 6 DAY),
('Réglage de la température', NOW() - INTERVAL 7 DAY),
('Ajout d\'un nouveau capteur', NOW() - INTERVAL 8 DAY);

-- Insertion de données dans `t_assoc_actions_conditions`
INSERT INTO `t_assoc_actions_conditions` (`id_actions_correctives`, `id_conditions`, `timestamp`) VALUES
(1, 1, NOW()),
(2, 2, NOW()),
(3, 3, NOW()),
(4, 4, NOW()),
(5, 5, NOW()),
(6, 6, NOW()),
(7, 7, NOW()),
(8, 8, NOW()),
(9, 9, NOW()),
(10, 10, NOW());

-- Insertion de données dans `t_assoc_actions_utilisateur`
INSERT INTO `t_assoc_actions_utilisateur` (`id_actions_correctives`, `id_utilisateur`, `timestamp`) VALUES
(1, 1, '2023-06-01 12:00:00'),
(2, 2, '2023-06-02 13:00:00'),
(3, 1, '2023-06-03 14:00:00'),
(4, 3, '2023-06-04 15:00:00'),
(5, 2, '2023-06-05 16:00:00'),
(6, 4, '2023-06-06 17:00:00'),
(7, 5, '2023-06-07 18:00:00'),
(8, 3, '2023-06-08 19:00:00'),
(9, 4, '2023-06-09 20:00:00'),
(10, 5, '2023-06-10 21:00:00');

-- Insertion de données dans `t_assoc_boite_plante`
INSERT INTO `t_assoc_boite_plante` (`id_boite`, `id_plante`, `timestamp`) VALUES
(1, 1, '2023-06-01 12:00:00'),
(2, 2, '2023-06-02 13:00:00'),
(3, 3, '2023-06-03 14:00:00'),
(4, 4, '2023-06-04 15:00:00'),
(5, 5, '2023-06-05 16:00:00'),
(6, 6, '2023-06-06 17:00:00'),
(7, 7, '2023-06-07 18:00:00'),
(8, 8, '2023-06-08 19:00:00'),
(9, 9, '2023-06-09 20:00:00'),
(10, 10, '2023-06-10 21:00:00');

-- Insertion de données dans `t_assoc_boite_capteur`
INSERT INTO `t_assoc_boite_capteur` (`id_capteur`, `id_boite`, `timestamp`) VALUES
(1, 1, NOW()),
(2, 2, NOW()),
(3, 3, NOW()),
(4, 4, NOW()),
(5, 5, NOW()),
(6, 6, NOW()),
(7, 7, NOW()),
(8, 8, NOW()),
(9, 9, NOW()),
(10, 10, NOW());

-- Insertion de données dans `t_assoc_capteurs_conditions`
INSERT INTO `t_assoc_capteurs_conditions` (`id_conditions`, `id_capteur`, `timestamp`) VALUES
(1, 1, '2023-06-01 12:00:00'),
(2, 2, '2023-06-02 13:00:00'),
(3, 3, '2023-06-03 14:00:00'),
(4, 4, '2023-06-04 15:00:00'),
(5, 5, '2023-06-05 16:00:00'),
(6, 6, '2023-06-06 17:00:00'),
(7, 7, '2023-06-07 18:00:00'),
(8, 8, '2023-06-08 19:00:00'),
(9, 9, '2023-06-09 20:00:00'),
(10, 10, '2023-06-10 21:00:00');

-- Insertion de données dans `t_assoc_plante_conditions_optimales`
INSERT INTO `t_assoc_plante_conditions_optimales` (`id_conditions_optimales`, `id_plante`, `timestamp`) VALUES
(1, 1, NOW()),
(2, 2, NOW()),
(3, 3, NOW()),
(4, 4, NOW()),
(5, 5, NOW()),
(6, 6, NOW()),
(7, 7, NOW()),
(8, 8, NOW()),
(9, 9, NOW()),
(10, 10, NOW());

