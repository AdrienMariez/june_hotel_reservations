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

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Table structure for table `reservation_status`
--

CREATE TABLE `reservation_status` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Table structure for table `roo_res_associative`
--

CREATE TABLE `roo_res_associative` (
  `rore_id` int(11) NOT NULL,
  `rore_fk_roo_id` int(11) NOT NULL,
  `rore_fk_res_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Table structure for table `services_available`
--

CREATE TABLE `services_available` (
  `seav_id` int(11) NOT NULL,
  `seav_fk_ser_id` int(11) NOT NULL,
  `seav_fk_roo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
