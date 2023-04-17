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
-- Base de données : `travel_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `travel_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `event_time` datetime DEFAULT current_timestamp(),
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `photos`
--

CREATE TABLE `photos` (
  `id` int(11) NOT NULL,
  `travel_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `travel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `content`, `travel_id`, `user_id`, `created_at`) VALUES
(3, 'Aut ratione non et aut voluptatem. Laborum quis labore provident aut rerum est voluptas repellat. Nam deleniti voluptatibus natus nostrum inventore est velit tenetur. Veniam vel accusamus. Ex cupiditate nostrum fuga sequi.', 24, 39, '2022-04-20 12:28:44'),
(4, 'Sequi est optio facilis. Dolorem est nisi adipisci explicabo. Quam voluptatem impedit dolorem explicabo suscipit sit. Quo dignissimos molestiae neque occaecati voluptas deleniti dolores autem. Omnis voluptas vero harum debitis.', 7, 11, '2022-07-25 17:39:21'),
(5, 'Quasi tenetur qui. Dolor est consequatur architecto. Sequi accusamus esse fuga non cupiditate esse pariatur est aliquam. Eos blanditiis et sint officia voluptatum voluptatem ea nulla.', 22, 28, '2022-09-27 14:29:27'),
(6, 'Est eligendi similique autem qui. Doloribus culpa autem consequatur sint. Eveniet explicabo quod. Ut et porro voluptas libero voluptatem ipsum praesentium autem pariatur.', 28, 10, '2023-03-06 06:35:27'),
(7, 'Nam non sint eaque et consectetur. Dolore placeat ducimus cum. Esse sit ut est. Eum ab rerum voluptatem consequatur nulla. Sit excepturi voluptatibus et aut quia et deserunt reiciendis voluptas.', 46, 9, '2022-12-04 12:19:11'),
(8, 'Et atque fugit repudiandae omnis. Voluptas quam aut inventore quibusdam. Quia beatae dolor hic corrupti.', 41, 25, '2023-04-13 09:59:51'),
(9, 'Voluptatum autem rerum et magni tenetur ea voluptas magnam. Quo asperiores tempora officiis esse voluptatem. Quibusdam et deserunt.', 7, 28, '2023-01-30 02:28:32'),
(10, 'Accusamus vero repellat perspiciatis aperiam autem ut earum aut tempore. Molestiae ut nam excepturi a aspernatur ad exercitationem aut. Voluptas ratione id. Sint dolores labore consequuntur optio enim quo distinctio similique.', 4, 29, '2022-11-01 05:31:37'),
(11, 'Expedita rerum eum. Enim iure aliquid dolore sit recusandae eveniet corporis deserunt. Ut earum exercitationem dolorum vitae totam aperiam et qui. Nobis culpa aut ad.', 31, 17, '2022-08-18 13:06:11'),
(12, 'Molestiae iste aut enim sit provident magni ut ab. Veritatis dolores iusto recusandae ea molestias neque sed. Ratione non officia esse esse et dolorum inventore impedit dolore.', 23, 18, '2022-09-24 21:48:46'),
(13, 'Aspernatur quis aperiam et. Autem temporibus provident error tenetur eveniet. Modi ut expedita modi qui et. Ducimus quia dolor quo omnis omnis soluta dolor eaque voluptas. Nobis quidem est nobis et non.', 10, 22, '2022-10-01 06:19:51'),
(14, 'Sit adipisci sed incidunt. Odit qui hic dolore sequi eligendi aliquam. Possimus sequi assumenda eius quaerat quos animi et. Labore veritatis qui aut qui est officiis. Ut excepturi asperiores rerum tempore at quidem. Pariatur quod quia impedit similique est nihil qui.', 15, 23, '2022-12-12 09:23:27'),
(15, 'Libero molestiae architecto qui id in. Adipisci et sit est. Distinctio labore optio ut sequi sapiente accusamus ab quia. Dicta iure nobis sed.', 7, 11, '2022-05-22 20:33:21'),
(16, 'Voluptates at et excepturi qui provident nemo illo illum molestiae. Molestias qui nulla dolore quaerat. Illum illo in et sit. Fugit amet modi quis tempora doloribus. Magni iste non. Sit numquam non labore temporibus ab beatae debitis blanditiis.', 8, 27, '2022-09-14 10:28:39'),
(17, 'Ut corrupti veritatis est aut qui vel sed quis. Fuga id qui itaque illo accusantium. Sed voluptatum quas minus et ea.', 47, 6, '2022-05-25 00:48:38'),
(18, 'Cum rerum sint nobis tempore aliquid non iusto error. Alias asperiores optio aut totam et sit ut architecto fuga. Et exercitationem harum voluptas doloremque autem nam. Distinctio voluptas aut incidunt ullam enim nisi beatae maxime. Voluptates quas et sint. Qui sequi a.', 31, 15, '2022-12-20 19:13:12'),
(19, 'Quia maxime illum. Quibusdam sunt enim quod iure. Atque minus maiores suscipit. Qui ut itaque in omnis voluptatem quaerat occaecati.', 13, 37, '2022-10-02 13:24:49'),
(20, 'Aliquam expedita suscipit laudantium. Ducimus aut omnis minus nobis praesentium at nemo.', 40, 26, '2022-07-14 04:11:29'),
(21, 'Repellat at occaecati suscipit. Aliquid non molestiae aperiam delectus necessitatibus iusto sint. Ut hic cupiditate et amet rerum delectus maiores. Ut dignissimos et. Vel et eaque vero nisi omnis ipsam aliquid. Id nam dicta temporibus aut commodi quibusdam qui dolorum.', 21, 37, '2023-01-02 06:08:20'),
(22, 'Dolorum et non et aspernatur veniam qui. Modi quidem earum vel. Cupiditate aut veritatis enim. Sint exercitationem quis vitae. Ea assumenda consequatur voluptates odit qui est nemo reprehenderit corrupti. Sint autem nesciunt dolorum accusantium sit et.', 34, 13, '2022-06-26 06:12:38'),
(23, 'Ea enim iste doloribus unde illum veritatis. Velit tempora et dolor. Necessitatibus odit sed quia libero inventore adipisci non et est. Unde aut ut error velit quaerat reiciendis. Quasi est sit repellat praesentium harum. Minus quaerat architecto quos cupiditate rem unde sed.', 39, 39, '2022-12-29 11:22:49'),
(24, 'Facilis nobis est soluta eligendi. Iste est voluptatem sed et. Nesciunt nihil sed natus.', 1, 39, '2022-04-20 23:04:49'),
(25, 'Harum et in voluptatibus rem. Deleniti quia est aliquid laborum explicabo saepe quas et ex.', 25, 11, '2023-01-02 19:31:48'),
(26, 'Voluptatibus minus dicta ut ut et neque. Nihil sed a odio earum dicta hic vitae quis. Eum beatae dolores. Culpa quia molestiae libero. At earum nisi exercitationem voluptatibus laboriosam et facere. Est ducimus minus autem.', 25, 22, '2023-03-27 16:05:46'),
(27, 'Harum repellat quis. Nemo illum vitae facere in expedita voluptas porro sapiente. Ad consequatur voluptas totam. Natus nobis omnis voluptas quia et aspernatur. Doloribus molestiae laudantium voluptatem ipsum.', 48, 21, '2022-12-06 07:16:22'),
(28, 'Labore vitae fuga vel quia qui eos et hic libero. Velit dolor delectus officiis quo quia. Dolorem ducimus veniam quam. Sint et quis sed sint iusto illum qui iusto voluptatem. Molestiae quae molestias accusantium reiciendis omnis velit debitis fugiat sequi.', 7, 18, '2023-03-25 18:10:23'),
(29, 'Fugiat voluptatem odio. Voluptatum et sint explicabo blanditiis mollitia vero. Porro et numquam laboriosam suscipit ex et. Alias assumenda non mollitia corrupti quia consectetur.', 31, 4, '2022-10-29 17:02:48'),
(30, 'Voluptate ut saepe et accusamus illo voluptatibus. Veritatis dicta omnis nulla in. Magni quia esse aliquid officiis nobis. Consequuntur inventore facilis. Consequatur cum et.', 47, 4, '2022-11-17 23:22:42'),
(31, 'Est necessitatibus alias. Atque quia doloremque aliquam nesciunt maiores. Excepturi est et voluptate id quisquam beatae vitae. Nihil quo sint omnis. Odit impedit exercitationem. Temporibus aut vitae doloribus praesentium qui qui nam rerum.', 40, 17, '2022-10-17 10:17:34'),
(32, 'Rerum veritatis sunt odio. Unde facere minus voluptates quia et nemo. Libero eum nihil quia totam sit dolores sequi ad. Ut aspernatur aut et. Aspernatur molestias soluta autem explicabo. Ad cumque vel ducimus.', 44, 15, '2022-07-15 03:16:13'),
(33, 'Non ab rerum quidem sed voluptatem ipsa hic ipsum corporis. Eum consequatur maiores. Tenetur placeat error fuga enim fuga nihil est cumque. Atque nemo nisi non. Ipsum consequatur et. Voluptate minus expedita necessitatibus deleniti enim temporibus.', 34, 14, '2022-11-22 05:52:00'),
(34, 'Eum consectetur molestiae magni voluptas. Pariatur quaerat doloremque voluptatem voluptas at et quia.', 30, 14, '2023-01-15 17:54:41'),
(35, 'Repudiandae sed facere sed. Excepturi eos at. Ea et facilis qui quam qui totam et.', 5, 20, '2022-07-03 11:39:17'),
(36, 'Vitae dolores at. Qui ab voluptatem non nesciunt tempore occaecati quia molestiae officia. Necessitatibus pariatur est beatae ex rerum non. Rem et delectus nulla est. Officia nisi labore veniam asperiores eos. Asperiores ut delectus nobis architecto.', 27, 9, '2023-01-20 22:25:36'),
(37, 'Non voluptatem ut a temporibus et dolor. Qui laboriosam aut ducimus in rerum aut laborum omnis distinctio.', 16, 2, '2022-08-08 15:32:18'),
(38, 'Aut est aspernatur quia incidunt qui rerum aliquam pariatur accusantium. Ex ducimus adipisci minima repudiandae fugit quibusdam alias rerum. Enim sint repellat saepe porro. Molestiae expedita dolore sint dolor et recusandae quae a. Eligendi ad nihil quam vel eaque facere incidunt consequatur voluptatem. Laudantium quis iure illum dolores quo ea ex aperiam odit.', 31, 6, '2022-08-21 08:28:52'),
(39, 'Unde possimus error quia et quis ipsum saepe eum eos. Dicta doloremque velit voluptates voluptate minima eaque. Distinctio ea tempore aliquid.', 17, 20, '2022-06-10 12:09:41'),
(40, 'At ea sit et. Possimus libero reprehenderit recusandae itaque atque modi quibusdam rerum. Eligendi provident alias voluptatem. Rerum totam quam excepturi quam. Omnis aut maxime ut ad est voluptas dignissimos.', 15, 40, '2022-09-27 11:36:43'),
(41, 'Non facere architecto. Magni non maxime et consequuntur aspernatur nostrum et sunt fugit. Quia nesciunt deleniti modi delectus officia dicta assumenda aut dolorum. Maxime praesentium ipsam quisquam veniam illum natus qui aut. Totam ipsa natus qui.', 14, 35, '2023-04-07 10:37:42'),
(42, 'Dolore asperiores animi libero. Temporibus saepe deleniti nesciunt velit in.', 21, 9, '2022-05-13 13:37:28'),
(43, 'Reiciendis blanditiis et dolor molestias doloribus doloribus. Vero vitae impedit enim dolores cupiditate numquam sint nesciunt eligendi. Odio facere animi. Repudiandae perspiciatis autem aut aut et voluptate. Debitis sint veritatis maxime. Vel est laudantium illo.', 40, 28, '2023-02-18 03:13:34'),
(44, 'Sequi maiores rerum sunt voluptas non velit in voluptatibus. Autem sint et nam eos at accusantium accusantium odit. Magni tenetur necessitatibus.', 36, 25, '2022-05-05 23:33:53'),
(45, 'Quidem quia ut veritatis autem qui ea aliquam. Dolorem aperiam voluptate quo eveniet eum vel optio. Voluptatem sit enim quibusdam explicabo porro nostrum enim excepturi. Ut aut omnis fuga molestiae libero assumenda.', 4, 30, '2022-06-01 08:23:21'),
(46, 'Nemo similique voluptatibus qui sequi voluptas. Aut neque et enim. Ea in voluptas illo sed fuga laudantium. Hic aut nihil labore quidem sapiente. Nostrum nihil enim.', 28, 11, '2023-01-01 19:56:30'),
(47, 'Laudantium dolor quia autem. Pariatur autem excepturi voluptas in. Et soluta aut.', 38, 10, '2023-03-15 12:31:51'),
(48, 'Enim odio ut aut repudiandae quod error voluptatum. Deserunt adipisci voluptas necessitatibus unde. Nostrum doloribus velit. Eum qui sint vel asperiores saepe iusto necessitatibus. Dicta sed commodi sint repellendus labore.', 6, 9, '2022-08-10 20:03:17'),
(49, 'Qui harum sunt blanditiis. Sed esse eius asperiores et error natus eum. A harum aut similique veniam excepturi quam iusto officiis beatae. Enim molestias nostrum autem. Aut reprehenderit a facilis. Eum animi enim molestiae.', 22, 7, '2022-06-22 04:29:03'),
(50, 'Dolorum tempora quo. Vitae architecto occaecati rerum eius. Odio mollitia dolorem qui. Quasi totam commodi sunt eveniet non dolorum dolorem.', 1, 23, '2022-08-03 05:43:22'),
(51, 'Fugit vel maxime possimus sint eum. Quae qui aut est molestiae cum. Aliquid sequi ipsa vel. Nulla excepturi soluta vitae perferendis nihil explicabo hic qui consequatur.', 45, 32, '2022-11-16 13:02:13'),
(52, 'Voluptatem quia est in quam praesentium. Odit omnis magni odio possimus et accusamus. Laboriosam omnis et aut odit optio error ipsam.', 23, 5, '2022-06-14 16:05:08'),
(53, 'Aut aut quo aut aliquam. Ad laudantium iste rerum nesciunt soluta consequuntur. Aut facilis harum itaque enim. Quia sed recusandae omnis non alias eaque. Pariatur ut eum et qui nesciunt voluptas occaecati corporis officia. Quod officia nam et possimus magni quo fugiat incidunt quisquam.', 12, 8, '2022-06-01 16:12:50'),
(54, 'Molestias corrupti nisi voluptatum nemo veniam iste. Sed ut debitis omnis voluptatum quasi dolor soluta deserunt minima. Minima consectetur veritatis aut omnis ea eius.', 3, 19, '2022-07-20 19:06:09'),
(55, 'Voluptas eius nesciunt dolorem dolorem exercitationem dicta aut. Similique qui molestiae eum quia ex aut. Cum eius voluptatibus qui aliquam modi quibusdam qui. Itaque laborum reiciendis nemo accusantium ipsum perspiciatis omnis et et.', 49, 6, '2022-06-16 21:34:21'),
(56, 'Explicabo quam fugiat. Aut est a eveniet quasi soluta culpa non. Illum ut doloremque facere sequi aliquid.', 4, 37, '2022-11-26 18:50:54'),
(57, 'Et sunt fugit laborum optio. Sed commodi iste cum. Perspiciatis quo reprehenderit harum. Voluptatem minima voluptas qui cum amet officia iure.', 48, 31, '2022-05-22 21:21:38'),
(58, 'Rerum nihil dolorum non aut dolorum officiis. Dolores voluptatem sint iure accusantium. Quia ab nesciunt omnis sed assumenda cumque optio cupiditate rem. Nam vel quia. Dolores quibusdam voluptas ipsam dolor culpa rerum cupiditate ducimus quos. Voluptas dolorem aliquam fuga perspiciatis vel cupiditate autem distinctio.', 39, 40, '2022-08-20 10:46:52'),
(59, 'Necessitatibus minus qui natus porro. Qui perferendis eos excepturi et labore ipsum soluta. Numquam dicta rerum minus consequatur placeat. Harum eum qui quo aut autem ea et non molestias. Necessitatibus qui excepturi porro ea consequatur nemo.', 42, 7, '2022-12-10 11:34:30'),
(60, 'Sed quaerat voluptatem officiis fuga ut a. Tempora sapiente sit voluptatem hic sed excepturi. Nihil iste id neque et. Consequatur aut cum vel deleniti est. Ratione aspernatur asperiores illo asperiores. Rerum autem sequi dolor molestias autem a rerum velit.', 1, 9, '2022-11-01 23:48:02'),
(61, 'Velit rerum dolores. Fugit eveniet ipsa molestias dolores. Expedita architecto asperiores reiciendis distinctio aut.', 33, 36, '2022-11-20 01:28:36'),
(62, 'Ducimus nam quod vitae repellat ut blanditiis nulla et voluptas. Sit aut vel ut sed. Ad labore quia consequatur. Magni et ea id.', 35, 10, '2023-01-05 07:18:11'),
(63, 'Qui dolor dolorum ex nemo officiis repellat quam. Praesentium expedita commodi rerum harum.', 33, 10, '2022-12-18 23:54:21'),
(64, 'Tenetur beatae deserunt facilis eum. Ab earum occaecati sed placeat quia id est rerum doloribus. Et aspernatur quis est ut ab corporis libero praesentium. Sed quis ducimus voluptas placeat cupiditate eligendi voluptas aut. Voluptatum enim quaerat reiciendis.', 44, 14, '2022-08-05 06:09:37'),
(65, 'Ab quo accusantium sunt. Veritatis placeat vitae ipsum vero occaecati velit enim magni eligendi. Nostrum ut ipsum reiciendis enim molestiae similique voluptas impedit porro. Nobis voluptatem ut enim voluptas alias accusamus consequatur autem. Dignissimos non consectetur sint magnam id ipsam. Voluptatem occaecati repudiandae.', 43, 20, '2022-09-07 05:57:17'),
(66, 'Delectus ut suscipit aut dolorem. Culpa inventore tempora culpa harum quas debitis.', 27, 39, '2022-05-29 16:40:01'),
(67, 'Eum voluptatem quos sed delectus odit qui nostrum. Ex mollitia facere fuga sit soluta inventore. Tempore dolor placeat non est corporis omnis consequuntur quisquam fuga. Vel dolores voluptatem.', 5, 32, '2022-09-18 10:06:05'),
(68, 'Maiores quia iure ea ipsum natus. Provident eos harum in quis iusto ullam consequatur quae. Facere consequatur sit iusto qui placeat.', 42, 13, '2022-06-18 19:53:15'),
(69, 'Neque quidem dolores corrupti et. Nostrum sed minima ut eveniet minus repudiandae ea ipsum.', 32, 1, '2023-01-05 19:22:49'),
(70, 'Voluptatem est ut sequi. Omnis quidem et velit aperiam. Et voluptates magni nam eveniet sunt ullam itaque vel. Enim aut eius maxime quaerat. Voluptatem fuga quis culpa molestiae animi.', 30, 6, '2023-02-16 12:40:21'),
(71, 'Rem esse dolor quia quisquam consequuntur incidunt. Totam corporis omnis et excepturi qui voluptatem pariatur ea magni.', 30, 38, '2022-10-10 09:01:07'),
(72, 'Ipsa et nihil blanditiis delectus et facere. Repudiandae minima perferendis qui dolorum aperiam et qui praesentium amet. Deleniti non fugiat. Est quia maxime doloremque quis. Tempora hic totam quia et. Est quae modi unde quia atque quis ut dolores ad.', 15, 7, '2022-07-21 19:05:02'),
(73, 'Hic sit suscipit quod ut voluptas quidem ullam. Eveniet quaerat similique et aliquam odio voluptas ea placeat molestiae. Ipsa dolor rerum ratione.', 11, 18, '2022-11-21 00:09:40'),
(74, 'Et dolorum omnis eum voluptas eligendi voluptatibus. Quia eius hic odit. Nemo temporibus voluptatem aspernatur autem.', 11, 24, '2022-06-06 09:16:12'),
(75, 'Rem eum ut expedita magni earum ratione accusantium. Rerum cum ex architecto molestiae necessitatibus consectetur in quis.', 42, 17, '2022-12-07 16:02:30'),
(76, 'Sed voluptatum tenetur quia quia numquam optio blanditiis. Velit cupiditate ipsam nihil mollitia nemo laboriosam temporibus.', 23, 2, '2023-03-23 20:08:53'),
(77, 'Quae incidunt et ipsam excepturi. Adipisci ut nemo rem voluptas autem recusandae. Nostrum maiores et fuga dolorem impedit.', 29, 16, '2022-05-30 11:40:24'),
(78, 'Aut ullam distinctio eius perferendis voluptatem laudantium et. Sit quo eum assumenda iste repellendus voluptas doloribus consequatur.', 1, 35, '2023-01-01 13:05:58'),
(79, 'Nihil qui id et. Et qui quae nobis. Quia non vero magnam officia unde voluptatem hic voluptatum voluptatem. Officia sed suscipit nam non mollitia. Omnis cum dolore autem quia commodi suscipit accusamus eveniet.', 17, 14, '2022-11-19 06:37:16'),
(80, 'Asperiores nobis aliquam et quia nesciunt aliquam illo. Doloremque fuga fugit et iste dolor fugit et.', 25, 31, '2023-02-10 06:07:11'),
(81, 'Libero iusto optio ad non aspernatur quis et debitis nisi. Sunt consequatur omnis vel veniam eius ex quia enim. Facilis nesciunt facere porro molestiae et.', 34, 7, '2022-08-31 05:16:41'),
(82, 'Maxime exercitationem qui incidunt aperiam. Nemo nemo recusandae ut sunt numquam. Perspiciatis autem perferendis eos quia aut id omnis. Est corrupti voluptatem. Harum fugit et perferendis. Error repellendus aut autem.', 26, 38, '2022-11-14 19:50:20'),
(83, 'Et non nisi corporis aut soluta. Occaecati qui est voluptate magnam sed aut. Ad non voluptatum rem eum. Delectus sint quis tempore fugiat debitis sapiente. Suscipit officia et numquam asperiores.', 21, 4, '2022-08-05 06:24:04'),
(84, 'Explicabo iure rerum quis commodi reprehenderit vitae. Amet et et reiciendis ipsa.', 16, 3, '2022-04-21 13:48:59'),
(85, 'Soluta eligendi sit. Accusantium dolores molestiae quidem perspiciatis sit. Cumque ut qui explicabo asperiores ipsa dignissimos neque aliquam quo.', 33, 11, '2023-02-02 01:59:39'),
(86, 'A esse amet harum sequi saepe molestiae quam assumenda enim. Nihil id ut officiis dicta architecto molestiae. Quis quasi est id ipsum. Reprehenderit sit tempora est dolore tenetur qui odio cum consequatur. Fuga natus et in voluptatum. Est dolorem officia culpa minus et praesentium esse explicabo.', 49, 5, '2022-06-20 01:46:46'),
(87, 'Minima eum voluptatem est possimus est. Eius delectus et natus repellendus beatae similique velit. Aut sed ea aut assumenda incidunt nemo et aliquam nulla.', 50, 17, '2022-04-26 03:39:37'),
(88, 'Iure voluptatem molestias. Non et rem dolor perferendis et occaecati dolorum amet.', 11, 31, '2022-06-08 00:09:14'),
(89, 'Molestias aperiam qui eaque distinctio. Est aut natus deleniti hic tenetur quo eum molestiae qui. Omnis qui porro repudiandae.', 37, 29, '2022-09-19 22:45:56'),
(90, 'Est est eveniet perferendis assumenda adipisci sunt omnis quis sint. Minima sed quibusdam saepe quidem excepturi.', 39, 25, '2023-03-01 08:42:21'),
(91, 'Quasi id ipsum quo corporis. Est debitis perferendis tempore. Et exercitationem voluptas sed est. Quis id culpa maiores. Rem ullam soluta.', 16, 13, '2022-08-01 01:04:32'),
(92, 'Eos aut aliquam error perferendis vitae et sit sint reprehenderit. Ducimus natus repellat eaque ullam doloribus et.', 19, 5, '2022-05-24 10:17:35'),
(93, 'Nostrum voluptatibus commodi qui accusantium et necessitatibus. Consequatur repellat tenetur et. Modi saepe cupiditate enim reiciendis non eligendi voluptatem possimus voluptatibus. Quod autem repellat laborum itaque in sapiente.', 2, 8, '2022-11-19 11:37:08'),
(94, 'Libero magnam sequi. At eveniet porro sunt aliquid illum nobis eveniet reiciendis. Et rerum molestiae quia minima. Vero incidunt aut pariatur. Distinctio qui unde hic. Et tempore placeat et commodi inventore voluptatem voluptatum natus consectetur.', 20, 15, '2022-07-27 16:18:36'),
(95, 'Assumenda repudiandae maiores quod impedit. Tempora alias qui omnis repudiandae et quae sint dolore officiis. Et ea delectus sint. Ad sed velit et enim cumque quidem vel et aut. A fuga atque. Et beatae rerum inventore quia nihil consequatur ea a natus.', 3, 11, '2023-02-03 19:54:49'),
(96, 'Debitis inventore quidem eligendi velit accusamus. Nihil consequatur vel tempora occaecati sequi. Qui animi recusandae et quis suscipit non in velit hic. Qui commodi magni.', 8, 27, '2022-09-26 23:04:59'),
(97, 'Vero dignissimos cum rerum id repellat quas fuga. Error id qui sit dolor blanditiis repudiandae. Eos et quis.', 46, 38, '2022-05-07 23:22:19'),
(98, 'Veritatis dicta repellat modi. Corporis ducimus molestias repellendus. Vero inventore doloribus. Voluptatem accusamus tempore sit et.', 8, 30, '2022-10-11 08:37:34'),
(99, 'Officia eos mollitia consequuntur tempore laboriosam tenetur dolores aliquam cum. Perferendis in vel quisquam. Unde dignissimos optio rerum culpa minima.', 30, 25, '2022-12-13 09:24:24'),
(100, 'Neque officiis nesciunt in est. Ex quo aliquid quaerat et magnam necessitatibus qui.', 35, 8, '2023-03-25 16:09:02'),
(101, 'Quis voluptatem quia. Voluptatum et molestiae voluptas tempora nostrum reprehenderit veniam. Aut eius quisquam maxime velit et. Sunt praesentium aspernatur adipisci et deleniti magnam provident. Nobis exercitationem assumenda impedit tenetur.', 7, 4, '2023-01-06 14:43:43'),
(102, 'Molestiae laborum ipsa molestiae porro. Doloribus similique ullam modi fugit vel eum ad in. Voluptas minima quam corrupti cum quos suscipit. Sed quia possimus eum. Voluptates dolor et cupiditate. Voluptatem reprehenderit natus nostrum minima consequatur ut.', 5, 13, '2023-02-09 09:53:33');

