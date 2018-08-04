-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Dim 05 Août 2018 à 00:10
-- Version du serveur :  5.7.22-0ubuntu18.04.1
-- Version de PHP :  7.2.5-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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

CREATE TABLE `candidat` (
  `idcandidat` int(11) NOT NULL,
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
  `idxpro` int(11) NOT NULL,
  `idcompet` int(11) NOT NULL,
  `iddiplome` int(11) NOT NULL,
  `idlangues` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `candidat`
--

INSERT INTO `candidat` (`idcandidat`, `nom`, `prenom`, `age`, `date_naissance`, `Nationalite`, `email`, `telephone`, `adresse`, `Code_Postal`, `Ville`, `Remarque`, `idxpro`, `idcompet`, `iddiplome`, `idlangues`) VALUES
(1, 'Es Sadik', 'Hamza', 34, '1984-04-06', 'Francaise', 'hamzaessadik@gmail.com', 605040302, '17 rue des poilu', 57000, 'Metz', NULL, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `competence`
--

CREATE TABLE `competence` (
  `idcompetence` int(11) NOT NULL,
  `com_nom` varchar(100) DEFAULT NULL,
  `com_evaluation` int(11) NOT NULL,
  `com_commentaire` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `competence`
--

INSERT INTO `competence` (`idcompetence`, `com_nom`, `com_evaluation`, `com_commentaire`) VALUES
(1, 'CakePHP', 18, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `diplome`
--

CREATE TABLE `diplome` (
  `iddiplome` int(11) NOT NULL,
  `type_diplome` varchar(100) DEFAULT NULL,
  `date_obtention` date DEFAULT NULL,
  `dip_commentaire` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `diplome`
--

INSERT INTO `diplome` (`iddiplome`, `type_diplome`, `date_obtention`, `dip_commentaire`) VALUES
(1, 'Master Informatique', '2004-07-04', 'Mention tres bien');

-- --------------------------------------------------------

--
-- Structure de la table `experience_pro`
--

CREATE TABLE `experience_pro` (
  `idexperience_pro` int(11) NOT NULL,
  `employeur` varchar(200) DEFAULT NULL,
  `debut_contrat` date DEFAULT NULL,
  `fin_contrat` date DEFAULT NULL,
  `xpro_Commentaire` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `experience_pro`
--

INSERT INTO `experience_pro` (`idexperience_pro`, `employeur`, `debut_contrat`, `fin_contrat`, `xpro_Commentaire`) VALUES
(1, 'Microsoft', '2005-01-01', '2010-12-31', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `langue`
--

CREATE TABLE `langue` (
  `idlangue` int(11) NOT NULL,
  `l_nom` varchar(100) DEFAULT NULL,
  `l_evaluation` int(11) DEFAULT NULL,
  `l_commentaire` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `langue`
--

INSERT INTO `langue` (`idlangue`, `l_nom`, `l_evaluation`, `l_commentaire`) VALUES
(1, 'anglais', 19, 'Excellent');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `idusers` int(11) NOT NULL,
  `login` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `candidat`
--
ALTER TABLE `candidat`
  ADD PRIMARY KEY (`idcandidat`),
  ADD KEY `fk_candidat_experience_pro_idx` (`idxpro`),
  ADD KEY `fk_candidat_competence1_idx` (`idcompet`),
  ADD KEY `fk_candidat_diplome1_idx` (`iddiplome`),
  ADD KEY `fk_candidat_langue1_idx` (`idlangues`);

--
-- Index pour la table `competence`
--
ALTER TABLE `competence`
  ADD PRIMARY KEY (`idcompetence`);

--
-- Index pour la table `diplome`
--
ALTER TABLE `diplome`
  ADD PRIMARY KEY (`iddiplome`);

--
-- Index pour la table `experience_pro`
--
ALTER TABLE `experience_pro`
  ADD PRIMARY KEY (`idexperience_pro`);

--
-- Index pour la table `langue`
--
ALTER TABLE `langue`
  ADD PRIMARY KEY (`idlangue`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idusers`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `candidat`
--
ALTER TABLE `candidat`
  MODIFY `idcandidat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `competence`
--
ALTER TABLE `competence`
  MODIFY `idcompetence` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `diplome`
--
ALTER TABLE `diplome`
  MODIFY `iddiplome` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `experience_pro`
--
ALTER TABLE `experience_pro`
  MODIFY `idexperience_pro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `langue`
--
ALTER TABLE `langue`
  MODIFY `idlangue` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `idusers` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `candidat`
--
ALTER TABLE `candidat`
  ADD CONSTRAINT `fk_candidat_competence1` FOREIGN KEY (`idcompet`) REFERENCES `competence` (`idcompetence`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_candidat_diplome1` FOREIGN KEY (`iddiplome`) REFERENCES `diplome` (`iddiplome`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_candidat_experience_pro` FOREIGN KEY (`idxpro`) REFERENCES `experience_pro` (`idexperience_pro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_candidat_langue1` FOREIGN KEY (`idlangues`) REFERENCES `langue` (`idlangue`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
