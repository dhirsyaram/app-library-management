-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2023 at 03:35 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `libraryadmin`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(100) NOT NULL,
  `adminID` varchar(150) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` varchar(70) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `adminID`, `username`, `password`, `email`) VALUES
(1, 'Admin-01', 'Dhirsya', 'adminDhir1', 'dhirsya@gmail.com'),
(2, 'Admin-02', 'Damar', 'ok3damar', 'damar02@gmail.com'),
(3, 'admin03', 'auliaa', 'good3ull', 'aulia03@gmail.com'),
(4, 'admin04', 'ariiqq', 'baik03riqq', 'ariiq@gmail.com'),
(5, 'admin-05', 'Cindyy', 'cindy05admin', 'cindyy@gmail.com'),
(6, 'admin-06', 'litaaa', 'admin06litaa', 'litaa@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `book_details`
--

CREATE TABLE `book_details` (
  `books_id` int(100) NOT NULL,
  `books_name` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `available` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book_details`
--

INSERT INTO `book_details` (`books_id`, `books_name`, `author`, `available`) VALUES
(1, 'Geografi 11', 'Yudhistira', 4),
(2, 'Kimia Kelas 10', 'Erlangga', 3),
(3, 'Biologi 12', 'Erlangga', 3),
(4, 'Ekonomi 10', 'Yudhistira', 5);

-- --------------------------------------------------------

--
-- Table structure for table `issue_books_details`
--

CREATE TABLE `issue_books_details` (
  `id` int(100) NOT NULL,
  `books_id` int(100) NOT NULL,
  `books_name` varchar(150) NOT NULL,
  `students_id` int(100) NOT NULL,
  `students_name` varchar(150) NOT NULL,
  `issue_date` date NOT NULL,
  `due_date` date NOT NULL,
  `status` enum('pending','returned') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `issue_books_details`
--

INSERT INTO `issue_books_details` (`id`, `books_id`, `books_name`, `students_id`, `students_name`, `issue_date`, `due_date`, `status`) VALUES
(2, 1, 'Java', 6271, 'Andi', '2023-06-01', '2023-06-08', 'returned'),
(3, 1, 'Java', 1425, 'Rena', '2023-06-16', '2023-06-21', 'returned'),
(4, 1, 'Java', 3152, 'Luis', '2023-06-12', '2023-06-20', 'pending'),
(5, 1, 'Java', 1234, 'Sisi', '2023-06-01', '2023-06-09', 'pending'),
(6, 2, 'Kimia Kelas 10', 1425, 'Rena', '2023-06-08', '2023-06-18', 'returned');

-- --------------------------------------------------------

--
-- Table structure for table `student_details`
--

CREATE TABLE `student_details` (
  `students_id` int(100) NOT NULL,
  `studName` varchar(255) NOT NULL,
  `course` varchar(255) NOT NULL,
  `branch` enum('IPA','IPS') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_details`
--

INSERT INTO `student_details` (`students_id`, `studName`, `course`, `branch`) VALUES
(1234, 'Sisi', 'Geografi 11', 'IPS'),
(1425, 'Rena', 'KIMIA 8', 'IPA'),
(3152, 'Luis', 'Ekonomi', 'IPS'),
(3245, 'Lala', 'PKN', 'IPS'),
(6271, 'Andi', 'Bahasa Indonesia', 'IPA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_details`
--
ALTER TABLE `book_details`
  ADD PRIMARY KEY (`books_id`);

--
-- Indexes for table `issue_books_details`
--
ALTER TABLE `issue_books_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `books_id` (`books_id`),
  ADD KEY `students_id` (`students_id`),
  ADD KEY `students_name` (`students_name`);

--
-- Indexes for table `student_details`
--
ALTER TABLE `student_details`
  ADD PRIMARY KEY (`students_id`),
  ADD UNIQUE KEY `studName` (`studName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `book_details`
--
ALTER TABLE `book_details`
  MODIFY `books_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1973;

--
-- AUTO_INCREMENT for table `issue_books_details`
--
ALTER TABLE `issue_books_details`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `issue_books_details`
--
ALTER TABLE `issue_books_details`
  ADD CONSTRAINT `issue_books_details_ibfk_1` FOREIGN KEY (`books_id`) REFERENCES `book_details` (`books_id`),
  ADD CONSTRAINT `issue_books_details_ibfk_2` FOREIGN KEY (`students_id`) REFERENCES `student_details` (`students_id`),
  ADD CONSTRAINT `issue_books_details_ibfk_3` FOREIGN KEY (`students_name`) REFERENCES `student_details` (`studName`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
