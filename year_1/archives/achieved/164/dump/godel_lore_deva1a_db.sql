-- Destruction de la BD si elle existe pour assurer la mise à jour
DROP DATABASE IF EXISTS godel_lore_deva1a_db;

-- Création de la base de données
CREATE DATABASE IF NOT EXISTS godel_lore_deva1a_db;
USE godel_lore_deva1a_db;

-- Création de la table `T_plante`pour identifier et gérer les plantes dans les boîtes.
CREATE TABLE `T_plante` (
  `id_plante` int NOT NULL AUTO_INCREMENT,
  `espece` varchar(255) NOT NULL,
  `nom_commun` varchar(255) NOT NULL,
  `date_plantation` date NOT NULL,
  PRIMARY KEY (`id_plante`)
);

-- Insertion de données dans `T_plante`
INSERT INTO `T_plante` (`espece`, `nom_commun`, `date_plantation`) VALUES
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

-- Création de la table `T_capteur`pour surveiller et modifier les conditions dans les boîtes
CREATE TABLE `T_capteur` (
  `id_capteur` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id_capteur`)
);

-- Insertion de données dans `T_capteur`pour surveiller les paramètres de culture
INSERT INTO `T_capteur` (`type`) VALUES
('Humidité'),
('Température'),
('Lumière'),
('pH'),
('EC'),
('CO2'),
('Oxygène'),
('Humidité du sol'),
('Son');

-- Création de la table `T_conditions`pour surveiller les paramètres de culture.
CREATE TABLE `T_conditions` (
  `id_conditions` int NOT NULL AUTO_INCREMENT,
  `temperature` decimal(5,2) NOT NULL,
  `humidite` decimal(5,2) NOT NULL,
  `luminosite` decimal(5,2) NOT NULL,
  `concentration_nutriment` decimal(5,2) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id_conditions`)
);

-- Insertion de données dans `T_conditions`
INSERT INTO `T_conditions` (`temperature`, `humidite`, `luminosite`, `concentration_nutriment`, `timestamp`) VALUES
(23.5, 50.0, 300.0, 20.0, NOW()),
(24.0, 55.0, 350.0, 22.0, NOW()),
(22.0, 60.0, 320.0, 21.0, NOW()),
(25.0, 45.0, 310.0, 19.0, NOW()),
(23.0, 50.0, 340.0, 20.0, NOW()),
(24.5, 55.0, 330.0, 22.5, NOW()),
(23.5, 52.0, 310.0, 21.5, NOW()),
(24.0, 53.0, 320.0, 22.0, NOW()),
(23.0, 54.0, 330.0, 21.0, NOW()),
(24.5, 50.0, 340.0, 22.5, NOW()),
(23.5, 56.0, 310.0, 21.5, NOW());

-- Création de la table `T_utilisateur` pour la gestion des utilisateurs et les permissions.
CREATE TABLE `T_utilisateur` (
  `id_utilisateur` int NOT NULL AUTO_INCREMENT,
  `nom_utilisateur` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `date_naissance` date NOT NULL,
  `adresse_mail` varchar(255) NOT NULL,
  PRIMARY KEY (`id_utilisateur`)
);

-- Insertion de données dans `T_utilisateur`
INSERT INTO `T_utilisateur` (`nom_utilisateur`, `mot_de_passe`, `date_naissance`, `adresse_mail`) VALUES
('Dupont', 'password123', '1980-05-10', 'jean.dupont@example.com'),
('Doe', 'password456', '1990-07-15', 'jane.doe@example.com'),
('Smith', 'password789', '1985-03-25', 'john.smith@example.com'),
('Johnson', 'password101', '1975-12-20', 'alice.johnson@example.com'),
('Williams', 'password102', '1982-07-30', 'bob.williams@example.com'),
('Brown', 'password103', '1995-01-10', 'charlie.brown@example.com'),
('Jones', 'password104', '1988-09-15', 'david.jones@example.com'),
('Garcia', 'password105', '1972-11-05', 'eva.garcia@example.com'),
('Martinez', 'password106', '1992-02-20', 'frank.martinez@example.com'),
('Hernandez', 'password107', '1980-10-10', 'gina.hernandez@example.com'),
('Lopez', 'password108', '1987-06-25', 'hugo.lopez@example.com'),
('Gonzalez', 'password109', '1979-08-15', 'irene.gonzalez@example.com');

