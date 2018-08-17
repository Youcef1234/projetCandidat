-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  jeu. 16 août 2018 à 11:50
-- Version du serveur :  10.1.34-MariaDB
-- Version de PHP :  7.2.7

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

CREATE TABLE `candidat` (
  `idcandidat` int(11) NOT NULL,
  `nom` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `prenom` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(11) NOT NULL,
  `date_naissance` date DEFAULT NULL,
  `Nationalite` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` varchar(20) NOT NULL,
  `adresse` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Code_Postal` varchar(20) NOT NULL,
  `Ville` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Remarque` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `candidat`
--

INSERT INTO `candidat` (`idcandidat`, `nom`, `prenom`, `age`, `date_naissance`, `Nationalite`, `email`, `telephone`, `adresse`, `Code_Postal`, `Ville`, `Remarque`) VALUES
(1, 'Es Sadik', 'Hamza', 24, '1984-04-06', 'Francaise', 'hamzaessadik@gmail.com', '0605040302', '17 rue des poilu', '57000', 'Metz', 'Test'),
(2, 'Wayne', 'Bruce', 40, '1970-02-01', 'Anglaise', 'brucewayne@outlook.fr', '+33777432160', '2 rue fleuri', '57330', 'Hettange-Grande', ''),
(3, 'Dupont', 'Michel', 38, '1980-10-01', 'Belge', 'duponmichel@outlook.fr', '0677321564', '20 route des campagnes', '57970', 'Yutz', ''),
(4, 'LEE', 'Michael', 24, '1994-04-14', 'Anglaise', 'leemichael@yahoo.com', '+352 653 34 980', '13 route d Esch', 'L-2090', 'Luxembourg', ''),
(5, 'Ericksen', 'Elena', 31, '1987-02-27', 'FranÃ§aise', 'ericksenelena@gmail.com', '+352 7 523 54 321', '20 rue de la Gare', '57100', 'Elange', ''),
(6, 'Dos Santos', 'Paola', 29, '1989-03-31', 'Francaise', 'dossantospaola', '0790732153', '3 avenue du ChÃªne', 'MaiziÃ¨re-les-Metz', '57280', ''),
(7, 'Hakimi', 'Achraf', 23, '1995-08-21', 'Marocaine', 'hakimiachraf@outlook.com', '0643567218', '32 rue des ilots', 'Morhange', '57340', ''),
(10, 'Garcia', 'Anthony', 37, '1981-06-07', 'Francaise', 'garciaanthony@gmail.com', '0798564300', 'impasse des disparus', 'Saint Avold', '57500', ''),
(11, 'Alfonse', 'Frederic', 50, '1958-09-30', 'Italienne', 'alfonsefrederic@orange.fr', '0732124589', '34 rue Marechal Lebon', 'Metz', '57000', '');

-- --------------------------------------------------------

--
-- Structure de la table `candidat_competences`
--

CREATE TABLE `candidat_competences` (
  `idcandidat` int(11) NOT NULL,
  `idcompet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `candidat_competences`
--

INSERT INTO `candidat_competences` (`idcandidat`, `idcompet`) VALUES
(1, 1),
(2, 6),
(2, 8),
(3, 9),
(3, 10),
(4, 11),
(5, 12),
(6, 13),
(7, 14),
(10, 15),
(11, 16);

-- --------------------------------------------------------

--
-- Structure de la table `candidat_diplome`
--

CREATE TABLE `candidat_diplome` (
  `idcandidat` int(11) NOT NULL,
  `iddiplome` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `candidat_diplome`
--

INSERT INTO `candidat_diplome` (`idcandidat`, `iddiplome`) VALUES
(2, 4),
(2, 5),
(3, 6),
(4, 7),
(5, 8),
(6, 9),
(7, 10),
(10, 14),
(11, 15);

-- --------------------------------------------------------

--
-- Structure de la table `candidat_experience`
--

CREATE TABLE `candidat_experience` (
  `idcandidat` int(11) NOT NULL,
  `idexperience` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `candidat_experience`
--

INSERT INTO `candidat_experience` (`idcandidat`, `idexperience`) VALUES
(1, 4),
(2, 5),
(2, 6),
(3, 7),
(4, 8),
(5, 9),
(6, 10),
(7, 11),
(10, 13),
(11, 14),
(11, 15);

-- --------------------------------------------------------

--
-- Structure de la table `candidat_interet`
--

CREATE TABLE `candidat_interet` (
  `idcandidat` int(11) NOT NULL,
  `idinteret` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `candidat_interet`
--

INSERT INTO `candidat_interet` (`idcandidat`, `idinteret`) VALUES
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(10, 11),
(11, 12);

-- --------------------------------------------------------

--
-- Structure de la table `candidat_langue`
--

CREATE TABLE `candidat_langue` (
  `idcandidat` int(11) NOT NULL,
  `idlangue` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `candidat_langue`
--

INSERT INTO `candidat_langue` (`idcandidat`, `idlangue`) VALUES
(1, 1),
(1, 6),
(2, 7),
(2, 8),
(3, 9),
(4, 10),
(5, 11),
(6, 12),
(7, 13),
(10, 14),
(11, 15);

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
-- Déchargement des données de la table `competence`
--

INSERT INTO `competence` (`idcompetence`, `com_nom`, `com_evaluation`, `com_commentaire`) VALUES
(1, 'CakePHP', 18, 'framework '),
(2, 'symfony', 13, 'powerful framework'),
(3, 'angularjs', 20, 'nice frontend framework'),
(4, 'java', 20, 'poo'),
(5, 'sql', 14, 'bdd'),
(6, 'Symfony', 15, 'Connaissance des prÃ©requis'),
(8, 'PHP', 17, ''),
(9, 'Javascript', 17, ''),
(10, 'React.JS', 15, ''),
(11, 'big data', 18, ''),
(12, 'Developpeuse front-end', 15, ''),
(13, 'Ressources Humaines', 20, ''),
(14, 'Helpdesk', 17, 'Bonne connaissance technique'),
(15, 'Auditeur', 17, ''),
(16, 'Maintenance helpdesk', 0, '');

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
-- Déchargement des données de la table `diplome`
--

INSERT INTO `diplome` (`iddiplome`, `type_diplome`, `date_obtention`, `dip_commentaire`) VALUES
(1, 'bac', '2012-12-12', 'SM'),
(2, 'dut', '2014-01-05', 'informatique'),
(3, 'master informatique', '2020-12-12', 'prochainement'),
(4, 'Master Informatique', '1993-07-01', ''),
(5, '', '0000-00-00', ''),
(6, 'Licence Pro Informatique', '2004-06-28', ''),
(7, 'Licence pro genie informatique', '2016-06-30', ''),
(8, 'Master infographiste', '2001-06-25', ''),
(9, 'Master Gestion des ressources humaines', '2013-06-16', ''),
(10, 'Licence informatique', '2016-06-29', ''),
(14, 'Master audit', '2004-07-21', ''),
(15, 'DUT inofrmatique', '1978-07-02', '');

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
-- Déchargement des données de la table `experience_pro`
--

INSERT INTO `experience_pro` (`idexperience_pro`, `employeur`, `debut_contrat`, `fin_contrat`, `xpro_Commentaire`) VALUES
(1, 'Microsoft', '2005-01-01', '2010-12-31', 'bonne experience'),
(2, 'Dyna-info', '2001-12-12', '2012-12-12', 'interessant'),
(4, 'Samsung', '2009-12-01', '2017-09-30', ''),
(5, 'Orange', '1996-09-01', '2006-05-16', ''),
(6, 'Apple', '2006-08-01', '0000-00-00', ''),
(7, 'Web Idea', '2005-01-10', '2018-12-31', ''),
(8, 'D-software', '2017-02-01', '2017-10-30', ''),
(9, 'GrafikDev', '2002-07-25', '0000-00-00', ''),
(10, 'LogiEst', '2014-03-21', '2018-06-30', ''),
(11, 'SoluceTech', '2016-09-05', '2017-12-01', ''),
(13, 'STV', '2005-04-23', '2018-07-21', ''),
(14, 'DPANNE', '1980-01-03', '1990-09-21', ''),
(15, 'PC+', '1991-08-21', '2018-05-21', '');

-- --------------------------------------------------------

--
-- Structure de la table `interet`
--

CREATE TABLE `interet` (
  `idinteret` int(100) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `commentaire` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `interet`
--

INSERT INTO `interet` (`idinteret`, `nom`, `commentaire`) VALUES
(1, 'sport', 'musculation 3 fois par semaine'),
(2, 'KaratÃ©', 'en club'),
(3, 'Lecture', 'Romans'),
(4, 'Yoga', ''),
(5, 'aikido', '1'),
(6, 'Theatre', 'Pratique depuis le lycÃ©e'),
(7, 'Musique', 'Guitare'),
(11, 'Velo', ''),
(12, 'Lecture', 'Revue scientifique');

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
-- Déchargement des données de la table `langue`
--

INSERT INTO `langue` (`idlangue`, `l_nom`, `l_evaluation`, `l_commentaire`) VALUES
(1, 'anglais', 20, 'Excellent'),
(2, 'tamazight', 12, 'belle langue'),
(3, 'francais', 12, 'belle langue aussi'),
(5, 'spanish', 20, 'stylish language'),
(6, 'Espagnol', 16, ''),
(7, 'Anglais', 16, ''),
(8, 'FranÃ§ais', 0, 'Langue maternelle'),
(9, 'Allemand', 16, ''),
(10, 'Anglais', 14, ''),
(11, 'Russe', 16, ''),
(12, 'Portugais', 15, ''),
(13, 'Anglais', 15, ''),
(14, 'Luxembourgeois', 15, ''),
(15, 'Italien', 20, 'Langue courante');

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
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`idusers`, `login`, `password`) VALUES
(1, 'youcefbouzem', '123'),
(2, 'root', 'azerty');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `candidat`
--
ALTER TABLE `candidat`
  ADD PRIMARY KEY (`idcandidat`);

--
-- Index pour la table `candidat_competences`
--
ALTER TABLE `candidat_competences`
  ADD PRIMARY KEY (`idcandidat`,`idcompet`),
  ADD KEY `idcandidat` (`idcandidat`),
  ADD KEY `idcompet` (`idcompet`);

--
-- Index pour la table `candidat_diplome`
--
ALTER TABLE `candidat_diplome`
  ADD PRIMARY KEY (`idcandidat`,`iddiplome`),
  ADD KEY `idcandidat` (`idcandidat`),
  ADD KEY `iddiplome` (`iddiplome`);

--
-- Index pour la table `candidat_experience`
--
ALTER TABLE `candidat_experience`
  ADD PRIMARY KEY (`idcandidat`,`idexperience`),
  ADD KEY `idcandidat` (`idcandidat`),
  ADD KEY `idexperience` (`idexperience`);

--
-- Index pour la table `candidat_interet`
--
ALTER TABLE `candidat_interet`
  ADD PRIMARY KEY (`idcandidat`,`idinteret`),
  ADD KEY `idcandidat` (`idcandidat`),
  ADD KEY `idinteret` (`idinteret`);

--
-- Index pour la table `candidat_langue`
--
ALTER TABLE `candidat_langue`
  ADD PRIMARY KEY (`idcandidat`,`idlangue`),
  ADD KEY `idcandidat` (`idcandidat`),
  ADD KEY `idlangue` (`idlangue`);

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
-- Index pour la table `interet`
--
ALTER TABLE `interet`
  ADD PRIMARY KEY (`idinteret`);

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
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `candidat`
--
ALTER TABLE `candidat`
  MODIFY `idcandidat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `competence`
--
ALTER TABLE `competence`
  MODIFY `idcompetence` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `diplome`
--
ALTER TABLE `diplome`
  MODIFY `iddiplome` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `experience_pro`
--
ALTER TABLE `experience_pro`
  MODIFY `idexperience_pro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `interet`
--
ALTER TABLE `interet`
  MODIFY `idinteret` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `langue`
--
ALTER TABLE `langue`
  MODIFY `idlangue` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `idusers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- Contraintes pour la table `candidat_interet`
--
ALTER TABLE `candidat_interet`
  ADD CONSTRAINT `candidat_interet_ibfk_1` FOREIGN KEY (`idcandidat`) REFERENCES `candidat` (`idcandidat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidat_interet_ibfk_2` FOREIGN KEY (`idinteret`) REFERENCES `interet` (`idinteret`) ON DELETE CASCADE ON UPDATE CASCADE;

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
