-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2021 at 04:15 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `greencar`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_area`
--

CREATE TABLE `tbl_area` (
  `area_id` int(11) NOT NULL,
  `area_province` varchar(20) NOT NULL,
  `area_city` varchar(20) NOT NULL,
  `area_address` varchar(150) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_area`
--

INSERT INTO `tbl_area` (`area_id`, `area_province`, `area_city`, `area_address`, `user_id`) VALUES
(60, 'Ontario', 'London', '1500 Dundas St, London, ON N5W 3B9', 98),
(61, 'Ontario', 'London', '1515 Rob Panzer Drive, London, ON N5X 0M7', 99),
(62, 'Ontario', 'London', '1365 Dundas St, London, ON N5W 3B5', 100),
(63, 'Ontario', 'London', '600 Fanshawe Park Rd E, London, ON N5X 1L1', 101),
(64, 'Ontario', 'London', '1500 Highbury Ave N, London, ON N5Y 5N7', 102),
(65, 'Ontario', 'London', '1652 Dundas St, London, ON N5W 3C5', 103),
(66, 'Ontario', 'London', '1754 Dundas St, London, ON N5W 3E4', 104),
(67, 'Ontario', 'London', 'Carling St, London, ON N5Y 2M9', 105);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cat`
--

CREATE TABLE `tbl_cat` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(20) NOT NULL,
  `cat_desc` varchar(1500) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_cat`
--

INSERT INTO `tbl_cat` (`cat_id`, `cat_name`, `cat_desc`, `user_id`) VALUES
(37, 'Trading', 'Used car dealer', 98),
(38, 'Trading', 'Red tag Toyota cars', 99),
(39, 'Trading', 'Ford car dealer', 100),
(40, 'Rental', 'Tool rental service', 101),
(41, 'Rental', 'Truck rental agency', 102),
(42, 'Rental', 'Car rental agency', 103),
(43, 'Car Wash', 'Car wash', 104),
(44, 'Car Wash', 'Car wash', 105);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(70) NOT NULL,
  `user_email` varchar(120) NOT NULL,
  `user_password` varchar(70) NOT NULL,
  `user_phone` varchar(15) NOT NULL,
  `user_status` char(1) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_name`, `user_email`, `user_password`, `user_phone`, `user_status`) VALUES
(98, '5 Star Dealers', 'info@5star.ca', '123', '+15197028888', 'A'),
(99, 'North London Toyota', 'info@toyota.ca', '123', '+15194513880', 'A'),
(100, 'Highbury Ford Sales', 'info@ford.ca', '123', '15194551800', 'A'),
(101, 'Home Depot', 'info@homedepot.ca', '123', '15198504129', 'A'),
(102, 'U-Haul Neighborhood Dealer', 'info@uhaul.ca', '123', '+12263160515', 'A'),
(103, 'Enterprise Rent-A-Car', 'info@enterprisecarrental.ca', '123', '+15194531674', 'A'),
(104, 'Auto Spa Car Wash', 'info@auto.ca', '123', '+15194533600', 'A'),
(105, 'Shell Touchless Carwash', 'info@shell.com', '123', '519000000', 'A');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_area`
--
ALTER TABLE `tbl_area`
  ADD PRIMARY KEY (`area_id`),
  ADD KEY `fk_area_with_user` (`user_id`);

--
-- Indexes for table `tbl_cat`
--
ALTER TABLE `tbl_cat`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `fk_cat_to_user` (`user_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_area`
--
ALTER TABLE `tbl_area`
  MODIFY `area_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `tbl_cat`
--
ALTER TABLE `tbl_cat`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_area`
--
ALTER TABLE `tbl_area`
  ADD CONSTRAINT `fk_area_with_user` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`);

--
-- Constraints for table `tbl_cat`
--
ALTER TABLE `tbl_cat`
  ADD CONSTRAINT `fk_cat_to_user` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
