-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2019 at 06:06 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kishor10d`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ci_sessions`
--

TRUNCATE TABLE `ci_sessions`;
-- --------------------------------------------------------

--
-- Table structure for table `tbl_last_login`
--

DROP TABLE IF EXISTS `tbl_last_login`;
CREATE TABLE IF NOT EXISTS `tbl_last_login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `sessionData` varchar(2048) NOT NULL,
  `machineIp` varchar(1024) NOT NULL,
  `userAgent` varchar(128) NOT NULL,
  `agentString` varchar(1024) NOT NULL,
  `platform` varchar(128) NOT NULL,
  `createdDtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tbl_last_login`
--

TRUNCATE TABLE `tbl_last_login`;
--
-- Dumping data for table `tbl_last_login`
--

INSERT INTO `tbl_last_login` (`id`, `userId`, `sessionData`, `machineIp`, `userAgent`, `agentString`, `platform`, `createdDtm`) VALUES(1, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 76.0.3809.132', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Windows 10', '2019-09-16 22:34:19');
INSERT INTO `tbl_last_login` (`id`, `userId`, `sessionData`, `machineIp`, `userAgent`, `agentString`, `platform`, `createdDtm`) VALUES(2, 9, '{\"role\":\"2\",\"roleText\":\"Manager\",\"name\":\"Ardnarong Boonkerd\"}', '::1', 'Chrome 76.0.3809.132', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Windows 10', '2019-09-16 22:35:33');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reset_password`
--

DROP TABLE IF EXISTS `tbl_reset_password`;
CREATE TABLE IF NOT EXISTS `tbl_reset_password` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `activation_id` varchar(32) NOT NULL,
  `agent` varchar(512) NOT NULL,
  `client_ip` varchar(32) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `createdBy` bigint(20) NOT NULL DEFAULT '1',
  `createdDtm` datetime NOT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedDtm` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `tbl_reset_password`
--

TRUNCATE TABLE `tbl_reset_password`;
-- --------------------------------------------------------

--
-- Table structure for table `tbl_roles`
--

DROP TABLE IF EXISTS `tbl_roles`;
CREATE TABLE IF NOT EXISTS `tbl_roles` (
  `roleId` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'role id',
  `role` varchar(50) NOT NULL COMMENT 'role text',
  PRIMARY KEY (`roleId`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tbl_roles`
--

TRUNCATE TABLE `tbl_roles`;
--
-- Dumping data for table `tbl_roles`
--

INSERT INTO `tbl_roles` (`roleId`, `role`) VALUES(1, 'System Administrator');
INSERT INTO `tbl_roles` (`roleId`, `role`) VALUES(2, 'Manager');
INSERT INTO `tbl_roles` (`roleId`, `role`) VALUES(3, 'Employee');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE IF NOT EXISTS `tbl_users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL COMMENT 'login email',
  `password` varchar(128) NOT NULL COMMENT 'hashed login password',
  `name` varchar(128) DEFAULT NULL COMMENT 'full name of user',
  `mobile` varchar(20) DEFAULT NULL,
  `roleId` tinyint(4) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `createdBy` int(11) NOT NULL,
  `createdDtm` datetime NOT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `updatedDtm` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tbl_users`
--

TRUNCATE TABLE `tbl_users`;
--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`userId`, `email`, `password`, `name`, `mobile`, `roleId`, `isDeleted`, `createdBy`, `createdDtm`, `updatedBy`, `updatedDtm`) VALUES(2, 'manager@example.com', '$2y$10$quODe6vkNma30rcxbAHbYuKYAZQqUaflBgc4YpV9/90ywd.5Koklm', 'Manager', '9890098900', 2, 0, 1, '2016-12-09 17:49:56', 1, '2018-01-12 07:22:11');
INSERT INTO `tbl_users` (`userId`, `email`, `password`, `name`, `mobile`, `roleId`, `isDeleted`, `createdBy`, `createdDtm`, `updatedBy`, `updatedDtm`) VALUES(3, 'employee@example.com', '$2y$10$UYsH1G7MkDg1cutOdgl2Q.ZbXjyX.CSjsdgQKvGzAgl60RXZxpB5u', 'Employee', '9890098900', 3, 0, 1, '2016-12-09 17:50:22', 3, '2018-01-04 07:58:28');
INSERT INTO `tbl_users` (`userId`, `email`, `password`, `name`, `mobile`, `roleId`, `isDeleted`, `createdBy`, `createdDtm`, `updatedBy`, `updatedDtm`) VALUES(9, 'ardnarong.b@outlook.com', '$2y$10$wwNYr5.iEnEDVxoAPyu..eP8EIuHTGgUs9iSU2yHQoZs8CHGGLcmG', 'Ardnarong Boonkerd', '0123456789', 1, 0, 1, '2019-09-16 17:35:14', NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