-- --------------------------------------------------------

--
-- Structure de la table `scratches`
--

CREATE TABLE `scratches` (
  `id` int(11) NOT NULL,
  `travel_id` int(11) NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `travels`
--

CREATE TABLE `travels` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `travels`
--

INSERT INTO `travels` (`id`, `user_id`, `title`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 25, 'ut quos ipsum', 'Nesciunt ipsa dolorum reprehenderit molestiae beatae harum. Officia corrupti exercitationem earum quis et hic. Quia sapiente fugit. Qui animi rerum dolorum sed aut natus voluptatem. Iusto est in.', '2023-08-04', '2023-08-08', '2022-10-02 00:12:31', '2022-10-02 00:12:31'),
(2, 17, 'possimus minus maxime', 'Qui consequatur voluptatem id debitis est. Sint deleniti architecto dolorem doloribus reprehenderit tempora. Harum qui accusantium molestiae enim rerum. Sint tenetur aliquid vitae assumenda consequatur molestias consequatur mollitia. Non magni rem quia.', '2023-08-08', '2023-08-11', '2022-05-04 07:28:05', '2022-05-04 07:28:05'),
(3, 2, 'possimus fugit ad', 'Fugit rem tempore labore rerum consectetur expedita. Et nisi ut. Maiores ut nulla quia nulla rerum similique harum voluptas eos. Voluptas est aperiam quos dolores laudantium tempora.', '2023-05-12', '2023-05-16', '2022-05-17 23:24:30', '2022-05-17 23:24:30'),
(4, 3, 'eos aut architecto', 'Tempore unde officiis dolorem sint. Molestiae quia aut. Mollitia et id accusantium reprehenderit. Iusto veritatis nihil. Neque debitis eos aperiam repudiandae sunt nihil.', '2023-11-20', '2023-11-28', '2023-01-03 02:15:27', '2023-01-03 02:15:27'),
(5, 16, 'maiores omnis non', 'Est animi ipsa doloremque dolores ut. Dolorem aut provident perferendis repellendus.', '2023-06-29', '2023-07-28', '2023-04-14 03:22:24', '2023-04-14 03:22:24'),
(6, 33, 'facere qui quibusdam', 'Occaecati officiis sequi. Sed quod numquam non. Modi quae magnam exercitationem. Quis deleniti sed velit qui quod ut deserunt. Ea voluptas atque voluptatem vel repellendus voluptas impedit pariatur laboriosam.', '2023-04-19', '2023-04-30', '2022-08-17 22:44:09', '2022-08-17 22:44:09'),
(7, 9, 'quas autem repellendus', 'Quaerat asperiores modi. Deserunt doloremque dolor dolorem. Veritatis est consectetur quia sequi odit iure quia aut. Aut voluptate saepe quia illum. Optio deleniti voluptas. Sunt aliquid quidem qui rerum et quaerat saepe est.', '2023-08-23', '2023-09-17', '2023-01-10 08:19:54', '2023-01-10 08:19:54'),
(8, 1, 'dolores voluptatem eum', 'Dolorum maxime sint voluptates modi eos saepe voluptatem. Et cupiditate non dolor distinctio et fuga. Natus aut cumque aut illo magni est tempora soluta qui. Unde autem error vel perferendis laborum animi vel.', '2023-05-04', '2023-05-05', '2022-07-04 06:16:19', '2022-07-04 06:16:19'),
(9, 1, 'aspernatur mollitia quos', 'Architecto alias sed fugiat molestias voluptatem illo non nihil. Excepturi est consectetur ab voluptas sit quia dolores ad. Totam inventore amet tempora quis iure. Debitis aut tenetur incidunt voluptates praesentium nemo quo. Ab dolor tenetur et repellat qui nulla voluptatum accusamus.', '2023-09-04', '2023-09-27', '2022-12-15 01:26:23', '2022-12-15 01:26:23'),
(10, 4, 'consequuntur aut iste', 'Magni sunt accusantium quia voluptatibus. Sint eius omnis saepe qui et molestias quia eos veritatis. Repellendus vel fuga quibusdam deserunt aspernatur. Non in enim ex recusandae inventore ullam minus facilis labore.', '2023-09-09', '2023-09-24', '2022-04-22 14:44:12', '2022-04-22 14:44:12'),
(11, 18, 'quibusdam error accusantium', 'Molestiae sed in beatae voluptatum quae. Qui unde in vitae nihil et.', '2023-09-30', '2023-10-24', '2022-10-21 05:21:02', '2022-10-21 05:21:02'),
(12, 25, 'voluptas nesciunt molestiae', 'Dolorem tempora assumenda ducimus. Magni voluptatem nam harum minima aspernatur maxime placeat. Ipsum aut sint earum sed reprehenderit vel cumque aut. Aut nostrum eos consequatur et. Quia voluptatem et. Ducimus iste ex necessitatibus id hic quia.', '2023-04-19', '2023-04-30', '2022-04-21 17:55:02', '2022-04-21 17:55:02'),
(13, 38, 'temporibus excepturi eos', 'Ea reiciendis vero est ea vel. Eum autem magnam qui voluptates totam pariatur quidem. Autem quis et.', '2023-10-03', '2023-10-13', '2023-01-02 07:18:51', '2023-01-02 07:18:51'),
(14, 38, 'optio dolor ea', 'Quis molestiae est ut ut consequuntur alias ullam. Reiciendis accusamus laudantium sunt qui veritatis qui ea atque. Et ipsum eligendi nesciunt.', '2023-05-30', '2023-06-04', '2022-12-08 10:30:54', '2022-12-08 10:30:54'),
(15, 11, 'quasi aut repudiandae', 'Qui quae ipsum neque fugit rerum aut. Ea ipsa ut maxime quis praesentium aut fugit.', '2023-07-31', '2023-08-16', '2022-10-12 14:54:08', '2022-10-12 14:54:08'),
(16, 25, 'excepturi harum at', 'Aspernatur voluptates dicta autem. Molestiae itaque cupiditate. Explicabo aperiam voluptas id est illum et. Explicabo quae officia impedit ab voluptatem animi molestiae. Rem aut doloribus. Non autem laudantium in quidem quisquam minima iusto vitae incidunt.', '2023-07-04', '2023-07-07', '2022-04-25 04:11:49', '2022-04-25 04:11:49'),
(17, 9, 'eum delectus et', 'Voluptatem tempora porro sed. Culpa enim optio quia incidunt sapiente suscipit dolores et cumque. Natus eos ut beatae iusto repellendus beatae. Eos modi ad hic accusantium sed ab adipisci qui. Sint delectus a sint neque aut et dolor omnis harum.', '2024-02-14', '2024-03-12', '2022-06-21 11:54:13', '2022-06-21 11:54:13'),
(18, 16, 'ab quis praesentium', 'Velit commodi dicta labore sunt ut in magni. Quia porro et et. Consequatur asperiores ducimus quam et. Dolorem excepturi impedit ex enim non repellendus a quaerat est. Facilis sunt dolorum debitis sunt repudiandae minima saepe quia sed.', '2023-09-30', '2023-10-16', '2023-02-19 00:48:57', '2023-02-19 00:48:57'),
(19, 19, 'perspiciatis sequi autem', 'Occaecati enim omnis minima vitae sapiente veritatis magni. Nemo non consequatur est. Officiis repellat a aut exercitationem veritatis omnis numquam enim quidem. Omnis cumque non beatae rem. Harum sed labore earum et consequuntur ut dicta rerum rerum. Et et minus reprehenderit praesentium placeat.', '2023-09-18', '2023-09-21', '2022-08-08 13:23:29', '2022-08-08 13:23:29'),
(20, 33, 'incidunt quod ut', 'Quo asperiores consequatur et aut eum inventore voluptas. Error explicabo esse. Hic laudantium aut modi.', '2023-05-04', '2023-05-15', '2023-03-10 00:06:16', '2023-03-10 00:06:16'),
(21, 1, 'aliquam et voluptatem', 'Esse deserunt non voluptates magnam adipisci ipsum consectetur ex et. Dolorem cumque cupiditate laborum quo dicta doloremque. Qui dolore autem nihil. Eius sit quo quis earum dolorem non nihil. Aut ab aut nemo tempora a enim.', '2024-03-03', '2024-03-04', '2022-12-13 12:55:17', '2022-12-13 12:55:17'),
(22, 25, 'dolor molestiae sequi', 'Quo quae iste ex sunt laborum. Qui recusandae rerum et delectus.', '2023-12-18', '2024-01-08', '2022-09-19 06:37:17', '2022-09-19 06:37:17'),
(23, 5, 'facilis molestiae et', 'Saepe sunt quam. Voluptas sint et ipsum saepe doloremque tempore. Ducimus dolorum fuga expedita cumque reprehenderit. Ab recusandae eum quis. Maiores eius ipsum vel officiis voluptatem qui ipsa aut cumque.', '2023-09-10', '2023-09-17', '2022-09-26 09:57:40', '2022-09-26 09:57:40'),
(24, 25, 'sapiente harum non', 'Perferendis et autem qui est et illo voluptates in. Aut sint perferendis. Qui perspiciatis natus sit saepe. Perferendis illum molestiae qui. Magni dolorem voluptas. Corporis numquam magnam ut consectetur.', '2023-04-25', '2023-05-08', '2023-03-20 23:58:02', '2023-03-20 23:58:02'),
(25, 3, 'assumenda aperiam eos', 'Repellendus ducimus consequatur assumenda magni numquam maiores quos at. Labore dolores aut. Est ut perferendis ea totam iure consequuntur accusamus. Illum reprehenderit ut alias debitis dicta dignissimos ut. Quos quod itaque.', '2023-11-28', '2023-12-20', '2022-12-27 19:10:15', '2022-12-27 19:10:15'),
(26, 34, 'accusamus quisquam molestiae', 'Temporibus reiciendis exercitationem quia nobis. Ex recusandae ex omnis molestiae harum sed. Ut quod dolores repellendus ea nulla placeat aut. Voluptatibus culpa veniam enim assumenda eveniet amet dolorum. Consectetur omnis molestiae aut voluptate non alias asperiores velit.', '2023-11-17', '2023-12-03', '2022-09-06 14:45:27', '2022-09-06 14:45:27'),
(27, 29, 'doloribus in vitae', 'Error facilis laudantium amet asperiores culpa quos. Nam aliquid sapiente itaque ut nostrum a. Sunt porro molestias laboriosam laboriosam quod. Error expedita amet ipsa. Ex deleniti provident in quia quia.', '2023-11-24', '2023-12-19', '2022-08-13 21:14:52', '2022-08-13 21:14:52'),
(28, 7, 'adipisci aspernatur rerum', 'Nobis cupiditate unde rem. Dolor iste voluptatem. Deserunt soluta et natus aut.', '2024-02-12', '2024-02-20', '2022-05-08 06:59:22', '2022-05-08 06:59:22'),
(29, 35, 'dicta modi totam', 'Quod corporis iusto at deleniti et odit eos. Maiores sunt fugiat numquam magnam voluptate atque velit. Ex illum sed minima. Natus ipsum ipsa ullam. Quia ipsam occaecati eveniet placeat.', '2023-08-25', '2023-09-04', '2023-03-03 00:41:56', '2023-03-03 00:41:56'),
(30, 25, 'est debitis aspernatur', 'Laudantium velit omnis sed est velit. Rem molestiae nihil ad quo et. Iure non enim. Officiis neque sint fuga quos quia ducimus aut exercitationem.', '2023-09-17', '2023-10-14', '2022-11-03 12:45:36', '2022-11-03 12:45:36'),
(31, 40, 'dolor quia omnis', 'Accusantium cumque nulla voluptate expedita fugit ut velit. Aperiam provident debitis ducimus quidem dolores velit a magni. A pariatur earum. Facere dolor atque. Aut nulla totam dolorum unde culpa molestias.', '2023-06-16', '2023-07-15', '2023-02-07 04:50:28', '2023-02-07 04:50:28'),
(32, 4, 'rem cupiditate laudantium', 'Voluptatem velit eaque dolorem rerum perspiciatis corrupti expedita. Porro cupiditate recusandae.', '2023-08-17', '2023-08-30', '2022-07-14 15:35:11', '2022-07-14 15:35:11'),
(33, 38, 'placeat eligendi dolores', 'Et labore consequuntur. Est fugiat dolor libero quidem et unde et qui. Nam perspiciatis eum deleniti assumenda commodi nulla ipsam dolores. Et omnis voluptatem labore officia. Quos iusto ullam delectus enim necessitatibus. Et quo hic.', '2023-06-22', '2023-07-16', '2022-09-30 19:08:41', '2022-09-30 19:08:41'),
(34, 24, 'quis adipisci dolorum', 'Earum et laudantium quia qui. Ut ducimus temporibus eum quia et odit. Corrupti numquam blanditiis quisquam aut asperiores blanditiis quia hic officia. Quo modi odit. Ab molestiae animi laboriosam adipisci officiis sed. Molestiae et temporibus quas.', '2023-10-27', '2023-11-23', '2022-08-29 00:22:04', '2022-08-29 00:22:04'),
(35, 31, 'perferendis id quae', 'Et molestias officia non dolor. Blanditiis id ducimus. Dolorem ea dolorem. Enim iste cupiditate magnam aut voluptatem aspernatur voluptates. Quia laborum qui expedita labore ab.', '2023-06-12', '2023-07-10', '2022-05-27 06:40:06', '2022-05-27 06:40:06'),
(36, 26, 'labore laboriosam quod', 'Qui iure eaque perspiciatis consectetur iste non. Aspernatur expedita iste. Assumenda debitis sit exercitationem dolor magni est culpa est qui.', '2023-07-27', '2023-08-06', '2022-08-30 17:37:56', '2022-08-30 17:37:56'),
(37, 28, 'ex numquam sunt', 'Eum rerum delectus. Aut libero eos sit est. Sit consequatur enim debitis quo voluptas quaerat quisquam cumque.', '2024-01-18', '2024-02-12', '2022-04-19 13:18:24', '2022-04-19 13:18:24'),
(38, 27, 'ea qui aut', 'Consequuntur neque recusandae qui animi. Accusantium quia blanditiis doloribus vel possimus animi et ullam a. Tempore sunt sit pariatur est quo et velit. Ducimus ad dolores dolorum perferendis velit facere recusandae. Consequuntur enim quia omnis vel reprehenderit corporis dolores. Rerum laudantium et qui quis.', '2024-01-27', '2024-02-10', '2022-12-15 00:34:16', '2022-12-15 00:34:16'),
(39, 16, 'aut accusamus consequuntur', 'Omnis porro quaerat aperiam et asperiores odio nihil placeat eos. Omnis possimus voluptate.', '2023-12-28', '2024-01-02', '2022-10-29 17:25:19', '2022-10-29 17:25:19'),
(40, 16, 'cum quo quisquam', 'Cupiditate unde voluptates et asperiores quis aut non. Minima temporibus qui asperiores magnam odio ad quidem reiciendis quia. Fugiat quia culpa nemo vel. Dolor eius incidunt ullam consequatur suscipit. Sed ex inventore beatae neque eos consequatur. Aut quos debitis.', '2023-10-21', '2023-11-10', '2022-05-20 17:12:40', '2022-05-20 17:12:40'),
(41, 3, 'blanditiis reprehenderit aut', 'Minima minima tempora quia sunt dolor. Praesentium nemo beatae quo ducimus voluptatum.', '2023-12-05', '2023-12-24', '2022-09-17 06:58:10', '2022-09-17 06:58:10'),
(42, 18, 'assumenda consequuntur ducimus', 'Ducimus est quis. Temporibus eius et ut asperiores. Rerum et eius temporibus.', '2024-03-08', '2024-03-29', '2022-05-02 02:59:16', '2022-05-02 02:59:16'),
(43, 39, 'dignissimos ex quo', 'Cupiditate quos nesciunt quisquam eum qui hic quia odit in. Ut ullam vero ea rerum. Et aut quia voluptates qui explicabo et. Qui atque illo dolor occaecati. Officiis perferendis veniam error excepturi id iusto asperiores.', '2024-02-17', '2024-03-17', '2023-03-27 02:28:33', '2023-03-27 02:28:33'),
(44, 10, 'fugit repudiandae facere', 'Quidem rerum eum repellendus. Accusantium minima sit necessitatibus necessitatibus. Non expedita quasi accusantium molestiae. Voluptas ut quod nobis eos non porro sed. Autem consequatur pariatur accusantium eius dolores et tempora.', '2023-05-05', '2023-06-04', '2022-12-23 23:18:44', '2022-12-23 23:18:44'),
(45, 26, 'nesciunt corporis molestiae', 'Repellendus enim quia possimus exercitationem enim dolores. Mollitia vitae sunt repudiandae consectetur nulla. Possimus et porro ducimus omnis recusandae quis recusandae. Quas debitis velit placeat officia ut rerum ullam. Dolor non reprehenderit vitae.', '2023-04-22', '2023-05-04', '2023-02-02 12:29:15', '2023-02-02 12:29:15'),
(46, 31, 'laudantium enim quis', 'Facere dolor excepturi est incidunt nam temporibus dolorem non. Quos sint dolor accusamus. Eos praesentium et hic. Et consectetur eius similique. Esse quo quo.', '2023-08-10', '2023-08-25', '2023-02-05 15:51:24', '2023-02-05 15:51:24'),
(47, 38, 'nisi asperiores sed', 'Consequatur nulla quis. Autem fugiat in amet et autem. Adipisci et perferendis.', '2023-06-11', '2023-07-07', '2022-08-10 12:51:25', '2022-08-10 12:51:25'),
(48, 4, 'at corporis officia', 'Quia qui unde fugit repudiandae. Est magni odit in mollitia. Quos qui consequatur provident blanditiis maxime eum tenetur ipsam incidunt. Voluptates assumenda nisi. Ut dolore voluptatum.', '2024-01-15', '2024-01-16', '2023-02-15 01:51:31', '2023-02-15 01:51:31'),
(49, 22, 'accusamus explicabo tempore', 'Earum mollitia et omnis ut. Excepturi quis dignissimos. Ad id vel dolor cupiditate. Veniam et cumque atque. Iusto dolorum nostrum ea repudiandae.', '2024-03-03', '2024-03-24', '2022-05-04 15:30:52', '2022-05-04 15:30:52'),
(50, 27, 'quam et non', 'Consequatur ut magnam reprehenderit voluptas odio corporis quod rerum consequuntur. Consequuntur vel voluptas sequi fugit dicta et. Quia quam animi velit ea est quis doloremque. Quas nobis nostrum alias repellat quis enim perspiciatis. Nihil asperiores deleniti rerum sunt vel sunt.', '2023-11-05', '2023-11-30', '2022-07-22 03:51:54', '2022-07-22 03:51:54');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password_hash`, `created_at`, `updated_at`) VALUES
(1, 'Roberto_Paucek45', 'Antonio_Schmitt4@yahoo.com', '$2b$10$1SB.gECGcCC5jyUCTwGWt.RPo/xLipkvhHm2ZvDBuBrAulm1f/IOO', '2022-10-08 00:33:46', '2022-10-08 00:33:46'),
(2, 'Greta65', 'Daron3@yahoo.com', '$2b$10$eQTbqjCoQkOl9TpP.AjlTew5TegZfQ7ddEWp392TX306U8fF91tHy', '2022-06-13 04:03:09', '2022-06-13 04:03:09'),
(3, 'Hillary_Marks73', 'Oscar_OReilly89@yahoo.com', '$2b$10$G50FIG3Zm1UgZo8m3fROb.nTBl0wz0B1jj6f1R5leIu.SmL3WpNKu', '2022-06-22 17:13:59', '2022-06-22 17:13:59'),
(4, 'Quentin68', 'Waylon_Ziemann9@yahoo.com', '$2b$10$qe6UbrVV.Oy6liD4caN.4OlFHaB7HLGmqGX.HWcUX9dhJbg85Zomq', '2023-03-13 17:07:45', '2023-03-13 17:07:45'),
(5, 'Hester.Crooks', 'Gerardo_Berge@gmail.com', '$2b$10$oVM9gYhFNFHmmm6P31x9h.dKok8fUGKUWN6lIQSjskSAU0U2DgepC', '2023-03-28 17:36:40', '2023-03-28 17:36:40'),
(6, 'Destany.Mayer', 'Tavares90@yahoo.com', '$2b$10$7LkxWdzsIzS0PlJQD.vHNu0B5OPQDHLqXxWGvJlVwejp2Jt1wAuCO', '2022-10-21 10:51:09', '2022-10-21 10:51:09'),
(7, 'Mafalda87', 'Shyanne67@hotmail.com', '$2b$10$kzU95.rKgNQGrcfmcNULlOfZGpEyhQwRG.J5IlKPXN05ZVPeW37/y', '2023-02-15 23:13:13', '2023-02-15 23:13:13'),
(8, 'Tamia59', 'Raphaelle.Lehner10@gmail.com', '$2b$10$9ukgC16hgs5EENZBV135CuyCHRReUZbD8C51RI4URb7qQ6tGLT3lK', '2023-04-01 21:09:33', '2023-04-01 21:09:33'),
(9, 'Chase.Gibson', 'Abby.Marks53@gmail.com', '$2b$10$r9r3lwjOeOrl2QEkT0qXquAdkvQPdh8LiIEkXJQ0PBGtE2Wy8YvIi', '2022-08-31 23:34:34', '2022-08-31 23:34:34'),
(10, 'Alfredo.Gutmann', 'Lorenz.Gibson@yahoo.com', '$2b$10$/Ex8sSOFbdSnbQG2MBjQ/eKMI9wg27jY0sKbvnhJRPJCPJyEq5V9a', '2022-05-29 18:43:31', '2022-05-29 18:43:31'),
(11, 'Wava_Leffler', 'Raphael_Champlin@gmail.com', '$2b$10$JKYTvpWQWmG/X.Etuli3teHJhIAO0b8Q9R8BtQn0jsJXui0Hs5XkC', '2023-02-28 11:42:36', '2023-02-28 11:42:36'),
(12, 'Maximillian.Stokes', 'Connie78@yahoo.com', '$2b$10$VMV1oGOPMW11XJ3wnAZ5F.rhNz.MKFrSvNyX2Et.6hdWE3ifHshB6', '2022-08-20 09:25:07', '2022-08-20 09:25:07'),
(13, 'Laurel_Schinner', 'Josephine38@hotmail.com', '$2b$10$jZmgU2YR2J7L3IGWCAgqye5AvaKF7S8eK9bxxpj2fVXrobgPhF39C', '2022-09-03 22:11:45', '2022-09-03 22:11:45'),
(14, 'Deondre.Wintheiser', 'Cesar.Williamson20@hotmail.com', '$2b$10$oHbLlCqRkFK0.1Zu55UaO.KCYAbzt4fzd9KeBn5ils3Zr7j2nzpli', '2022-12-08 02:21:03', '2022-12-08 02:21:03'),
(15, 'Rodger17', 'Margarita_Reichel60@gmail.com', '$2b$10$2gP9OunJ.tOmnlieEK0K4.h1o8g4Pto7E/mGZDZTr.F3QFH2ciaAi', '2022-09-16 03:09:48', '2022-09-16 03:09:48'),
(16, 'Branson_Abbott', 'Chelsea97@hotmail.com', '$2b$10$idNapP6.ByJ0evvTrQlay.dDTLeM4eDQq0zp73tTi7nIYo3VhpUe2', '2022-10-01 08:34:32', '2022-10-01 08:34:32'),
(17, 'Ahmad53', 'Germaine16@hotmail.com', '$2b$10$.DM7xJ/2SMZZT6MjdTWDCeFeVREeM9ABB5J5XOaZbIm4x.x.1xQxm', '2022-06-01 20:18:43', '2022-06-01 20:18:43'),
(18, 'Florian6', 'Marielle49@hotmail.com', '$2b$10$EJECMS6ccH5CUxNicLTg.uh2Q8UL1Ba.18Wb07DAjfD7HcpKBaHsK', '2022-08-01 07:07:05', '2022-08-01 07:07:05'),
(19, 'Stephanie.Wisozk', 'Jackeline.Smitham@yahoo.com', '$2b$10$NA9qOjRiOVvA3DfwA3HU5.46OlFpW5Kmc2QaiHvKt.3oBg0rohogG', '2022-12-15 12:29:11', '2022-12-15 12:29:11'),
(20, 'Bruce.Turner', 'Paris29@yahoo.com', '$2b$10$Oi3KlWvQeETP9cYSw6V4huNPxPPrQahU1D1zDE39Aon1bHgYo9vom', '2022-09-25 10:05:08', '2022-09-25 10:05:08'),
(21, 'Vella.Mayert', 'Jadyn.Hahn@gmail.com', '$2b$10$yuWu5WVvY0QlyxAe18s7weWR6hXf.5HHQACGMTlixtqksZ/Xu54xy', '2023-02-05 00:59:48', '2023-02-05 00:59:48'),
(22, 'Ewald_Hayes', 'Giovani.Ebert39@gmail.com', '$2b$10$e0VW/nez8DQYFKNb.JDPpO/yY18ScaxH.FRs6cq..G8gTb0NBCjaa', '2022-08-10 20:28:00', '2022-08-10 20:28:00'),
(23, 'Letha.Bradtke29', 'Reagan57@gmail.com', '$2b$10$j3iTEXbnuae2vmi1ilR9seblu8dFhJ2QDejVPrEP4mIIi40UzNsTS', '2022-11-28 03:22:46', '2022-11-28 03:22:46'),
(24, 'George.Kreiger74', 'Lew_Gottlieb@gmail.com', '$2b$10$CoEqhwXShy4b.tD07..BEuuFQ9ZcEMoCcGAndO2KKXsRrfeYfahJu', '2023-01-15 03:11:04', '2023-01-15 03:11:04'),
(25, 'Justice.Cummings70', 'Spencer_Quitzon3@yahoo.com', '$2b$10$NF3yN5UIOSxnrxvoFNtnpOYPRmJQJ8CzKbMblm04WS3WXl8Xe/Xna', '2022-06-29 17:38:57', '2022-06-29 17:38:57'),
(26, 'Samantha17', 'Timothy.Weimann14@gmail.com', '$2b$10$lpU/2ONdqSB7Xq.de/1y0eeNArbpSM.aNaR9.sr5nL8CMnLIvOB8W', '2022-08-07 07:29:34', '2022-08-07 07:29:34'),
(27, 'Elmo.Mertz', 'Blaise_Kozey12@gmail.com', '$2b$10$huq7ZW4gIhV8O9l.LNgipOl2z3sjAYbWWt/InuE.OlygEfomq.tIm', '2022-11-24 08:14:54', '2022-11-24 08:14:54'),
(28, 'Florida_Hand76', 'Anastacio12@yahoo.com', '$2b$10$Fs8ETruyOKdfd.bT96ox4e6TYk77c9n7RqqH6naLkL4y4yuBpMymi', '2022-04-19 13:39:13', '2022-04-19 13:39:13'),
(29, 'Princess95', 'Velva14@gmail.com', '$2b$10$S3e/p3MdKxCTAPLEwxk8dujLsfAyVjL.dvkGAaBPIISUC0CGLJE1C', '2022-11-29 11:19:21', '2022-11-29 11:19:21'),
(30, 'Ryley.Corkery8', 'Hildegard8@gmail.com', '$2b$10$bEo7LnOtPeldUb816AXZHOr7CEJYRVxHTbtg4U11UvrsJxBcdBF5u', '2022-12-06 11:33:21', '2022-12-06 11:33:21'),
(31, 'Adelle.Batz', 'Jaren92@gmail.com', '$2b$10$9JUxn0sLSBYpFX4N7WJ0L.ZIgxQU5F.dSorXELBbkuEsXlbU4J67i', '2023-03-17 11:15:21', '2023-03-17 11:15:21'),
(32, 'Hailey.Rosenbaum65', 'Lily.Greenfelder@gmail.com', '$2b$10$5GNNZWc5O5QfOAf6uEs0SeRJA0yZexnjKsbxwz/MiML3vjLjlS3Vq', '2022-11-30 18:45:41', '2022-11-30 18:45:41'),
(33, 'Michael_Littel', 'Gabriel29@gmail.com', '$2b$10$KNXTXKRMNy170gvfxSW.BuGIdebVUDU/t0ZwfHpyUb.0mfOgtcmNC', '2022-11-12 14:18:46', '2022-11-12 14:18:46'),
(34, 'Alek8', 'Theresa_Kiehn10@yahoo.com', '$2b$10$hC09Pc7gTJEbU0WRT7Gg0.sOgl59NX0XxyigBZ7Z5KUwJAwJAKBAy', '2023-02-02 12:07:03', '2023-02-02 12:07:03'),
(35, 'Asia57', 'Houston.Brown@gmail.com', '$2b$10$K/iw0MOgQ5ll9YHnfVyIk.9oigvAFCz45JXwNegLl0yinmd5rpDGG', '2022-06-23 15:04:49', '2022-06-23 15:04:49'),
(36, 'Francesco7', 'Donavon_Feil72@gmail.com', '$2b$10$xiGANLPaiAj8Zm.MvQ1RgehiVFIX.oETEZEiAvgZJRalE6uoqjASW', '2022-10-14 13:47:07', '2022-10-14 13:47:07'),
(37, 'Reymundo.Gorczany43', 'Hank_Trantow1@gmail.com', '$2b$10$QeGsmGRsjavoZN0ERMjBe.X4hah6pizPiW5VtRRLSECLe5lZAWyeW', '2023-01-29 21:12:11', '2023-01-29 21:12:11'),
(38, 'Ruby_MacGyver30', 'Helga94@hotmail.com', '$2b$10$6fLV5VtCwd6fTA3lpv/YeOyZyMkgY9pHtfZXA/N.beZIkQcIvfuIS', '2022-07-02 06:45:38', '2022-07-02 06:45:38'),
(39, 'Terrence.Pfeffer', 'Roel.Bartoletti@gmail.com', '$2b$10$.JwRiN/aoll.Xyu7QexUSOLRw3LDbq9sEvtDTp9E7ccrLA6RC4Sbq', '2023-01-12 20:01:47', '2023-01-12 20:01:47'),
(40, 'Dominique.Doyle15', 'Marcellus.Cremin43@gmail.com', '$2b$10$RrG7cpHCiIDy8l0cX9ULbe3up1tNvffyOtrszpc0gBNEmuEyp8R0O', '2023-01-17 11:57:24', '2023-01-17 11:57:24'),
(41, 'test123', 'test@gmail.com', '$2b$10$JWeQe0Wd0VfiTwUxot5bWuQsROQ3h1esdUasSCcxZ2WS0ayJf4wNG', '2023-04-15 16:39:22', '2023-04-15 16:39:22'),
(42, 'Samantha17', 'Timothy.Weimann14@gmail.com', '$2b$10$Zmb5yNhq4GxWzmBlaOTIf.xzQIUOoKgWanpd5mD2dD1qOkEOAVAt6', '2023-04-15 16:50:02', '2023-04-15 16:50:02');

-- --------------------------------------------------------

--
-- Structure de la table `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `travel_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `travel_id` (`travel_id`);

--
-- Index pour la table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_travel` (`travel_id`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `travel_id` (`travel_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `scratches`
--
ALTER TABLE `scratches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_travel` (`travel_id`);

--
-- Index pour la table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `travels`
--
ALTER TABLE `travels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `travel_user` (`user_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_username` (`username`),
  ADD KEY `user_email` (`email`);

--
-- Index pour la table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_travel` (`travel_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT pour la table `scratches`
--
ALTER TABLE `scratches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `travels`
--
ALTER TABLE `travels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT pour la table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`travel_id`) REFERENCES `travels` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`travel_id`) REFERENCES `travels` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`travel_id`) REFERENCES `travels` (`id`),
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `scratches`
--
ALTER TABLE `scratches`
  ADD CONSTRAINT `scratches_ibfk_1` FOREIGN KEY (`travel_id`) REFERENCES `travels` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `travels`
--
ALTER TABLE `travels`
  ADD CONSTRAINT `travels_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`travel_id`) REFERENCES `travels` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
