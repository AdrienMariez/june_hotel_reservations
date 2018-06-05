-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 05, 2018 at 02:04 PM
-- Server version: 5.7.22-0ubuntu18.04.1
-- PHP Version: 7.2.5-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `june_hotel_administrationv2`
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
(1, 'Lit adulte'),
(2, 'Lit adulte 2 places'),
(3, 'Lit enfant'),
(4, 'Lit adulte premium'),
(5, 'Lit adulte 2 places premium');

-- --------------------------------------------------------

--
-- Table structure for table `bed_roo_associative`
--

CREATE TABLE `bed_roo_associative` (
  `bero_id` int(11) NOT NULL,
  `bero_fk_roo_id` int(11) DEFAULT NULL,
  `bero_fk_bed_id` int(11) DEFAULT NULL,
  `bero_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bed_roo_associative`
--

INSERT INTO `bed_roo_associative` (`bero_id`, `bero_fk_roo_id`, `bero_fk_bed_id`, `bero_quantity`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 2),
(3, 3, 2, 1),
(4, 3, 3, 1),
(5, 4, 5, 1),
(6, 5, 4, 2);

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
(1, 'Matériel'),
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
  `cli_name` varchar(45) NOT NULL,
  `cli_firstname` varchar(45) DEFAULT NULL,
  `cli_phone` varchar(45) DEFAULT NULL,
  `cli_email` varchar(45) DEFAULT NULL,
  `cli_address` varchar(45) DEFAULT NULL,
  `cli_country` varchar(45) DEFAULT NULL,
  `cli_securepass` varchar(455) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`cli_id`, `cli_name`, `cli_firstname`, `cli_phone`, `cli_email`, `cli_address`, `cli_country`, `cli_securepass`) VALUES
(1, 'customer1name', 'customer1firstname', 'customer1phone', 'customer1@mail.co', 'customer1address', 'customer1country', 'customer1HASHHASHHASHHASHHASHHASHHASHHASHHASHHASHHASHHASHHASHHASHHASH'),
(2, 'customer2name', 'customer2name', 'customer2phone', 'customer2@mail.co', 'customer2address', 'customer2country', 'customer2HASHHASHHASHHASHHASHHASHHASHHASHHASHHASHHASHHASHHASHHASHHASH'),
(3, 'customer3name', 'customer3firstname', 'customer3phone', 'customer3@mail.co', 'customer3address', 'customer3country', 'customer3HASHHASHHASHHASHHASHHASHHASHHASHHASHHASHHASHHASHHASHHASHHASH'),
(4, 'customer #4 tries some goofy stuff', 'AnD So ItGoEs AnD (with this)[and 7|-|1$]', 'I don\'t have any phone, sorry', 'et rantamplan tambour battant', 'Vaillant et fier sans arrogance', 'Brutal pour qui fait résistance', 'Servir la loi, servir la terre, voilà l\'esprit du régiment. Et rli et vlan.');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `res_id` int(11) NOT NULL,
  `res_fk_cli_id` int(11) NOT NULL,
  `res_start` date DEFAULT NULL,
  `res_end` date DEFAULT NULL,
  `res_comment` varchar(455) NOT NULL,
  `res_totalprice` int(11) NOT NULL,
  `res_fk_status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`res_id`, `res_fk_cli_id`, `res_start`, `res_end`, `res_comment`, `res_totalprice`, `res_fk_status_id`) VALUES
(1, 1, '2018-06-07', '2018-06-15', 'I am client 1 and I wonder if I can rent a car near the hotel', 500, 1),
(2, 2, '2018-06-07', '2018-06-09', '', 600, 3),
(3, 2, '2018-06-07', '2018-06-11', 'I am client 2. Please ignore previous orders, I had to change the dates.\r\n\r\nCustomer service : order canceled per client request.', 800, 4),
(4, 2, '2018-06-07', '2018-06-11', 'I am client 2. Please ignore previous orders, I had to change payment method.', 800, 2),
(5, 4, '2018-06-14', '2018-06-04', 'I am client 4 and shoop da whoop the start of my staying is after my departure. Where is your data integrity, now ?\r\n\r\ncustomer service : an error was detected with your order, and was therefore canceled and refunded.', 1200, 5);

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
(1, 'ordered awaiting payment'),
(2, 'ordered payed'),
(3, 'cancelled by client'),
(4, 'cancelled by hotel - no refund'),
(5, 'cancelled by hotel - refunded'),
(6, 'ordered and paid begun'),
(7, 'ordered and paid ended');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `roo_id` int(11) NOT NULL,
  `roo_name` varchar(45) DEFAULT NULL,
  `roo_size` int(11) DEFAULT NULL,
  `roo_suite` tinyint(1) DEFAULT NULL,
  `roo_floor` int(11) DEFAULT NULL,
  `roo_view` varchar(100) DEFAULT NULL,
  `roo_access_disabled` tinyint(1) DEFAULT NULL,
  `roo_shower` int(11) DEFAULT NULL,
  `roo_bathtub` int(11) DEFAULT NULL,
  `roo_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`roo_id`, `roo_name`, `roo_size`, `roo_suite`, `roo_floor`, `roo_view`, `roo_access_disabled`, `roo_shower`, `roo_bathtub`, `roo_price`) VALUES
