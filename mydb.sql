-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 06 août 2018 à 04:09
-- Version du serveur :  5.7.19
-- Version de PHP :  7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `mydb`
--

-- --------------------------------------------------------

--
-- Structure de la table `candidat`
--

DROP TABLE IF EXISTS `candidat`;
CREATE TABLE IF NOT EXISTS `candidat` (
  `idcandidat` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `prenom` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(11) NOT NULL,
  `date_naissance` date DEFAULT NULL,
  `Nationalite` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` int(11) NOT NULL,
  `adresse` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Code_Postal` int(11) NOT NULL,
  `Ville` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Remarque` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`idcandidat`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `candidat`
--

INSERT INTO `candidat` (`idcandidat`, `nom`, `prenom`, `age`, `date_naissance`, `Nationalite`, `email`, `telephone`, `adresse`, `Code_Postal`, `Ville`, `Remarque`) VALUES
(1, 'Es Sadik', 'Hamza', 34, '1984-04-06', 'Francaise', 'hamzaessadik@gmail.com', 605040302, '17 rue des poilu', 57000, 'Metz', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `candidat_competences`
--

DROP TABLE IF EXISTS `candidat_competences`;
CREATE TABLE IF NOT EXISTS `candidat_competences` (
  `idcandidat` int(11) NOT NULL,
  `idcompet` int(11) NOT NULL,
  PRIMARY KEY (`idcandidat`,`idcompet`),
  KEY `idcandidat` (`idcandidat`),
  KEY `idcompet` (`idcompet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `candidat_diplome`
--

DROP TABLE IF EXISTS `candidat_diplome`;
CREATE TABLE IF NOT EXISTS `candidat_diplome` (
  `idcandidat` int(11) NOT NULL,
  `iddiplome` int(11) NOT NULL,
  PRIMARY KEY (`idcandidat`,`iddiplome`),
  KEY `idcandidat` (`idcandidat`),
  KEY `iddiplome` (`iddiplome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `candidat_experience`
--

DROP TABLE IF EXISTS `candidat_experience`;
CREATE TABLE IF NOT EXISTS `candidat_experience` (
  `idcandidat` int(11) NOT NULL,
  `idexperience` int(11) NOT NULL,
  PRIMARY KEY (`idcandidat`,`idexperience`),
  KEY `idcandidat` (`idcandidat`),
  KEY `idexperience` (`idexperience`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `candidat_langue`
--

DROP TABLE IF EXISTS `candidat_langue`;
CREATE TABLE IF NOT EXISTS `candidat_langue` (
  `idcandidat` int(11) NOT NULL,
  `idlangue` int(11) NOT NULL,
  PRIMARY KEY (`idcandidat`,`idlangue`),
  KEY `idcandidat` (`idcandidat`),
  KEY `idlangue` (`idlangue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `competence`
--

DROP TABLE IF EXISTS `competence`;
CREATE TABLE IF NOT EXISTS `competence` (
  `idcompetence` int(11) NOT NULL AUTO_INCREMENT,
  `com_nom` varchar(100) DEFAULT NULL,
  `com_evaluation` int(11) NOT NULL,
  `com_commentaire` mediumtext,
  PRIMARY KEY (`idcompetence`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `competence`
--

INSERT INTO `competence` (`idcompetence`, `com_nom`, `com_evaluation`, `com_commentaire`) VALUES
(1, 'CakePHP', 18, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `diplome`
--

DROP TABLE IF EXISTS `diplome`;
CREATE TABLE IF NOT EXISTS `diplome` (
  `iddiplome` int(11) NOT NULL AUTO_INCREMENT,
  `type_diplome` varchar(100) DEFAULT NULL,
  `date_obtention` date DEFAULT NULL,
  `dip_commentaire` mediumtext,
  PRIMARY KEY (`iddiplome`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `diplome`
--

INSERT INTO `diplome` (`iddiplome`, `type_diplome`, `date_obtention`, `dip_commentaire`) VALUES
(1, 'Master Informatique', '2004-07-04', 'Mention tres bien');

-- --------------------------------------------------------

--
-- Structure de la table `experience_pro`
--

DROP TABLE IF EXISTS `experience_pro`;
CREATE TABLE IF NOT EXISTS `experience_pro` (
  `idexperience_pro` int(11) NOT NULL AUTO_INCREMENT,
  `employeur` varchar(200) DEFAULT NULL,
  `debut_contrat` date DEFAULT NULL,
  `fin_contrat` date DEFAULT NULL,
  `xpro_Commentaire` mediumtext,
  PRIMARY KEY (`idexperience_pro`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `experience_pro`
--

INSERT INTO `experience_pro` (`idexperience_pro`, `employeur`, `debut_contrat`, `fin_contrat`, `xpro_Commentaire`) VALUES
(1, 'Microsoft', '2005-01-01', '2010-12-31', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `langue`
--

DROP TABLE IF EXISTS `langue`;
CREATE TABLE IF NOT EXISTS `langue` (
  `idlangue` int(11) NOT NULL AUTO_INCREMENT,
  `l_nom` varchar(100) DEFAULT NULL,
  `l_evaluation` int(11) DEFAULT NULL,
  `l_commentaire` mediumtext,
  PRIMARY KEY (`idlangue`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `langue`
--

INSERT INTO `langue` (`idlangue`, `l_nom`, `l_evaluation`, `l_commentaire`) VALUES
(1, 'anglais', 19, 'Excellent');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `idusers` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idusers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `candidat_competences`
--
ALTER TABLE `candidat_competences`
  ADD CONSTRAINT `candidat_competences_ibfk_1` FOREIGN KEY (`idcandidat`) REFERENCES `candidat` (`idcandidat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidat_competences_ibfk_2` FOREIGN KEY (`idcompet`) REFERENCES `competence` (`idcompetence`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `candidat_diplome`
--
ALTER TABLE `candidat_diplome`
  ADD CONSTRAINT `candidat_diplome_ibfk_1` FOREIGN KEY (`idcandidat`) REFERENCES `candidat` (`idcandidat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidat_diplome_ibfk_2` FOREIGN KEY (`iddiplome`) REFERENCES `diplome` (`iddiplome`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `candidat_experience`
--
ALTER TABLE `candidat_experience`
  ADD CONSTRAINT `candidat_experience_ibfk_1` FOREIGN KEY (`idcandidat`) REFERENCES `candidat` (`idcandidat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidat_experience_ibfk_2` FOREIGN KEY (`idexperience`) REFERENCES `experience_pro` (`idexperience_pro`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `candidat_langue`
--
ALTER TABLE `candidat_langue`
  ADD CONSTRAINT `candidat_langue_ibfk_1` FOREIGN KEY (`idcandidat`) REFERENCES `candidat` (`idcandidat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidat_langue_ibfk_2` FOREIGN KEY (`idlangue`) REFERENCES `langue` (`idlangue`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
