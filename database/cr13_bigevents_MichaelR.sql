-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 14, 2021 at 08:13 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr13_bigevents_MichaelR`
--
CREATE DATABASE IF NOT EXISTS `cr13_bigevents_MichaelR` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cr13_bigevents_MichaelR`;

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210514084213', '2021-05-14 08:42:56', 164);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `fk_type_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datetime` datetime NOT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int(11) NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `fk_type_id`, `name`, `datetime`, `description`, `image`, `capacity`, `contact`, `phone`, `location`, `address`, `zip`, `city`, `url`) VALUES
(1, 5, 'Lady with Fan', '2021-05-14 00:00:00', 'Gustav Klimt‘s Last Works\r\n\r\n25 March 2021 - 13 February 2022\r\n\r\nIt is Gustav Klimt’s last, almost completed painting and a fascinating, self-confident female portrait: Lady with Fan. In Vienna as a loan to the Belvedere, this important late work will be presented at the Upper Belvedere in a special exhibition devoted to Klimt’s final artistic phase.', 'https://events.wien.info/media/full/Dame_mit_F%C3%A4cher.jpg', 200, 'www.belvedere.at', '+43 1 795 57-0', 'Upper Belvedere (Oberes Belvedere)', 'Prinz-Eugen-Straße 27', '1030', 'Vienna', 'https://events.wien.info/en/139j/lady-with-fan/'),
(2, 5, 'Vienna 1900', '2021-05-14 00:00:00', 'The Leopold Museum is a unique treasury of Viennese Modernism and the Wiener Werkstätte. The new permanent exhibition “Vienna 1900. Birth of Modernism” offers insights into the enormous abundance and diversity of the artistic and intellectual achievements of this epoch.', 'https://events.wien.info/media/full/Klimt_Tod_und_Leben_1.jpg', 200, 'office@leopoldmuseum.org', '+43 1 525 70 0', 'Venue Leopold Museum', 'Museumsplatz 1', '1070', 'Vienna', 'www.leopoldmuseum.org'),
(3, 1, 'Piano recital Daniel Barenboim', '2021-05-20 19:30:00', 'Ludwig van Beethoven:\r\nSonate für Klavier f-Moll, op. 2/1\r\nSonate für Klavier C-Dur, op. 2/3\r\nSonate für Klavier A-Dur, op. 2/2\r\nSonate für Klavier Es-Dur, op. 7', 'https://events.wien.info/media/full/MV_GrosserSaal1_1.jpg', 300, 'Wiener Musikverein', '+43 1 505 81 90', 'Musikverein', 'Musikvereinsplatz 1', '1010', 'Vienna', 'www.musikverein.at'),
(4, 1, 'Klavierabend Rudolf Buchbinder', '2021-05-23 11:00:00', '»Beethovens Klaviersonaten VII«\r\n\r\nRudolf Buchbinder, Piano\r\n\r\nLudwig van Beethoven\r\nSonate E-Dur op. 109 (1820)\r\nSonate As-Dur op. 110 (1821)\r\nSonate c-moll op. 111 (1821–1822)', 'https://events.wien.info/media/full/KHGrosserSaalNeu.jpg', 250, 'ticket@konzerthaus.at', '+43 1 242 002', 'Vienna Konzerthaus', 'Lothringerstraße 20', '1030', 'Vienna', 'www.konzerthaus.at'),
(5, 1, 'Tosca', '2021-05-21 18:30:00', 'Opera by Giacomo Puccini\r\n\r\nProduction: Margarethe Wallmann\r\n\r\nRome, 1800: The city suffers from Scarpias, the Chief Constables, reign of terror. The seditious painter Cavaradossi falls into his clutches and is bound to be executed. His beloved Tosca - chased after by Scarpia - strikes a bargain: She answers his desires, and Scarpia will save Cavaradossi by a fake execution with blank cartridges in return. Scarpia agrees, approaches her - and she stabs him to death. But he, too, has not kept his word and ordered to shoot Cavaradossi with real ammunition. With a broken heart, she leaps to her death from the pinnacles of Castel Sant’Angelo.', 'https://events.wien.info/media/full/oper.jpg', 500, 'www.wiener-staatsoper.at', '+43 1 513 1 513', 'Venue Vienna State Opera (Wiener Staatsoper)', 'Opernring 2', '1010', 'Vienna', 'www.culturall.com'),
(6, 4, 'Open House – Sommerbühne Eröffnungsfest', '2021-06-01 19:00:00', 'Eddie Luis & DIE GNADENLOSEN XL Jazz Orchestra\r\nTrio Freundschaftsspiel\r\n\r\npay as you wish! Reservierung erforderlich!', 'https://events.wien.info/media/full/161022992_4131779920186978_4405481608072568907_n.jpg', 300, 'tickets@theateramspittelberg.at', '+43 1 526 13 85', 'Theater am Spittelberg', 'Spittelberggasse 10', '1070', 'Vienna', 'www.theateramspittelberg.at');

-- --------------------------------------------------------

--
-- Table structure for table `events_types`
--

CREATE TABLE `events_types` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events_types`
--

INSERT INTO `events_types` (`id`, `type`) VALUES
(1, 'Music'),
(2, 'Sport'),
(3, 'Movie'),
(4, 'Theater'),
(5, 'Art');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5387574A3563B1BF` (`fk_type_id`);

--
-- Indexes for table `events_types`
--
ALTER TABLE `events_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `events_types`
--
ALTER TABLE `events_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `FK_5387574A3563B1BF` FOREIGN KEY (`fk_type_id`) REFERENCES `events_types` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
