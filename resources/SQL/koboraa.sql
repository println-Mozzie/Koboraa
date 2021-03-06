-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2018 at 04:13 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `koboraa`
--

-- --------------------------------------------------------

--
-- Table structure for table `building`
--

CREATE TABLE `building` (
  `buildingID` int(5) NOT NULL,
  `buildID` varchar(50) NOT NULL,
  `buildingName` varchar(90) NOT NULL,
  `buildingCity` varchar(20) NOT NULL,
  `buildingEstate` varchar(20) NOT NULL,
  `ownerID` int(5) NOT NULL,
  `roomCapacity` int(3) NOT NULL,
  `caretakerName` varchar(50) DEFAULT NULL,
  `caretakerNo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `building`
--

INSERT INTO `building` (`buildingID`, `buildID`, `buildingName`, `buildingCity`, `buildingEstate`, `ownerID`, `roomCapacity`, `caretakerName`, `caretakerNo`) VALUES
(1, 'kbsiw5487', 'Siwaka Plaza', 'Nairobi', 'West Madaraka', 2, 12, 'Karis', 71245678),
(2, 'kbold5420', 'Old Mutual Building', 'Nairobi', 'CBD', 2, 21, 'Old Mutual', 2043201),
(5, 'kbcap5402', 'capito', 'nai', '868', 14, 69, 'amos', 123456789),
(6, 'kbpha5480', 'Phase 1', 'Nairobi', 'Mada', 2, 12, 'Su', 712345678);

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `complaintID` int(5) NOT NULL,
  `complaint` text NOT NULL,
  `complaintTime` bigint(10) NOT NULL,
  `buildID` varchar(15) NOT NULL,
  `buildingID` int(5) NOT NULL,
  `ownerID` int(5) NOT NULL,
  `buildingName` varchar(90) NOT NULL,
  `status` int(2) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`complaintID`, `complaint`, `complaintTime`, `buildID`, `buildingID`, `ownerID`, `buildingName`, `status`) VALUES
(1, 'Tenant in HG1 is unruly!', 1543362176, 'kbsiw5487', 1, 2, 'Siwaka Plaza', 1),
(2, 'No water!', 1543363175, 'kbsiw5487', 1, 2, 'Siwaka Plaza', 0);

-- --------------------------------------------------------

--
-- Table structure for table `conpay`
--

CREATE TABLE `conpay` (
  `ID` int(5) NOT NULL,
  `transactionID` varchar(20) NOT NULL,
  `buildID` varchar(15) NOT NULL,
  `buildingID` int(5) NOT NULL,
  `ownerID` int(5) NOT NULL,
  `buildingName` varchar(90) NOT NULL,
  `rentalNumber` varchar(10) DEFAULT NULL,
  `amount` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conpay`
--

INSERT INTO `conpay` (`ID`, `transactionID`, `buildID`, `buildingID`, `ownerID`, `buildingName`, `rentalNumber`, `amount`) VALUES
(1, 'UJYUIYSYU1234', 'kbsiw5487', 1, 2, 'Siwaka Plaza', 'HG2', 15000),
(2, 'KH456GT11', 'kbpha5480', 6, 2, 'Phase 1', 'HF1', 15000);

-- --------------------------------------------------------

--
-- Table structure for table `prepay`
--

CREATE TABLE `prepay` (
  `ID` int(5) NOT NULL,
  `transactionID` varchar(20) NOT NULL,
  `buildID` varchar(15) NOT NULL,
  `buildingID` int(5) NOT NULL,
  `ownerID` int(5) NOT NULL,
  `buildingName` varchar(90) NOT NULL,
  `rentalNumber` varchar(10) DEFAULT NULL,
  `amount` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prepay`
--

INSERT INTO `prepay` (`ID`, `transactionID`, `buildID`, `buildingID`, `ownerID`, `buildingName`, `rentalNumber`, `amount`) VALUES
(1, 'HGFRT4567', 'kbsiw5487', 1, 2, 'Siwaka Plaza', 'HG1', 15000),
(2, 'UJYUIYSYU1234', 'kbsiw5487', 1, 2, 'Siwaka Plaza', 'HG2', 15000),
(3, 'KH456GT11', 'kbpha5480', 6, 2, 'Phase 1', 'HF1', 15000);

-- --------------------------------------------------------

--
-- Table structure for table `tenant`
--

CREATE TABLE `tenant` (
  `tenantID` int(5) NOT NULL,
  `tenantName` varchar(90) NOT NULL,
  `tenantPhone` int(10) NOT NULL,
  `tenantEmail` varchar(50) NOT NULL,
  `buildingID` int(5) NOT NULL,
  `ownerID` int(5) NOT NULL,
  `rentalNumber` varchar(10) DEFAULT NULL,
  `payStatus` int(2) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tenant`
--

INSERT INTO `tenant` (`tenantID`, `tenantName`, `tenantPhone`, `tenantEmail`, `buildingID`, `ownerID`, `rentalNumber`, `payStatus`) VALUES
(1, 'Murage Muraguri', 720533799, 'amosmurage56@gmail.com', 1, 2, 'HG1', 0),
(2, 'Brian Mulei', 729468786, 'bmukshi@gmail.com', 1, 2, 'HG2', 0),
(4, 'Nicodemus Opon', 707123456, 'nicodemusopon@gmail.com', 1, 2, 'HF1', 0),
(5, 'Alex', 72649568, 'alex@yahoo.com', 6, 2, 'HF1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(5) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `userMail` varchar(50) NOT NULL,
  `userPass` varchar(50) NOT NULL,
  `designation` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `firstName`, `lastName`, `userMail`, `userPass`, `designation`) VALUES
(2, 'Amos', 'Muraguri', 'amosmurage56@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 0),
(3, 'Nicodemus', 'Opon', 'cbsoftlabke@gmail.com', '410ec15153a6dff0bed851467309bcbd', 0),
(10, 'B', 'Mukshi', 'bmukshi@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 0),
(12, 'Amos ', 'Murage', 'admin@koboraa.com', '81dc9bdb52d04dc20036dbd8313ed055', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`buildingID`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`complaintID`);

--
-- Indexes for table `conpay`
--
ALTER TABLE `conpay`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `prepay`
--
ALTER TABLE `prepay`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tenant`
--
ALTER TABLE `tenant`
  ADD PRIMARY KEY (`tenantID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `building`
--
ALTER TABLE `building`
  MODIFY `buildingID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `complaintID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `conpay`
--
ALTER TABLE `conpay`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `prepay`
--
ALTER TABLE `prepay`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tenant`
--
ALTER TABLE `tenant`
  MODIFY `tenantID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
