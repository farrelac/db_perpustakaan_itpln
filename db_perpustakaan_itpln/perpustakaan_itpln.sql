-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: May 06, 2024 at 04:59 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan_itpln`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` char(5) NOT NULL,
  `nama_anggota` varchar(25) NOT NULL,
  `prodi_anggota` varchar(25) NOT NULL,
  `telp_anggota` varchar(15) NOT NULL,
  `alamat_anggota` text DEFAULT NULL,
  `email_anggota` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama_anggota`, `prodi_anggota`, `telp_anggota`, `alamat_anggota`, `email_anggota`) VALUES
('A-001', 'Farrel Alfared', 'Teknik Informatika', '0880 8921 5312', 'Jalan Kebun Raya', 'alfared@gmail.com'),
('A-002', 'Sasikirana', 'Teknik Informatika', '0875 8121 3352', 'Jalan Haji Mali', 'kiranasasi@gmail.com'),
('A-003', 'Adindasafira', 'Teknik Informatika', '0875 8213 0952', 'Jalan Interkota', 'safiradinda@gmail.com'),
('A-004', 'Aang Kun', 'Teknik Sipil', '0815 9987 9391', 'Jalan Selong', 'kunaang@gmail.com'),
('A-005', 'Zuko Kiw', 'Teknik Elektro', '0855 8899 0987', 'Jalan Manggara', 'zukooog@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` char(5) NOT NULL,
  `judul_buku` varchar(50) NOT NULL,
  `stok_buku` int(3) NOT NULL,
  `penulis_buku` varchar(50) NOT NULL,
  `penerbit_buku` varchar(30) NOT NULL,
  `launch_buku` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `judul_buku`, `stok_buku`, `penulis_buku`, `penerbit_buku`, `launch_buku`) VALUES
('BK001', 'Introduction to Algorithms', 3, 'Thomas H. Cormen', 'MIT Press', '1990-09-01'),
('BK002', 'Electric Machinery Fundamentals', 4, 'Stephen J. Chapman', 'McGraw-Hill', '2004-02-01'),
('BK003', 'Fluid Mechanics', 6, 'Russell C. Hibbeler', 'Wiley', '2019-05-05'),
('BK004', 'Introduction to Industrial Engineering', 2, 'Turner, Wayne C', 'Wiley', '2017-10-01'),
('BK005', 'Foundation Engineering', 2, 'Ralph B. Peck', 'Wiley', '2017-01-10');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` char(5) NOT NULL,
  `id_buku` char(5) NOT NULL,
  `id_anggota` char(5) NOT NULL,
  `id_petugas` char(5) NOT NULL,
  `tgl_peminjaman` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `id_buku`, `id_anggota`, `id_petugas`, `tgl_peminjaman`) VALUES
('PJ001', 'BK001', 'A-002', 'P-003', '2024-04-23'),
('PJ002', 'BK004', 'A-003', 'P-004', '2024-04-29'),
('PJ003', 'BK002', 'A-005', 'P-005', '2024-05-03'),
('PJ004', 'BK003', 'A-004', 'P-001', '2024-05-04'),
('PJ005', 'BK005', 'A-001', 'P-002', '2024-05-05');

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id_pengembalian` char(5) NOT NULL,
  `id_peminjaman` char(5) NOT NULL,
  `id_buku` char(5) NOT NULL,
  `id_anggota` char(5) NOT NULL,
  `denda_kembali` decimal(8,2) NOT NULL,
  `tgl_kembali` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`id_pengembalian`, `id_peminjaman`, `id_buku`, `id_anggota`, `denda_kembali`, `tgl_kembali`) VALUES
('PK001', 'PJ001', 'BK001', 'A-002', 0.00, '2024-04-27'),
('PK002', 'PJ002', 'BK004', 'A-003', 30000.00, '2024-05-09'),
('PK003', 'PJ003', 'BK002', 'A-005', 10000.00, '2024-05-11'),
('PK004', 'PJ004', 'BK003', 'A-004', 0.00, '2024-05-09'),
('PK005', 'PJ005', 'BK005', 'A-001', 20000.00, '2024-05-14');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` char(5) NOT NULL,
  `name_petugas` varchar(25) NOT NULL,
  `telp_petugas` varchar(15) NOT NULL,
  `email_petugas` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `name_petugas`, `telp_petugas`, `email_petugas`) VALUES
('P-001', 'Dirgantara', '0889 9023 8432', 'gantaratir@gmail.com'),
('P-002', 'Raden Mas', '0882 7655 0923', 'masraden@gmail.com'),
('P-003', 'Karyanti', '0822 2312 8322', 'yantikar@gmail.com'),
('P-004', 'Handayani', '0823 6754 1209', 'handayani89@gmail.com'),
('P-005', 'Kuswardani', '0812 5521 2031', 'wardanikus11@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `rak`
--

CREATE TABLE `rak` (
  `id_rak` char(5) NOT NULL,
  `id_buku` char(5) NOT NULL,
  `nama_rak` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rak`
--

INSERT INTO `rak` (`id_rak`, `id_buku`, `nama_rak`) VALUES
('RK001', 'BK001', 'Rak Ilmu Komputer'),
('RK002', 'BK002', 'Rak Teknik Elektro'),
('RK003', 'BK003', 'Rak Teknik Mesin'),
('RK004', 'BK004', 'Rak Teknik Industri'),
('RK005', 'BK005', 'Rak Teknik Sipil');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `fk_buku2` (`id_buku`),
  ADD KEY `fk_anggota` (`id_anggota`),
  ADD KEY `fk_petugas` (`id_petugas`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id_pengembalian`),
  ADD KEY `fk_buku3` (`id_buku`),
  ADD KEY `fk_anggota2` (`id_anggota`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `rak`
--
ALTER TABLE `rak`
  ADD PRIMARY KEY (`id_rak`),
  ADD KEY `fk_buku` (`id_buku`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `fk_anggota` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  ADD CONSTRAINT `fk_buku2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`),
  ADD CONSTRAINT `fk_petugas` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`);

--
-- Constraints for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD CONSTRAINT `fk_anggota2` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  ADD CONSTRAINT `fk_buku3` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);

--
-- Constraints for table `rak`
--
ALTER TABLE `rak`
  ADD CONSTRAINT `fk_buku` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
