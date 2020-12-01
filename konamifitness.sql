-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2020 at 09:43 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `konamifitness`
--

-- --------------------------------------------------------

--
-- Table structure for table `roster`
--

CREATE TABLE `roster` (
  `rosterID` int(11) NOT NULL,
  `teamID` int(11) NOT NULL,
  `playerID` int(11) NOT NULL,
  `coach` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `teamID` int(11) NOT NULL,
  `teamname` varchar(50) NOT NULL,
  `coachID` int(11) NOT NULL,
  `coachname` int(50) NOT NULL,
  `sport` varchar(50) NOT NULL DEFAULT 'Fitness'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `sex` tinyint(4) NOT NULL DEFAULT 2,
  `age` int(11) DEFAULT NULL,
  `weight` int(11) NOT NULL,
  `height` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `usertogrocery`
--

CREATE TABLE `usertogrocery` (
  `groceryID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `food1` int(11) NOT NULL,
  `food2` int(11) DEFAULT NULL,
  `food3` int(11) DEFAULT NULL,
  `food4` int(11) DEFAULT NULL,
  `food5` int(11) DEFAULT NULL,
  `food6` int(11) DEFAULT NULL,
  `food7` int(11) DEFAULT NULL,
  `food8` int(11) DEFAULT NULL,
  `food9` int(11) DEFAULT NULL,
  `food10` int(11) DEFAULT NULL,
  `food11` int(11) DEFAULT NULL,
  `food12` int(11) DEFAULT NULL,
  `food13` int(11) DEFAULT NULL,
  `food14` int(11) DEFAULT NULL,
  `food15` int(11) DEFAULT NULL,
  `food16` int(11) DEFAULT NULL,
  `food17` int(11) DEFAULT NULL,
  `food18` int(11) DEFAULT NULL,
  `food19` int(11) DEFAULT NULL,
  `food20` int(11) DEFAULT NULL,
  `food21` int(11) DEFAULT NULL,
  `food22` int(11) DEFAULT NULL,
  `food23` int(11) DEFAULT NULL,
  `food24` int(11) DEFAULT NULL,
  `food25` int(11) DEFAULT NULL,
  `food26` int(11) DEFAULT NULL,
  `food27` int(11) DEFAULT NULL,
  `food28` int(11) DEFAULT NULL,
  `food29` int(11) DEFAULT NULL,
  `food30` int(11) DEFAULT NULL,
  `food31` int(11) DEFAULT NULL,
  `food32` int(11) DEFAULT NULL,
  `food33` int(11) DEFAULT NULL,
  `food34` int(11) DEFAULT NULL,
  `food35` int(11) DEFAULT NULL,
  `food36` int(11) DEFAULT NULL,
  `food37` int(11) DEFAULT NULL,
  `food38` int(11) DEFAULT NULL,
  `food39` int(11) DEFAULT NULL,
  `food40` int(11) DEFAULT NULL,
  `food41` int(11) DEFAULT NULL,
  `food42` int(11) DEFAULT NULL,
  `food43` int(11) DEFAULT NULL,
  `food44` int(11) DEFAULT NULL,
  `food45` int(11) DEFAULT NULL,
  `food46` int(11) DEFAULT NULL,
  `food47` int(11) DEFAULT NULL,
  `food48` int(11) DEFAULT NULL,
  `food49` int(11) DEFAULT NULL,
  `food50` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `usertonutrition`
--

CREATE TABLE `usertonutrition` (
  `nutritionid` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `nid1` int(11) NOT NULL,
  `nid2` int(11) DEFAULT NULL,
  `nid3` int(11) DEFAULT NULL,
  `nid4` int(11) DEFAULT NULL,
  `nid5` int(11) DEFAULT NULL,
  `nid6` int(11) DEFAULT NULL,
  `nid7` int(11) DEFAULT NULL,
  `nid8` int(11) DEFAULT NULL,
  `nid9` int(11) DEFAULT NULL,
  `nid10` int(11) DEFAULT NULL,
  `nid11` int(11) DEFAULT NULL,
  `nid12` int(11) DEFAULT NULL,
  `nid13` int(11) DEFAULT NULL,
  `nid14` int(11) DEFAULT NULL,
  `nid15` int(11) DEFAULT NULL,
  `nid16` int(11) DEFAULT NULL,
  `nid17` int(11) DEFAULT NULL,
  `nid18` int(11) DEFAULT NULL,
  `nid19` int(11) DEFAULT NULL,
  `nid20` int(11) DEFAULT NULL,
  `nid21` int(11) DEFAULT NULL,
  `nid22` int(11) DEFAULT NULL,
  `nid23` int(11) DEFAULT NULL,
  `nid24` int(11) DEFAULT NULL,
  `nid25` int(11) DEFAULT NULL,
  `nid26` int(11) DEFAULT NULL,
  `nid27` int(11) DEFAULT NULL,
  `nid28` int(11) DEFAULT NULL,
  `nid29` int(11) DEFAULT NULL,
  `nid30` int(11) DEFAULT NULL,
  `nid31` int(11) DEFAULT NULL,
  `nid32` int(11) DEFAULT NULL,
  `nid33` int(11) DEFAULT NULL,
  `nid34` int(11) DEFAULT NULL,
  `nid35` int(11) DEFAULT NULL,
  `nid36` int(11) DEFAULT NULL,
  `nid37` int(11) DEFAULT NULL,
  `nid38` int(11) DEFAULT NULL,
  `nid39` int(11) DEFAULT NULL,
  `nid40` int(11) DEFAULT NULL,
  `nid41` int(11) DEFAULT NULL,
  `nid42` int(11) DEFAULT NULL,
  `nid43` int(11) DEFAULT NULL,
  `nid44` int(11) DEFAULT NULL,
  `nid45` int(11) DEFAULT NULL,
  `nid46` int(11) DEFAULT NULL,
  `nid47` int(11) DEFAULT NULL,
  `nid48` int(11) DEFAULT NULL,
  `nid49` int(11) DEFAULT NULL,
  `nid50` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `usertoworkouts`
--

CREATE TABLE `usertoworkouts` (
  `workoutID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `wid1` int(11) NOT NULL,
  `wid2` int(11) DEFAULT NULL,
  `wid3` int(11) DEFAULT NULL,
  `wid4` int(11) DEFAULT NULL,
  `wid5` int(11) DEFAULT NULL,
  `wid6` int(11) DEFAULT NULL,
  `wid7` int(11) DEFAULT NULL,
  `wid8` int(11) DEFAULT NULL,
  `wid9` int(11) DEFAULT NULL,
  `wid10` int(11) DEFAULT NULL,
  `wid11` int(11) DEFAULT NULL,
  `wid12` int(11) DEFAULT NULL,
  `wid13` int(11) DEFAULT NULL,
  `wid14` int(11) DEFAULT NULL,
  `wid15` int(11) DEFAULT NULL,
  `wid16` int(11) DEFAULT NULL,
  `wid17` int(11) DEFAULT NULL,
  `wid18` int(11) DEFAULT NULL,
  `wid19` int(11) DEFAULT NULL,
  `wid20` int(11) DEFAULT NULL,
  `wid21` int(11) DEFAULT NULL,
  `wid22` int(11) DEFAULT NULL,
  `wid23` int(11) DEFAULT NULL,
  `wid24` int(11) DEFAULT NULL,
  `wid25` int(11) DEFAULT NULL,
  `wid26` int(11) DEFAULT NULL,
  `wid27` int(11) DEFAULT NULL,
  `wid28` int(11) DEFAULT NULL,
  `wid29` int(11) DEFAULT NULL,
  `wid30` int(11) DEFAULT NULL,
  `wid31` int(11) DEFAULT NULL,
  `wid32` int(11) DEFAULT NULL,
  `wid33` int(11) DEFAULT NULL,
  `wid34` int(11) DEFAULT NULL,
  `wid35` int(11) DEFAULT NULL,
  `wid36` int(11) DEFAULT NULL,
  `wid37` int(11) DEFAULT NULL,
  `wid38` int(11) DEFAULT NULL,
  `wid39` int(11) DEFAULT NULL,
  `wid40` int(11) DEFAULT NULL,
  `wid41` int(11) DEFAULT NULL,
  `wid42` int(11) DEFAULT NULL,
  `wid43` int(11) DEFAULT NULL,
  `wid44` int(11) DEFAULT NULL,
  `wid45` int(11) DEFAULT NULL,
  `wid46` int(11) DEFAULT NULL,
  `wid47` int(11) DEFAULT NULL,
  `wid48` int(11) DEFAULT NULL,
  `wid49` int(11) DEFAULT NULL,
  `wid50` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `roster`
--
ALTER TABLE `roster`
  ADD PRIMARY KEY (`rosterID`),
  ADD KEY `fk_team_id` (`teamID`),
  ADD KEY `fk_player_id` (`playerID`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`teamID`),
  ADD KEY `fk_coachid_userid` (`coachID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `roster`
--
ALTER TABLE `roster`
  ADD CONSTRAINT `fk_player_id` FOREIGN KEY (`playerID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `fk_coachid_userid` FOREIGN KEY (`coachID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
