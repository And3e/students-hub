-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Nov 02, 2023 alle 10:53
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `students_hub_db`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `Address`
--

CREATE TABLE `Address` (
  `cod_address` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `FKcod_institute` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Address`
--

INSERT INTO `Address` (`cod_address`, `name`, `position`, `FKcod_institute`) VALUES
(1, 'AGR.AGROAL.AGROIND. / PRODUZIONI E TRASFORMAZIONI', 'Regione la RochèRe 1/A', 2),
(2, 'IEFP COMPLEMENTARE', 'Regione la RochèRe 1/A', 2),
(3, 'INFORMATICA E TELECOMUNICAZIONI', 'Via J.B. Festaz 27/A', 1),
(4, 'AMMINISTRAZIONE, FINANZA E MARKETING', 'Via J.B. Festaz 27/A', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `Classes`
--

CREATE TABLE `Classes` (
  `cod_class` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `section` char(1) NOT NULL,
  `schoolyear` varchar(255) NOT NULL,
  `FKcod_address` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Classes`
--

INSERT INTO `Classes` (`cod_class`, `year`, `section`, `schoolyear`, `FKcod_address`) VALUES
(1, 2, 'A', '2023-2024', 1),
(2, 4, 'B', '2021-2022', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `ClassSubjects`
--

CREATE TABLE `ClassSubjects` (
  `cod_classSubjects` int(11) NOT NULL,
  `FKcod_class` int(11) DEFAULT NULL,
  `FKcod_subject` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `ClassSubjects`
--

INSERT INTO `ClassSubjects` (`cod_classSubjects`, `FKcod_class`, `FKcod_subject`) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 2, 3),
(4, 2, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `Comments`
--

CREATE TABLE `Comments` (
  `cod_comment` int(11) NOT NULL,
  `corp` varchar(255) NOT NULL,
  `FKcod_user` int(11) NOT NULL,
  `FKcod_note` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Institutes`
--

CREATE TABLE `Institutes` (
  `cod_institute` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sede` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Institutes`
--

INSERT INTO `Institutes` (`cod_institute`, `name`, `sede`) VALUES
(1, 'Innocent Manzetti', 'Via J.B. Festaz 27/A'),
(2, 'Institut Agricole Régional', 'Regione la RochèRe 1/A');

-- --------------------------------------------------------

--
-- Struttura della tabella `Notes`
--

CREATE TABLE `Notes` (
  `cod_note` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `FKcod_user` int(11) NOT NULL,
  `FKcod_classSubjects` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Reviews`
--

CREATE TABLE `Reviews` (
  `cod_review` int(11) NOT NULL,
  `vote` int(11) NOT NULL,
  `FKcod_user` int(11) NOT NULL,
  `FKcod_note` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Subjects`
--

CREATE TABLE `Subjects` (
  `cod_subject` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Subjects`
--

INSERT INTO `Subjects` (`cod_subject`, `name`) VALUES
(1, 'Matematica'),
(2, 'Francese'),
(3, 'Italiano'),
(4, 'Storia');

-- --------------------------------------------------------

--
-- Struttura della tabella `Users`
--

CREATE TABLE `Users` (
  `cod_user` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `FKcod_class` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Users`
--

INSERT INTO `Users` (`cod_user`, `name`, `surname`, `email`, `password`, `FKcod_class`) VALUES
(1, 'John', 'Millet', 'sr.millet@mail.scuole.vda.it', 'CIAo', 1),
(2, 'André ', 'Marguerettaz', 'sa.marguerettaz@mail.scuole.vda.it', 'And3e', 2);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Address`
--
ALTER TABLE `Address`
  ADD PRIMARY KEY (`cod_address`),
  ADD KEY `5` (`FKcod_institute`);

--
-- Indici per le tabelle `Classes`
--
ALTER TABLE `Classes`
  ADD PRIMARY KEY (`cod_class`),
  ADD KEY `8` (`FKcod_address`);

--
-- Indici per le tabelle `ClassSubjects`
--
ALTER TABLE `ClassSubjects`
  ADD PRIMARY KEY (`cod_classSubjects`),
  ADD KEY `1` (`FKcod_class`),
  ADD KEY `2` (`FKcod_subject`);

--
-- Indici per le tabelle `Comments`
--
ALTER TABLE `Comments`
  ADD PRIMARY KEY (`cod_comment`),
  ADD KEY `11` (`FKcod_note`),
  ADD KEY `12` (`FKcod_user`);

--
-- Indici per le tabelle `Institutes`
--
ALTER TABLE `Institutes`
  ADD PRIMARY KEY (`cod_institute`);

--
-- Indici per le tabelle `Notes`
--
ALTER TABLE `Notes`
  ADD PRIMARY KEY (`cod_note`),
  ADD KEY `7` (`FKcod_user`),
  ADD KEY `3` (`FKcod_classSubjects`);

--
-- Indici per le tabelle `Reviews`
--
ALTER TABLE `Reviews`
  ADD PRIMARY KEY (`cod_review`),
  ADD KEY `13` (`FKcod_note`),
  ADD KEY `14` (`FKcod_user`);

--
-- Indici per le tabelle `Subjects`
--
ALTER TABLE `Subjects`
  ADD PRIMARY KEY (`cod_subject`);

--
-- Indici per le tabelle `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`cod_user`),
  ADD KEY `6` (`FKcod_class`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `Address`
--
ALTER TABLE `Address`
  ADD CONSTRAINT `5` FOREIGN KEY (`FKcod_institute`) REFERENCES `Institutes` (`cod_institute`);

--
-- Limiti per la tabella `Classes`
--
ALTER TABLE `Classes`
  ADD CONSTRAINT `8` FOREIGN KEY (`FKcod_address`) REFERENCES `Address` (`cod_address`);

--
-- Limiti per la tabella `ClassSubjects`
--
ALTER TABLE `ClassSubjects`
  ADD CONSTRAINT `1` FOREIGN KEY (`FKcod_class`) REFERENCES `Classes` (`cod_class`),
  ADD CONSTRAINT `2` FOREIGN KEY (`FKcod_subject`) REFERENCES `Subjects` (`cod_subject`);

--
-- Limiti per la tabella `Comments`
--
ALTER TABLE `Comments`
  ADD CONSTRAINT `11` FOREIGN KEY (`FKcod_note`) REFERENCES `Notes` (`cod_note`),
  ADD CONSTRAINT `12` FOREIGN KEY (`FKcod_user`) REFERENCES `Users` (`cod_user`);

--
-- Limiti per la tabella `Notes`
--
ALTER TABLE `Notes`
  ADD CONSTRAINT `3` FOREIGN KEY (`FKcod_classSubjects`) REFERENCES `ClassSubjects` (`cod_classSubjects`),
  ADD CONSTRAINT `7` FOREIGN KEY (`FKcod_user`) REFERENCES `Users` (`cod_user`);

--
-- Limiti per la tabella `Reviews`
--
ALTER TABLE `Reviews`
  ADD CONSTRAINT `13` FOREIGN KEY (`FKcod_note`) REFERENCES `Notes` (`cod_note`),
  ADD CONSTRAINT `14` FOREIGN KEY (`FKcod_user`) REFERENCES `Users` (`cod_user`);

--
-- Limiti per la tabella `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `6` FOREIGN KEY (`FKcod_class`) REFERENCES `Classes` (`cod_class`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
