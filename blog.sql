-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 29 avr. 2022 à 12:35
-- Version du serveur : 10.4.20-MariaDB
-- Version de PHP : 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenu` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_creation` date NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `titre`, `contenu`, `date_creation`, `state`) VALUES
(134, 'Article n°1', 'Lorem Ipsum', '2022-04-28', 'brouillon'),
(135, 'Article n°2', 'Lorem Ipsum', '2022-04-27', 'publier'),
(136, 'Article n°3', 'Lorem Ipsum', '2022-04-26', 'publier'),
(137, 'Article n°4', 'Lorem Ipsum', '2022-04-25', 'brouillon'),
(138, 'Article n°5', 'Lorem Ipsum', '2022-04-24', 'publier'),
(139, 'Article n°6', 'Lorem Ipsum', '2022-04-23', 'brouillon'),
(140, 'Article n°7', 'Lorem Ipsum', '2022-04-22', 'brouillon'),
(141, 'Article n°8', 'Lorem Ipsum', '2022-04-21', 'brouillon'),
(142, 'Article n°9', 'Lorem Ipsum', '2022-04-20', 'brouillon'),
(143, 'Article n°10', 'Lorem Ipsum', '2022-04-19', 'brouillon');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(11, 'sport'),
(12, 'maison');

-- --------------------------------------------------------

--
-- Structure de la table `category_article`
--

CREATE TABLE `category_article` (
  `category_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category_article`
--

INSERT INTO `category_article` (`category_id`, `article_id`) VALUES
(11, 134),
(11, 135),
(11, 136),
(12, 135),
(12, 136),
(12, 137);

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `contenu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_comment` datetime NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `article_id`, `contenu`, `date_comment`, `author`) VALUES
(82, 134, 'Ceci est le contenu du commentaire', '2022-04-29 11:40:19', 'Thomas'),
(83, 135, 'Ceci est le contenu du commentaire', '2022-04-29 11:40:19', 'Thomas'),
(84, 136, 'Ceci est le contenu du commentaire', '2022-04-29 11:40:19', 'Thomas'),
(85, 137, 'Ceci est le contenu du commentaire', '2022-04-29 11:40:19', 'Thomas'),
(86, 138, 'Ceci est le contenu du commentaire', '2022-04-29 11:40:19', 'Thomas'),
(87, 139, 'Ceci est le contenu du commentaire', '2022-04-29 11:40:19', 'Thomas'),
(88, 140, 'Ceci est le contenu du commentaire', '2022-04-29 11:40:19', 'Thomas'),
(89, 141, 'Ceci est le contenu du commentaire', '2022-04-29 11:40:19', 'Thomas'),
(90, 142, 'Ceci est le contenu du commentaire', '2022-04-29 11:40:19', 'Thomas'),
(91, 143, 'Ceci est le contenu du commentaire', '2022-04-29 11:40:19', 'Thomas');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220421094507', '2022-04-21 11:46:53', 427),
('DoctrineMigrations\\Version20220425133026', '2022-04-25 15:32:32', 1014),
('DoctrineMigrations\\Version20220425145217', '2022-04-25 16:52:42', 973),
('DoctrineMigrations\\Version20220428124733', '2022-04-28 14:48:05', 338),
('DoctrineMigrations\\Version20220429093101', '2022-04-29 11:31:27', 245);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `roles`, `password`) VALUES
(2, 'Paul', '[]', '$2y$13$KKdvv.j/tHAJWXI1urrRHuMP/ziBvTgKZTLfWzoqbssMcG/cXpRqG'),
(3, 'admin', '[\"ROLE_ADMIN\"]', '$2y$13$m2PbyiZfMd/mFovytA2Ob.8deCLXGgZhj2gqHVeVAe5Luuwz9eh7C');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `category_article`
--
ALTER TABLE `category_article`
  ADD PRIMARY KEY (`category_id`,`article_id`),
  ADD KEY `IDX_C5E24E1812469DE2` (`category_id`),
  ADD KEY `IDX_C5E24E187294869C` (`article_id`);

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526C7294869C` (`article_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `category_article`
--
ALTER TABLE `category_article`
  ADD CONSTRAINT `FK_C5E24E1812469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C5E24E187294869C` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C7294869C` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
