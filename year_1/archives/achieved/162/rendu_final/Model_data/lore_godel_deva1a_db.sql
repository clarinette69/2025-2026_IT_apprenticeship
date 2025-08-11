-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2023 at 05:24 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lore_godel_deva1a_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `assoc_personne_adresse`
--

CREATE TABLE `assoc_personne_adresse` (
  `id_personne` int(11) NOT NULL,
  `id_adresse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `assoc_personne_adresse` (id_personne, id_adresse) VALUES
(1, 1),
(2, 2);
-- --------------------------------------------------------

--
-- Table structure for table `assoc_personne_mail`
--

CREATE TABLE `assoc_personne_mail` (
  `id_personne` int(11) NOT NULL,
  `id_mail` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `assoc_personne_mail` (id_personne, id_mail) VALUES
(1, 1),
(2, 2);


-- --------------------------------------------------------

--
-- Table structure for table `assoc_personne_numero`
--

CREATE TABLE `assoc_personne_numero` (
  `id_personne` int(11) NOT NULL,
  `id_numero_telephone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `assoc_personne_numero` (id_personne, id_numero_telephone) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `assoc_url_siteweb`
--

CREATE TABLE `assoc_url_siteweb` (
  `id_url` int(11) NOT NULL,
  `id_siteWeb` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `assoc_url_siteweb` (id_url, id_siteWeb) VALUES
(1, 1),
(2, 2);
-- --------------------------------------------------------

--
-- Table structure for table `t_adresse`
--

CREATE TABLE `t_adresse` (
  `id_adresse` int(11) NOT NULL,
  `Rue` varchar(255) DEFAULT NULL,
  `Ville` varchar(255) DEFAULT NULL,
  `Pays` varchar(255) DEFAULT NULL,
  `code_postal` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Données pour la table `t_adresse`
INSERT INTO `t_adresse` (id_adresse, Rue, Ville, Pays, code_postal) VALUES
(1, '123 rue des Lilas', 'Paris', 'France', '75004'),
(2, '456 avenue du Général', 'Lyon', 'France', '69000'),
(3, '789 boulevard de la Liberté', 'Marseille', 'France', NULL),
(4, '10 rue de la Paix', 'Nantes', 'France', '44000'),
(5, '25 avenue de la République', 'Bordeaux', 'France', '33000'),
(6, '55 boulevard Saint-Michel', 'Toulouse', 'France', '31000'),
(7, '10 rue du Port', 'Nantes', 'France', '44000'),
(8, '55 boulevard Gambetta', 'Nice', 'France', '06000'),
(9, '32 rue Victor Hugo', 'Nice', 'France', '06000'),
(10, '18 avenue Jean Jaurès', 'Lille', 'France', '59000');

-- --------------------------------------------------------

--
-- Table structure for table `t_entreprise`
--

CREATE TABLE `t_entreprise` (
  `id_entreprise` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `secteur_activite` varchar(255) DEFAULT NULL,
  `statut_juridique` varchar(255) DEFAULT NULL,
  `chiffre_affaire` decimal(19,2) DEFAULT NULL,
  `date_creation` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Données pour la table `t_entreprise`
INSERT INTO `t_entreprise` (id_entreprise, nom, secteur_activite, statut_juridique, chiffre_affaire, date_creation) VALUES
(1, 'InnovCorp', 'Technologie', 'SAS', 1500000.00, '2015-09-23'),
(2, 'EcoBio', 'Agroalimentaire', 'SARL', 300000.00, '2018-04-18'),
(3, 'GreenTech', 'Environnement', 'SA', 500000.00, '2020-06-15'),
(4, 'HealthPlus', 'Santé', 'SARL', 750000.00, '2019-11-20'),
(5, 'AutoInnov', 'Automobile', 'SASU', 2000000.00, '2021-05-30'),
(6, 'MediCare', 'Santé', 'SAS', 500000.00, '2019-08-20'),
(7, 'ArtisticWorld', 'Culture', 'SASU', 600000.00, '2020-12-30'),
(8, 'DataMax', 'Informatique', 'SARL', 2000000.00, '2020-08-21'),
(9, 'SolarTech', 'Energie', 'SA', 800000.00, '2019-03-12'),
(10, 'BioHealth', 'Santé', 'SARL', 1200000.00, '2021-07-10');

-- --------------------------------------------------------

--
-- Table structure for table `t_mail`
--

CREATE TABLE `t_mail` (
  `id_mail` int(11) NOT NULL,
  `date_de_creation` date DEFAULT NULL,
  `Domaine` varchar(255) DEFAULT NULL,
  `Adresse` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insertion dans la table `t_mail`
INSERT INTO t_mail (id_mail, date_de_creation, Domaine, Adresse) VALUES
(1, '2023-01-01', 'example.com', 'contact@example.com'),
(2, '2023-01-02', 'monsite.fr', 'info@monsite.fr'),
(3, '2023-01-12', 'example.com', 'charlie@exemple'),
(4, '2023-01-13', 'example.net', 'daniel_example.net'),
(5, '2023-01-14', 'example.org', '@emilyexample.org'),
(6, '2023-02-15', 'technews.com', 'info@technews.com'),
(7, '2023-02-20', 'health.org', 'contact@health.org'),
(8, '2023-04-05', 'ecoworld.net', 'support@ecoworld.net'),
(9, '2023-02-15', 'techworld.com', 'support@techworld.com'),
(10, '2023-02-17', 'medicinfo.org', 'contact@medicinfo.org'),
(11, '2023-03-20', 'travelnet.net', 'info@travelnet.net');

-- --------------------------------------------------------

--
-- Table structure for table `t_nationalite`
--

CREATE TABLE `t_nationalite` (
  `id_nationalite` int(11) NOT NULL,
  `pays` varchar(255) DEFAULT NULL,
  `capitale` varchar(55) DEFAULT NULL,
  `monnaie` varchar(255) DEFAULT NULL,
  `langue_officielle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Données pour la table `t_nationalite`
INSERT INTO `t_nationalite` (id_nationalite, pays, capitale, monnaie, langue_officielle) VALUES
(1, 'France', 'Paris', 'Euro', 'Français'),
(2, 'Belgique', 'Bruxelles', 'Euro', 'Français'),
(3, 'Allemagne', 'Berlin', 'Euro', 'Allemand'),
(4, 'Italie', 'Rome', 'Euro', 'Italien'),
(5, 'Portugal', 'Lisbonne', 'Euro', 'Portugais'),
(6, 'Espagne', 'Madrid', 'Euro', 'Espagnol'),
(7, 'Canada', 'Ottawa', 'Dollar Canadien', 'Anglais'),
(8, 'Japon', 'Tokyo', 'Yen', 'Japonais');



-- --------------------------------------------------------

--
-- Table structure for table `t_numero_telephone`
--

CREATE TABLE `t_numero_telephone` (
  `id_numero_telephone` int(11) NOT NULL,
  `operateur` varchar(255) DEFAULT NULL,
  `numero` varchar(55) DEFAULT NULL,
  `prefixe` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Données pour la table `t_numero_telephone`
INSERT INTO `t_numero_telephone` (id_numero_telephone, operateur, numero, prefixe) VALUES
(1, 'Orange', '0612345678', '+33'),
(2, 'SFR', '0698765432', '+33'),
(3, 'Bouygues', '0712345678', '+33'),
(4, 'Free', '0723456789', '+33'),
(5, 'Red by SFR', '0787654321', '+33'),
(6, 'Free', '0765432198', '+33'),
(7, 'Vodafone', '0778901234', '+33'),
(8, 'Bouygues', '0678901234', '+33'),
(9, 'Vodafone', '0687654321', '+33'),
(22, 'Telus', '0665432187', '+33');

-- --------------------------------------------------------

--
-- Table structure for table `t_personne`
--

CREATE TABLE `t_personne` (
  `id_personne` int(11) NOT NULL,
  `prenom` varchar(55) DEFAULT NULL,
  `nom` varchar(55) DEFAULT NULL,
  `sexe` char(1) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Données pour la table `t_personne`
INSERT INTO `t_personne` (id_personne, prenom, nom, sexe, date_naissance) VALUES
(1, 'Alice', 'Durand', 'F', '1990-03-01'),
(2, 'Bob', 'Martin', 'M', '1985-07-12'),
(3, 'Charlotte', 'Petit', 'F', '1992-08-25'),
(4, 'David', 'Leroy', 'M', '1980-02-17'),
(5, 'Sophie', 'Blanc', 'F', '1986-01-31'),
(6, 'Clara', 'Leblanc', 'F', '1992-06-05'),
(7, 'David', 'Moreau', 'M', '1988-11-22'),
(8, 'Lucie', 'Girard', 'F', '1994-04-18'),
(9, 'Claire', 'Petit', 'F', '1995-06-20'),
(10, 'Lucas', 'Lemoine', 'M', '1988-12-31');

-- --------------------------------------------------------

--
-- Table structure for table `t_siteweb`
--

CREATE TABLE `t_siteweb` (
  `id_siteWeb` int(11) NOT NULL,
  `nom` varchar(55) DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `contenu` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insertion dans la table `t_siteweb`
INSERT INTO t_siteweb (id_siteWeb, nom, logo, contenu) VALUES
(1, 'Example Web', NULL, 'Contenu du site web example.'),
(2, 'Mon Site', NULL, 'Bienvenue sur Mon Site.'),
(3, 'Site de Nouvelles', NULL, 'Actualités et reportages en ligne.'),
(4, 'Tech Blog', NULL, 'Articles et analyses sur la technologie.'),
(5, 'Boutique en Ligne', NULL, 'Vente de produits en ligne.'),
(6, 'Forum de Discussion', NULL, 'Espace de discussion sur divers sujets.'),
(7, 'Portfolio Personnel', NULL, 'Présentation de travaux et projets personnels.'),
(8, 'Site de Voyage', NULL, 'Informations sur les destinations de voyage.'),
(9, 'Site de Cuisine', NULL, 'Recettes et conseils culinaires.'),
(10, 'Blog de Mode', NULL, 'Tendances de la mode et astuces de style.');


-- --------------------------------------------------------

--
-- Table structure for table `t_url`
--

CREATE TABLE `t_url` (
  `id_url` int(11) NOT NULL,
  `protocole` varchar(55) DEFAULT NULL,
  `nom_domaine` varchar(55) DEFAULT NULL,
  `extension_domaine` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Données pour la table `t_url`
INSERT INTO `t_url` (id_url, protocole, nom_domaine, extension_domaine) VALUES
(1, 'https', 'monsite', '.com'),
(2, 'http', 'exemple', '.net'),
(3, 'https', 'newswebsite', '.com'),
(4, 'http', 'techblog', '.net'),
(5, 'https', 'onlineshop', '.com'),
(6, 'https', 'forum', '.org'),
(7, 'https', 'myportfolio', '.com'),
(8, 'https', 'travelguide', '.net'),
(9, 'https', 'foodblog', '.com'),
(10, 'https', 'fashion', '.net');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assoc_personne_adresse`
--
ALTER TABLE `assoc_personne_adresse`
  ADD KEY `id_personne` (`id_personne`),
  ADD KEY `id_adresse` (`id_adresse`);

--
-- Indexes for table `assoc_personne_mail`
--
ALTER TABLE `assoc_personne_mail`
  ADD KEY `id_personne` (`id_personne`),
  ADD KEY `id_mail` (`id_mail`);

--
-- Indexes for table `assoc_personne_numero`
--
ALTER TABLE `assoc_personne_numero`
  ADD KEY `id_personne` (`id_personne`),
  ADD KEY `id_numero_telephone` (`id_numero_telephone`);

--
-- Indexes for table `assoc_url_siteweb`
--
ALTER TABLE `assoc_url_siteweb`
  ADD KEY `id_url` (`id_url`),
  ADD KEY `id_siteWeb` (`id_siteWeb`);

--
-- Indexes for table `t_adresse`
--
ALTER TABLE `t_adresse`
  ADD PRIMARY KEY (`id_adresse`);

--
-- Indexes for table `t_entreprise`
--
ALTER TABLE `t_entreprise`
  ADD PRIMARY KEY (`id_entreprise`);

--
-- Indexes for table `t_mail`
--
ALTER TABLE `t_mail`
  ADD PRIMARY KEY (`id_mail`);

--
-- Indexes for table `t_nationalite`
--
ALTER TABLE `t_nationalite`
  ADD PRIMARY KEY (`id_nationalite`);

--
-- Indexes for table `t_numero_telephone`
--
ALTER TABLE `t_numero_telephone`
  ADD PRIMARY KEY (`id_numero_telephone`);

--
-- Indexes for table `t_personne`
--
ALTER TABLE `t_personne`
  ADD PRIMARY KEY (`id_personne`);

--
-- Indexes for table `t_siteweb`
--
ALTER TABLE `t_siteweb`
  ADD PRIMARY KEY (`id_siteWeb`);

--
-- Indexes for table `t_url`
--
ALTER TABLE `t_url`
  ADD PRIMARY KEY (`id_url`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assoc_personne_adresse`
--
ALTER TABLE `assoc_personne_adresse`
  ADD CONSTRAINT `assoc_personne_adresse_ibfk_1` FOREIGN KEY (`id_personne`) REFERENCES `t_personne` (`id_personne`),
  ADD CONSTRAINT `assoc_personne_adresse_ibfk_2` FOREIGN KEY (`id_adresse`) REFERENCES `t_adresse` (`id_adresse`);

--
-- Constraints for table `assoc_personne_mail`
--
ALTER TABLE `assoc_personne_mail`
  ADD CONSTRAINT `assoc_personne_mail_ibfk_1` FOREIGN KEY (`id_personne`) REFERENCES `t_personne` (`id_personne`),
  ADD CONSTRAINT `assoc_personne_mail_ibfk_2` FOREIGN KEY (`id_mail`) REFERENCES `t_mail` (`id_mail`);

--
-- Constraints for table `assoc_personne_numero`
--
ALTER TABLE `assoc_personne_numero`
  ADD CONSTRAINT `assoc_personne_numero_ibfk_1` FOREIGN KEY (`id_personne`) REFERENCES `t_personne` (`id_personne`),
  ADD CONSTRAINT `assoc_personne_numero_ibfk_2` FOREIGN KEY (`id_numero_telephone`) REFERENCES `t_numero_telephone` (`id_numero_telephone`);

--
-- Constraints for table `assoc_url_siteweb`
--
ALTER TABLE `assoc_url_siteweb`
  ADD CONSTRAINT `assoc_url_siteweb_ibfk_1` FOREIGN KEY (`id_url`) REFERENCES `t_url` (`id_url`),
  ADD CONSTRAINT `assoc_url_siteweb_ibfk_2` FOREIGN KEY (`id_siteWeb`) REFERENCES `t_siteweb` (`id_siteWeb`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
