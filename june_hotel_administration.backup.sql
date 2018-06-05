-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 05, 2018 at 09:56 AM
-- Server version: 5.7.22-0ubuntu18.04.1
-- PHP Version: 7.2.5-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `june_hotel_administration`
--

-- --------------------------------------------------------

--
-- Table structure for table `beds`
--

CREATE TABLE `beds` (
  `bed_id` int(11) NOT NULL,
  `bed_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `beds`
--

INSERT INTO `beds` (`bed_id`, `bed_name`) VALUES
(1, '1 place'),
(2, '2 places'),
(3, '3 places'),
(4, 'king size'),
(5, 'queen size');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`) VALUES
(1, 'materiel'),
(2, 'bien-être'),
(3, 'repas'),
(4, 'alcool'),
(5, 'special');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `cli_id` int(11) NOT NULL,
  `cli_name` varchar(45) DEFAULT NULL,
  `cli_firstname` varchar(45) DEFAULT NULL,
  `cli_phone` int(11) DEFAULT NULL,
  `cli_email` varchar(45) DEFAULT NULL,
  `cli_adress` varchar(45) DEFAULT NULL,
  `cli_securepass` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`cli_id`, `cli_name`, `cli_firstname`, `cli_phone`, `cli_email`, `cli_adress`, `cli_securepass`) VALUES
(1, 'Ben-khom', 'Muhammad', 660033011, 'Muha.ben@gomail.com', '12 rue du jardiland', 'G7G7645EYGIUHYTR56D6RTFHJKJH78HG8'),
(2, 'Stefan', 'Jorakosski', 116512512, 'Ste.jora@gokar.pl', '222, Pl 5, Fortnk strasse', 'GT67G455E3ZER7YU87T65RE6');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `res_id` int(11) NOT NULL,
  `res_fk_cli_id` int(11) NOT NULL,
  `res_start` date DEFAULT NULL,
  `res_end` date DEFAULT NULL,
  `res_totalprice` int(11) DEFAULT NULL,
  `res_fk_status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`res_id`, `res_fk_cli_id`, `res_start`, `res_end`, `res_totalprice`, `res_fk_status_id`) VALUES
(1, 1, '2018-06-06', '2018-06-14', 355, 1),
(2, 1, '2018-06-06', '2018-06-14', 125, 1),
(3, 2, '2018-06-12', '2018-06-14', 2400, 2);

-- --------------------------------------------------------

--
-- Table structure for table `reservation_status`
--

CREATE TABLE `reservation_status` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservation_status`
--

INSERT INTO `reservation_status` (`status_id`, `status_name`) VALUES
(1, 'ordered'),
(2, 'paid'),
(3, 'cancelled by client'),
(4, 'cancelled by hotel - no refund'),
(5, 'cancelled by hotel - refunded');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `roo_id` int(11) NOT NULL,
  `roo_name` varchar(45) DEFAULT NULL,
  `roo_size` int(45) DEFAULT NULL,
  `roo_suite` tinyint(1) DEFAULT NULL,
  `roo_floor` int(11) DEFAULT NULL,
  `roo_view` varchar(45) DEFAULT NULL,
  `roo_access_disabled` tinyint(1) DEFAULT NULL,
  `roo_fk_bed_id` int(11) DEFAULT NULL,
  `roo_shower` int(11) DEFAULT NULL,
  `roo_bathtub` int(11) DEFAULT NULL,
  `roo_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`roo_id`, `roo_name`, `roo_size`, `roo_suite`, `roo_floor`, `roo_view`, `roo_access_disabled`, `roo_fk_bed_id`, `roo_shower`, `roo_bathtub`, `roo_price`) VALUES
(1, 'Triton', 25, 0, -1, 'Le local à poubelle', 1, 2, 1, 0, 450),
(2, 'Trident marin', 35, 0, 1, 'Le local à poubelles vu du dessus', 1, 4, 2, 0, 600),
(3, 'Murène', 33, 0, 1, 'Parking', 1, 2, 1, 1, 630),
(4, 'Nave del grande armadura', 45, 1, 2, 'Magnifique coucher de soleil sur la plage ', 0, 2, 2, 2, 1200),
(5, 'La Santa Maria', 120, 1, 3, 'Terre à tribord, captain !', 0, 5, 5, 5, 2400);

-- --------------------------------------------------------

--
-- Table structure for table `roo_res_associative`
--

CREATE TABLE `roo_res_associative` (
  `rore_id` int(11) NOT NULL,
  `rore_fk_roo_id` int(11) NOT NULL,
  `rore_fk_res_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roo_res_associative`
--

INSERT INTO `roo_res_associative` (`rore_id`, `rore_fk_roo_id`, `rore_fk_res_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `ser_id` int(11) NOT NULL,
  `ser_name` varchar(45) DEFAULT NULL,
  `ser_descr` varchar(455) DEFAULT NULL,
  `ser_price` decimal(10,0) DEFAULT NULL,
  `ser_fk_cat_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`ser_id`, `ser_name`, `ser_descr`, `ser_price`, `ser_fk_cat_id`) VALUES
(1, 'Champomy', 'Une bouteille de champomy.\r\nUne quantité vaut une bouteille. Pas plus de 1 bouteille par jour et par commande.', '15', 4),
(2, 'Champagne (bouteille)', 'Une bouteille de Champagne.\r\nUne quantité vaut une bouteille. Pas plus de 1 bouteille par jour et par commande.', '40', 4),
(3, 'Champagne (coupe)', 'Une coupe de Champagne.\r\nUne quantité vaut une coupe. Pas plus de 4 coupes par jour et par commande.', '15', 4),
(4, 'Bière', 'Une cannette de bière.\r\nUne quantité vaut une cannette. Pas plus de 2 cannettes par jour et par commande.', '8', 4),
(5, 'serviette de plage', 'Location d\'un lot de serviettes de bain.\r\nUn set vaut pour toutes les personnes de la commande pour un jour.', '12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `services_available`
--

CREATE TABLE `services_available` (
  `seav_id` int(11) NOT NULL,
  `seav_fk_ser_id` int(11) NOT NULL,
  `seav_fk_roo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services_available`
--

INSERT INTO `services_available` (`seav_id`, `seav_fk_ser_id`, `seav_fk_roo_id`) VALUES
(1, 4, 1),
(2, 4, 2),
(3, 1, 2),
(4, 1, 3),
(5, 4, 3),
(6, 3, 3),
(7, 1, 4),
(8, 1, 5),
(9, 3, 4),
(10, 4, 4),
(11, 5, 4),
(12, 2, 5),
(13, 1, 5),
(14, 2, 5),
(15, 3, 5),
(16, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `services_ordered`
--

CREATE TABLE `services_ordered` (
  `seor_id` int(11) NOT NULL,
  `seor_fk_res_id` int(11) NOT NULL,
  `seor_fk_ser_id` int(11) NOT NULL,
  `seor_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services_ordered`
--

INSERT INTO `services_ordered` (`seor_id`, `seor_fk_res_id`, `seor_fk_ser_id`, `seor_quantity`) VALUES
(1, 1, 2, 5),
(2, 2, 2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `beds`
--
ALTER TABLE `beds`
  ADD PRIMARY KEY (`bed_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`cli_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`res_id`),
  ADD KEY `fk_reservations_reservation_status1_idx` (`res_fk_status_id`),
  ADD KEY `fk_reservations_clients1_idx` (`res_fk_cli_id`);

--
-- Indexes for table `reservation_status`
--
ALTER TABLE `reservation_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`roo_id`),
  ADD KEY `fk_rooms_beds1_idx` (`roo_fk_bed_id`);

