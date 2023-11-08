-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: database:3306
-- Generation Time: Nov 08, 2023 at 07:25 AM
-- Server version: 8.0.33
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_klik`
--

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` varchar(255) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `nira` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `nira` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jabatan` enum('kepala ruang','perawat') NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`nira`, `nama`, `jabatan`, `alamat`) VALUES
('75020501011', 'Frangky Usman, S .Tr.Kep', 'perawat', 'Sidomulyo selatan'),
('75020501013', 'Zulkifli B. Noe, A.Md.Kep', 'perawat', 'Mootilango'),
('75020501018', 'Septiana Taidi, S.Kep', 'perawat', 'Kabila'),
('75020501022', 'Nia Anggreini Moha, A.Md.Kep', 'perawat', 'Asparaga'),
('75020501024', 'Rivega Apriliani Mohammad, A.md.Kep', 'perawat', 'Bilato'),
('75020501037', 'Ummu Kalsum W.Badu, S.Kep.Ns', 'perawat', 'Wonosari'),
('75020501046', 'Maryanto, A.Md.Kep', 'perawat', 'Kota Gorontalo'),
('75020501058', 'Dewanti Maharani, S.Kep.Ns', 'perawat', 'Paguyaman'),
('75020501065', 'Sulistiyowati, A.Md.Kep', 'perawat', 'Boliyohuto'),
('75020501087', 'Sri Dewi Yunita Djangga, S.Kep,Ns', 'perawat', 'Mootilango');

-- --------------------------------------------------------

--
-- Table structure for table `rawat_inap`
--

CREATE TABLE `rawat_inap` (
  `kode_ruangan` varchar(255) NOT NULL,
  `nama_ruangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rawat_inap`
--

INSERT INTO `rawat_inap` (`kode_ruangan`, `nama_ruangan`) VALUES
('a1611ff7-b604-11ed-8fc0-dc215c6adf56', 'Rawat Inap');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `telp` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL DEFAULT 'NORMAL',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `sso_type` varchar(20) DEFAULT NULL,
  `login_at` datetime DEFAULT NULL,
  `login_count` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_anggota_tim`
--

