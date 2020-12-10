-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2020 at 11:50 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbsportms`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `participantId` varchar(25) NOT NULL,
  `roundId` varchar(25) NOT NULL,
  `isPresent` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `absensi`
--

INSERT INTO `absensi` (`participantId`, `roundId`, `isPresent`) VALUES
('PA0001', 'ROCA002', 'Y'),
('PA0002', 'ROCA003', 'Y'),
('PA0003', 'ROCA004', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminId` varchar(25) NOT NULL,
  `adminPassword` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminId`, `adminPassword`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `eventId` varchar(25) NOT NULL,
  `adminId` varchar(25) NOT NULL,
  `teacherId` varchar(25) NOT NULL,
  `eventDate` date NOT NULL,
  `eventName` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`eventId`, `adminId`, `teacherId`, `eventDate`, `eventName`) VALUES
('Catur10021', 'admin', 'teach1', '2020-12-18', 'Catur Amatir');

-- --------------------------------------------------------

--
-- Table structure for table `participant`
--

CREATE TABLE `participant` (
  `participantId` varchar(25) NOT NULL,
  `studentId` varchar(25) NOT NULL,
  `eventId` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `participant`
--

INSERT INTO `participant` (`participantId`, `studentId`, `eventId`) VALUES
('PA0001', 'IS0001', 'Catur10021'),
('PA0002', 'IS0002', 'Catur10021'),
('PA0003', 'IS0003', 'Catur10021');

-- --------------------------------------------------------

--
-- Table structure for table `round`
--

CREATE TABLE `round` (
  `roundId` varchar(25) NOT NULL,
  `eventId` varchar(25) NOT NULL,
  `roundNo` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `round`
--

INSERT INTO `round` (`roundId`, `eventId`, `roundNo`) VALUES
('ROCA001', 'Catur10021', '1'),
('ROCA002', 'Catur10021', '2'),
('ROCA003', 'Catur10021', '3'),
('ROCA004', 'Catur10021', '4');

-- --------------------------------------------------------

--
-- Table structure for table `standing`
--

CREATE TABLE `standing` (
  `eventId` varchar(25) NOT NULL,
  `studentId` varchar(25) NOT NULL,
  `standingRank` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `standing`
--

INSERT INTO `standing` (`eventId`, `studentId`, `standingRank`) VALUES
('Catur10021', 'IS0001', 1),
('Catur10021', 'IS0002', 2),
('Catur10021', 'IS0003', 3);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studentID` varchar(25) NOT NULL,
  `studentName` varchar(25) NOT NULL,
  `studentClass` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentID`, `studentName`, `studentClass`) VALUES
('IS0001', 'Fawwaz', '2A'),
('IS0002', 'Amjad', '2B'),
('IS0003', 'Fuadi', '2C');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `teacherId` varchar(25) NOT NULL,
  `teacherPassword` varchar(25) NOT NULL,
  `teacherName` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`teacherId`, `teacherPassword`, `teacherName`) VALUES
('teach1', 'teach1', 'Eko');

-- --------------------------------------------------------

--
-- Table structure for table `winner`
--

CREATE TABLE `winner` (
  `participantId` varchar(25) NOT NULL,
  `roundId` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `winner`
--

INSERT INTO `winner` (`participantId`, `roundId`) VALUES
('PA0001', 'ROCA003');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD KEY `participantId` (`participantId`),
  ADD KEY `roundId` (`roundId`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminId`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`eventId`),
  ADD KEY `adminId` (`adminId`),
  ADD KEY `teacherId` (`teacherId`);

--
-- Indexes for table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`participantId`),
  ADD KEY `eventId` (`eventId`),
  ADD KEY `studentId` (`studentId`);

--
-- Indexes for table `round`
--
ALTER TABLE `round`
  ADD PRIMARY KEY (`roundId`),
  ADD KEY `eventId` (`eventId`);

--
-- Indexes for table `standing`
--
ALTER TABLE `standing`
  ADD KEY `FK_standing1` (`eventId`),
  ADD KEY `FK_standing2` (`studentId`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentID`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacherId`);

--
-- Indexes for table `winner`
--
ALTER TABLE `winner`
  ADD KEY `participantId` (`participantId`),
  ADD KEY `roundId` (`roundId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absensi`
--
ALTER TABLE `absensi`
  ADD CONSTRAINT `absensi_ibfk_1` FOREIGN KEY (`participantId`) REFERENCES `participant` (`participantId`),
  ADD CONSTRAINT `absensi_ibfk_2` FOREIGN KEY (`roundId`) REFERENCES `round` (`roundId`);

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`adminId`) REFERENCES `admin` (`adminId`),
  ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`teacherId`),
  ADD CONSTRAINT `event_ibfk_3` FOREIGN KEY (`adminId`) REFERENCES `admin` (`adminId`) ON DELETE CASCADE,
  ADD CONSTRAINT `event_ibfk_4` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`teacherId`) ON DELETE CASCADE;

--
-- Constraints for table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `participant_ibfk_1` FOREIGN KEY (`eventId`) REFERENCES `event` (`eventId`),
  ADD CONSTRAINT `participant_ibfk_2` FOREIGN KEY (`studentId`) REFERENCES `student` (`studentID`),
  ADD CONSTRAINT `participant_ibfk_3` FOREIGN KEY (`eventId`) REFERENCES `event` (`eventId`) ON DELETE CASCADE,
  ADD CONSTRAINT `participant_ibfk_4` FOREIGN KEY (`studentId`) REFERENCES `student` (`studentID`) ON DELETE CASCADE;

--
-- Constraints for table `round`
--
ALTER TABLE `round`
  ADD CONSTRAINT `round_ibfk_1` FOREIGN KEY (`eventId`) REFERENCES `event` (`eventId`);

--
-- Constraints for table `standing`
--
ALTER TABLE `standing`
  ADD CONSTRAINT `FK_standing1` FOREIGN KEY (`eventId`) REFERENCES `event` (`eventId`),
  ADD CONSTRAINT `FK_standing2` FOREIGN KEY (`studentId`) REFERENCES `student` (`studentID`);

--
-- Constraints for table `winner`
--
ALTER TABLE `winner`
  ADD CONSTRAINT `winner_ibfk_1` FOREIGN KEY (`participantId`) REFERENCES `participant` (`participantId`),
  ADD CONSTRAINT `winner_ibfk_2` FOREIGN KEY (`roundId`) REFERENCES `round` (`roundId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
