-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 17 avr. 2023 à 23:30
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `travel_app`
--

-- --------------------------------------------------------

--
-- Structure de la table `comment_likes`
--

CREATE TABLE `comment_likes` (
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `liked` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `friendships`
--

CREATE TABLE `friendships` (
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `request_date` date DEFAULT NULL,
  `friendship_date` date DEFAULT NULL,
  `status` enum('pending','accepted','rejected','blocked') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `group_members`
--

CREATE TABLE `group_members` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `group_photos`
--

CREATE TABLE `group_photos` (
  `id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `group_trips`
--

CREATE TABLE `group_trips` (
  `group_id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `group_users`
--

CREATE TABLE `group_users` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `photos`
--

CREATE TABLE `photos` (
  `id` int(11) NOT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `places`
--

CREATE TABLE `places` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` int(11) NOT NULL,
  `photo_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `post_likes`
--

CREATE TABLE `post_likes` (
  `user_id` int(11) NOT NULL,
  `photo_id` int(11) NOT NULL,
  `liked` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `place_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `trips`
--

CREATE TABLE `trips` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `trip_groups`
--

CREATE TABLE `trip_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `password_reset_expires` datetime DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('male','female','other','prefer_not_to_say') DEFAULT 'prefer_not_to_say',
  `preferences` text DEFAULT NULL,
  `last_known_latitude` decimal(10,6) DEFAULT NULL,
  `last_known_longitude` decimal(10,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password_hash`, `password_reset_token`, `password_reset_expires`, `profile_picture`, `date_of_birth`, `gender`, `preferences`, `last_known_latitude`, `last_known_longitude`) VALUES
(1, 'John', 'Doe', 'john@example.com', '$2a$10$CTHvfSkZ.0ZUiVm6pje/d.dr.Lv8PWhi7.R9DuyxCGzLxTBJMVcVG', NULL, NULL, NULL, '1999-10-08', 'male', NULL, NULL, NULL),
(2, 'teszte', 'hihi', 'test@example.com', '$2a$10$.b03t59VO5tja7GUGRvBQOeRU1hasWYZwLhqIopqLw/oAzJ4uQV86', NULL, NULL, NULL, '1999-10-08', 'male', NULL, NULL, NULL),
(3, 'teszte', 'hihi', 'test1@example.com', '$2a$10$Xz4EQcAFw2ov2bxCgYMNZOQkHxwyl9zdt188NzkDPvs0rE6G7k9sq', NULL, NULL, NULL, '1999-10-08', 'male', NULL, NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `comment_likes`
--
ALTER TABLE `comment_likes`
  ADD PRIMARY KEY (`user_id`,`comment_id`),
  ADD KEY `comment_id` (`comment_id`);

--
-- Index pour la table `friendships`
--
ALTER TABLE `friendships`
  ADD PRIMARY KEY (`user_id`,`friend_id`),
  ADD KEY `idx_friendships_user_id` (`user_id`),
  ADD KEY `idx_friendships_friend_id` (`friend_id`);

--
-- Index pour la table `group_members`
--
ALTER TABLE `group_members`
  ADD PRIMARY KEY (`group_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `group_photos`
--
ALTER TABLE `group_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Index pour la table `group_trips`
--
ALTER TABLE `group_trips`
  ADD PRIMARY KEY (`group_id`,`trip_id`),
  ADD KEY `trip_id` (`trip_id`);

--
-- Index pour la table `group_users`
--
ALTER TABLE `group_users`
  ADD PRIMARY KEY (`group_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trip_id` (`trip_id`);

--
-- Index pour la table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `trip_id` (`trip_id`);

--
-- Index pour la table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photo_id` (`photo_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `post_likes`
--
ALTER TABLE `post_likes`
  ADD PRIMARY KEY (`user_id`,`photo_id`),
  ADD KEY `photo_id` (`photo_id`);

--
-- Index pour la table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `place_id` (`place_id`);

--
-- Index pour la table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_trips_user_id` (`user_id`);

--
-- Index pour la table `trip_groups`
--
ALTER TABLE `trip_groups`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `group_photos`
--
ALTER TABLE `group_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `places`
--
ALTER TABLE `places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `trips`
--
ALTER TABLE `trips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `trip_groups`
--
ALTER TABLE `trip_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment_likes`
--
ALTER TABLE `comment_likes`
  ADD CONSTRAINT `comment_likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comment_likes_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `post_comments` (`id`);

--
-- Contraintes pour la table `friendships`
--
ALTER TABLE `friendships`
  ADD CONSTRAINT `friendships_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `friendships_ibfk_2` FOREIGN KEY (`friend_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `group_members`
--
ALTER TABLE `group_members`
  ADD CONSTRAINT `group_members_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `trip_groups` (`id`),
  ADD CONSTRAINT `group_members_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `group_photos`
--
ALTER TABLE `group_photos`
  ADD CONSTRAINT `group_photos_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `trip_groups` (`id`);

--
-- Contraintes pour la table `group_trips`
--
ALTER TABLE `group_trips`
  ADD CONSTRAINT `group_trips_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `trip_groups` (`id`),
  ADD CONSTRAINT `group_trips_ibfk_2` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`);

--
-- Contraintes pour la table `group_users`
--
ALTER TABLE `group_users`
  ADD CONSTRAINT `group_users_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `trip_groups` (`id`),
  ADD CONSTRAINT `group_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`);

--
-- Contraintes pour la table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`);

--
-- Contraintes pour la table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_ibfk_1` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`),
  ADD CONSTRAINT `post_comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `post_likes`
--
ALTER TABLE `post_likes`
  ADD CONSTRAINT `post_likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `post_likes_ibfk_2` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`);

--
-- Contraintes pour la table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`);

--
-- Contraintes pour la table `trips`
--
ALTER TABLE `trips`
  ADD CONSTRAINT `trips_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