CREATE TABLE `tb_anggota_tim` (
  `kd_tim` varchar(255) NOT NULL,
  `nira` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_anggota_tim`
--

INSERT INTO `tb_anggota_tim` (`kd_tim`, `nira`) VALUES
('3fdf37d0-b609-11ed-8fc0-dc215c6adf56', '75020501018'),
('3fdf37d0-b609-11ed-8fc0-dc215c6adf56', '75020501037'),
('41c91840-b609-11ed-8fc0-dc215c6adf56', '75020501011'),
('41c91840-b609-11ed-8fc0-dc215c6adf56', '75020501013'),
('43c2ed4c-b609-11ed-8fc0-dc215c6adf56', '75020501022'),
('43c2ed4c-b609-11ed-8fc0-dc215c6adf56', '75020501024'),
('45741914-b609-11ed-8fc0-dc215c6adf56', '75020501046'),
('45741914-b609-11ed-8fc0-dc215c6adf56', '75020501058'),
('47e9391f-b609-11ed-8fc0-dc215c6adf56', '75020501065'),
('47e9391f-b609-11ed-8fc0-dc215c6adf56', '75020501087');

-- --------------------------------------------------------

--
-- Table structure for table `tb_konfigurasi`
--

CREATE TABLE `tb_konfigurasi` (
  `kode_konfigurasi` varchar(255) NOT NULL,
  `kd_tim` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `kode_ruangan` varchar(255) NOT NULL,
  `kode_shift` int NOT NULL,
  `tanggal` date NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_konfigurasi`
--

INSERT INTO `tb_konfigurasi` (`kode_konfigurasi`, `kd_tim`, `kode_ruangan`, `kode_shift`, `tanggal`, `status`) VALUES
('b637e591-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-01', 0),
('b638a901-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-01', 0),
('b6395c13-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-01', 0),
('b63a0867-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-01', 0),
('b63aa905-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-01', 0),
('b63b641d-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-02', 0),
('b63c1edc-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-02', 0),
('b63ce721-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-02', 0),
('b63d8dce-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-02', 0),
('b63e1cdf-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-02', 0),
('b63ed483-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-03', 0),
('b63f65c6-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-03', 0),
('b6402369-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-03', 0),
('b640c8aa-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-03', 0),
('b64164e0-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-03', 0),
('b642208c-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-04', 0),
('b642c1db-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-04', 0),
('b6436730-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-04', 0),
('b644058b-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-04', 0),
('b644d4be-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-04', 0),
('b6457c63-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-05', 0),
('b6464ab0-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-05', 0),
('b646f34c-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-05', 0),
('b6479644-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-05', 0),
('b6487f7d-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-05', 0),
('b6494818-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-06', 0),
('b64a257b-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-06', 0),
('b64af096-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-06', 0),
('b64ba38e-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-06', 0),
('b64c7de5-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-06', 0),
('b64d6aa0-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-07', 0),
('b64e384b-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-07', 0),
('b64f4d91-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-07', 0),
('b64fe6c1-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-07', 0),
('b650b84b-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-07', 0),
('b65189db-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-08', 0),
('b6527897-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-08', 0),
('b6532adf-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-08', 0),
('b653d781-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-08', 0),
('b6546e1b-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-08', 0),
('b655194c-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-09', 0),
('b655f34d-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-09', 0),
('b656a7b1-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-09', 0),
('b65783d7-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-09', 0),
('b6584f28-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-09', 0),
('b65901c3-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-10', 0),
('b659b44d-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-10', 0),
('b65a5d9c-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-10', 0),
('b65b07b8-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-10', 0),
('b65bb03b-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-10', 0),
('b65c57d0-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-11', 0),
('b65d00a3-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-11', 0),
('b65dc59e-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-11', 0),
('b65e93c6-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-11', 0),
('b65f744e-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-11', 0),
('b660326f-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-12', 0),
('b660e580-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-12', 0),
('b6619523-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-12', 0),
('b6623e9b-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-12', 0),
('b662f221-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-12', 0),
('b663a6d0-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-13', 0),
('b66453c9-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-13', 0),
('b664f971-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-13', 0),
('b665cff1-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-13', 0),
('b666a1c3-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-13', 0),
('b6678b73-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-14', 0),
('b6684740-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-14', 0),
('b66911fa-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-14', 0),
('b669bd47-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-14', 0),
('b66a6401-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-14', 0),
('b66af9fb-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-15', 0),
('b66bb6d2-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-15', 0),
('b66c4a5c-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-15', 0),
('b66ce9e9-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-15', 0),
('b66d896f-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-15', 0),
('b66e1b00-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-16', 0),
('b66ed8f9-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-16', 0),
('b66f60c5-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-16', 0),
('b6700788-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-16', 0),
('b670a189-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-16', 0),
('b6711b8d-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-17', 0),
('b671c84b-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-17', 0),
('b672e8e8-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-17', 0),
('b6739137-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-17', 0),
('b67419a5-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-17', 0),
('b674cc1c-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-18', 0),
('b675572a-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-18', 0),
('b67612e1-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-18', 0),
('b676a4af-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-18', 0),
('b6774fbf-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-18', 0),
('b67808a6-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-19', 0),
('b678a7cd-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-19', 0),
('b67b93df-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-19', 0),
('b67cba8e-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-19', 0),
('b67e0bc1-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-19', 0),
('b67f3b20-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-20', 0),
('b6808350-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-20', 0),
('b681914c-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-20', 0),
('b683002c-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-20', 0),
('b683e358-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-20', 0),
('b684e1fe-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-21', 0),
('b685e5fb-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-21', 0),
('b686e8cf-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-21', 0),
('b6881175-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-21', 0),
('b6890ff3-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-21', 0),
('b689eade-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-22', 0),
('b68aced1-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-22', 0),
('b68bbe38-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-22', 0),
('b68c8bf8-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-22', 0),
('b68d8c41-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-22', 0),
('b68e3046-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-23', 0),
('b68ed97b-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-23', 0),
('b68f7836-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-23', 0),
('b6902481-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-23', 0),
('b690c7e6-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-23', 0),
('b6916abf-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-24', 0),
('b69207a5-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-24', 0),
('b692afcd-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-24', 0),
('b6934d38-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-24', 0),
('b694004a-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-24', 0),
('b694f127-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-25', 0),
('b695aef2-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-25', 0),
('b6966300-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-25', 0),
('b697387b-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-25', 0),
('b6980584-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-25', 0),
('b698a587-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-26', 0),
('b6995ef8-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-26', 0),
('b69a02f7-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-26', 0),
('b69abc03-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-26', 0),
('b69b6f9e-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-26', 0),
('b69c395b-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-27', 0),
('b69d20c8-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-27', 0),
('b69dee29-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-27', 0),
('b69ec5b2-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-27', 0),
('b69f75f4-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-27', 0),
('b6a0238b-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-28', 0),
('b6a0ba1b-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-28', 0),
('b6a17a59-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-28', 0),
('b6a249f6-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-28', 0),
('b6a30223-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-28', 0),
('b6a3c8eb-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-29', 0),
('b6a48988-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-29', 0),
('b6a57470-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-29', 0),
('b6a62977-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-29', 0),
('b6a6cf7d-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-29', 0),
('b6a780e4-658b-11ee-9c96-0242ac120002', '41c91840-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 1, '2023-11-30', 0),
('b6a83277-658b-11ee-9c96-0242ac120002', '43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 2, '2023-11-30', 0),
('b6a92190-658b-11ee-9c96-0242ac120002', '45741914-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 3, '2023-11-30', 0),
('b6a9df0c-658b-11ee-9c96-0242ac120002', '47e9391f-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 4, '2023-11-30', 0),
('b6aa8f5e-658b-11ee-9c96-0242ac120002', '3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 'a1611ff7-b604-11ed-8fc0-dc215c6adf56', 5, '2023-11-30', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_shift`
--

CREATE TABLE `tb_shift` (
  `kode_shift` int NOT NULL,
  `shift` enum('Pagi','Siang','Malam','Lepas','Libur') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `waktu` time NOT NULL,
  `waktu_pulang` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_shift`
--

INSERT INTO `tb_shift` (`kode_shift`, `shift`, `waktu`, `waktu_pulang`) VALUES
(1, 'Pagi', '06:00:00', '13:59:59'),
(2, 'Siang', '14:00:00', '21:59:59'),
(3, 'Malam', '22:00:00', '05:59:59'),
(4, 'Lepas', '00:00:00', '00:00:00'),
(5, 'Libur', '00:00:00', '00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tim`
--

CREATE TABLE `tb_tim` (
  `kode_tim` varchar(255) NOT NULL,
  `id_jenis_tim` int NOT NULL,
  `waktu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_tim`
--

INSERT INTO `tb_tim` (`kode_tim`, `id_jenis_tim`, `waktu`) VALUES
('3fdf37d0-b609-11ed-8fc0-dc215c6adf56', 16, '2023-02-27'),
('41c91840-b609-11ed-8fc0-dc215c6adf56', 17, '2023-02-27'),
('43c2ed4c-b609-11ed-8fc0-dc215c6adf56', 18, '2023-02-27'),
('45741914-b609-11ed-8fc0-dc215c6adf56', 19, '2023-02-27'),
('47e9391f-b609-11ed-8fc0-dc215c6adf56', 20, '2023-02-27');

-- --------------------------------------------------------

--
-- Table structure for table `t_absen`
--

CREATE TABLE `t_absen` (
  `kd_absen` varchar(255) NOT NULL,
  `kode_konfigurasi` varchar(225) NOT NULL,
  `nira` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `kd_jenis_absen` int NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Triggers `t_absen`
--
DELIMITER $$
CREATE TRIGGER `update_jadwal_status` AFTER INSERT ON `t_absen` FOR EACH ROW BEGIN
    UPDATE tb_konfigurasi
    SET status = 1
    WHERE kode_konfigurasi = NEW.kode_konfigurasi;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `t_ajuan_tukar`
--

CREATE TABLE `t_ajuan_tukar` (
  `id_ajuan_tukar` varchar(255) NOT NULL,
  `nira` varchar(255) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_ajuan_tukar`
--

INSERT INTO `t_ajuan_tukar` (`id_ajuan_tukar`, `nira`, `tanggal`, `keterangan`) VALUES
('39737266-da81-11ed-ac3c-dc215c6adf56', '75020501087', '2023-05-24 03:19:32', 'maaf saya ada kendala'),
('3aa93f16-da8b-11ed-ac3c-dc215c6adf56', '75020501065', '2023-05-24 03:19:32', 'sakit'),
('59da578d-08e5-11ee-bb1b-0242ac120002', '75020501046', '2023-06-12 05:52:44', 'saya harus izin'),
('768a8ea9-d959-11ed-a386-dc215c6adf56', '75020501065', '2023-05-24 03:19:32', 'sakit saya'),
('7ed1378c-d955-11ed-a386-dc215c6adf56', '75020501058', '2023-05-24 03:19:32', 'sakit'),
('b6a9ed29-0674-11ee-b5f8-0242ac120002', '75020501022', '2023-06-09 03:21:24', 'saya hari ini ada kesibukan'),
('cd36b15a-7dfa-11ee-9c96-0242ac120002', '75020501065', '2023-11-08 05:51:03', 'kontol'),
('dbe26b44-d959-11ed-a386-dc215c6adf56', '75020501022', '2023-05-24 03:19:32', 'saya sedang sibuk'),
('f9c4d8d1-d959-11ed-a386-dc215c6adf56', '75020501024', '2023-05-24 03:19:32', 'MOHON MAAF SAYA TIDAK BISA DATANG🫰');

-- --------------------------------------------------------

--
-- Table structure for table `t_jenis_absen`
--

CREATE TABLE `t_jenis_absen` (
  `kd_jenis_absen` int NOT NULL,
  `jenis_absen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_jenis_absen`
--

INSERT INTO `t_jenis_absen` (`kd_jenis_absen`, `jenis_absen`) VALUES
(1, 'masuk'),
(2, 'pulang');

-- --------------------------------------------------------

--
-- Table structure for table `t_jenis_tim`
--

CREATE TABLE `t_jenis_tim` (
  `id_jenis_tim` int NOT NULL,
  `tim` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_jenis_tim`
--

INSERT INTO `t_jenis_tim` (`id_jenis_tim`, `tim`) VALUES
(16, 'A'),
(17, 'B'),
(18, 'C'),
(19, 'D'),
(20, 'E'),
(21, 'f');

-- --------------------------------------------------------

--
-- Table structure for table `t_level`
--

CREATE TABLE `t_level` (
  `id_level` int NOT NULL,
  `level` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_level`
--

INSERT INTO `t_level` (`id_level`, `level`) VALUES
(1, 'perawat'),
(2, 'kepala ruang');

-- --------------------------------------------------------

--
-- Table structure for table `t_temp_tim`
--

CREATE TABLE `t_temp_tim` (
  `kode_tim` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_todo`
--

CREATE TABLE `t_todo` (
  `id_todo` varchar(255) NOT NULL,
  `create_at` datetime(6) NOT NULL,
  `todo` varchar(255) DEFAULT NULL,
  `update_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_todo`
--

INSERT INTO `t_todo` (`id_todo`, `create_at`, `todo`, `update_at`) VALUES
('c0f7bfba-7d0c-11ee-b55c-0242ac120002', '2023-11-07 09:25:36.000000', 'Takwa Is Number One', '2023-11-07 09:25:36.000000'),
('c0f7dfa0-7d0c-11ee-b55c-0242ac120002', '2023-11-07 09:25:36.000000', 'Respect For Everything', '2023-11-07 09:25:36.000000'),
('db5e853e-7d0c-11ee-b55c-0242ac120002', '2023-11-07 09:27:04.000000', 'Usefull for Others', '2023-11-07 09:27:04.000000'),
('db5e9943-7d0c-11ee-b55c-0242ac120002', '2023-11-07 09:27:04.000000', 'Smart Learning', '2023-11-07 09:27:04.000000'),
('f1048a49-7d0c-11ee-b55c-0242ac120002', '2023-11-07 09:27:52.000000', 'Totality and Integrity', '2023-11-07 09:27:52.000000');

-- --------------------------------------------------------

--
-- Table structure for table `t_tukar_shift`
--

CREATE TABLE `t_tukar_shift` (
  `kode_konfigurasi` varchar(255) NOT NULL,
  `nira` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `kode_ruangan` varchar(255) NOT NULL,
  `kode_shift` int NOT NULL,
  `tanggal` date NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_user`
--

CREATE TABLE `t_user` (
  `id_user` varchar(255) NOT NULL,
  `kode_perawat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_level` int NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `t_user`
--

INSERT INTO `t_user` (`id_user`, `kode_perawat`, `username`, `password`, `id_level`, `status`) VALUES
('211732fb-b6fd-11ed-a17b-dc215c6adf56', '75020501011', 'frangky', '202cb962ac59075b964b07152d234b70', 1, 1),
('211737e0-b6fd-11ed-a17b-dc215c6adf56', '75020501013', 'zulkifli', '202cb962ac59075b964b07152d234b70', 1, 1),
('4adb13e0-b6fd-11ed-a17b-dc215c6adf56', '75020501022', 'nia', '202cb962ac59075b964b07152d234b70', 1, 1),
('4adb1761-b6fd-11ed-a17b-dc215c6adf56', '75020501024', 'rivega', '202cb962ac59075b964b07152d234b70', 1, 1),
('7596a034-b6fd-11ed-a17b-dc215c6adf56', '75020501046', 'maryanto', '202cb962ac59075b964b07152d234b70', 1, 1),
('7596a5e7-b6fd-11ed-a17b-dc215c6adf56', '75020501058', 'dewanti', '202cb962ac59075b964b07152d234b70', 1, 1),
('b43b80c1-b6fd-11ed-a17b-dc215c6adf56', '75020501065', 'sulistiyowati', '202cb962ac59075b964b07152d234b70', 1, 1),
('b43b90af-b6fd-11ed-a17b-dc215c6adf56', '75020501087', 'dewi', '202cb962ac59075b964b07152d234b70', 1, 1),
('d5554ded-b6fd-11ed-a17b-dc215c6adf56', '75020501018', 'septiana', '202cb962ac59075b964b07152d234b70', 1, 1),
('d5555562-b6fd-11ed-a17b-dc215c6adf56', '75020501037', 'ummu', '202cb962ac59075b964b07152d234b70', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int NOT NULL,
  `is_active` int NOT NULL,
  `date_created` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `email`, `image`, `password`, `role_id`, `is_active`, `date_created`) VALUES
('7c686ab7-abc9-11ed-ba21-000a1305122e', 'KEPEGAWAIAN', 'pegawai@gmail.com', 'nanda.jpeg', '202cb962ac59075b964b07152d234b70', 2, 1, '04:00:00'),
('fdb06f3e-b455-11ed-a933-dc215c6adf56', 'KEPALA RUANGAN', 'karu@gmail.com', 'nanda.jpeg', '202cb962ac59075b964b07152d234b70', 1, 1, '06:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int NOT NULL,
  `role_id` int NOT NULL,
  `menu_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(6, 2, 4),
(8, 1, 6),
(14, 1, 4),
(19, 1, 5),
(21, 2, 6),
(27, 1, 7),
(29, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int NOT NULL,
  `menu` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'Menu'),
(4, 'Dashboard'),
(5, 'Jadwal'),
(6, 'Absen'),
(7, 'Tukar Shift');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'administrator'),
(2, 'Kepegawaian');

-- --------------------------------------------------------

--
-- Table structure for table `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id` int NOT NULL,
  `menu_id` int NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 4, 'Dashboard', 'dashboard', 'fas fa-fw fa-tachometer-alt', 1),
(2, 2, 'Profil', 'user', 'fas fa-fw fa-user', 1),
(4, 3, 'Menu Management', 'menu', 'fas fa-fw fa-folder', 1),
(5, 3, 'SubMenu Management', 'menu/submenu', 'fas fa-fw fa-folder', 1),
(6, 1, 'Role', 'admin/role', 'fas fa-fw fa-user', 1),
(7, 5, 'jadwal shift', 'jadwal', 'fas fa-fw fa-calendar', 1),
(8, 5, 'data absen', 'absen', 'fas fa-fw fa-file', 1),
(10, 7, 'Tukar Shift', 'jadwal/tukar', 'fas fa-fw fa-sync', 1),
(12, 5, 'Data Perawat', 'jadwal/perawat', 'fas fa-fw fa-user', 1),
(15, 6, 'Rekapan absensi', 'absen/rekapan', 'fas fa-fw fa-file', 1),
(16, 7, 'Data Laporan Perawat', 'tukar_shift', 'fas fas-fw fa-file', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_rekapan`
-- (See below for the actual view)
--
CREATE TABLE `v_rekapan` (
`kode_konfigurasi` varchar(255)
,`kode_shift` int
,`nama` varchar(255)
,`nira` varchar(255)
,`shift` enum('Pagi','Siang','Malam','Lepas','Libur')
,`tanggal` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_rekap_all`
-- (See below for the actual view)
--
CREATE TABLE `v_rekap_all` (
`kode_shift` int
,`nama` varchar(255)
,`nira` varchar(255)
,`shift` enum('Pagi','Siang','Malam','Lepas','Libur')
,`tanggal` date
);

-- --------------------------------------------------------

--
-- Structure for view `v_rekapan`
--
DROP TABLE IF EXISTS `v_rekapan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_rekapan`  AS SELECT `tb`.`kode_konfigurasi` AS `kode_konfigurasi`, `ta`.`nira` AS `nira`, `p`.`nama` AS `nama`, `tb`.`tanggal` AS `tanggal`, `tb`.`kode_shift` AS `kode_shift`, `s`.`shift` AS `shift` FROM (((`tb_konfigurasi` `tb` join `pegawai` `p`) join `tb_shift` `s`) join `tb_anggota_tim` `ta`) WHERE ((`ta`.`kd_tim` = `tb`.`kd_tim`) AND (`p`.`nira` = `ta`.`nira`) AND (`tb`.`kode_shift` = `s`.`kode_shift`)) ORDER BY `ta`.`nira` ASC, `tb`.`tanggal` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `v_rekap_all`
--
DROP TABLE IF EXISTS `v_rekap_all`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_rekap_all`  AS SELECT `ta`.`nira` AS `nira`, `p`.`nama` AS `nama`, `tb`.`tanggal` AS `tanggal`, `tb`.`kode_shift` AS `kode_shift`, `s`.`shift` AS `shift` FROM (((`tb_konfigurasi` `tb` join `pegawai` `p`) join `tb_shift` `s`) join `tb_anggota_tim` `ta`) WHERE ((`ta`.`kd_tim` = `tb`.`kd_tim`) AND (`p`.`nira` = `ta`.`nira`) AND (`tb`.`kode_shift` = `s`.`kode_shift`)) ORDER BY `ta`.`nira` ASC, `tb`.`tanggal` ASC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`nira`);

--
-- Indexes for table `rawat_inap`
--
ALTER TABLE `rawat_inap`
  ADD PRIMARY KEY (`kode_ruangan`),
  ADD UNIQUE KEY `nama_ruangan` (`nama_ruangan`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_id_unique` (`email_id`),
  ADD UNIQUE KEY `telp_unique` (`telp`);

--
-- Indexes for table `tb_anggota_tim`
--
ALTER TABLE `tb_anggota_tim`
  ADD KEY `nira` (`nira`),
  ADD KEY `kd_tim` (`kd_tim`);

--
-- Indexes for table `tb_konfigurasi`
--
ALTER TABLE `tb_konfigurasi`
  ADD PRIMARY KEY (`kode_konfigurasi`),
  ADD KEY `kode_ruangan` (`kode_ruangan`),
  ADD KEY `kode_shift` (`kode_shift`),
  ADD KEY `kd_anggota` (`kd_tim`);

--
-- Indexes for table `tb_shift`
--
ALTER TABLE `tb_shift`
  ADD PRIMARY KEY (`kode_shift`);

--
-- Indexes for table `tb_tim`
--
ALTER TABLE `tb_tim`
  ADD PRIMARY KEY (`kode_tim`),
  ADD KEY `id_jenis_tim` (`id_jenis_tim`);

--
-- Indexes for table `t_absen`
--
ALTER TABLE `t_absen`
  ADD PRIMARY KEY (`kd_absen`),
  ADD KEY `kode_konfigurasi` (`kode_konfigurasi`),
  ADD KEY `kd_perawat` (`nira`),
  ADD KEY `kd_jenis_absen` (`kd_jenis_absen`);

--
-- Indexes for table `t_ajuan_tukar`
--
ALTER TABLE `t_ajuan_tukar`
  ADD PRIMARY KEY (`id_ajuan_tukar`),
  ADD KEY `nira` (`nira`);

--
-- Indexes for table `t_jenis_absen`
--
ALTER TABLE `t_jenis_absen`
  ADD PRIMARY KEY (`kd_jenis_absen`);

--
-- Indexes for table `t_jenis_tim`
--
ALTER TABLE `t_jenis_tim`
  ADD PRIMARY KEY (`id_jenis_tim`);

--
-- Indexes for table `t_level`
--
ALTER TABLE `t_level`
  ADD PRIMARY KEY (`id_level`);

--
-- Indexes for table `t_todo`
--
ALTER TABLE `t_todo`
  ADD PRIMARY KEY (`id_todo`);

--
-- Indexes for table `t_tukar_shift`
--
ALTER TABLE `t_tukar_shift`
  ADD KEY `kd_tim` (`nira`),
  ADD KEY `kode_ruangan` (`kode_ruangan`),
  ADD KEY `kode_shift` (`kode_shift`),
  ADD KEY `kode_konfigurasi` (`kode_konfigurasi`);

--
-- Indexes for table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `kd_perawat` (`kode_perawat`),
  ADD KEY `id_level` (`id_level`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_shift`
--
ALTER TABLE `tb_shift`
  MODIFY `kode_shift` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `t_jenis_absen`
--
ALTER TABLE `t_jenis_absen`
  MODIFY `kd_jenis_absen` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_jenis_tim`
--
ALTER TABLE `t_jenis_tim`
  MODIFY `id_jenis_tim` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `t_level`
--
ALTER TABLE `t_level`
  MODIFY `id_level` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_anggota_tim`
--
ALTER TABLE `tb_anggota_tim`
  ADD CONSTRAINT `tb_anggota_tim_ibfk_1` FOREIGN KEY (`nira`) REFERENCES `pegawai` (`nira`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_anggota_tim_ibfk_2` FOREIGN KEY (`kd_tim`) REFERENCES `tb_tim` (`kode_tim`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tb_konfigurasi`
--
ALTER TABLE `tb_konfigurasi`
  ADD CONSTRAINT `shift` FOREIGN KEY (`kode_shift`) REFERENCES `tb_shift` (`kode_shift`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_konfigurasi_ibfk_2` FOREIGN KEY (`kode_ruangan`) REFERENCES `rawat_inap` (`kode_ruangan`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_konfigurasi_ibfk_3` FOREIGN KEY (`kd_tim`) REFERENCES `tb_tim` (`kode_tim`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tb_tim`
--
ALTER TABLE `tb_tim`
  ADD CONSTRAINT `tb_tim_ibfk_1` FOREIGN KEY (`id_jenis_tim`) REFERENCES `t_jenis_tim` (`id_jenis_tim`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `t_absen`
--
ALTER TABLE `t_absen`
  ADD CONSTRAINT `r_jadwal` FOREIGN KEY (`kode_konfigurasi`) REFERENCES `tb_konfigurasi` (`kode_konfigurasi`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `r_jenis_absen` FOREIGN KEY (`kd_jenis_absen`) REFERENCES `t_jenis_absen` (`kd_jenis_absen`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `r_perawat` FOREIGN KEY (`nira`) REFERENCES `pegawai` (`nira`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `t_ajuan_tukar`
--
ALTER TABLE `t_ajuan_tukar`
  ADD CONSTRAINT `t_ajuan_tukar_ibfk_1` FOREIGN KEY (`nira`) REFERENCES `pegawai` (`nira`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `t_tukar_shift`
--
ALTER TABLE `t_tukar_shift`
  ADD CONSTRAINT `t_tukar_shift_ibfk_1` FOREIGN KEY (`kode_konfigurasi`) REFERENCES `tb_konfigurasi` (`kode_konfigurasi`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `t_tukar_shift_ibfk_2` FOREIGN KEY (`nira`) REFERENCES `pegawai` (`nira`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `t_tukar_shift_ibfk_3` FOREIGN KEY (`kode_ruangan`) REFERENCES `rawat_inap` (`kode_ruangan`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `t_tukar_shift_ibfk_4` FOREIGN KEY (`kode_shift`) REFERENCES `tb_shift` (`kode_shift`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `t_user`
--
ALTER TABLE `t_user`
  ADD CONSTRAINT `level` FOREIGN KEY (`id_level`) REFERENCES `t_level` (`id_level`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `perawat` FOREIGN KEY (`kode_perawat`) REFERENCES `pegawai` (`nira`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
