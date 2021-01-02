-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: 127.0.0.1
-- Χρόνος δημιουργίας: 02 Ιαν 2021 στις 16:27:30
-- Έκδοση διακομιστή: 10.4.8-MariaDB
-- Έκδοση PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `my_tavli`
--

DELIMITER $$
--
-- Διαδικασίες
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `clean_board` ()  MODIFIES SQL DATA
    DETERMINISTIC
delete from board$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `move_piece` (IN `side1` CHAR(1), IN `y1` INT, IN `side2` CHAR(1), IN `y2` INT, IN `token1` INT, IN `color1` INT)  BEGIN
  update `board` set   quantity = quantity - 1 where `side` = side1 and `y`=y1;
  update `board` set  `piece_color` = (select piece_color from board where side = side1 and y = y1), quantity = quantity + 1 where `side` = side2 and `y`=y2;
  update `board` set `piece_color` = NULL where `quantity` = 0;
  update `players` set `last_action` = CURRENT_TIMESTAMP where `token` = token1;
  
  
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `board`
--

CREATE TABLE `board` (
  `side` enum('B','W') NOT NULL,
  `y` tinyint(1) NOT NULL,
  `quantity` tinyint(4) NOT NULL DEFAULT 0,
  `piece_color` enum('W','B') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `board`
--

INSERT INTO `board` (`side`, `y`, `quantity`, `piece_color`) VALUES
('B', 0, 15, 'B'),
('W', 0, 15, 'W'),
('B', 1, 0, NULL),
('W', 1, 0, NULL),
('B', 2, 0, NULL),
('W', 2, 0, NULL),
('B', 3, 0, NULL),
('W', 3, 0, NULL),
('B', 4, 0, NULL),
('W', 4, 0, NULL),
('B', 5, 0, NULL),
('W', 5, 0, NULL),
('B', 6, 0, NULL),
('W', 6, 0, NULL),
('B', 7, 0, NULL),
('W', 7, 0, NULL),
('B', 8, 0, NULL),
('W', 8, 0, NULL),
('B', 9, 0, NULL),
('W', 9, 0, NULL),
('B', 10, 0, NULL),
('W', 10, 0, NULL),
('B', 11, 0, NULL),
('W', 11, 0, NULL),
('B', 12, 0, NULL),
('W', 12, 0, NULL);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `board_empty`
--

CREATE TABLE `board_empty` (
  `side` enum('B','W') CHARACTER SET utf8 NOT NULL,
  `y` tinyint(1) NOT NULL,
  `quantity` tinyint(4) NOT NULL DEFAULT 0,
  `piece_color` enum('W','B') CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `board_empty`
--

INSERT INTO `board_empty` (`side`, `y`, `quantity`, `piece_color`) VALUES
('B', 0, 15, 'B'),
('B', 1, 0, NULL),
('B', 2, 0, NULL),
('B', 3, 0, NULL),
('B', 4, 0, NULL),
('B', 5, 0, NULL),
('B', 6, 0, NULL),
('B', 7, 0, NULL),
('B', 8, 0, NULL),
('B', 9, 0, NULL),
('B', 10, 0, NULL),
('B', 11, 0, NULL),
('B', 12, 0, NULL),
('W', 0, 15, 'W'),
('W', 1, 0, NULL),
('W', 2, 0, NULL),
('W', 3, 0, NULL),
('W', 4, 0, NULL),
('W', 5, 0, NULL),
('W', 6, 0, NULL),
('W', 7, 0, NULL),
('W', 8, 0, NULL),
('W', 9, 0, NULL),
('W', 10, 0, NULL),
('W', 11, 0, NULL),
('W', 12, 0, NULL);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `game_status`
--

CREATE TABLE `game_status` (
  `status` enum('not active','initialized','started','ended','aborded') NOT NULL DEFAULT 'not active',
  `p_turn` enum('W','B') DEFAULT NULL,
  `result` enum('B','W','D') DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `game_status`
--

INSERT INTO `game_status` (`status`, `p_turn`, `result`, `last_change`) VALUES
('initialized', NULL, 'B', '2020-12-27 21:20:38');

--
-- Δείκτες `game_status`
--
DELIMITER $$
CREATE TRIGGER `game_status_update` BEFORE UPDATE ON `game_status` FOR EACH ROW BEGIN
		set NEW.last_change = now();
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `players`
--

CREATE TABLE `players` (
  `username` varchar(20) DEFAULT NULL,
  `piece_color` enum('B','W') NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `last_action` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `players`
--

INSERT INTO `players` (`username`, `piece_color`, `token`, `last_action`) VALUES
(NULL, 'B', NULL, NULL),
(NULL, 'W', NULL, NULL);

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `board`
--
ALTER TABLE `board`
  ADD PRIMARY KEY (`y`,`side`);

--
-- Ευρετήρια για πίνακα `board_empty`
--
ALTER TABLE `board_empty`
  ADD PRIMARY KEY (`side`,`y`);

--
-- Ευρετήρια για πίνακα `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`piece_color`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
