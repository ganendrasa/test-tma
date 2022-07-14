-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2022 at 10:23 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_karyawan`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `listKaryawan` ()  BEGIN
    SELECT nama, jabatan, penilaian,
    CASE
    WHEN penilaian >= 50 AND penilaian <= 70 THEN 'B'
        WHEN penilaian >= 71 AND penilaian <= 90 THEN 'A'
        WHEN penilaian >= 91 AND penilaian <= 100 THEN 'A+'
    END AS grade
    FROM karyawan;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jabatan` varchar(30) NOT NULL,
  `penilaian` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id`, `nama`, `jabatan`, `penilaian`) VALUES
(1, 'David', 'Manager', 85),
(2, 'Cakra', 'Sales', 70),
(3, 'Juned', 'IT', 92),
(4, 'Stefano', 'HRD', 95),
(5, 'Dustin', 'Sales', 75),
(6, 'Mike', 'Admin', 87),
(7, 'Zoey', 'Receptionist', 71),
(8, 'Eddie', 'IT', 90),
(9, 'Steve', 'Admin', 75);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
