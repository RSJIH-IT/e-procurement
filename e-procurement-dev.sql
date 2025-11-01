-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 31, 2025 at 11:46 PM
-- Server version: 8.0.40
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-procurement-dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `cat_offr`
--

CREATE TABLE `cat_offr` (
  `id_cat` int NOT NULL,
  `index` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT 'null, Gas Medis, Perlengkapan Pasien, ATK, Barang Cetakan, Barang RT (Rumah Tangga), Solar, Spare Part, Peralatan Medis, lainnya'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cat_offr`
--

INSERT INTO `cat_offr` (`id_cat`, `index`, `name`) VALUES
(1, 0, 'null'),
(2, 1, 'gas medis'),
(3, 2, 'perlengkapan medis'),
(4, 3, 'atk'),
(5, 4, 'barang cetakan'),
(6, 5, 'barang rt (rumah tangga)'),
(7, 6, 'solar'),
(8, 7, 'spare part'),
(9, 8, 'peralatan medis'),
(10, 9, 'lainnya');

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `id` int NOT NULL,
  `index` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`id`, `index`, `name`) VALUES
(1, 0, 'null'),
(2, 1, 'merah'),
(3, 2, 'kuning'),
(4, 3, 'hijau'),
(5, 4, 'biru');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id_company` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `type` int DEFAULT '2' COMMENT 'def: 2 - vendor',
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `status` int DEFAULT '1' COMMENT 'def: 0 - active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id_company`, `name`, `pic`, `type`, `email`, `phone`, `address`, `status`) VALUES
(1, 'RS JIH YK', NULL, 1, 'info@rs-jih.co.id', ' 0274-446-3535', 'Jl. Ring Road Utara No.160, Perumnas Condong Catur, Condongcatur, Kec. Depok, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55283', 1),
(2, 'Kharismas', NULL, 2, 'kharisma@gmail.com', '089912341234', 'jl jalan ke kota baru', 1),
(3, 'contoh', NULL, 2, 'email@email.com', '123412341234', 'asdf', 2),
(4, 'contoh2', NULL, 2, 'email@email.com2', '123412341234', 'asdf', 2);

-- --------------------------------------------------------

--
-- Table structure for table `dimention`
--

CREATE TABLE `dimention` (
  `id_dim` int NOT NULL,
  `index` int DEFAULT NULL,
  `heigth` int DEFAULT '0' COMMENT 'in cm',
  `width` int DEFAULT '0' COMMENT 'in cm',
  `length` int DEFAULT '0' COMMENT 'in cm'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dimention`
--

INSERT INTO `dimention` (`id_dim`, `index`, `heigth`, `width`, `length`) VALUES
(1, 0, 40, 35, 10);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id_log` int NOT NULL,
  `data` text,
  `tipe` int DEFAULT NULL,
  `affected_count` int DEFAULT '0',
  `affected_data` text,
  `support_data` text,
  `response` text,
  `url` varchar(255) DEFAULT '',
  `data_id` int DEFAULT '0',
  `kolom` varchar(255) DEFAULT '',
  `tabel` varchar(255) DEFAULT '',
  `original_data` text,
  `status` int DEFAULT NULL,
  `time_at` datetime NOT NULL DEFAULT (now()),
  `by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offer`
--

CREATE TABLE `offer` (
  `id_offer` int NOT NULL,
  `requester` int DEFAULT NULL,
  `vendor` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `detail` text,
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `offer`
--

INSERT INTO `offer` (`id_offer`, `requester`, `vendor`, `name`, `detail`, `status`) VALUES
(1, 2, 1, 'Komputer TUF', 'Contoh offering komputer', 1);

-- --------------------------------------------------------

--
-- Table structure for table `off_file`
--

CREATE TABLE `off_file` (
  `id_file` int NOT NULL,
  `offer` int DEFAULT NULL,
  `location` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `off_item`
--

CREATE TABLE `off_item` (
  `id_item` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `detail` text,
  `count` int NOT NULL DEFAULT '0',
  `unit` int DEFAULT NULL,
  `typ_offr` int DEFAULT NULL,
  `category` int DEFAULT NULL,
  `merk` varchar(255) DEFAULT NULL,
  `type_origin` int DEFAULT NULL,
  `origin` int DEFAULT NULL,
  `spec` text,
  `color` int DEFAULT NULL,
  `warranty` int DEFAULT NULL,
  `dimention` int DEFAULT NULL,
  `weight` float DEFAULT '0' COMMENT 'in gram',
  `price` float DEFAULT '0' COMMENT 'in Rp',
  `ppn` int DEFAULT NULL,
  `pph` int DEFAULT NULL,
  `pd` int DEFAULT NULL,
  `file` text COMMENT 'url link',
  `pcc` text COMMENT 'Personnel Cost Components',
  `occ` text COMMENT 'Other Cost Components (if any)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `off_item`
--

INSERT INTO `off_item` (`id_item`, `name`, `detail`, `count`, `unit`, `typ_offr`, `category`, `merk`, `type_origin`, `origin`, `spec`, `color`, `warranty`, `dimention`, `weight`, `price`, `ppn`, `pph`, `pd`, `file`, `pcc`, `occ`) VALUES
(2, 'Komputer TUF', 'Inid adalah contoh penawaran Komputer TUF', 0, 2, 3, 6, 'Asus', 2, 8, 'Contoh spesifikasi dari komputer TUF\r\nRAM 16GB\r\nProsesor i7 141234I\r\nVGA 2GB RTX 1080', 2, 1, 1, 12000, 13500000, 2, 2, 2, NULL, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `off_to_item`
--

CREATE TABLE `off_to_item` (
  `id_off_det` int NOT NULL,
  `off_id` int DEFAULT NULL,
  `off_item` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `off_to_item`
--

INSERT INTO `off_to_item` (`id_off_det`, `off_id`, `off_item`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `origin`
--

CREATE TABLE `origin` (
  `id_origin` int NOT NULL,
  `index` int DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL COMMENT 'null, indonesia, singapura, malaysia, thailand, jepang, amerika'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `origin`
--

INSERT INTO `origin` (`id_origin`, `index`, `origin`) VALUES
(1, 0, 'null'),
(2, 1, 'indonesia'),
(3, 2, 'singapura'),
(4, 3, 'malaysia'),
(5, 4, 'thailand'),
(6, 5, 'jepang'),
(7, 6, 'amerika'),
(8, 7, 'China');

-- --------------------------------------------------------

--
-- Table structure for table `radio`
--

CREATE TABLE `radio` (
  `id` int NOT NULL,
  `index` int DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT 'yes, no, maybe'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `radio`
--

INSERT INTO `radio` (`id`, `index`, `type`) VALUES
(1, 0, 'yes'),
(2, 1, 'no');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id_status` int NOT NULL,
  `index` int DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT 'active, non-active, ban, shadow-ban'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id_status`, `index`, `type`) VALUES
(1, 0, 'Active'),
(2, 1, 'non-active'),
(3, 2, 'ban'),
(4, 3, 'shadow-ban');

-- --------------------------------------------------------

--
-- Table structure for table `trx_stts`
--

CREATE TABLE `trx_stts` (
  `id` int NOT NULL,
  `index` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL COMMENT 'success, fail'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trx_type`
--

CREATE TABLE `trx_type` (
  `id` int NOT NULL,
  `index` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL COMMENT 'Create, read, update, delete, system, log'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `type_offer`
--

CREATE TABLE `type_offer` (
  `id_typ_offr` int NOT NULL,
  `index` int DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT 'null, service, goods'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `type_offer`
--

INSERT INTO `type_offer` (`id_typ_offr`, `index`, `type`) VALUES
(1, 0, 'null'),
(2, 1, 'services'),
(3, 2, 'goods');

-- --------------------------------------------------------

--
-- Table structure for table `typ_comp`
--

CREATE TABLE `typ_comp` (
  `id_tp_cp` int NOT NULL,
  `index` int DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT 'user, vendor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `typ_comp`
--

INSERT INTO `typ_comp` (`id_tp_cp`, `index`, `type`) VALUES
(1, 0, 'user'),
(2, 1, 'vendor');

-- --------------------------------------------------------

--
-- Table structure for table `typ_origin`
--

CREATE TABLE `typ_origin` (
  `id_tp_origin` int NOT NULL,
  `index` int DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT 'null, import, non import'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `typ_origin`
--

INSERT INTO `typ_origin` (`id_tp_origin`, `index`, `type`) VALUES
(1, 0, 'null'),
(2, 1, 'import'),
(3, 2, 'non import');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id_unit` int NOT NULL,
  `index` int DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL COMMENT 'null, pcs, box, rim, dozen, pkg, years, semester, months, weeks, days, hours, minutes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id_unit`, `index`, `unit`) VALUES
(1, 0, 'null'),
(2, 1, 'pcs'),
(3, 2, 'box'),
(4, 3, 'rim'),
(5, 4, 'years'),
(6, 5, 'semester'),
(7, 6, 'months'),
(8, 7, 'weeks'),
(9, 8, 'days'),
(10, 9, 'hours'),
(11, 10, 'minutes');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_usr` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `pass` text NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_usr`, `name`, `email`, `pass`, `phone`, `status`) VALUES
(1, 'Tri', 'tri@gmail.com', '202cb962ac59075b964b07152d234b70', '089912341234', 1),
(2, 'Yuli supplier', 'y-Sup@gmail.com', '123', '089912341234', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usr_occp`
--

CREATE TABLE `usr_occp` (
  `id_user` int NOT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `work_in` int DEFAULT NULL,
  `usr_id` int DEFAULT NULL,
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `usr_occp`
--

INSERT INTO `usr_occp` (`id_user`, `occupation`, `work_in`, `usr_id`, `status`) VALUES
(1, NULL, 2, 2, 1),
(2, NULL, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `warranty`
--

CREATE TABLE `warranty` (
  `id` int NOT NULL,
  `index` int DEFAULT NULL,
  `lenght` int DEFAULT '0',
  `unit` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `warranty`
--

INSERT INTO `warranty` (`id`, `index`, `lenght`, `unit`) VALUES
(1, 0, 1, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cat_offr`
--
ALTER TABLE `cat_offr`
  ADD PRIMARY KEY (`id_cat`),
  ADD UNIQUE KEY `index` (`index`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index` (`index`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id_company`),
  ADD KEY `type` (`type`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `dimention`
--
ALTER TABLE `dimention`
  ADD PRIMARY KEY (`id_dim`),
  ADD UNIQUE KEY `index` (`index`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `tipe` (`tipe`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `offer`
--
ALTER TABLE `offer`
  ADD PRIMARY KEY (`id_offer`),
  ADD KEY `requester` (`requester`),
  ADD KEY `vendor` (`vendor`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `off_file`
--
ALTER TABLE `off_file`
  ADD PRIMARY KEY (`id_file`),
  ADD KEY `offer` (`offer`);

--
-- Indexes for table `off_item`
--
ALTER TABLE `off_item`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `unit` (`unit`),
  ADD KEY `typ_offr` (`typ_offr`),
  ADD KEY `category` (`category`),
  ADD KEY `type_origin` (`type_origin`),
  ADD KEY `origin` (`origin`),
  ADD KEY `color` (`color`),
  ADD KEY `warranty` (`warranty`),
  ADD KEY `dimention` (`dimention`),
  ADD KEY `ppn` (`ppn`),
  ADD KEY `pph` (`pph`),
  ADD KEY `pd` (`pd`);

--
-- Indexes for table `off_to_item`
--
ALTER TABLE `off_to_item`
  ADD PRIMARY KEY (`id_off_det`),
  ADD KEY `off_id` (`off_id`),
  ADD KEY `off_item` (`off_item`);

--
-- Indexes for table `origin`
--
ALTER TABLE `origin`
  ADD PRIMARY KEY (`id_origin`),
  ADD UNIQUE KEY `index` (`index`);

--
-- Indexes for table `radio`
--
ALTER TABLE `radio`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index` (`index`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status`),
  ADD UNIQUE KEY `index` (`index`);

--
-- Indexes for table `trx_stts`
--
ALTER TABLE `trx_stts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index` (`index`);

--
-- Indexes for table `trx_type`
--
ALTER TABLE `trx_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index` (`index`);

--
-- Indexes for table `type_offer`
--
ALTER TABLE `type_offer`
  ADD PRIMARY KEY (`id_typ_offr`),
  ADD UNIQUE KEY `index` (`index`);

--
-- Indexes for table `typ_comp`
--
ALTER TABLE `typ_comp`
  ADD PRIMARY KEY (`id_tp_cp`),
  ADD UNIQUE KEY `index` (`index`);

--
-- Indexes for table `typ_origin`
--
ALTER TABLE `typ_origin`
  ADD PRIMARY KEY (`id_tp_origin`),
  ADD UNIQUE KEY `index` (`index`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id_unit`),
  ADD UNIQUE KEY `index` (`index`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_usr`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `usr_occp`
--
ALTER TABLE `usr_occp`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `work_in` (`work_in`),
  ADD KEY `usr_id` (`usr_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `warranty`
--
ALTER TABLE `warranty`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index` (`index`),
  ADD KEY `unit` (`unit`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cat_offr`
--
ALTER TABLE `cat_offr`
  MODIFY `id_cat` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id_company` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dimention`
--
ALTER TABLE `dimention`
  MODIFY `id_dim` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id_log` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offer`
--
ALTER TABLE `offer`
  MODIFY `id_offer` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `off_file`
--
ALTER TABLE `off_file`
  MODIFY `id_file` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `off_item`
--
ALTER TABLE `off_item`
  MODIFY `id_item` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `off_to_item`
--
ALTER TABLE `off_to_item`
  MODIFY `id_off_det` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `origin`
--
ALTER TABLE `origin`
  MODIFY `id_origin` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `radio`
--
ALTER TABLE `radio`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id_status` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `trx_stts`
--
ALTER TABLE `trx_stts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trx_type`
--
ALTER TABLE `trx_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `type_offer`
--
ALTER TABLE `type_offer`
  MODIFY `id_typ_offr` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `typ_comp`
--
ALTER TABLE `typ_comp`
  MODIFY `id_tp_cp` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `typ_origin`
--
ALTER TABLE `typ_origin`
  MODIFY `id_tp_origin` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id_unit` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_usr` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usr_occp`
--
ALTER TABLE `usr_occp`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `warranty`
--
ALTER TABLE `warranty`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`type`) REFERENCES `typ_comp` (`id_tp_cp`),
  ADD CONSTRAINT `company_ibfk_2` FOREIGN KEY (`status`) REFERENCES `status` (`id_status`);

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `log_ibfk_1` FOREIGN KEY (`tipe`) REFERENCES `trx_type` (`id`),
  ADD CONSTRAINT `log_ibfk_2` FOREIGN KEY (`status`) REFERENCES `trx_stts` (`id`);

--
-- Constraints for table `offer`
--
ALTER TABLE `offer`
  ADD CONSTRAINT `offer_ibfk_1` FOREIGN KEY (`requester`) REFERENCES `usr_occp` (`id_user`),
  ADD CONSTRAINT `offer_ibfk_2` FOREIGN KEY (`vendor`) REFERENCES `usr_occp` (`id_user`),
  ADD CONSTRAINT `offer_ibfk_3` FOREIGN KEY (`status`) REFERENCES `status` (`id_status`);

--
-- Constraints for table `off_file`
--
ALTER TABLE `off_file`
  ADD CONSTRAINT `off_file_ibfk_1` FOREIGN KEY (`offer`) REFERENCES `offer` (`id_offer`);

--
-- Constraints for table `off_item`
--
ALTER TABLE `off_item`
  ADD CONSTRAINT `off_item_ibfk_1` FOREIGN KEY (`unit`) REFERENCES `unit` (`id_unit`),
  ADD CONSTRAINT `off_item_ibfk_10` FOREIGN KEY (`pph`) REFERENCES `radio` (`id`),
  ADD CONSTRAINT `off_item_ibfk_11` FOREIGN KEY (`pd`) REFERENCES `radio` (`id`),
  ADD CONSTRAINT `off_item_ibfk_2` FOREIGN KEY (`typ_offr`) REFERENCES `type_offer` (`id_typ_offr`),
  ADD CONSTRAINT `off_item_ibfk_3` FOREIGN KEY (`category`) REFERENCES `cat_offr` (`id_cat`),
  ADD CONSTRAINT `off_item_ibfk_4` FOREIGN KEY (`type_origin`) REFERENCES `typ_origin` (`id_tp_origin`),
  ADD CONSTRAINT `off_item_ibfk_5` FOREIGN KEY (`origin`) REFERENCES `origin` (`id_origin`),
  ADD CONSTRAINT `off_item_ibfk_6` FOREIGN KEY (`color`) REFERENCES `color` (`id`),
  ADD CONSTRAINT `off_item_ibfk_7` FOREIGN KEY (`warranty`) REFERENCES `warranty` (`id`),
  ADD CONSTRAINT `off_item_ibfk_8` FOREIGN KEY (`dimention`) REFERENCES `dimention` (`id_dim`),
  ADD CONSTRAINT `off_item_ibfk_9` FOREIGN KEY (`ppn`) REFERENCES `radio` (`id`);

--
-- Constraints for table `off_to_item`
--
ALTER TABLE `off_to_item`
  ADD CONSTRAINT `off_to_item_ibfk_1` FOREIGN KEY (`off_id`) REFERENCES `offer` (`id_offer`),
  ADD CONSTRAINT `off_to_item_ibfk_2` FOREIGN KEY (`off_item`) REFERENCES `off_item` (`id_item`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`status`) REFERENCES `status` (`id_status`);

--
-- Constraints for table `usr_occp`
--
ALTER TABLE `usr_occp`
  ADD CONSTRAINT `usr_occp_ibfk_1` FOREIGN KEY (`work_in`) REFERENCES `company` (`id_company`),
  ADD CONSTRAINT `usr_occp_ibfk_2` FOREIGN KEY (`usr_id`) REFERENCES `user` (`id_usr`),
  ADD CONSTRAINT `usr_occp_ibfk_3` FOREIGN KEY (`status`) REFERENCES `status` (`id_status`);

--
-- Constraints for table `warranty`
--
ALTER TABLE `warranty`
  ADD CONSTRAINT `warranty_ibfk_1` FOREIGN KEY (`unit`) REFERENCES `unit` (`id_unit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
