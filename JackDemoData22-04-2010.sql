DELETE FROM `age_limits`;
DELETE FROM `businesses`;
DELETE FROM `categories`;
DELETE FROM `event_instances`;
DELETE FROM `genres`;
DELETE FROM `users`;

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

INSERT INTO `age_limits` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'U', '2010-03-18 18:22:52', '2010-03-18 18:22:52'),
(2, 'PG', '2010-03-18 18:23:24', '2010-03-18 18:23:24'),
(3, '12', '2010-03-18 18:23:56', '2010-03-18 18:23:56'),
(4, '15', '2010-03-18 18:24:42', '2010-03-18 18:24:42'),
(5, '16', '2010-03-18 18:25:18', '2010-03-18 18:25:18'),
(6, '18', '2010-03-18 18:25:51', '2010-03-18 18:25:51');


INSERT INTO `businesses` (`id`, `user_id`, `name`, `address`, `province`, `city`, `country`, `longitude`, `lattitude`, `created_at`, `updated_at`) VALUES
(1, 1, 'Test business', '123 alphabet road', 'dublin', 'dublin', 'ireland', 50, 30, '2010-03-13 16:45:25', '2010-03-13 16:45:25'),
(2, 1, 'joebloggs', 'joebloggs', 'adsf', 'adsf', 'adf', 23, 12, '2010-03-13 16:56:49', '2010-03-13 16:56:49'),
(3, 1, 'mcdonalds', '123 mews', 'dublin', 'dublin', 'ireland', 40, 33, '2010-03-13 17:29:48', '2010-03-13 17:29:48');

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Movie', NULL, NULL),
(2, 'Music Gig', NULL, NULL);

INSERT INTO `event_instances` (`id`, `start`, `end`, `notes`, `ticketPrice`, `doorPrice`, `created_at`, `updated_at`, `age_limit_id`, `genre_id`, `category_id`) VALUES
(2, '2010-03-18 18:35:00', '2010-03-18 19:35:00', 'Up', 8, 10, '2010-03-18 18:35:37', '2010-03-18 18:35:37', 1, 2, 1),
(3, '2010-03-18 18:37:00', '2010-03-18 20:37:00', 'Alice in Wonderland', 10, 12, '2010-03-18 18:38:03', '2010-03-18 18:38:03', 2, 2, 1),
(4, '2010-03-19 18:38:00', '2010-03-19 19:38:00', 'Cheech and Chong up in smoke', 8, 9, '2010-03-18 18:39:14', '2010-03-18 18:39:14', 3, 3, 1),
(5, '2010-03-19 18:39:00', '2010-03-19 20:39:00', 'Avatar 3D', 10, 12, '2010-03-18 18:40:19', '2010-03-18 18:40:19', 4, 1, 1),
(6, '2010-03-18 18:40:00', '2010-03-18 19:40:00', 'Saw IV', 9, 10, '2010-03-18 18:41:22', '2010-03-18 18:41:22', 6, 4, 1),
(7, '2010-03-18 18:42:00', '2010-03-18 19:57:00', 'Honey I shrunk the kids', 7, 9, '2010-03-18 18:43:00', '2010-03-18 18:43:00', 1, 2, 1);

INSERT INTO `genres` (`id`, `name`, `created_at`, `updated_at`, `category_id`) VALUES
(1, 'Action', '2010-03-18 18:26:29', '2010-03-18 18:26:29', 1),
(2, 'Children', '2010-03-18 18:27:17', '2010-03-18 18:27:17', 1),
(3, 'Comedy', '2010-03-18 18:27:52', '2010-03-18 18:27:52', 1),
(4, 'Horror', '2010-03-18 18:28:43', '2010-03-18 18:28:43', 1),
(5, 'Thriller', '2010-03-18 18:29:18', '2010-03-18 18:29:18', 1),
(6, 'Rock', NULL, NULL, 2),
(7, 'Jazz', NULL, NULL, 2),
(8, 'Blues', NULL, NULL, 2);

INSERT INTO `users` (`id`, `login`, `crypted_password`, `password_salt`, `persistence_token`, `login_count`, `last_request_at`, `last_login_at`, `current_login_at`, `last_login_ip`, `current_login_ip`, `created_at`, `updated_at`, `perishable_token`, `email`) VALUES
(1, 'jack', 'cc57fe9226433d2360e1a68a2d785135025c4c8d08eb4bed7ec8ce615fe2f49b7cb723cf8c676257541b427dd61014d5d0758e8f8fd04dd1e36175f1f7336dd3', 'Ga78DUIE_YerhXTiAbEV', '0e312157401ca16ec5c0c0c219ebe419e5096277915d0dc2b9d62f40dc02def65e3fd5c30c7b008e43a8d8f96174dd954be22fc3aff827e8e155ecda7fb4c389', 2, '2010-04-11 20:46:25', '2010-04-11 12:12:37', '2010-04-11 16:34:08', '127.0.0.1', '127.0.0.1', '2010-04-11 12:12:37', '2010-04-11 20:46:25', 'BnguIq-EvGC_x2Jzk1Rx', 'jackgeek@gmail.com');
