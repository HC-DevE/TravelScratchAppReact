-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 17 avr. 2023 à 23:29
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
-- Base de données : `test_v3`
--

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `friendships`
--

CREATE TABLE `friendships` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `friend_id` int(10) UNSIGNED NOT NULL,
  `status` enum('pending','accepted','rejected') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `friendships`
--

INSERT INTO `friendships` (`user_id`, `friend_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'pending', '2023-04-17 11:14:14', '2023-04-17 11:14:14'),
(2, 3, 'pending', '2023-04-17 11:01:23', '2023-04-17 11:01:23');

-- --------------------------------------------------------

--
-- Structure de la table `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `group_members`
--

CREATE TABLE `group_members` (
  `group_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role` enum('member','admin') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `likes`
--

CREATE TABLE `likes` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `photos`
--

CREATE TABLE `photos` (
  `id` int(10) UNSIGNED NOT NULL,
  `trip_id` int(10) UNSIGNED NOT NULL,
  `url` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `places`
--

CREATE TABLE `places` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `location` point NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `place_id` int(10) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `trips`
--

CREATE TABLE `trips` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `trips`
--

INSERT INTO `trips` (`id`, `user_id`, `title`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 3, 'morococa', 'hfhtrtr', '1999-12-25', '2000-12-25', '2023-04-16 09:48:46', '2023-04-16 09:48:46'),
(2, 3, '', '', '0000-00-00', '0000-00-00', '2023-04-16 09:50:18', '2023-04-16 09:50:18'),
(3, 3, 'ther', '', '0000-00-00', '0000-00-00', '2023-04-16 09:51:02', '2023-04-16 09:51:02'),
(4, 3, 'herte', '', '0000-00-00', '0000-00-00', '2023-04-16 13:51:08', '2023-04-16 13:51:08'),
(5, 3, 'herte15', 'tezst', '0000-00-00', '0000-00-00', '2023-04-17 10:30:27', '2023-04-17 10:30:27');

-- --------------------------------------------------------

--
-- Structure de la table `trip_places`
--

CREATE TABLE `trip_places` (
  `trip_id` int(10) UNSIGNED NOT NULL,
  `place_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `birth_date` date NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `preferences` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`preferences`)),
  `last_known_latitude` decimal(9,6) DEFAULT NULL,
  `last_known_longitude` decimal(9,6) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password_hash`, `birth_date`, `profile_picture`, `gender`, `preferences`, `last_known_latitude`, `last_known_longitude`, `created_at`, `updated_at`) VALUES
(1, 'test', '123', 'test@gmail.com', '$2a$10$0nisN8yxQzdaI5NS2Gp1YuSJ2yPM4Q8faxmQL5xGNBgzGos5ADZ0i', '1999-12-02', NULL, 'male', NULL, NULL, NULL, '2023-04-16 08:59:38', '2023-04-16 08:59:38'),
(2, 'test', '123', 'test45@gmail.com', '$2a$10$C0xTA6TM5u3pm1K3W9Om4u0kHOLfKhMl/23FZ51I3z2SA5Up2KVZ.', '1999-12-02', NULL, 'male', NULL, NULL, NULL, '2023-04-16 09:00:37', '2023-04-16 09:00:37'),
(3, '', '', 'Timothy.Weimann14@gmail.com', '$2a$10$.T4ff0A.gS1LL5SSbE8CWOzKZUl2xBIlEVbSLwBYlUibnfZIPk.US', '1994-12-02', NULL, 'male', NULL, NULL, NULL, '2023-04-16 09:01:26', '2023-04-16 09:01:26'),
(4, 'teszte', 'hihi', 'test12@example.com', '$2a$10$/1kjTbFgUUHaAxkdw7Z61upkMW7QO6wSlFwBlerEQpKt2AITAGYTi', '1999-10-08', NULL, 'female', NULL, NULL, NULL, '2023-04-16 09:40:25', '2023-04-16 09:40:25'),
(5, 'test15', 'hihi15', 'test15@example.com', '$2a$10$GJUwWB9W1SGekxtXbTK9E.l3KbGBUBnF///4W/6rPVfiKsyDz1aee', '0000-00-00', NULL, '', NULL, NULL, NULL, '2023-04-17 10:29:04', '2023-04-17 10:29:04'),
(6, 'test156', 'hihi15', 'test156@example.com', '$2a$10$V0kvUB.ZE6WioqioyLrLR.aa.Jdf9xdpnwdr1RLBLF31Cawup7vYu', '0000-00-00', NULL, '', NULL, NULL, NULL, '2023-04-17 13:21:47', '2023-04-17 13:21:47'),
(7, 'emulate', 'test', 'devtest@gmail.com', '$2a$10$4mKrmMwS5a6x0liowYOcdOxMO0sA3LUA4XmpYnUbtZm/TgAnmUg3G', '1999-05-24', NULL, 'other', NULL, NULL, NULL, '2023-04-17 13:30:13', '2023-04-17 13:30:13'),
(8, 'dark', 'shadow', 'devtest&é@gmail.com', '$2a$10$vDtjW6rKy75D0WQ0WNPwsu8nNBxK.h34CBpkNgMkcsFMep3yqUWHi', '1998-11-22', NULL, 'other', NULL, NULL, NULL, '2023-04-17 18:02:22', '2023-04-17 18:02:22');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Index pour la table `friendships`
--
ALTER TABLE `friendships`
  ADD PRIMARY KEY (`user_id`,`friend_id`),
  ADD KEY `friend_id` (`friend_id`);

--
-- Index pour la table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `group_members`
--
ALTER TABLE `group_members`
  ADD PRIMARY KEY (`group_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`user_id`,`post_id`),
  ADD KEY `post_id` (`post_id`);

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
  ADD KEY `user_id` (`user_id`);

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
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `trip_places`
--
ALTER TABLE `trip_places`
  ADD PRIMARY KEY (`trip_id`,`place_id`),
  ADD KEY `place_id` (`place_id`);

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
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `places`
--
ALTER TABLE `places`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `trips`
--
ALTER TABLE `trips`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `friendships`
--
ALTER TABLE `friendships`
  ADD CONSTRAINT `friendships_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `friendships_ibfk_2` FOREIGN KEY (`friend_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `group_members`
--
ALTER TABLE `group_members`
  ADD CONSTRAINT `group_members_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `group_members_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `trips`
--
ALTER TABLE `trips`
  ADD CONSTRAINT `trips_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `trip_places`
--
ALTER TABLE `trip_places`
  ADD CONSTRAINT `trip_places_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trip_places_ibfk_2` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
