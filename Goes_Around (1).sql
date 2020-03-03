-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 03, 2020 at 07:13 PM
-- Server version: 5.5.64-MariaDB
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Goes_Around`
--
Create Database Goes_Around;
USE Goes_Around;
-- --------------------------------------------------------

--
-- Table structure for table `BadPhrases`
--

CREATE TABLE IF NOT EXISTS `BadPhrases` (
  `BadPhrasesID` int(11) NOT NULL,
  `BadPhrases` varchar(500) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `BadPhrases`
--

INSERT INTO `BadPhrases` (`BadPhrasesID`, `BadPhrases`) VALUES
(1, 'I hate you'),
(2, 'You''re dumb'),
(3, 'I hope you have a bad day'),
(4, 'Your breath stinks'),
(5, 'I can smell you from over here');

-- --------------------------------------------------------

--
-- Table structure for table `GoodPhrases`
--

CREATE TABLE IF NOT EXISTS `GoodPhrases` (
  `GoodPhrasesID` int(11) NOT NULL,
  `GoodPhrases` varchar(500) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `GoodPhrases`
--

INSERT INTO `GoodPhrases` (`GoodPhrasesID`, `GoodPhrases`) VALUES
(1, 'Have a good day'),
(2, 'You look nice today'),
(3, 'I like your eyebrows today'),
(4, 'You did great job today'),
(5, 'Have a blessed day');

-- --------------------------------------------------------

--
-- Table structure for table `NegativeWords`
--

CREATE TABLE IF NOT EXISTS `NegativeWords` (
  `NegativeWordsID` int(11) NOT NULL,
  `CurseWords` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `NegativeWords`
--

INSERT INTO `NegativeWords` (`NegativeWordsID`, `CurseWords`) VALUES
(1, 'fuck'),
(2, 'shit'),
(3, 'dumb'),
(4, 'punk'),
(5, 'loser');

-- --------------------------------------------------------

--
-- Table structure for table `PositiveWords`
--

CREATE TABLE IF NOT EXISTS `PositiveWords` (
  `PositiveWordsID` int(11) NOT NULL,
  `NonCurseWords` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PositiveWords`
--

INSERT INTO `PositiveWords` (`PositiveWordsID`, `NonCurseWords`) VALUES
(65, 'amazing'),
(67, 'gorgeous'),
(68, 'lovely'),
(69, 'brilliant'),
(70, 'super');

-- --------------------------------------------------------

--
-- Table structure for table `ReplacementPhrases`
--

