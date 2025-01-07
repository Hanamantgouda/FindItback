-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 07, 2025 at 07:32 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `finditback`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `created_at`) VALUES
(8, 'admin', 'admin123', '2024-11-29 04:38:34');

-- --------------------------------------------------------

--
-- Table structure for table `belongings`
--

CREATE TABLE `belongings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `location_found` varchar(255) NOT NULL,
  `date_found` date NOT NULL,
  `description` text DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `status` enum('available','claimed','returned') DEFAULT 'available',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `claims`
--

CREATE TABLE `claims` (
  `id` int(11) NOT NULL,
  `belonging_id` int(11) DEFAULT NULL,
  `claimer_id` int(11) DEFAULT NULL,
  `lost_location` varchar(255) NOT NULL,
  `lost_date` date NOT NULL,
  `proof_description` text DEFAULT NULL,
  `proof_image_path` varchar(255) DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`, `phone`) VALUES
(12, 'hanamant', 'hanamantadyavanal10@gmail.com', '$2y$10$ohTmb0B/4Fg7BEMe4vwWFeS8tRXMp4fQ8nrGApy8XhD8N.TFwGHx6', '2024-11-30 11:07:57', '9019197263'),
(13, 'vinay', 'hattikalvinay@gmail.com', '$2y$10$Bu244YtmtwMrPNQ1Eyf72eAAZuuAf9PlZsLU5twejMH92bXNeK9yS', '2024-11-30 11:14:09', '8310020887'),
(14, 'Anirudh ', 'anirudhkulkarni733@gmail.com', '$2y$10$q4/nx./OJi8HYleHbERT1.YtfaBjuYvg0v5l13kgrmnYo3IVJ86vC', '2024-12-04 05:26:37', '8746961642'),
(15, 'Girish', 'gsraddy994@gmail.com', '$2y$10$h0Rv6t.vHtBlKB6/NaTd3eqIwxlIaEeH5JyRqGsnbdqHWYEvyhuiO', '2024-12-05 10:24:05', '9019197263'),
(16, 'Godeshwari', 'godeshwarichavan@gmail.com', '$2y$10$24Chx05d1H8Gtxmu9l7AhOq8FDXRT.OqpVLDGwHgQG0DJQwMOs//u', '2024-12-14 04:16:53', '1236547897'),
(17, 'Darshan J', 'darshanjaniward@gmail.com', '$2y$10$oitgonaiz42wpfrog4ADyehwUpg8vQkIv8S85eyqEAUacjklfhlcy', '2024-12-17 08:58:30', '6362158997'),
(18, 'Pratik', 'pratiksatyanaik@gmail.com', '$2y$10$b0rissPB0KB73VU9wIxRUeT8qwT3etM3YcSkiOAPbHa2aqE2Yu1H.', '2024-12-18 06:57:48', '9844561946'),
(19, 'Mallikarjun', 'maheshbiradar698@gmail.com', '$2y$10$9QmhUlfRgSCF3Hm2TV1wCuRnPvCxCdEY8EQqpRJe17ieg2iwXPMmW', '2024-12-20 12:05:07', '8867193155'),
(20, 'abhishek', 'abhishekvadavadagi555@gmail.com', '$2y$10$V3v8plnAGoSm6A5QM3.ERO7.oz/uqrsUCzzxLy5HhGvyLwA3iqjMe', '2025-01-06 11:40:26', '8861876540');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `belongings`
--
ALTER TABLE `belongings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `claims`
--
ALTER TABLE `claims`
  ADD PRIMARY KEY (`id`),
  ADD KEY `belonging_id` (`belonging_id`),
  ADD KEY `claimer_id` (`claimer_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `belongings`
--
ALTER TABLE `belongings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `claims`
--
ALTER TABLE `claims`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `belongings`
--
ALTER TABLE `belongings`
  ADD CONSTRAINT `belongings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `claims`
--
ALTER TABLE `claims`
  ADD CONSTRAINT `claims_ibfk_1` FOREIGN KEY (`belonging_id`) REFERENCES `belongings` (`id`),
  ADD CONSTRAINT `claims_ibfk_2` FOREIGN KEY (`claimer_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