-- Création de la table `T_boite` pour organiser les plantes et les capteurs par emplacement physique.
CREATE TABLE `T_boite` (
  `id_boite` int NOT NULL AUTO_INCREMENT,
  `localisation` varchar(255) NOT NULL,
  PRIMARY KEY (`id_boite`)
);

-- Insertion de données dans `T_boite` 
INSERT INTO `T_boite` (`localisation`) VALUES
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

-- Création de la table `T_conditions_optimales` pour comparer les conditions mesurées avec les conditions idéales et ajuster les paramètres de culture.
CREATE TABLE `T_conditions_optimales` (
  `id_conditions_optimales` int NOT NULL AUTO_INCREMENT,
  `temperature_optimale` decimal(5,2) NOT NULL,
  `humidite_optimale` decimal(5,2) NOT NULL,
  `luminosite_optimale` decimal(5,2) NOT NULL,
  `concentration_nutriment_optimale` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id_conditions_optimales`)
);

-- Insertion de données dans `T_conditions_optimales`
INSERT INTO `T_conditions_optimales` (`temperature_optimale`, `humidite_optimale`, `luminosite_optimale`, `concentration_nutriment_optimale`) VALUES
(25.0, 60.0, 300.0, 25.0),
(26.0, 65.0, 320.0, 27.0),
(24.0, 55.0, 310.0, 24.0),
(25.5, 62.0, 330.0, 26.5),
(26.5, 64.0, 315.0, 28.0),
(24.5, 57.0, 305.0, 23.5),
(25.0, 60.0, 320.0, 25.0),
(26.0, 63.0, 330.0, 27.0),
(24.5, 56.0, 310.0, 24.5),
(25.5, 61.0, 325.0, 26.0);


-- Création de la table `T_historique_conditions` pour analyser les tendances et les changements au fil du temps.
CREATE TABLE `T_historique_conditions` (
  `id_historique` int NOT NULL AUTO_INCREMENT,
  `id_conditions` int NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id_historique`),
  FOREIGN KEY (`id_conditions`) REFERENCES `T_conditions` (`id_conditions`)
);

-- Insertion de données dans `T_historique_conditions`
INSERT INTO `T_historique_conditions` (`id_conditions`, `timestamp`) VALUES
(1, NOW()),
(2, NOW()),
(3, NOW() - INTERVAL 1 DAY),
(4, NOW() - INTERVAL 2 DAY),
(5, NOW() - INTERVAL 3 DAY),
(6, NOW() - INTERVAL 4 DAY),
(7, NOW() - INTERVAL 5 DAY),
(8, NOW() - INTERVAL 6 DAY),
(9, NOW() - INTERVAL 7 DAY),
(10, NOW() - INTERVAL 8 DAY);

