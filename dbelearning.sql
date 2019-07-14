-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2019 at 03:51 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbelearning`
--

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `Id_feed` int(5) NOT NULL,
  `Notes_feed` varchar(20) NOT NULL,
  `Tgl_posting` date DEFAULT NULL,
  `Id_siswa` int(10) NOT NULL,
  `Jml_rupiah` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `Id_kategori` int(10) NOT NULL,
  `Nama` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `studycenter`
--

CREATE TABLE `studycenter` (
  `Id_center` int(5) NOT NULL,
  `Nama` varchar(20) NOT NULL,
  `Lokasi` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblatihan`
--

CREATE TABLE `tblatihan` (
  `Kode_lat` char(5) NOT NULL,
  `Judul_lat` varchar(20) NOT NULL,
  `Tgl_latihan` date DEFAULT NULL,
  `Tgl_dikumpul` date DEFAULT NULL,
  `Kode_pel` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbmateri`
--

CREATE TABLE `tbmateri` (
  `Kode_mat` char(5) NOT NULL,
  `Judul_mat` varchar(30) NOT NULL,
  `Jml_mat` int(3) DEFAULT NULL,
  `Kode_pel` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbpelajaran`
--

CREATE TABLE `tbpelajaran` (
  `Kode_pel` char(5) NOT NULL,
  `Nama_pel` varchar(20) NOT NULL,
  `Jml_pel` int(3) NOT NULL,
  `Id_pengajar` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbpengajar`
--

CREATE TABLE `tbpengajar` (
  `Id_pengajar` int(10) NOT NULL,
  `Nama_pengajar` varchar(30) NOT NULL,
  `Alamat` varchar(20) NOT NULL,
  `Email` char(15) NOT NULL,
  `Id_kategori` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbsiswa`
--

CREATE TABLE `tbsiswa` (
  `Id_siswa` int(10) NOT NULL,
  `Nama_siswa` varchar(30) NOT NULL,
  `Alamat` varchar(20) NOT NULL,
  `Telepon` int(12) NOT NULL,
  `Email` char(15) NOT NULL,
  `Id_kategori` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`Id_feed`),
  ADD KEY `Id_siswa` (`Id_siswa`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`Id_kategori`);

--
-- Indexes for table `studycenter`
--
ALTER TABLE `studycenter`
  ADD PRIMARY KEY (`Id_center`);

--
-- Indexes for table `tblatihan`
--
ALTER TABLE `tblatihan`
  ADD PRIMARY KEY (`Kode_lat`),
  ADD KEY `Kode_pel` (`Kode_pel`);

--
-- Indexes for table `tbmateri`
--
ALTER TABLE `tbmateri`
  ADD PRIMARY KEY (`Kode_mat`),
  ADD KEY `Kode_pel` (`Kode_pel`);

--
-- Indexes for table `tbpelajaran`
--
ALTER TABLE `tbpelajaran`
  ADD PRIMARY KEY (`Kode_pel`),
  ADD KEY `Id_pengajar` (`Id_pengajar`);

--
-- Indexes for table `tbpengajar`
--
ALTER TABLE `tbpengajar`
  ADD PRIMARY KEY (`Id_pengajar`),
  ADD KEY `Id_kategori` (`Id_kategori`);

--
-- Indexes for table `tbsiswa`
--
ALTER TABLE `tbsiswa`
  ADD PRIMARY KEY (`Id_siswa`),
  ADD KEY `Id_kategori` (`Id_kategori`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`Id_siswa`) REFERENCES `tbsiswa` (`Id_siswa`);

--
-- Constraints for table `tblatihan`
--
ALTER TABLE `tblatihan`
  ADD CONSTRAINT `tblatihan_ibfk_1` FOREIGN KEY (`Kode_pel`) REFERENCES `tbpelajaran` (`Kode_pel`);

--
-- Constraints for table `tbmateri`
--
ALTER TABLE `tbmateri`
  ADD CONSTRAINT `tbmateri_ibfk_1` FOREIGN KEY (`Kode_pel`) REFERENCES `tbpelajaran` (`Kode_pel`);

--
-- Constraints for table `tbpelajaran`
--
ALTER TABLE `tbpelajaran`
  ADD CONSTRAINT `tbpelajaran_ibfk_1` FOREIGN KEY (`Id_pengajar`) REFERENCES `tbpengajar` (`Id_pengajar`);

--
-- Constraints for table `tbpengajar`
--
ALTER TABLE `tbpengajar`
  ADD CONSTRAINT `tbpengajar_ibfk_1` FOREIGN KEY (`Id_kategori`) REFERENCES `kategori` (`Id_kategori`);

--
-- Constraints for table `tbsiswa`
--
ALTER TABLE `tbsiswa`
  ADD CONSTRAINT `tbsiswa_ibfk_1` FOREIGN KEY (`Id_kategori`) REFERENCES `kategori` (`Id_kategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
