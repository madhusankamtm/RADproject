-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2017 at 01:43 PM
-- Server version: 5.5.16
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leavemanagment`
--

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `name` varchar(50) DEFAULT NULL,
  `contactnumber` int(11) DEFAULT NULL,
  `emailaddress` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `comments` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `leaverequest`
--

CREATE TABLE `leaverequest` (
  `id` int(11) NOT NULL,
  `User_ID` varchar(25) NOT NULL,
  `emp_name` varchar(100) NOT NULL,
  `type_of_leave` varchar(30) NOT NULL,
  `Emp_type` varchar(30) NOT NULL,
  `Designation` varchar(30) NOT NULL,
  `Department` varchar(30) NOT NULL,
  `date_request` date NOT NULL,
  `leave_from` date NOT NULL,
  `leave_to` date NOT NULL,
  `total_days` int(11) NOT NULL,
  `acept` varchar(50) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leaverequest`
--

INSERT INTO `leaverequest` (`id`, `User_ID`, `emp_name`, `type_of_leave`, `Emp_type`, `Designation`, `Department`, `date_request`, `leave_from`, `leave_to`, `total_days`, `acept`) VALUES
(65, 'emp003', 'nipuni', 'holiday', 'Accounts', 'Faculty', 'CST', '2017-11-19', '2017-11-20', '2017-11-21', 1, 'pending'),
(66, 'emp004', 'mithushan', 'privet', 'Accounts', 'Department', 'CST', '2017-11-19', '2017-11-24', '2017-11-29', 5, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `leave_approval`
--

CREATE TABLE `leave_approval` (
  `id` int(11) NOT NULL,
  `emp_ID` varchar(25) NOT NULL,
  `emp_name` varchar(100) NOT NULL,
  `emp_type` varchar(30) NOT NULL,
  `designation` varchar(30) NOT NULL,
  `department` varchar(30) NOT NULL,
  `type_leave` varchar(30) NOT NULL,
  `leave_from` varchar(11) NOT NULL,
  `leave_to` varchar(11) NOT NULL,
  `total_days` int(11) NOT NULL,
  `acept` varchar(20) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leave_approval`
--

INSERT INTO `leave_approval` (`id`, `emp_ID`, `emp_name`, `emp_type`, `designation`, `department`, `type_leave`, `leave_from`, `leave_to`, `total_days`, `acept`) VALUES
(1, 'emp003', 'nipuni', 'Accounts', 'Faculty', 'CST', 'holiday', '2017-11-20', '2017-11-21', 1, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `new_employee`
--

CREATE TABLE `new_employee` (
  `id` int(11) NOT NULL,
  `User_ID` varchar(25) NOT NULL,
  `emp_name` varchar(100) NOT NULL,
  `password` varchar(25) NOT NULL,
  `emp_type` varchar(30) NOT NULL,
  `designation` varchar(30) NOT NULL,
  `department` varchar(30) NOT NULL,
  `dob` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contact` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `new_employee`
--

INSERT INTO `new_employee` (`id`, `User_ID`, `emp_name`, `password`, `emp_type`, `designation`, `department`, `dob`, `email`, `contact`) VALUES
(1, 'emp001', 'thakshila', 'mtm', 'Accounts', 'Faculty', 'CST', '1995-12-18', 'madhusanka@gmail.com', 716445275),
(14, 'emp002', 'harsha', 'harsha', 'Accounts', 'Department', 'CST', '1995-10-25', 'harsh@gmail.com', 711234564),
(15, 'emp003', 'nipuni', 'nipuni', 'Accounts', 'Faculty', 'SCT', '1995-06-14', 'nipuni@gmail.com', 714567891),
(18, 'emp004', 'mithushan', 'mithushan', 'Clerical', 'Faculty', 'SCT', '1995-08-26', 'mithushan@gmail.com', 713456981),
(19, 'emp005', 'vithujan', 'vithujan', 'Accounts', 'Faculty', 'CST', '1995-03-15', 'vithujan@gmail.com', 714567892);

-- --------------------------------------------------------

--
-- Table structure for table `new_staff`
--

CREATE TABLE `new_staff` (
  `id` int(11) NOT NULL,
  `staff_ID` varchar(25) NOT NULL,
  `password` varchar(30) NOT NULL,
  `staff_name` varchar(100) NOT NULL,
  `staff_type` varchar(20) NOT NULL,
  `department` varchar(30) NOT NULL,
  `dob` datetime NOT NULL,
  `phoneno` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `new_staff`
--

INSERT INTO `new_staff` (`id`, `staff_ID`, `password`, `staff_name`, `staff_type`, `department`, `dob`, `phoneno`) VALUES
(1, 'Admin@123', 'admin@123', '', '', '', '0000-00-00 00:00:00', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `leaverequest`
--
ALTER TABLE `leaverequest`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `leave_approval`
--
ALTER TABLE `leave_approval`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `emp_ID` (`emp_ID`);

--
-- Indexes for table `new_employee`
--
ALTER TABLE `new_employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `User_ID` (`User_ID`),
  ADD UNIQUE KEY `id_2` (`id`),
  ADD KEY `User_ID_2` (`User_ID`),
  ADD KEY `User_ID_3` (`User_ID`),
  ADD KEY `id` (`id`),
  ADD KEY `User_ID_4` (`User_ID`);

--
-- Indexes for table `new_staff`
--
ALTER TABLE `new_staff`
  ADD PRIMARY KEY (`staff_ID`),
  ADD UNIQUE KEY `staff_ID` (`staff_ID`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `staff_ID_2` (`staff_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `leaverequest`
--
ALTER TABLE `leaverequest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT for table `leave_approval`
--
ALTER TABLE `leave_approval`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `new_employee`
--
ALTER TABLE `new_employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `new_staff`
--
ALTER TABLE `new_staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