(1, 'Triton', 10, 0, 1, 'view from room 1. Parking view.', 1, 1, 0, 45),
(2, 'Trident marin', 12, 0, 1, 'view from room 2. Parking view.', 1, 2, 0, 55),
(3, 'Murène', 23, 0, 2, 'view from room 3. Nice view !', 1, 1, 1, 63),
(4, 'Nave del grande armadura', 35, 1, 2, 'view from room 4. Nice view of the pool !', 0, 2, 2, 120),
(5, 'La Santa Maria', 45, 1, 3, 'view from room 5. Perfect view of the beach.', 0, 5, 5, 240);

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
(2, 3, 2),
(3, 3, 3),
(4, 3, 4),
(5, 1, 5),
(6, 2, 5),
(7, 3, 5);

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
(1, 'Serviettes de bain', 'Location d\'un lot de serviettes de bain pour la durée du sejour.', '12', 1),
(2, 'accès wifi premium', 'Accès premium au wifi de l\'hotel pour la durée du sejour.', '8', 1),
(3, 'Repas midi', 'Réservation pour les repas du midi.', '8', 3),
(4, 'Repas soir', 'Réservation pour les repas du soir.', '8', 3),
(5, 'petit dejeuner', 'Réservation pour les petits dejeuners.', '6', 3),
(6, 'Bouteille de champagne', 'Une bouteille de champagne', '50', 4),
(7, '\"Bière aprem\"', 'Une canette de bière fournie pour l\'après midi avec réduction sur les prix pratiqués.\r\nUniquement disponible si l\'option \"piscine\" a été prise.', '1', 4),
(8, 'Piscine', 'Accès à la piscine de l\'hotel.\r\nVoir les horaires sur le site.', '5', 2);

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
(1, 1, 5),
(2, 2, 5),
(3, 3, 5),
(4, 4, 5),
(5, 5, 5),
(6, 6, 5),
(7, 7, 5),
(8, 8, 5),
(9, 1, 4),
(10, 3, 4),
(11, 4, 4),
(12, 5, 4),
(13, 7, 4),
(14, 8, 4),
(15, 1, 3),
(16, 3, 3),
(17, 4, 3),
(18, 5, 3),
(19, 8, 3),
(20, 1, 2),
(21, 8, 2),
(22, 8, 1);

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
(1, 1, 4, 3),
(2, 1, 3, 3),
(3, 4, 6, 1),
(4, 5, 1, 2),
(5, 5, 2, 5),
(6, 5, 3, 6),
(7, 5, 4, 4),
(8, 5, 5, 8),
(9, 5, 6, 22),
(10, 5, 7, 6),
(11, 5, 8, 6);

-- --------------------------------------------------------

--
-- Table structure for table `staff_account`
--

CREATE TABLE `staff_account` (
  `cli_id` int(11) NOT NULL,
  `cli_email` varchar(45) DEFAULT NULL,
  `cli_securepass` varchar(455) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff_account`
--

INSERT INTO `staff_account` (`cli_id`, `cli_email`, `cli_securepass`) VALUES
(1, 'owner.staff@hotel.co', 'staffkeyT6T67T76T76T76T76T7T6'),
(2, 'secretary.staff@hotel.co', 'staffkeyH9H9H9H99HH9H99H9H9H9H9H');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `beds`
--
ALTER TABLE `beds`
  ADD PRIMARY KEY (`bed_id`);

--
-- Indexes for table `bed_roo_associative`
--
ALTER TABLE `bed_roo_associative`
  ADD PRIMARY KEY (`bero_id`),
  ADD KEY `fk_bed_roo_associative_beds1_idx` (`bero_fk_bed_id`),
  ADD KEY `fk_bed_roo_associative_rooms1_idx` (`bero_fk_roo_id`);

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
  ADD PRIMARY KEY (`roo_id`);

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
-- Indexes for table `staff_account`
--
ALTER TABLE `staff_account`
  ADD PRIMARY KEY (`cli_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `beds`
--
ALTER TABLE `beds`
  MODIFY `bed_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `bed_roo_associative`
--
ALTER TABLE `bed_roo_associative`
  MODIFY `bero_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `cli_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `res_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `reservation_status`
--
ALTER TABLE `reservation_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `roo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `roo_res_associative`
--
ALTER TABLE `roo_res_associative`
  MODIFY `rore_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `ser_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `services_available`
--
ALTER TABLE `services_available`
  MODIFY `seav_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `services_ordered`
--
ALTER TABLE `services_ordered`
  MODIFY `seor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `staff_account`
--
ALTER TABLE `staff_account`
  MODIFY `cli_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bed_roo_associative`
--
ALTER TABLE `bed_roo_associative`
  ADD CONSTRAINT `fk_bed_roo_associative_beds1` FOREIGN KEY (`bero_fk_bed_id`) REFERENCES `beds` (`bed_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bed_roo_associative_rooms1` FOREIGN KEY (`bero_fk_roo_id`) REFERENCES `rooms` (`roo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `fk_reservations_clients1` FOREIGN KEY (`res_fk_cli_id`) REFERENCES `clients` (`cli_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_reservations_reservation_status1` FOREIGN KEY (`res_fk_status_id`) REFERENCES `reservation_status` (`status_id`) ON UPDATE CASCADE;

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
