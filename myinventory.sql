-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 30, 2013 at 09:06 AM
-- Server version: 5.5.24-log
-- PHP Version: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `myinventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(200) NOT NULL,
  `c_address` text NOT NULL,
  `c_mo` bigint(11) NOT NULL,
  `c_ph` bigint(11) NOT NULL,
  `c_email` varchar(100) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`c_id`, `c_name`, `c_address`, `c_mo`, `c_ph`, `c_email`) VALUES
(1, 'jeevan', 'lahavit', 9049402749, 9049402749, 'jeevan@gmail.com'),
(5, 'sachin', '  NASIK', 9049402749, 9049402749, 'sachin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `i_no` int(11) NOT NULL AUTO_INCREMENT,
  `i_name` varchar(25) NOT NULL,
  `i_address` varchar(100) NOT NULL,
  `i_date` date NOT NULL,
  `i_cno` bigint(11) NOT NULL,
  `i_ph` bigint(11) NOT NULL,
  `i_vat` double NOT NULL,
  `i_other` double NOT NULL,
  `i_total` double NOT NULL,
  PRIMARY KEY (`i_no`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`i_no`, `i_name`, `i_address`, `i_date`, `i_cno`, `i_ph`, `i_vat`, `i_other`, `i_total`) VALUES
(3, 'jeevan', 'lahavit', '1970-01-01', 9049402749, 9049402749, 0, 25, 1601.25),
(4, 'jeevan', 'lahavit', '2013-08-27', 9049402749, 9049402749, 0, 200, 1522.5),
(5, 'jeevan', 'lahavit', '1970-01-01', 9049402749, 9049402749, 0, 100, 210),
(6, 'jeevan', 'lahavit', '1970-01-01', 9049402749, 9049402749, 0, 0, 26250),
(7, 'jeevan', 'lahavit', '2013-08-28', 9049402749, 9049402749, 0, 0, 9843.75),
(8, 'jeevan', 'lahavit', '1970-01-01', 9049402749, 9049402749, 0.04, 25, 26026),
(9, 'jeevan', 'lahavit', '1970-01-01', 9049402749, 9049402749, 0.04, 100, 1404),
(10, 'jeevan', 'lahavit', '1970-01-01', 9049402749, 9049402749, 0.04, 400, 96616),
(11, 'jeevan', 'lahavit', '1970-01-01', 9049402749, 9049402749, 0.04, 51, 52053.04),
(12, 'jeevan', 'lahavit', '2013-08-28', 9049402749, 9049402749, 0.04, 100, 1664),
(13, 'jeevan', 'lahavit', '1970-01-01', 9049402749, 9049402749, 0.04, 1000, 3120);

-- --------------------------------------------------------

--
-- Table structure for table `partial_payment`
--

CREATE TABLE IF NOT EXISTS `partial_payment` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `sl_id` varchar(11) NOT NULL,
  `c_name` varchar(25) NOT NULL,
  `p_mode` varchar(25) NOT NULL,
  `p_date` date NOT NULL,
  `p_check` varchar(25) NOT NULL,
  `p_amt` double NOT NULL,
  `bank` varchar(100) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `partial_payment`
--

INSERT INTO `partial_payment` (`p_id`, `sl_id`, `c_name`, `p_mode`, `p_date`, `p_check`, `p_amt`, `bank`) VALUES
(55, '6', 'jeevan', 'Cheque', '2013-08-27', '', 26000, ''),
(56, '6', 'jeevan', 'Cheque', '2013-08-27', '', 50, ''),
(57, 's57', '', 'Cheque', '2013-08-28', '', 100, ''),
(58, 's56', 'sachin', 'Cheque', '2013-08-28', '', 100, ''),
(59, '10', 'jeevan', 'Cheque', '2013-08-28', '1234', 900, 'Icici'),
(60, 's57', 'sager', 'Cheque', '2013-08-28', '12345', 100, 'Icici'),
(61, '10', 'jeevan', 'Cash', '2013-08-28', '', 95716, ''),
(62, 's55', 'sager', 'Cash', '2013-08-28', '', 100, ''),
(63, '4', 'jeevan', 'Cash', '2013-08-28', '', 1222, ''),
(64, '11', 'jeevan', 'Cash', '2013-08-28', '', 100, ''),
(65, 's58', 'sachin', 'Cash', '2013-08-28', '', 100, ''),
(66, 's58', 'sachin', 'Cash', '2013-08-28', '', 100, '');

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE IF NOT EXISTS `sale` (
  `sl_id` int(11) NOT NULL AUTO_INCREMENT,
  `sl_cust` varchar(25) NOT NULL,
  `sl_contact` bigint(11) NOT NULL,
  `sl_date` date NOT NULL,
  `sl_amt` double NOT NULL,
  PRIMARY KEY (`sl_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`sl_id`, `sl_cust`, `sl_contact`, `sl_date`, `sl_amt`) VALUES
