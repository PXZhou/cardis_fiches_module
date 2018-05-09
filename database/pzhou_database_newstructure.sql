-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mer. 09 mai 2018 à 22:37
-- Version du serveur :  10.1.22-MariaDB
-- Version de PHP :  7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `cardis_newstructure`
--

-- --------------------------------------------------------

--
-- Structure de la table `course_skills`
--

CREATE TABLE `course_skills` (
  `id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `sheet_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Structure de la table `sheet`
--

CREATE TABLE `sheet` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(250) CHARACTER SET utf8 NOT NULL,
  `ECTS` int(11) NOT NULL,
  `login` tinytext CHARACTER SET utf8 NOT NULL,
  `hours` text CHARACTER SET utf8,
  `isteamwork` tinyint(1) DEFAULT NULL,
  `description` text CHARACTER SET utf8,
  `requirement` text CHARACTER SET utf8,
  `content` text CHARACTER SET utf8,
  `teacher_tools` text CHARACTER SET utf8,
  `student_tools` text CHARACTER SET utf8,
  `next_module` text CHARACTER SET utf8,
  `learning_method` text CHARACTER SET utf8,
  `grade_rating` text CHARACTER SET utf8,
  `language` text CHARACTER SET utf8,
  `bibliography` text CHARACTER SET utf8,
  `is_published` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `skills`
--

CREATE TABLE `skills` (
  `id` int(11) NOT NULL,
  `skill` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `SPRING_SESSION`
--

CREATE TABLE `SPRING_SESSION` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint(20) NOT NULL,
  `LAST_ACCESS_TIME` bigint(20) NOT NULL,
  `MAX_INACTIVE_INTERVAL` int(11) NOT NULL,
  `EXPIRY_TIME` bigint(20) NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `SPRING_SESSION`
--

INSERT INTO `SPRING_SESSION` (`PRIMARY_ID`, `SESSION_ID`, `CREATION_TIME`, `LAST_ACCESS_TIME`, `MAX_INACTIVE_INTERVAL`, `EXPIRY_TIME`, `PRINCIPAL_NAME`) VALUES
('10230e30-a06a-4970-b2b9-ce75c82927df', 'a04decb4-276a-4633-ac54-e0a2a5821e55', 1525789966458, 1525789966458, 1800, 1525791766458, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `SPRING_SESSION_ATTRIBUTES`
--

CREATE TABLE `SPRING_SESSION_ATTRIBUTES` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `firstname`, `mail`, `role`, `lastname`) VALUES
(1, 'dmutombo', 'ISEP2018', 'Dikembe', 'dikembe.mutombo@isep.fr', 'admin', 'Mutombo'),
(2, 'jmara', 'ISEP2018', 'Jean', 'jean.mara@isep.fr', 'teacher', 'Mara'),
(3, 'jdickinson', 'ISEP2018', 'Jack', 'jack.dickison@isep.fr', 'student', 'Dickison');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `course_skills`
--
ALTER TABLE `course_skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `skill_id` (`skill_id`),
  ADD KEY `sheet_id` (`sheet_id`);

--
-- Index pour la table `sheet`
--
ALTER TABLE `sheet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_supervisor` (`user_id`);

--
-- Index pour la table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `SPRING_SESSION`
--
ALTER TABLE `SPRING_SESSION`
  ADD PRIMARY KEY (`PRIMARY_ID`),
  ADD UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  ADD KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  ADD KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`);

--
-- Index pour la table `SPRING_SESSION_ATTRIBUTES`
--
ALTER TABLE `SPRING_SESSION_ATTRIBUTES`
  ADD PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  ADD KEY `SPRING_SESSION_ATTRIBUTES_IX1` (`SESSION_PRIMARY_ID`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_id_uindex` (`id`),
  ADD UNIQUE KEY `users_mail_uindex` (`mail`),
  ADD UNIQUE KEY `users_userName_uindex` (`username`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `course_skills`
--
ALTER TABLE `course_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `sheet`
--
ALTER TABLE `sheet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `sheet`
--
ALTER TABLE `sheet`
  ADD CONSTRAINT `sheet_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Contraintes pour la table `SPRING_SESSION_ATTRIBUTES`
--
ALTER TABLE `SPRING_SESSION_ATTRIBUTES`
  ADD CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `SPRING_SESSION` (`PRIMARY_ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
