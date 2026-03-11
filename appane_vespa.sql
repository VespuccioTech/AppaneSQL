-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mar 11, 2026 alle 13:51
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
-- Struttura della tabella `taccount`
--

CREATE TABLE `taccount` (
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tcliente`
--

CREATE TABLE `tcliente` (
  `email` varchar(255) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `n_telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tcomposizione`
--

CREATE TABLE `tcomposizione` (
  `nome_ingrediente` varchar(100) NOT NULL,
  `nome_prodotto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `timmagine_prodotto`
--

CREATE TABLE `timmagine_prodotto` (
  `id_immagine` int(11) NOT NULL,
  `nome_prodotto` varchar(100) NOT NULL,
  `percorso_file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tindirizzo_di_consegna`
--

CREATE TABLE `tindirizzo_di_consegna` (
  `id_indirizzo` int(11) NOT NULL,
  `n_civico` varchar(10) NOT NULL,
  `cap` varchar(10) NOT NULL,
  `via` varchar(100) NOT NULL,
  `citta` varchar(100) NOT NULL,
  `username_account` varchar(50) NOT NULL,
  `attivo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tingrediente`
--

CREATE TABLE `tingrediente` (
  `nome` varchar(100) NOT NULL,
  `descrizione` text DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tmenu_settimanale`
--

CREATE TABLE `tmenu_settimanale` (
  `id_menu` int(11) NOT NULL,
  `data` date NOT NULL DEFAULT current_timestamp(),
  `giorno_ripubblicazione` varchar(20) DEFAULT 'Mercoledì',
  `giorno_fine_ordinazioni` varchar(20) DEFAULT 'Venerdì'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tordine`
--

CREATE TABLE `tordine` (
  `id_ordine` int(11) NOT NULL,
  `importo` decimal(10,2) NOT NULL,
  `data` datetime NOT NULL,
  `stato` varchar(50) NOT NULL DEFAULT 'In attesa',
  `id_indirizzo` int(11) NOT NULL,
  `username_account` varchar(50) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tprodotto`
--

CREATE TABLE `tprodotto` (
  `nome` varchar(100) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `prezzo` decimal(10,2) NOT NULL,
  `descrizione` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tproduzione`
--

CREATE TABLE `tproduzione` (
  `nome_prodotto` varchar(100) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tregistrazione`
--

CREATE TABLE `tregistrazione` (
  `email_cliente` varchar(255) NOT NULL,
  `username_account` varchar(50) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tselezione`
--

CREATE TABLE `tselezione` (
  `id_ordine` int(11) NOT NULL,
  `nome_prodotto` varchar(100) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `quantita` int(11) NOT NULL CHECK (`quantita` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `taccount`
--
ALTER TABLE `taccount`
  ADD PRIMARY KEY (`username`);

--
-- Indici per le tabelle `tcliente`
--
ALTER TABLE `tcliente`
  ADD PRIMARY KEY (`email`);

--
-- Indici per le tabelle `tcomposizione`
--
ALTER TABLE `tcomposizione`
  ADD PRIMARY KEY (`nome_ingrediente`,`nome_prodotto`),
  ADD KEY `nome_prodotto` (`nome_prodotto`);

--
-- Indici per le tabelle `timmagine_prodotto`
--
ALTER TABLE `timmagine_prodotto`
  ADD PRIMARY KEY (`id_immagine`),
  ADD KEY `nome_prodotto` (`nome_prodotto`);

--
-- Indici per le tabelle `tindirizzo_di_consegna`
--
ALTER TABLE `tindirizzo_di_consegna`
  ADD PRIMARY KEY (`id_indirizzo`),
  ADD KEY `username_account` (`username_account`);

--
-- Indici per le tabelle `tingrediente`
--
ALTER TABLE `tingrediente`
  ADD PRIMARY KEY (`nome`);

--
-- Indici per le tabelle `tmenu_settimanale`
--
ALTER TABLE `tmenu_settimanale`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indici per le tabelle `tordine`
--
ALTER TABLE `tordine`
  ADD PRIMARY KEY (`id_ordine`),
  ADD KEY `id_indirizzo` (`id_indirizzo`),
  ADD KEY `username_account` (`username_account`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indici per le tabelle `tprodotto`
--
ALTER TABLE `tprodotto`
  ADD PRIMARY KEY (`nome`);

--
-- Indici per le tabelle `tproduzione`
--
ALTER TABLE `tproduzione`
  ADD PRIMARY KEY (`nome_prodotto`,`id_menu`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indici per le tabelle `tregistrazione`
--
ALTER TABLE `tregistrazione`
  ADD PRIMARY KEY (`email_cliente`,`username_account`),
  ADD KEY `username_account` (`username_account`);

--
-- Indici per le tabelle `tselezione`
--
ALTER TABLE `tselezione`
  ADD PRIMARY KEY (`id_ordine`,`nome_prodotto`,`id_menu`),
  ADD KEY `nome_prodotto` (`nome_prodotto`),
  ADD KEY `id_menu` (`id_menu`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `timmagine_prodotto`
--
ALTER TABLE `timmagine_prodotto`
  MODIFY `id_immagine` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `tindirizzo_di_consegna`
--
ALTER TABLE `tindirizzo_di_consegna`
  MODIFY `id_indirizzo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `tmenu_settimanale`
--
ALTER TABLE `tmenu_settimanale`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `tordine`
--
ALTER TABLE `tordine`
  MODIFY `id_ordine` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `tcomposizione`
--
ALTER TABLE `tcomposizione`
  ADD CONSTRAINT `composizione_ibfk_1` FOREIGN KEY (`nome_ingrediente`) REFERENCES `tingrediente` (`nome`) ON DELETE CASCADE,
  ADD CONSTRAINT `composizione_ibfk_2` FOREIGN KEY (`nome_prodotto`) REFERENCES `tprodotto` (`nome`) ON DELETE CASCADE;

--
-- Limiti per la tabella `timmagine_prodotto`
--
ALTER TABLE `timmagine_prodotto`
  ADD CONSTRAINT `immagine_prodotto_ibfk_1` FOREIGN KEY (`nome_prodotto`) REFERENCES `tprodotto` (`nome`) ON DELETE CASCADE;

--
-- Limiti per la tabella `tindirizzo_di_consegna`
--
ALTER TABLE `tindirizzo_di_consegna`
  ADD CONSTRAINT `indirizzo_di_consegna_ibfk_1` FOREIGN KEY (`username_account`) REFERENCES `taccount` (`username`) ON DELETE CASCADE;

--
-- Limiti per la tabella `tordine`
--
ALTER TABLE `tordine`
  ADD CONSTRAINT `ordine_ibfk_1` FOREIGN KEY (`id_indirizzo`) REFERENCES `tindirizzo_di_consegna` (`id_indirizzo`),
  ADD CONSTRAINT `ordine_ibfk_2` FOREIGN KEY (`username_account`) REFERENCES `taccount` (`username`),
  ADD CONSTRAINT `ordine_ibfk_3` FOREIGN KEY (`id_menu`) REFERENCES `tmenu_settimanale` (`id_menu`);

--
-- Limiti per la tabella `tproduzione`
--
ALTER TABLE `tproduzione`
  ADD CONSTRAINT `produzione_ibfk_1` FOREIGN KEY (`nome_prodotto`) REFERENCES `tprodotto` (`nome`) ON DELETE CASCADE,
  ADD CONSTRAINT `produzione_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `tmenu_settimanale` (`id_menu`) ON DELETE CASCADE;

--
-- Limiti per la tabella `tregistrazione`
--
ALTER TABLE `tregistrazione`
  ADD CONSTRAINT `registrazione_ibfk_1` FOREIGN KEY (`email_cliente`) REFERENCES `tcliente` (`email`) ON DELETE CASCADE,
  ADD CONSTRAINT `registrazione_ibfk_2` FOREIGN KEY (`username_account`) REFERENCES `taccount` (`username`) ON DELETE CASCADE;

--
-- Limiti per la tabella `tselezione`
--
ALTER TABLE `tselezione`
  ADD CONSTRAINT `selezione_ibfk_1` FOREIGN KEY (`id_ordine`) REFERENCES `tordine` (`id_ordine`) ON DELETE CASCADE,
  ADD CONSTRAINT `selezione_ibfk_2` FOREIGN KEY (`nome_prodotto`) REFERENCES `tprodotto` (`nome`) ON DELETE CASCADE,
  ADD CONSTRAINT `selezione_ibfk_3` FOREIGN KEY (`id_menu`) REFERENCES `tmenu_settimanale` (`id_menu`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
