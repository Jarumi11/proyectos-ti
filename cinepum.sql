-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 13, 2023 at 05:35 AM
-- Server version: 8.0.27
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cinepum`
--

-- --------------------------------------------------------

--
-- Table structure for table `cinema_campus`
--

DROP TABLE IF EXISTS `cinema_campus`;
CREATE TABLE IF NOT EXISTS `cinema_campus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(160) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `district` varchar(125) COLLATE utf8mb4_general_ci NOT NULL,
  `province` varchar(125) COLLATE utf8mb4_general_ci NOT NULL,
  `department` varchar(125) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cinema_rooms`
--

DROP TABLE IF EXISTS `cinema_rooms`;
CREATE TABLE IF NOT EXISTS `cinema_rooms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cinema_campus` int NOT NULL,
  `room_number` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `last_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `birth_date` date NOT NULL,
  `city` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
CREATE TABLE IF NOT EXISTS `movies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `img_path` text COLLATE utf8mb4_general_ci,
  `release_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `name`, `description`, `img_path`, `release_date`) VALUES
(1, 'Mario Bros - La Pelicula', 'Un fontanero llamado Mario viaja por un laberinto subterráneo con su hermano, Luigi, intentando salvar a una princesa capturada.', '/images/movies/mario_photo_movie.webp', '2023-04-07'),
(2, 'John Wick 4', 'El marqués Vincent de Gramont pretende matar a John Wick para afianzar su poder en la Orden Suprema. Sin embargo, John tratará de adelantarse a cada uno de sus movimientos hasta lograr enfrentarse cara a cara con su peor enemigo.', '/images/movies/john_wick_movie.jpg', '2023-04-03'),
(3, 'Guardianes de la Galaxia Vol.3', 'Guardianes de la Galaxia vol. 3 es una película de superhéroes estadounidense basada en el equipo de superhéroes Guardianes de la Galaxia, perteneciente a Marvel Comics.', '/images/movies/guardianes_vol_3.webp', '2023-05-24'),
(4, 'Jurassic World: Dominio', 'Cuatro años después de la destrucción de la Isla Nublar, los dinosaurios viven y cazan junto a los humanos en todo el mundo. Este frágil equilibrio remodelará el futuro y determinará si los humanos seguirán siendo o no la especie dominante.', '/images/movies/jurassic_world_dominio_movie.jpg', '2022-12-14'),
(5, 'Spider-Man: Across Spider-Verse', 'Miles Morales se embarca en una aventura épica que transportará al simpático Spiderman de Brooklyn a través del Multiverso para unir fuerzas con Gwen Stacy y un nuevo equipo.', '/images/movies/spider_man_spiderverse_movie.webp', '2023-06-02');

-- --------------------------------------------------------

--
-- Table structure for table `shifts`
--

DROP TABLE IF EXISTS `shifts`;
CREATE TABLE IF NOT EXISTS `shifts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_movie` int NOT NULL,
  `id_cinema_room` int NOT NULL,
  `hour` time NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shifts`
--

INSERT INTO `shifts` (`id`, `id_movie`, `id_cinema_room`, `hour`, `date`) VALUES
(1, 1, 1, '10:00:00', '2023-05-08'),
(2, 2, 2, '14:00:00', '2023-05-08'),
(3, 2, 2, '09:00:00', '2023-05-07'),
(4, 2, 3, '22:00:00', '2023-05-08'),
(5, 1, 4, '12:00:00', '2023-05-16'),
(6, 1, 4, '12:00:00', '2023-05-24');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