--
-- Indexes for table `roo_res_associative`
--
ALTER TABLE `roo_res_associative`
  ADD PRIMARY KEY (`rore_id`),
  ADD KEY `fk_roo_res_associative_rooms1_idx` (`rore_fk_roo_id`),
  ADD KEY `fk_roo_res_associative_reservations1_idx` (`rore_fk_res_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`ser_id`),
  ADD KEY `ser_fk_cat_id_idx` (`ser_fk_cat_id`);

--
-- Indexes for table `services_available`
--
ALTER TABLE `services_available`
  ADD PRIMARY KEY (`seav_id`),
  ADD KEY `fk_services_available_services1_idx` (`seav_fk_ser_id`),
  ADD KEY `fk_services_available_rooms1_idx` (`seav_fk_roo_id`);

--
-- Indexes for table `services_ordered`
--
ALTER TABLE `services_ordered`
  ADD PRIMARY KEY (`seor_id`),
  ADD KEY `fk_services_ordered_services1_idx` (`seor_fk_ser_id`),
  ADD KEY `fk_services_ordered_reservations1_idx` (`seor_fk_res_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `beds`
--
ALTER TABLE `beds`
  MODIFY `bed_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `cli_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `res_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `reservation_status`
--
ALTER TABLE `reservation_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `roo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `roo_res_associative`
--
ALTER TABLE `roo_res_associative`
  MODIFY `rore_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `ser_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `services_available`
--
ALTER TABLE `services_available`
  MODIFY `seav_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `services_ordered`
--
ALTER TABLE `services_ordered`
  MODIFY `seor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `fk_reservations_clients1` FOREIGN KEY (`res_fk_cli_id`) REFERENCES `clients` (`cli_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_reservations_reservation_status1` FOREIGN KEY (`res_fk_status_id`) REFERENCES `reservation_status` (`status_id`) ON UPDATE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `fk_rooms_beds1` FOREIGN KEY (`roo_fk_bed_id`) REFERENCES `beds` (`bed_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `roo_res_associative`
--
ALTER TABLE `roo_res_associative`
  ADD CONSTRAINT `fk_roo_res_associative_reservations1` FOREIGN KEY (`rore_fk_res_id`) REFERENCES `reservations` (`res_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_roo_res_associative_rooms1` FOREIGN KEY (`rore_fk_roo_id`) REFERENCES `rooms` (`roo_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `ser_fk_cat_id` FOREIGN KEY (`ser_fk_cat_id`) REFERENCES `categories` (`cat_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `services_available`
--
ALTER TABLE `services_available`
  ADD CONSTRAINT `fk_services_available_rooms1` FOREIGN KEY (`seav_fk_roo_id`) REFERENCES `rooms` (`roo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_services_available_services1` FOREIGN KEY (`seav_fk_ser_id`) REFERENCES `services` (`ser_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `services_ordered`
--
ALTER TABLE `services_ordered`
  ADD CONSTRAINT `fk_services_ordered_reservations1` FOREIGN KEY (`seor_fk_res_id`) REFERENCES `reservations` (`res_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_services_ordered_services1` FOREIGN KEY (`seor_fk_ser_id`) REFERENCES `services` (`ser_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