CREATE TABLE IF NOT EXISTS `ReplacementPhrases` (
  `ReplacementPhrasesID` int(11) NOT NULL,
  `BadPhrasesID` int(11) NOT NULL,
  `GoodPhrasesID` int(11) NOT NULL,
  `SwappedPhrases` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ReplacementPhrases`
--

INSERT INTO `ReplacementPhrases` (`ReplacementPhrasesID`, `BadPhrasesID`, `GoodPhrasesID`, `SwappedPhrases`) VALUES
(32, 1, 1, 'Have a good day!'),
(33, 2, 2, 'You look nice today.'),
(34, 3, 3, 'I like your eyebrows today'),
(35, 4, 4, 'You did a great job today'),
(36, 5, 5, 'Have a blessed day');

-- --------------------------------------------------------

--
-- Table structure for table `ReplacementWords`
--

CREATE TABLE IF NOT EXISTS `ReplacementWords` (
  `ReplacementWordsID` int(11) NOT NULL,
  `NegativeWordsID` int(11) NOT NULL,
  `PositiveWordsID` int(11) NOT NULL,
  `SwappedWords` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ReplacementWords`
--

INSERT INTO `ReplacementWords` (`ReplacementWordsID`, `NegativeWordsID`, `PositiveWordsID`, `SwappedWords`) VALUES
(10, 1, 65, 'amazing'),
(11, 2, 67, 'gorgeous'),
(12, 3, 68, 'lovely'),
(13, 4, 69, 'brilliant'),
(14, 5, 70, 'super');

-- --------------------------------------------------------

--
-- Table structure for table `UserInput`
--

CREATE TABLE IF NOT EXISTS `UserInput` (
  `UserInputID` int(11) NOT NULL,
  `NegativeWordsID` int(11) DEFAULT NULL,
  `BadPhrasesID` int(11) DEFAULT NULL,
  `PositiveWordsID` int(11) DEFAULT NULL,
  `GoodPhrasesID` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9652 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UserInput`
--

INSERT INTO `UserInput` (`UserInputID`, `NegativeWordsID`, `BadPhrasesID`, `PositiveWordsID`, `GoodPhrasesID`) VALUES
(845, 1, 1, 65, 1),
(872, 3, 3, 68, 3),
(6542, 2, 2, 67, 2),
(7484, 5, 5, 70, 5),
(9651, 4, 4, 69, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `BadPhrases`
--
ALTER TABLE `BadPhrases`
  ADD PRIMARY KEY (`BadPhrasesID`);

--
-- Indexes for table `GoodPhrases`
--
ALTER TABLE `GoodPhrases`
  ADD PRIMARY KEY (`GoodPhrasesID`);

--
-- Indexes for table `NegativeWords`
--
ALTER TABLE `NegativeWords`
  ADD PRIMARY KEY (`NegativeWordsID`);

--
-- Indexes for table `PositiveWords`
--
ALTER TABLE `PositiveWords`
  ADD PRIMARY KEY (`PositiveWordsID`);

--
-- Indexes for table `ReplacementPhrases`
--
ALTER TABLE `ReplacementPhrases`
  ADD PRIMARY KEY (`ReplacementPhrasesID`),
  ADD KEY `BadPhrasesID` (`BadPhrasesID`),
  ADD KEY `GoodPhrasesID` (`GoodPhrasesID`);

--
-- Indexes for table `ReplacementWords`
--
ALTER TABLE `ReplacementWords`
  ADD PRIMARY KEY (`ReplacementWordsID`),
  ADD KEY `NegativeWordsID` (`NegativeWordsID`),
  ADD KEY `PositiveWordsID` (`PositiveWordsID`);

--
-- Indexes for table `UserInput`
--
ALTER TABLE `UserInput`
  ADD PRIMARY KEY (`UserInputID`),
  ADD KEY `NegativeWordsID` (`NegativeWordsID`),
  ADD KEY `BadPhrasesID` (`BadPhrasesID`),
  ADD KEY `PositiveWordsID` (`PositiveWordsID`),
  ADD KEY `GoodPhrasesID` (`GoodPhrasesID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `BadPhrases`
--
ALTER TABLE `BadPhrases`
  MODIFY `BadPhrasesID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `GoodPhrases`
--
ALTER TABLE `GoodPhrases`
  MODIFY `GoodPhrasesID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `NegativeWords`
--
ALTER TABLE `NegativeWords`
  MODIFY `NegativeWordsID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `PositiveWords`
--
ALTER TABLE `PositiveWords`
  MODIFY `PositiveWordsID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=71;
--
-- AUTO_INCREMENT for table `ReplacementPhrases`
--
ALTER TABLE `ReplacementPhrases`
  MODIFY `ReplacementPhrasesID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `ReplacementWords`
--
ALTER TABLE `ReplacementWords`
  MODIFY `ReplacementWordsID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `UserInput`
--
ALTER TABLE `UserInput`
  MODIFY `UserInputID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9652;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `ReplacementPhrases`
--
ALTER TABLE `ReplacementPhrases`
  ADD CONSTRAINT `ReplacementPhrases_ibfk_1` FOREIGN KEY (`BadPhrasesID`) REFERENCES `BadPhrases` (`BadPhrasesID`),
  ADD CONSTRAINT `ReplacementPhrases_ibfk_2` FOREIGN KEY (`GoodPhrasesID`) REFERENCES `GoodPhrases` (`GoodPhrasesID`);

--
-- Constraints for table `ReplacementWords`
--
ALTER TABLE `ReplacementWords`
  ADD CONSTRAINT `ReplacementWords_ibfk_1` FOREIGN KEY (`NegativeWordsID`) REFERENCES `NegativeWords` (`NegativeWordsID`),
  ADD CONSTRAINT `ReplacementWords_ibfk_2` FOREIGN KEY (`PositiveWordsID`) REFERENCES `PositiveWords` (`PositiveWordsID`);

--
-- Constraints for table `UserInput`
--
ALTER TABLE `UserInput`
  ADD CONSTRAINT `UserInput_ibfk_1` FOREIGN KEY (`NegativeWordsID`) REFERENCES `NegativeWords` (`NegativeWordsID`),
  ADD CONSTRAINT `UserInput_ibfk_2` FOREIGN KEY (`BadPhrasesID`) REFERENCES `BadPhrases` (`BadPhrasesID`),
  ADD CONSTRAINT `UserInput_ibfk_3` FOREIGN KEY (`PositiveWordsID`) REFERENCES `PositiveWords` (`PositiveWordsID`),
  ADD CONSTRAINT `UserInput_ibfk_4` FOREIGN KEY (`GoodPhrasesID`) REFERENCES `GoodPhrases` (`GoodPhrasesID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