(12, 'jeevan', 0, '2013-08-26', 0),
(13, 'jeevan', 0, '2013-08-26', 0),
(14, 'jeevan', 0, '2013-08-26', 0),
(15, 'jeevan', 0, '2013-08-26', 0),
(16, 'jeevan', 0, '2013-08-26', 0),
(17, 'jeevan', 0, '2013-08-26', 0),
(18, 'jeevan', 0, '2013-08-26', 0),
(19, 'jeevan', 0, '2013-08-26', 0),
(20, 'jeevan', 0, '2013-08-26', 0),
(27, 'jeevan', 0, '2013-08-28', 0),
(28, 'jeevan', 0, '2013-08-28', 0);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE IF NOT EXISTS `stock` (
  `st_id` int(11) NOT NULL AUTO_INCREMENT,
  `st_date` date NOT NULL,
  `sup_name` varchar(200) NOT NULL,
  PRIMARY KEY (`st_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`st_id`, `st_date`, `sup_name`) VALUES
(55, '2013-08-28', 'sager'),
(56, '2013-08-28', 'sachin'),
(57, '2013-08-28', 'sager'),
(58, '2013-08-28', 'sachin');

-- --------------------------------------------------------

--
-- Table structure for table `stock_detail`
--

CREATE TABLE IF NOT EXISTS `stock_detail` (
  `stock_name` varchar(25) NOT NULL,
  `stock_bag` int(10) NOT NULL,
  `stock_kg` double NOT NULL,
  `total_kg` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_detail`
--

INSERT INTO `stock_detail` (`stock_name`, `stock_bag`, `stock_kg`, `total_kg`) VALUES
('stock_one', 360, 43, 8318),
('stock_two', 9, 95, 23036);

-- --------------------------------------------------------

--
-- Table structure for table `sub_invoice`
--

CREATE TABLE IF NOT EXISTS `sub_invoice` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `i_no` int(10) NOT NULL,
  `si_p` varchar(25) NOT NULL,
  `s_bag` int(10) NOT NULL,
  `s_kg` double NOT NULL,
  `s_rate` double NOT NULL,
  `s_amt` double NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `sub_invoice`
--

INSERT INTO `sub_invoice` (`s_id`, `i_no`, `si_p`, `s_bag`, `s_kg`, `s_rate`, `s_amt`) VALUES
(21, 3, 'stock_two', 25, 5, 2, 250),
(22, 3, 'stock_one', 10, 5, 25, 1250),
(23, 4, 'stock_one', 25, 2, 25, 1250),
(24, 5, 'stock_two', 1, 10, 10, 100),
(25, 6, 'stock_two', 50, 20, 25, 25000),
(26, 7, 'stock_two', 25, 15, 25, 9375),
(27, 8, 'stock_two', 50, 20, 25, 25000),
(28, 9, 'stock_one', 25, 2, 25, 1250),
(29, 10, 'stock_one', 100, 25, 12, 30000),
(30, 10, 'stock_two', 250, 25, 10, 62500),
(31, 11, 'stock_two', 50, 20, 25, 25000),
(32, 12, 'stock_two', 10, 10, 5, 500),
(33, 13, 'stock_one', 10, 10, 5, 500);

-- --------------------------------------------------------

--
-- Table structure for table `sub_sale`
--

CREATE TABLE IF NOT EXISTS `sub_sale` (
  `ss_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) NOT NULL,
  `s_date` date NOT NULL,
  `s_name` varchar(25) NOT NULL,
  `st_name` varchar(25) NOT NULL,
  `s_bag` int(10) NOT NULL,
  `s_kg` double NOT NULL,
  `s_rate` double NOT NULL,
  `s_value` double NOT NULL,
  PRIMARY KEY (`ss_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `sub_sale`
--

INSERT INTO `sub_sale` (`ss_id`, `s_id`, `s_date`, `s_name`, `st_name`, `s_bag`, `s_kg`, `s_rate`, `s_value`) VALUES
(1, 15, '2013-08-26', 'jeevan', 'stock_two', 25, 5, 2, 250),
(2, 15, '2013-08-26', 'jeevan', 'stock_one', 10, 5, 25, 1250),
(3, 17, '2013-08-26', 'jeevan', 'stock_two', 25, 15, 25, 9375),
(4, 18, '2013-08-26', 'jeevan', 'stock_one', 20, 2, 25, 1000),
(5, 19, '2013-08-26', 'jeevan', 'stock_one', 25, 5, 5, 625),
(6, 20, '2013-08-26', 'jeevan', 'stock_two', 50, 20, 25, 25000),
(7, 21, '2013-08-26', 'jeevan', 'stock_two', 1, 10, 10, 100),
(8, 22, '2013-08-26', 'jeevan', 'stock_one', 25, 2, 25, 1250),
(9, 23, '2013-08-28', 'jeevan', 'stock_one', 100, 25, 12, 30000),
(10, 23, '2013-08-28', 'jeevan', 'stock_two', 250, 25, 10, 62500),
(11, 24, '1970-01-01', 'jeevan', '', 50, 20, 25, 25000),
(12, 25, '1970-01-01', 'jeevan', '', 100, 25, 12, 30000),
(13, 25, '1970-01-01', 'jeevan', '', 250, 25, 10, 62500),
(14, 26, '1970-01-01', 'jeevan', '', 100, 25, 12, 30000),
(15, 26, '1970-01-01', 'jeevan', '', 250, 25, 10, 62500),
(16, 27, '2013-08-28', 'jeevan', 'stock_two', 10, 10, 5, 500),
(17, 28, '2013-08-28', 'jeevan', 'stock_one', 10, 10, 5, 500);

-- --------------------------------------------------------

--
-- Table structure for table `sub_stock`
--

CREATE TABLE IF NOT EXISTS `sub_stock` (
  `sb_id` int(11) NOT NULL AUTO_INCREMENT,
  `st_id` int(10) NOT NULL,
  `sb_date` date NOT NULL,
  `sb_name` varchar(25) NOT NULL,
  `st_name` varchar(25) NOT NULL,
  `st_bag` int(11) NOT NULL,
  `st_kg` double NOT NULL,
  `st_total` double NOT NULL,
  `st_amt` double NOT NULL,
  PRIMARY KEY (`sb_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=65 ;

--
-- Dumping data for table `sub_stock`
--

INSERT INTO `sub_stock` (`sb_id`, `st_id`, `sb_date`, `sb_name`, `st_name`, `st_bag`, `st_kg`, `st_total`, `st_amt`) VALUES
(60, 55, '2013-08-28', 'sager', 'stock_one', 25, 5, 125, 100),
(61, 56, '2013-08-28', 'sachin', 'stock_one', 100, 50, 5000, 5000),
(62, 56, '2013-08-28', 'sachin', 'stock_two', 200, 100, 20000, 10000),
(63, 57, '2013-08-28', 'sager', 'stock_one', 250, 10, 2500, 1000),
(64, 58, '2013-08-28', 'sachin', 'stock_two', 20, 10, 200, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE IF NOT EXISTS `suppliers` (
  `s_id` int(10) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(200) NOT NULL,
  `s_address` text NOT NULL,
  `s_mo` bigint(11) NOT NULL,
  `s_ph` bigint(11) NOT NULL,
  `s_email` varchar(25) NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`s_id`, `s_name`, `s_address`, `s_mo`, `s_ph`, `s_email`) VALUES
(1, 'sager', 'chandwad', 9049402749, 9049402749, 'sager@gmail.com'),
(2, 'sachin', 'nasik', 9049402794, 9049402794, 'sachin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE IF NOT EXISTS `terms` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `des` text NOT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `u_id` int(11) NOT NULL,
  `u_name` varchar(25) NOT NULL,
  `u_password` varchar(25) NOT NULL,
  `u_type` varchar(25) NOT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`u_id`, `u_name`, `u_password`, `u_type`) VALUES
(1, 'jeevan', 'jeevan', ''),
(2, 'viviek', 'viviek', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
