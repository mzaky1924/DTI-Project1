-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2020 at 06:00 PM
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
  `absensiId` int(100) NOT NULL,
  `participantId` char(5) NOT NULL,
  `roundId` char(5) NOT NULL,
  `isiPresensi` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `absensi`
--

INSERT INTO `absensi` (`absensiId`, `participantId`, `roundId`, `isiPresensi`) VALUES
(1, 'pa001', 'ro001', 'Y'),
(3, 'pa003', 'ro002', 'Y'),
(4, 'pa004', 'ro002', 'Y'),
(5, 'pa002', 'ro003', 'Y'),
(6, 'pa004', 'ro003', 'Y'),
(7, 'pa001', 'ro004', 'Y'),
(8, 'pa003', 'ro004', 'Y'),
(10, 'pa002', 'ro001', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminId` char(5) NOT NULL,
  `adminPassword` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminId`, `adminPassword`) VALUES
('ad001', 'password1'),
('ad002', 'password2'),
('ad003', 'password3'),
('ad004', 'password4'),
('ad005', 'password5');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `eventId` varchar(25) NOT NULL,
  `adminId` char(5) NOT NULL,
  `teacherId` char(5) NOT NULL,
  `startEventDate` date NOT NULL,
  `endEventDate` date NOT NULL,
  `eventName` varchar(25) NOT NULL,
  `eventType` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`eventId`, `adminId`, `teacherId`, `startEventDate`, `endEventDate`, `eventName`, `eventType`) VALUES
('ev001', 'ad001', 'tc001', '2020-12-09', '2020-12-10', 'Catur', 'Indoor'),
('ev002', 'ad002', 'tc002', '2020-12-11', '2020-12-12', 'Tenis Meja', 'Outdoor'),
('ev003', 'ad003', 'tc003', '2020-12-13', '2020-12-14', 'Bulu Tangkis', 'Indoor');

-- --------------------------------------------------------

--
-- Table structure for table `participant`
--

