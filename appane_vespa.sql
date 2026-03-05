-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mar 05, 2026 alle 22:20
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `appane_vespa`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `account`
--

CREATE TABLE `account` (
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `cliente`
--

CREATE TABLE `cliente` (
  `email` varchar(255) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `n_telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `composizione`
--

CREATE TABLE `composizione` (
  `nome_ingrediente` varchar(100) NOT NULL,
  `nome_prodotto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `immagine_ingrediente`
--

CREATE TABLE `immagine_ingrediente` (
  `id_immagine` int(11) NOT NULL,
  `nome_ingrediente` varchar(100) NOT NULL,
  `percorso_file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `immagine_prodotto`
--

CREATE TABLE `immagine_prodotto` (
  `id_immagine` int(11) NOT NULL,
  `nome_prodotto` varchar(100) NOT NULL,
  `percorso_file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `indirizzo_di_consegna`
--

CREATE TABLE `indirizzo_di_consegna` (
  `id_indirizzo` int(11) NOT NULL,
  `n_civico` varchar(10) NOT NULL,
  `cap` varchar(10) NOT NULL,
  `via` varchar(100) NOT NULL,
  `citta` varchar(100) NOT NULL,
  `username_account` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ingrediente`
--

CREATE TABLE `ingrediente` (
  `nome` varchar(100) NOT NULL,
  `descrizione` text DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `menu_settimanale`
--

CREATE TABLE `menu_settimanale` (
  `id_menu` int(11) NOT NULL,
  `data` date NOT NULL DEFAULT current_timestamp(),
  `giorno_ripubblicazione` varchar(20) DEFAULT 'Mercoledì',
  `giorno_fine_ordinazioni` varchar(20) DEFAULT 'Venerdì'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ordine`
--

CREATE TABLE `ordine` (
  `id_ordine` int(11) NOT NULL,
  `importo` decimal(10,2) NOT NULL,
  `data` datetime NOT NULL,
  `stato` varchar(50) NOT NULL DEFAULT 'In attesa',
  `id_indirizzo` int(11) NOT NULL,
  `username_account` varchar(50) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotto`
--

CREATE TABLE `prodotto` (
  `nome` varchar(100) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `prezzo` decimal(10,2) NOT NULL,
  `descrizione` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `produzione`
--

CREATE TABLE `produzione` (
  `nome_prodotto` varchar(100) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `registrazione`
--

CREATE TABLE `registrazione` (
  `email_cliente` varchar(255) NOT NULL,
  `username_account` varchar(50) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `selezione`
--

CREATE TABLE `selezione` (
  `id_ordine` int(11) NOT NULL,
  `nome_prodotto` varchar(100) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `quantita` int(11) NOT NULL CHECK (`quantita` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`username`);

--
-- Indici per le tabelle `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`email`);

--
-- Indici per le tabelle `composizione`
--
ALTER TABLE `composizione`
  ADD PRIMARY KEY (`nome_ingrediente`,`nome_prodotto`),
  ADD KEY `nome_prodotto` (`nome_prodotto`);

--
-- Indici per le tabelle `immagine_ingrediente`
--
ALTER TABLE `immagine_ingrediente`
  ADD PRIMARY KEY (`id_immagine`),
  ADD KEY `nome_ingrediente` (`nome_ingrediente`);

--
-- Indici per le tabelle `immagine_prodotto`
--
ALTER TABLE `immagine_prodotto`
  ADD PRIMARY KEY (`id_immagine`),
  ADD KEY `nome_prodotto` (`nome_prodotto`);

--
-- Indici per le tabelle `indirizzo_di_consegna`
--
ALTER TABLE `indirizzo_di_consegna`
  ADD PRIMARY KEY (`id_indirizzo`),
  ADD KEY `username_account` (`username_account`);

--
-- Indici per le tabelle `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD PRIMARY KEY (`nome`);

--
-- Indici per le tabelle `menu_settimanale`
--
ALTER TABLE `menu_settimanale`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indici per le tabelle `ordine`
--
ALTER TABLE `ordine`
  ADD PRIMARY KEY (`id_ordine`),
  ADD KEY `id_indirizzo` (`id_indirizzo`),
  ADD KEY `username_account` (`username_account`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indici per le tabelle `prodotto`
--
ALTER TABLE `prodotto`
  ADD PRIMARY KEY (`nome`);

--
-- Indici per le tabelle `produzione`
--
ALTER TABLE `produzione`
  ADD PRIMARY KEY (`nome_prodotto`,`id_menu`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indici per le tabelle `registrazione`
--
ALTER TABLE `registrazione`
  ADD PRIMARY KEY (`email_cliente`,`username_account`),
  ADD KEY `username_account` (`username_account`);

--
-- Indici per le tabelle `selezione`
--
ALTER TABLE `selezione`
  ADD PRIMARY KEY (`id_ordine`,`nome_prodotto`,`id_menu`),
  ADD KEY `nome_prodotto` (`nome_prodotto`),
  ADD KEY `id_menu` (`id_menu`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `immagine_ingrediente`
--
ALTER TABLE `immagine_ingrediente`
  MODIFY `id_immagine` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `immagine_prodotto`
--
ALTER TABLE `immagine_prodotto`
  MODIFY `id_immagine` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `indirizzo_di_consegna`
--
ALTER TABLE `indirizzo_di_consegna`
  MODIFY `id_indirizzo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `menu_settimanale`
--
ALTER TABLE `menu_settimanale`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ordine`
--
ALTER TABLE `ordine`
  MODIFY `id_ordine` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `composizione`
--
ALTER TABLE `composizione`
  ADD CONSTRAINT `composizione_ibfk_1` FOREIGN KEY (`nome_ingrediente`) REFERENCES `ingrediente` (`nome`) ON DELETE CASCADE,
  ADD CONSTRAINT `composizione_ibfk_2` FOREIGN KEY (`nome_prodotto`) REFERENCES `prodotto` (`nome`) ON DELETE CASCADE;

--
-- Limiti per la tabella `immagine_ingrediente`
--
ALTER TABLE `immagine_ingrediente`
  ADD CONSTRAINT `immagine_ingrediente_ibfk_1` FOREIGN KEY (`nome_ingrediente`) REFERENCES `ingrediente` (`nome`) ON DELETE CASCADE;

--
-- Limiti per la tabella `immagine_prodotto`
--
ALTER TABLE `immagine_prodotto`
  ADD CONSTRAINT `immagine_prodotto_ibfk_1` FOREIGN KEY (`nome_prodotto`) REFERENCES `prodotto` (`nome`) ON DELETE CASCADE;

--
-- Limiti per la tabella `indirizzo_di_consegna`
--
ALTER TABLE `indirizzo_di_consegna`
  ADD CONSTRAINT `indirizzo_di_consegna_ibfk_1` FOREIGN KEY (`username_account`) REFERENCES `account` (`username`) ON DELETE CASCADE;

--
-- Limiti per la tabella `ordine`
--
ALTER TABLE `ordine`
  ADD CONSTRAINT `ordine_ibfk_1` FOREIGN KEY (`id_indirizzo`) REFERENCES `indirizzo_di_consegna` (`id_indirizzo`),
  ADD CONSTRAINT `ordine_ibfk_2` FOREIGN KEY (`username_account`) REFERENCES `account` (`username`),
  ADD CONSTRAINT `ordine_ibfk_3` FOREIGN KEY (`id_menu`) REFERENCES `menu_settimanale` (`id_menu`);

--
-- Limiti per la tabella `produzione`
--
ALTER TABLE `produzione`
  ADD CONSTRAINT `produzione_ibfk_1` FOREIGN KEY (`nome_prodotto`) REFERENCES `prodotto` (`nome`) ON DELETE CASCADE,
  ADD CONSTRAINT `produzione_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `menu_settimanale` (`id_menu`) ON DELETE CASCADE;

--
-- Limiti per la tabella `registrazione`
--
ALTER TABLE `registrazione`
  ADD CONSTRAINT `registrazione_ibfk_1` FOREIGN KEY (`email_cliente`) REFERENCES `cliente` (`email`) ON DELETE CASCADE,
  ADD CONSTRAINT `registrazione_ibfk_2` FOREIGN KEY (`username_account`) REFERENCES `account` (`username`) ON DELETE CASCADE;

--
-- Limiti per la tabella `selezione`
--
ALTER TABLE `selezione`
  ADD CONSTRAINT `selezione_ibfk_1` FOREIGN KEY (`id_ordine`) REFERENCES `ordine` (`id_ordine`) ON DELETE CASCADE,
  ADD CONSTRAINT `selezione_ibfk_2` FOREIGN KEY (`nome_prodotto`) REFERENCES `prodotto` (`nome`) ON DELETE CASCADE,
  ADD CONSTRAINT `selezione_ibfk_3` FOREIGN KEY (`id_menu`) REFERENCES `menu_settimanale` (`id_menu`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