-- Création de la table `T_actions_correctives` pour documenter les interventions effectuées pour maintenir ou améliorer les conditions de culture.
CREATE TABLE `T_actions_correctives` (
  `id_action` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id_action`)
);

-- Insertion de données dans `T_actions_correctives`
INSERT INTO `T_actions_correctives` (`description`, `timestamp`) VALUES
('Ajustement de l\'arrosage', NOW()),
('Modification de l\'éclairage', NOW()),
('Réparation du système d\'irrigation', NOW() - INTERVAL 1 DAY),
('Augmentation de la concentration en nutriments', NOW() - INTERVAL 2 DAY),
('Réduction de l\'humidification', NOW() - INTERVAL 3 DAY),
('Changement des lampes de croissance', NOW() - INTERVAL 4 DAY),
('Calibration des capteurs', NOW() - INTERVAL 5 DAY),
('Nettoyage des filtres d\'air', NOW() - INTERVAL 6 DAY),
('Réglage de la température', NOW() - INTERVAL 7 DAY),
('Ajout d\'un nouveau capteur', NOW() - INTERVAL 8 DAY),
('Vérification des niveaux d\'eau', NOW() - INTERVAL 9 DAY),
('Contrôle des parasites', NOW() - INTERVAL 16 DAY),
('Mise à jour du logiciel de contrôle', NOW() - INTERVAL 17 DAY),
('Remplacement des plantes malades', NOW() - INTERVAL 18 DAY);

-- Création de la table `T_assoc_actions_conditions` pour suivre quelles actions ont été prises en réponse à quelles conditions.
CREATE TABLE `T_assoc_actions_conditions` (
  `id_action` int NOT NULL,
  `id_conditions` int NOT NULL,
  PRIMARY KEY (`id_action`, `id_conditions`),
  FOREIGN KEY (`id_action`) REFERENCES `T_actions_correctives` (`id_action`),
  FOREIGN KEY (`id_conditions`) REFERENCES `T_conditions` (`id_conditions`)
);

-- Insertion de données dans `T_assoc_actions_conditions`
INSERT INTO `T_assoc_actions_conditions` (`id_action`, `id_conditions`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);


-- Création de la table `T_assoc_boite_capteur`pour suivre quels capteurs sont installés dans quelles boîtes.
CREATE TABLE `T_assoc_boite_capteur` (
  `id_boite` int NOT NULL,
  `id_capteur` int NOT NULL,
  PRIMARY KEY (`id_boite`, `id_capteur`),
  FOREIGN KEY (`id_boite`) REFERENCES `T_boite` (`id_boite`),
  FOREIGN KEY (`id_capteur`) REFERENCES `T_capteur` (`id_capteur`)
);

-- Insertion de données dans `T_assoc_boite_capteur`
INSERT INTO `T_assoc_boite_capteur` (`id_boite`, `id_capteur`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 4),
(3, 1),
(3, 2),
(3, 5),
(4, 1),
(4, 6),
(5, 1),
(5, 7),
(6, 1),
(6, 8),
(7, 1),
(7, 9),
(8, 2),
(8, 3),
(9, 4),
(9, 5),
(10, 6);

-- Création de la table `T_assoc_utilisateur_conditions`pour documenter qui a surveillé quelles conditions et quand.
CREATE TABLE `T_assoc_utilisateur_conditions` (
  `id_utilisateur` int NOT NULL,
  `id_conditions` int NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id_utilisateur`, `id_conditions`, `timestamp`),
  FOREIGN KEY (`id_utilisateur`) REFERENCES `T_utilisateur` (`id_utilisateur`),
  FOREIGN KEY (`id_conditions`) REFERENCES `T_conditions` (`id_conditions`)
);

-- Insertion de données dans `T_assoc_utilisateur_conditions`
INSERT INTO `T_assoc_utilisateur_conditions` (`id_utilisateur`, `id_conditions`, `timestamp`) VALUES
(2, 2, NOW()),
(3, 3, NOW()),
(4, 4, NOW()),
(5, 5, NOW()),
(6, 6, NOW()),
(7, 7, NOW()),
(8, 8, NOW()),
(9, 9, NOW()),
(10, 10, NOW());

-- Création de la table `T_assoc_plante_conditions_optimales`pour définir quelles plantes nécessitent quelles conditions optimales.
CREATE TABLE `T_assoc_plante_conditions_optimales` (
  `id_plante` int NOT NULL,
  `id_conditions_optimales` int NOT NULL,
  PRIMARY KEY (`id_plante`, `id_conditions_optimales`),
  FOREIGN KEY (`id_plante`) REFERENCES `T_plante` (`id_plante`),
  FOREIGN KEY (`id_conditions_optimales`) REFERENCES `T_conditions_optimales` (`id_conditions_optimales`)
);

-- Insertion de données dans `T_assoc_plante_conditions_optimales`
INSERT INTO `T_assoc_plante_conditions_optimales` (`id_plante`, `id_conditions_optimales`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9);