CREATE TABLE `participant` (
  `participantId` char(5) NOT NULL,
  `studentId` varchar(5) NOT NULL,
  `eventId` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `participant`
--

INSERT INTO `participant` (`participantId`, `studentId`, `eventId`) VALUES
('pa001', 'st020', 'ev001'),
('pa002', 'st015', 'ev001'),
('pa003', 'st017', 'ev001'),
('pa004', 'st016', 'ev001'),
('pa005', 'st011', 'ev002'),
('pa006', 'st013', 'ev002'),
('pa007', 'st015', 'ev002'),
('pa008', 'st009', 'ev002'),
('pa009', 'st018', 'ev002'),
('pa010', 'st012', 'ev002'),
('pa011', 'st001', 'ev003'),
('pa012', 'st005', 'ev003'),
('pa013', 'st004', 'ev003'),
('pa014', 'st008', 'ev003'),
('pa015', 'st003', 'ev003'),
('pa016', 'st002', 'ev003');

-- --------------------------------------------------------

--
-- Table structure for table `round`
--

CREATE TABLE `round` (
  `roundId` char(5) NOT NULL,
  `eventId` char(5) NOT NULL,
  `roundNo` varchar(2) NOT NULL,
  `roundDateStart` datetime NOT NULL,
  `roundDateEnd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `round`
--

INSERT INTO `round` (`roundId`, `eventId`, `roundNo`, `roundDateStart`, `roundDateEnd`) VALUES
('ro001', 'ev001', '1', '2020-12-09 07:10:20', '2020-12-09 09:10:20'),
('ro002', 'ev001', '2', '2020-12-09 10:10:20', '2020-12-09 12:10:20'),
('ro003', 'ev001', '3', '2020-12-09 13:10:20', '2020-12-09 15:10:20'),
('ro004', 'ev001', '4', '2020-12-10 09:10:20', '2020-12-10 13:10:20'),
('ro005', 'ev002', '1', '2020-12-11 08:10:20', '2020-12-11 11:10:20'),
('ro006', 'ev003', '1', '2020-12-13 10:10:20', '2020-12-13 13:10:20');

-- --------------------------------------------------------

--
-- Table structure for table `standing`
--

CREATE TABLE `standing` (
  `eventId` char(5) NOT NULL,
  `participantId` char(5) NOT NULL,
  `standingRank` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `standing`
--

INSERT INTO `standing` (`eventId`, `participantId`, `standingRank`) VALUES
('ev001', 'pa001', 1),
('ev001', 'pa003', 2),
('ev001', 'pa004', 3);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studentId` char(5) NOT NULL,
  `studentName` varchar(25) NOT NULL,
  `studentClass` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentId`, `studentName`, `studentClass`) VALUES
('st001', 'Andi Dani', '9a'),
('st002', 'Dimas Prabu', '9a'),
('st003', 'Anggita Prili', '9b'),
('st004', 'Wahyu Tama', '8a'),
('st005', 'Mhita Sulastra', '7c'),
('st006', 'Fani Lastri', '7c'),
('st007', 'Titik Crina', '9c'),
('st008', 'Koko Sebastian', '9c'),
('st009', 'Dido Dodi', '8c'),
('st010', 'Ana Sri Astuti', '8c'),
('st011', 'Puji Astuti', '7a'),
('st012', 'Ilonmas Bagja', '7a'),
('st013', 'Aldebaran', '7a'),
('st014', 'Dadang Jetpam', '9c'),
('st015', 'Adeung Prayoga', '8a'),
('st016', 'Kiki Sutisni', '8a'),
('st017', 'Anggi Annis', '8a'),
('st018', 'Aldho', '7c'),
('st019', 'Herdiansyah', '9b'),
('st020', 'Dandi Prayoga', '9b');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `teacherId` char(5) NOT NULL,
  `teacherPassword` varchar(25) NOT NULL,
  `teacherName` varchar(25) NOT NULL,
  `teacherEmail` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`teacherId`, `teacherPassword`, `teacherName`, `teacherEmail`) VALUES
('tc001', 'password1', 'Ayu Pratiwi', 'ayupratiwi@gmail.com'),
('tc002', 'password2', 'Agus Dani', 'agusdani@gmail.com'),
('tc003', 'password3', 'Raden Ari', 'radenari@gmail.com'),
('tc004', 'password4', 'Rika Nurul', 'rikanurul@gmail.com'),
('tc005', 'password5', 'Bambang Supriatna', 'bambangsupriatna@gmail.co');

-- --------------------------------------------------------

--
-- Table structure for table `winner`
--

CREATE TABLE `winner` (
  `participantId` char(5) NOT NULL,
  `roundId` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `winner`
--

INSERT INTO `winner` (`participantId`, `roundId`) VALUES
('pa001', 'ro001'),
('pa003', 'ro002'),
('pa004', 'ro003'),
('pa001', 'ro004');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`absensiId`),
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
  ADD KEY `eventId` (`eventId`),
  ADD KEY `participantId` (`participantId`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentId`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi`
--
ALTER TABLE `absensi`
  MODIFY `absensiId` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`teacherId`);

--
-- Constraints for table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `participant_ibfk_1` FOREIGN KEY (`eventId`) REFERENCES `event` (`eventId`),
  ADD CONSTRAINT `participant_ibfk_2` FOREIGN KEY (`studentId`) REFERENCES `student` (`studentId`);

--
-- Constraints for table `round`
--
ALTER TABLE `round`
  ADD CONSTRAINT `round_ibfk_1` FOREIGN KEY (`eventId`) REFERENCES `event` (`eventId`);

--
-- Constraints for table `standing`
--
ALTER TABLE `standing`
  ADD CONSTRAINT `standing_ibfk_1` FOREIGN KEY (`eventId`) REFERENCES `event` (`eventId`),
  ADD CONSTRAINT `standing_ibfk_2` FOREIGN KEY (`participantId`) REFERENCES `participant` (`participantId`);

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
