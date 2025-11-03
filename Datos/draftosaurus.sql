
CREATE DATABASE IF NOT EXISTS draftosaurus;
USE draftosaurus;



SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";




CREATE TABLE `dinosaurios` (
  `nombre` varchar(50) NOT NULL,
  `color` varchar(20) NOT NULL,
  `puntos` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `dinosaurios` (`nombre`, `color`, `puntos`) VALUES
('Diplodocus', 'azul', 0),
('Estegosaurio', 'rosa', 0),
('Parasaurio', 'amarillo', 0),
('T-Rex', 'rojo', 1),
('Triceratops', 'verde', 0),
('Velociraptor', 'naranja', 0);



CREATE TABLE `jugadas` (
  `jugada_id` int(11) NOT NULL,
  `partida_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `recinto_nombre` varchar(50) NOT NULL,
  `dino_nombre` varchar(50) NOT NULL,
  `turno` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `jugadas` (`jugada_id`, `partida_id`, `usuario_id`, `recinto_nombre`, `dino_nombre`, `turno`, `fecha`) VALUES
(3, 20, 1, 'Bosque Izq 1', 'Parasaurio', 1, '2025-09-14 20:44:14'),
(4, 20, 1, 'Roca Der 2', 'Estegosaurio', 1, '2025-09-14 20:44:34'),
(5, 20, 1, 'Roca Izq', 'T-Rex', 1, '2025-09-14 20:44:43'),
(6, 20, 1, 'Roca Der 1', 'T-Rex', 1, '2025-09-14 20:44:53'),
(7, 20, 1, 'Roca Der 1', 'T-Rex', 1, '2025-09-14 21:32:21'),
(8, 20, 1, 'Bosque Izq 2', 'T-Rex', 1, '2025-09-14 21:32:28'),
(9, 21, 44, 'Roca Izq', 'Parasaurio', 1, '2025-09-14 21:35:26'),
(10, 21, 45, 'Roca Izq', 'Diplodocus', 2, '2025-09-14 21:35:35'),
(11, 22, 46, 'Roca Izq', 'Velociraptor', 1, '2025-09-14 21:36:00'),
(12, 23, 48, 'Roca Izq', 'Velociraptor', 1, '2025-09-14 23:04:10'),
(13, 23, 48, 'Roca Der 2', 'T-Rex', 1, '2025-09-14 23:04:19'),
(14, 23, 48, 'Bosque Izq 2', 'T-Rex', 1, '2025-09-14 23:04:26'),
(15, 23, 48, 'Roca Der 1', 'Velociraptor', 1, '2025-09-14 23:04:29'),
(16, 30, 56, 'Bosque Izq 1', 'Velociraptor', 1, '2025-09-15 01:47:43'),
(17, 30, 57, 'Roca Der 2', 'Diplodocus', 2, '2025-09-15 01:48:08'),
(18, 30, 58, 'Bosque Izq 1', 'Triceratops', 3, '2025-09-15 01:48:15'),
(19, 33, 62, 'Bosque Izq 1', 'Parasaurio', 1, '2025-09-15 02:38:49'),
(20, 33, 63, 'Bosque Izq 2', 'Triceratops', 2, '2025-09-15 02:38:58'),
(21, 33, 62, 'Bosque Izq 2', 'Estegosaurio', 1, '2025-09-15 02:39:12'),
(22, 33, 63, 'Roca Der 2', 'Diplodocus', 2, '2025-09-15 02:39:23'),
(23, 33, 62, 'Roca Izq', 'Diplodocus', 1, '2025-09-15 02:39:44'),
(24, 33, 63, 'Bosque Izq 1', 'T-Rex', 2, '2025-09-15 02:39:51'),
(25, 33, 62, 'Bosque Der T-Rex', 'Estegosaurio', 1, '2025-09-15 02:40:05'),
(26, 33, 63, 'Roca Izq', 'T-Rex', 2, '2025-09-15 02:40:12'),
(27, 33, 62, 'Roca Der 1', 'T-Rex', 1, '2025-09-15 02:40:19'),
(28, 33, 63, 'Roca Der 1', 'Parasaurio', 2, '2025-09-15 02:40:54'),
(29, 33, 62, 'Roca Der 2', 'Velociraptor', 1, '2025-09-15 02:40:59'),
(30, 33, 63, 'Rio', 'Triceratops', 2, '2025-09-15 02:41:28'),
(31, 34, 64, 'Roca Izq', 'Parasaurio', 1, '2025-09-15 14:48:05'),
(32, 34, 65, 'Roca Izq', 'T-Rex', 2, '2025-09-15 14:48:15'),
(33, 35, 66, 'Roca Izq', 'Diplodocus', 1, '2025-09-15 14:48:40'),
(34, 35, 66, 'Roca Der 2', 'Velociraptor', 1, '2025-09-15 14:48:46'),
(35, 36, 68, 'Bosque Izq 1', 'Velociraptor', 1, '2025-09-15 17:20:27'),
(36, 37, 69, 'Bosque Izq 1', 'Triceratops', 1, '2025-09-15 17:20:40'),
(37, 37, 70, 'Roca Izq', 'Triceratops', 2, '2025-09-15 17:20:44'),
(38, 42, 77, 'Bosque Izq 2', 'Parasaurio', 1, '2025-10-28 00:28:50'),
(39, 47, 82, 'Bosque Izq 1', 'Diplodocus', 1, '2025-10-29 01:18:12'),
(40, 47, 83, 'Roca Izq', 'Parasaurio', 2, '2025-10-29 01:18:20'),
(41, 47, 82, 'Roca Izq', 'Diplodocus', 1, '2025-10-29 01:18:33'),
(42, 48, 84, 'Bosque Izq 2', 'Triceratops', 1, '2025-10-29 01:19:44'),
(43, 49, 84, 'Roca Der 2', 'T-Rex', 1, '2025-10-29 01:29:49');


CREATE TABLE `jugadores` (
  `partida_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `puntos_totales` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `jugadores` (`partida_id`, `usuario_id`, `puntos_totales`) VALUES
(1, 3, 0),
(1, 4, 0),
(1, 5, 0),
(2, 9, 0),
(2, 10, 0),
(16, 37, 0),
(17, 38, 0),
(17, 39, 0),
(18, 40, 0),
(19, 41, 0),
(20, 42, 0),
(20, 43, 0),
(21, 44, 0),
(21, 45, 0),
(22, 46, 0),
(23, 48, 0),
(24, 49, 0),
(25, 50, 0),
(26, 51, 0),
(26, 52, 0),
(27, 53, 0),
(28, 54, 0),
(29, 55, 0),
(30, 56, 0),
(30, 57, 0),
(30, 58, 0),
(30, 59, 0),
(31, 60, 0),
(32, 61, 0),
(33, 62, 0),
(33, 63, 0),
(34, 64, 0),
(34, 65, 0),
(35, 66, 0),
(36, 68, 0),
(37, 69, 0),
(37, 70, 0),
(38, 71, 0),
(39, 72, 0),
(39, 73, 0),
(40, 74, 0),
(41, 75, 0),
(41, 76, 0),
(42, 77, 0),
(43, 78, 0),
(44, 79, 0),
(45, 80, 0),
(46, 81, 0),
(47, 82, 0),
(47, 83, 0),
(48, 84, 0),
(48, 85, 0),
(48, 86, 0),
(48, 87, 0),
(49, 84, 0);



CREATE TABLE `manos` (
  `mano_id` int(11) NOT NULL,
  `partida_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `dino_nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `manos` (`mano_id`, `partida_id`, `usuario_id`, `dino_nombre`) VALUES
(1, 19, 41, 'T-Rex'),
(2, 19, 41, 'Triceratops'),
(3, 19, 41, 'Estegosaurio'),
(4, 19, 41, 'Velociraptor'),
(5, 19, 41, 'Diplodocus'),
(6, 19, 41, 'Diplodocus'),
(43, 20, 43, 'Parasaurio'),
(44, 20, 43, 'T-Rex'),
(45, 20, 43, 'Parasaurio'),
(46, 20, 43, 'Estegosaurio'),
(47, 20, 43, 'Estegosaurio'),
(48, 20, 43, 'Triceratops'),
(49, 20, 42, 'T-Rex'),
(50, 20, 42, 'Estegosaurio'),
(51, 20, 42, 'Parasaurio'),
(52, 20, 42, 'Estegosaurio'),
(53, 20, 42, 'Estegosaurio'),
(54, 20, 42, 'Velociraptor'),
(67, 21, 45, 'T-Rex'),
(68, 21, 45, 'Parasaurio'),
(69, 21, 45, 'Velociraptor'),
(70, 21, 45, 'Estegosaurio'),
(71, 21, 45, 'Parasaurio'),
(72, 21, 44, 'Parasaurio'),
(73, 21, 44, 'Estegosaurio'),
(74, 21, 44, 'T-Rex'),
(75, 21, 44, 'Estegosaurio'),
(76, 21, 44, 'Estegosaurio'),
(83, 22, 46, 'Triceratops'),
(84, 22, 46, 'Estegosaurio'),
(85, 22, 46, 'T-Rex'),
(86, 22, 46, 'Triceratops'),
(87, 22, 46, 'Velociraptor'),
(106, 23, 48, 'Triceratops'),
(107, 23, 48, 'Diplodocus'),
(108, 24, 49, 'Diplodocus'),
(109, 24, 49, 'Diplodocus'),
(110, 24, 49, 'T-Rex'),
(111, 24, 49, 'Estegosaurio'),
(112, 24, 49, 'Parasaurio'),
(113, 24, 49, 'T-Rex'),
(114, 25, 50, 'Velociraptor'),
(115, 25, 50, 'Velociraptor'),
(116, 25, 50, 'T-Rex'),
(117, 25, 50, 'Triceratops'),
(118, 25, 50, 'Parasaurio'),
(119, 25, 50, 'Diplodocus'),
(120, 26, 51, 'T-Rex'),
(121, 26, 51, 'Estegosaurio'),
(122, 26, 51, 'Diplodocus'),
(123, 26, 51, 'Velociraptor'),
(124, 26, 51, 'Diplodocus'),
(125, 26, 51, 'Velociraptor'),
(126, 26, 52, 'Parasaurio'),
(127, 26, 52, 'Estegosaurio'),
(128, 26, 52, 'Estegosaurio'),
(129, 26, 52, 'Estegosaurio'),
(130, 26, 52, 'Diplodocus'),
(131, 26, 52, 'Parasaurio'),
(132, 27, 53, 'Velociraptor'),
(133, 27, 53, 'Triceratops'),
(134, 27, 53, 'Velociraptor'),
(135, 27, 53, 'T-Rex'),
(136, 27, 53, 'Triceratops'),
(137, 27, 53, 'T-Rex'),
(138, 28, 54, 'Estegosaurio'),
(139, 28, 54, 'Triceratops'),
(140, 28, 54, 'Diplodocus'),
(141, 28, 54, 'Diplodocus'),
(142, 28, 54, 'Parasaurio'),
(143, 28, 54, 'Parasaurio'),
(144, 29, 55, 'T-Rex'),
(145, 29, 55, 'Parasaurio'),
(146, 29, 55, 'Velociraptor'),
(147, 29, 55, 'Triceratops'),
(148, 29, 55, 'Velociraptor'),
(149, 29, 55, 'T-Rex'),
(151, 30, 56, 'Diplodocus'),
(152, 30, 56, 'Parasaurio'),
(153, 30, 56, 'Parasaurio'),
(154, 30, 56, 'Triceratops'),
(155, 30, 56, 'Parasaurio'),
(157, 30, 57, 'Velociraptor'),
(158, 30, 57, 'Estegosaurio'),
(159, 30, 57, 'Parasaurio'),
(160, 30, 57, 'Diplodocus'),
(161, 30, 57, 'Triceratops'),
(163, 30, 58, 'Diplodocus'),
(164, 30, 58, 'T-Rex'),
(165, 30, 58, 'Parasaurio'),
(166, 30, 58, 'T-Rex'),
(167, 30, 58, 'T-Rex'),
(168, 30, 59, 'Triceratops'),
(169, 30, 59, 'Estegosaurio'),
(170, 30, 59, 'T-Rex'),
(171, 30, 59, 'Estegosaurio'),
(172, 30, 59, 'Parasaurio'),
(173, 30, 59, 'Diplodocus'),
(174, 31, 60, 'Velociraptor'),
(175, 31, 60, 'Estegosaurio'),
(176, 31, 60, 'Parasaurio'),
(177, 31, 60, 'Estegosaurio'),
(178, 31, 60, 'T-Rex'),
(179, 31, 60, 'Velociraptor'),
(180, 32, 61, 'Parasaurio'),
(181, 32, 61, 'Parasaurio'),
(182, 32, 61, 'Diplodocus'),
(183, 32, 61, 'Estegosaurio'),
(184, 32, 61, 'Diplodocus'),
(185, 32, 61, 'Velociraptor'),
(240, 34, 65, 'Diplodocus'),
(241, 34, 65, 'Velociraptor'),
(242, 34, 65, 'Velociraptor'),
(243, 34, 65, 'Diplodocus'),
(244, 34, 65, 'Estegosaurio'),
(245, 34, 64, 'Velociraptor'),
(246, 34, 64, 'Triceratops'),
(247, 34, 64, 'Triceratops'),
(248, 34, 64, 'Velociraptor'),
(249, 34, 64, 'Velociraptor'),
(261, 35, 66, 'Parasaurio'),
(262, 35, 66, 'Parasaurio'),
(263, 35, 66, 'Estegosaurio'),
(264, 35, 66, 'Estegosaurio'),
(271, 36, 68, 'Diplodocus'),
(272, 36, 68, 'Velociraptor'),
(273, 36, 68, 'Estegosaurio'),
(274, 36, 68, 'Velociraptor'),
(275, 36, 68, 'Velociraptor'),
(288, 37, 70, 'T-Rex'),
(289, 37, 70, 'Estegosaurio'),
(290, 37, 70, 'Parasaurio'),
(291, 37, 70, 'Diplodocus'),
(292, 37, 70, 'Estegosaurio'),
(293, 37, 69, 'Triceratops'),
(294, 37, 69, 'Parasaurio'),
(295, 37, 69, 'Velociraptor'),
(296, 37, 69, 'Velociraptor'),
(297, 37, 69, 'Triceratops'),
(298, 38, 71, 'Estegosaurio'),
(299, 38, 71, 'Parasaurio'),
(300, 38, 71, 'T-Rex'),
(301, 38, 71, 'Triceratops'),
(302, 38, 71, 'Triceratops'),
(303, 38, 71, 'Diplodocus'),
(304, 39, 72, 'T-Rex'),
(305, 39, 72, 'Estegosaurio'),
(306, 39, 72, 'Estegosaurio'),
(307, 39, 72, 'Velociraptor'),
(308, 39, 72, 'Parasaurio'),
(309, 39, 72, 'Parasaurio'),
(310, 39, 73, 'Diplodocus'),
(311, 39, 73, 'Estegosaurio'),
(312, 39, 73, 'Velociraptor'),
(313, 39, 73, 'Triceratops'),
(314, 39, 73, 'Parasaurio'),
(315, 39, 73, 'Triceratops'),
(316, 40, 74, 'Estegosaurio'),
(317, 40, 74, 'Estegosaurio'),
(318, 40, 74, 'Triceratops'),
(319, 40, 74, 'Diplodocus'),
(320, 40, 74, 'Velociraptor'),
(321, 40, 74, 'Velociraptor'),
(322, 41, 75, 'T-Rex'),
(323, 41, 75, 'Diplodocus'),
(324, 41, 75, 'Diplodocus'),
(325, 41, 75, 'Velociraptor'),
(326, 41, 75, 'T-Rex'),
(327, 41, 75, 'Diplodocus'),
(328, 41, 76, 'Parasaurio'),
(329, 41, 76, 'Diplodocus'),
(330, 41, 76, 'Triceratops'),
(331, 41, 76, 'Parasaurio'),
(332, 41, 76, 'Estegosaurio'),
(333, 41, 76, 'Parasaurio'),
(340, 42, 77, 'Parasaurio'),
(341, 42, 77, 'Diplodocus'),
(342, 42, 77, 'T-Rex'),
(343, 42, 77, 'Triceratops'),
(344, 42, 77, 'Estegosaurio'),
(345, 43, 78, 'Diplodocus'),
(346, 43, 78, 'Parasaurio'),
(347, 43, 78, 'Parasaurio'),
(348, 43, 78, 'Estegosaurio'),
(349, 43, 78, 'T-Rex'),
(350, 43, 78, 'T-Rex'),
(351, 44, 79, 'Parasaurio'),
(352, 44, 79, 'Triceratops'),
(353, 44, 79, 'Velociraptor'),
(354, 44, 79, 'Estegosaurio'),
(355, 44, 79, 'Triceratops'),
(356, 44, 79, 'Diplodocus'),
(357, 45, 80, 'Estegosaurio'),
(358, 45, 80, 'T-Rex'),
(359, 45, 80, 'Diplodocus'),
(360, 45, 80, 'T-Rex'),
(361, 45, 80, 'Diplodocus'),
(362, 45, 80, 'Diplodocus'),
(363, 46, 81, 'Velociraptor'),
(364, 46, 81, 'T-Rex'),
(365, 46, 81, 'Velociraptor'),
(366, 46, 81, 'Velociraptor'),
(367, 46, 81, 'Triceratops'),
(368, 46, 81, 'Estegosaurio'),
(381, 47, 83, 'Triceratops'),
(382, 47, 83, 'Velociraptor'),
(383, 47, 83, 'Estegosaurio'),
(384, 47, 83, 'Velociraptor'),
(385, 47, 83, 'Estegosaurio'),
(386, 47, 82, 'Parasaurio'),
(388, 47, 82, 'Estegosaurio'),
(389, 47, 82, 'Diplodocus'),
(390, 47, 82, 'Triceratops'),
(392, 48, 84, 'Velociraptor'),
(393, 48, 84, 'T-Rex'),
(394, 48, 84, 'T-Rex'),
(395, 48, 84, 'Velociraptor'),
(396, 48, 84, 'Parasaurio'),
(397, 48, 85, 'Triceratops'),
(398, 48, 85, 'T-Rex'),
(399, 48, 85, 'Diplodocus'),
(400, 48, 85, 'Triceratops'),
(401, 48, 85, 'Estegosaurio'),
(402, 48, 85, 'Parasaurio'),
(403, 48, 86, 'Parasaurio'),
(404, 48, 86, 'Triceratops'),
(405, 48, 86, 'Triceratops'),
(406, 48, 86, 'Diplodocus'),
(407, 48, 86, 'Triceratops'),
(408, 48, 86, 'Velociraptor'),
(409, 48, 87, 'Diplodocus'),
(410, 48, 87, 'Triceratops'),
(411, 48, 87, 'Velociraptor'),
(412, 48, 87, 'Parasaurio'),
(413, 48, 87, 'Triceratops'),
(414, 48, 87, 'Parasaurio'),
(421, 49, 84, 'Parasaurio'),
(422, 49, 84, 'Diplodocus'),
(423, 49, 84, 'T-Rex'),
(424, 49, 84, 'Triceratops'),
(425, 49, 84, 'Parasaurio');



CREATE TABLE `partidas` (
  `partida_id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `cantidad_jugadores` int(11) NOT NULL,
  `estado` varchar(20) DEFAULT 'en curso'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `partidas` (`partida_id`, `fecha`, `cantidad_jugadores`, `estado`) VALUES
(1, '2025-09-13 21:05:14', 3, 'en curso'),
(2, '2025-09-13 21:05:37', 5, 'en curso'),
(3, '2025-09-13 21:05:47', 5, 'en curso'),
(4, '2025-09-13 22:50:13', 2, 'en curso'),
(5, '2025-09-14 00:29:52', 2, 'en curso'),
(6, '2025-09-14 00:53:40', 2, 'en curso'),
(7, '2025-09-14 17:09:28', 2, 'en curso'),
(8, '2025-09-14 18:38:09', 4, 'en curso'),
(9, '2025-09-14 18:38:17', 1, 'en curso'),
(10, '2025-09-14 18:54:27', 1, 'en curso'),
(11, '2025-09-14 18:54:40', 2, 'en curso'),
(12, '2025-09-14 19:27:24', 1, 'en curso'),
(13, '2025-09-14 19:28:03', 2, 'en curso'),
(14, '2025-09-14 20:36:34', 1, 'en curso'),
(15, '2025-09-14 20:36:39', 4, 'en curso'),
(16, '2025-09-14 20:39:41', 1, 'en curso'),
(17, '2025-09-14 20:40:00', 2, 'en curso'),
(18, '2025-09-14 20:40:29', 1, 'en curso'),
(19, '2025-09-14 20:43:54', 1, 'en curso'),
(20, '2025-09-14 20:44:01', 2, 'en curso'),
(21, '2025-09-14 21:35:11', 2, 'en curso'),
(22, '2025-09-14 21:35:55', 1, 'en curso'),
(23, '2025-09-14 23:03:59', 1, 'en curso'),
(24, '2025-09-15 00:44:11', 1, 'en curso'),
(25, '2025-09-15 00:44:13', 1, 'en curso'),
(26, '2025-09-15 00:44:15', 2, 'en curso'),
(27, '2025-09-15 00:44:28', 1, 'en curso'),
(28, '2025-09-15 00:49:01', 1, 'en curso'),
(29, '2025-09-15 01:07:16', 1, 'en curso'),
(30, '2025-09-15 01:47:39', 4, 'en curso'),
(31, '2025-09-15 02:18:01', 1, 'en curso'),
(32, '2025-09-15 02:20:46', 1, 'en curso'),
(33, '2025-09-15 02:38:20', 2, 'en curso'),
(34, '2025-09-15 14:47:55', 2, 'en curso'),
(35, '2025-09-15 14:48:35', 1, 'en curso'),
(36, '2025-09-15 17:20:23', 1, 'en curso'),
(37, '2025-09-15 17:20:36', 2, 'en curso'),
(38, '2025-10-28 00:27:29', 1, 'en curso'),
(39, '2025-10-28 00:27:32', 2, 'en curso'),
(40, '2025-10-28 00:28:03', 1, 'en curso'),
(41, '2025-10-28 00:28:07', 2, 'en curso'),
(42, '2025-10-28 00:28:42', 1, 'en curso'),
(43, '2025-10-28 00:31:22', 1, 'en curso'),
(44, '2025-10-28 00:31:23', 1, 'en curso'),
(45, '2025-10-28 00:48:15', 1, 'en curso'),
(46, '2025-10-28 23:19:08', 1, 'en curso'),
(47, '2025-10-29 01:15:48', 2, 'en curso'),
(48, '2025-10-29 01:19:38', 4, 'en curso'),
(49, '2025-10-29 01:28:44', 1, 'en curso');



CREATE TABLE `recintos` (
  `nombre` varchar(50) NOT NULL,
  `zona` varchar(20) DEFAULT NULL,
  `lado` varchar(10) DEFAULT NULL,
  `puntos_base` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `recintos` (`nombre`, `zona`, `lado`, `puntos_base`) VALUES
('Bosque Der T-Rex', 'bosque', 'der', 5),
('Bosque Izq 1', 'bosque', 'izq', 2),
('Bosque Izq 2', 'bosque', 'izq', 2),
('Río', 'rio', 'centro', 0),
('Roca Der 1', 'roca', 'der', 2),
('Roca Der 2', 'roca', 'der', 2),
('Roca Izq', 'roca', 'izq', 2);



CREATE TABLE `usuarios` (
  `usuario_id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `usuarios` (`usuario_id`, `nombre`, `email`, `contrasena`) VALUES
(1, 'admin', 'admin@sydneycorp.com', 'admin1234'),
(2, 'Lazaro', 'if6029869@gmail.com', '$2y$10$1DfDhwMOYm24ggSVJMWQM.O6qwFrWUIXySWvDeYbe6Fhi6pJHGuEO'),
(3, 'lucia', 'jugador1@draftosaurus.com', '$2y$10$PIzDq73uYZrleyD7EmtS8evnwXq1eQTeH8VHO0falK0HwJRzW.4hi'),
(4, 'lazaro', 'jugador2@draftosaurus.com', '$2y$10$x55LWeDVwxhtBq6o0Y2ja.Q9T0jUFFcKvxrdDTcZ9f35ErxRVd28W'),
(5, '', 'jugador3@draftosaurus.com', '$2y$10$uB3gGf90pduHJvG44glVlOlmfSOMz.KSf5ee1AmIPKZJkUm07xpGG'),
(9, '', 'jugador4@draftosaurus.com', '$2y$10$/oir0ZheCafO0q1E9tP.newA1U8plXNeAM6YbMKTwR77BYJy/VdXa'),
(10, '', 'jugador5@draftosaurus.com', '$2y$10$I1oLSgU2JBOkCTwhg8xy.uVOscuZkX6TBQjrHe2ppXMlLmPm8OJxq'),
(16, 'Lazaro', 'fredick2211@gmail.com', '1234'),
(37, 'Jugador1', 'jugador1_partida16@draftosaurus.com', '1234'),
(38, 'Jugador1', 'jugador1_partida17@draftosaurus.com', '1234'),
(39, 'Jugador2', 'jugador2_partida17@draftosaurus.com', '1234'),
(40, 'Jugador1', 'jugador1_partida18@draftosaurus.com', '1234'),
(41, 'Jugador1', 'jugador1_partida19@draftosaurus.com', '1234'),
(42, 'Jugador1', 'jugador1_partida20@draftosaurus.com', '1234'),
(43, 'Jugador2', 'jugador2_partida20@draftosaurus.com', '1234'),
(44, 'Jugador1', 'jugador1_partida21@draftosaurus.com', '1234'),
(45, 'Jugador2', 'jugador2_partida21@draftosaurus.com', '1234'),
(46, 'Jugador1', 'jugador1_partida22@draftosaurus.com', '1234'),
(47, 'lucia', 'luciaramirez@gmail.com', 'lucia1234'),
(48, 'Jugador1', 'jugador1_partida23@draftosaurus.com', '1234'),
(49, 'Jugador1', 'jugador1_partida24@draftosaurus.com', '1234'),
(50, 'Jugador1', 'jugador1_partida25@draftosaurus.com', '1234'),
(51, 'Jugador1', 'jugador1_partida26@draftosaurus.com', '1234'),
(52, 'Jugador2', 'jugador2_partida26@draftosaurus.com', '1234'),
(53, 'Jugador1', 'jugador1_partida27@draftosaurus.com', '1234'),
(54, 'Jugador1', 'jugador1_partida28@draftosaurus.com', '1234'),
(55, 'Jugador1', 'jugador1_partida29@draftosaurus.com', '1234'),
(56, 'Jugador1', 'jugador1_partida30@draftosaurus.com', '1234'),
(57, 'Jugador2', 'jugador2_partida30@draftosaurus.com', '1234'),
(58, 'Jugador3', 'jugador3_partida30@draftosaurus.com', '1234'),
(59, 'Jugador4', 'jugador4_partida30@draftosaurus.com', '1234'),
(60, 'Jugador1', 'jugador1_partida31@draftosaurus.com', '1234'),
(61, 'Jugador1', 'jugador1_partida32@draftosaurus.com', '1234'),
(62, 'Jugador1', 'jugador1_partida33@draftosaurus.com', '1234'),
(63, 'Jugador2', 'jugador2_partida33@draftosaurus.com', '1234'),
(64, 'Jugador1', 'jugador1_partida34@draftosaurus.com', '1234'),
(65, 'Jugador2', 'jugador2_partida34@draftosaurus.com', '1234'),
(66, 'Jugador1', 'jugador1_partida35@draftosaurus.com', '1234'),
(68, 'Jugador1', 'jugador1_partida36@draftosaurus.com', '1234'),
(69, 'Jugador1', 'jugador1_partida37@draftosaurus.com', '1234'),
(70, 'Jugador2', 'jugador2_partida37@draftosaurus.com', '1234'),
(71, 'Jugador1', 'jugador1_partida38@draftosaurus.com', '1234'),
(72, 'Jugador1', 'jugador1_partida39@draftosaurus.com', '1234'),
(73, 'Jugador2', 'jugador2_partida39@draftosaurus.com', '1234'),
(74, 'Jugador1', 'jugador1_partida40@draftosaurus.com', '1234'),
(75, 'Jugador1', 'jugador1_partida41@draftosaurus.com', '1234'),
(76, 'Jugador2', 'jugador2_partida41@draftosaurus.com', '1234'),
(77, 'Jugador1', 'jugador1_partida42@draftosaurus.com', '1234'),
(78, 'Jugador1', 'jugador1_partida43@draftosaurus.com', '1234'),
(79, 'Jugador1', 'jugador1_partida44@draftosaurus.com', '1234'),
(80, 'Jugador1', 'jugador1_partida45@draftosaurus.com', '1234'),
(81, 'Jugador1', 'jugador1_partida46@draftosaurus.com', '1234'),
(82, 'Jugador1', 'jugador1_partida47@draftosaurus.com', '1234'),
(83, 'Jugador2', 'jugador2_partida47@draftosaurus.com', '1234'),
(84, 'Lazaro', 'lazarofernandez@gmail.com', '1234'),
(85, 'Jugador2', 'jugador2_partida48@draftosaurus.com', '1234'),
(86, 'Jugador3', 'jugador3_partida48@draftosaurus.com', '1234'),
(87, 'Jugador4', 'jugador4_partida48@draftosaurus.com', '1234'),
(88, 'david', 'david1234@gmail.com', 'davis1234');


CREATE TABLE `vw_ranking` (
`jugador` varchar(50)
,`puntos_totales` decimal(22,0)
,`jugadas` bigint(21)
);


DROP TABLE IF EXISTS `vw_ranking`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_ranking`  AS SELECT `u`.`nombre` AS `jugador`, sum(case when `j`.`dino_nombre` = 'T-Rex' then 1 else 0 end) AS `puntos_totales`, count(`j`.`jugada_id`) AS `jugadas` FROM (`jugadas` `j` join `usuarios` `u` on(`j`.`usuario_id` = `u`.`usuario_id`)) GROUP BY `j`.`usuario_id` ORDER BY sum(case when `j`.`dino_nombre` = 'T-Rex' then 1 else 0 end) DESC ;


ALTER TABLE `dinosaurios`
  ADD PRIMARY KEY (`nombre`);


ALTER TABLE `jugadas`
  ADD PRIMARY KEY (`jugada_id`),
  ADD KEY `partida_id` (`partida_id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `recinto_nombre` (`recinto_nombre`),
  ADD KEY `dino_nombre` (`dino_nombre`);


ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`partida_id`,`usuario_id`),
  ADD KEY `usuario_id` (`usuario_id`);


ALTER TABLE `manos`
  ADD PRIMARY KEY (`mano_id`),
  ADD KEY `partida_id` (`partida_id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `dino_nombre` (`dino_nombre`);


ALTER TABLE `partidas`
  ADD PRIMARY KEY (`partida_id`);


ALTER TABLE `recintos`
  ADD PRIMARY KEY (`nombre`);


ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`),
  ADD UNIQUE KEY `email` (`email`);



ALTER TABLE `jugadas`
  MODIFY `jugada_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;


ALTER TABLE `manos`
  MODIFY `mano_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=426;


ALTER TABLE `partidas`
  MODIFY `partida_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;


ALTER TABLE `usuarios`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;


ALTER TABLE `jugadas`
  ADD CONSTRAINT `jugadas_ibfk_1` FOREIGN KEY (`partida_id`) REFERENCES `partidas` (`partida_id`),
  ADD CONSTRAINT `jugadas_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`),
  ADD CONSTRAINT `jugadas_ibfk_3` FOREIGN KEY (`recinto_nombre`) REFERENCES `recintos` (`nombre`),
  ADD CONSTRAINT `jugadas_ibfk_4` FOREIGN KEY (`dino_nombre`) REFERENCES `dinosaurios` (`nombre`);


ALTER TABLE `jugadores`
  ADD CONSTRAINT `jugadores_ibfk_1` FOREIGN KEY (`partida_id`) REFERENCES `partidas` (`partida_id`),
  ADD CONSTRAINT `jugadores_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`);


ALTER TABLE `manos`
  ADD CONSTRAINT `manos_ibfk_1` FOREIGN KEY (`partida_id`) REFERENCES `partidas` (`partida_id`),
  ADD CONSTRAINT `manos_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`),
  ADD CONSTRAINT `manos_ibfk_3` FOREIGN KEY (`dino_nombre`) REFERENCES `dinosaurios` (`nombre`);
COMMIT;

