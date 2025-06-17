-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2021 at 11:26 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sana`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `ID` int(11) NOT NULL,
  `Brand` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`ID`, `Brand`, `Status`) VALUES
(7, 'Samsung', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `ID` int(11) NOT NULL,
  `Category` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`ID`, `Category`, `Status`) VALUES
(11, 'Mobile', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ID` int(11) NOT NULL,
  `Product` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Cate_ID` int(11) NOT NULL,
  `Brand_ID` int(11) NOT NULL,
  `Cost_Price` int(11) NOT NULL,
  `Retail_Price` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Barcode` int(11) NOT NULL,
  `Status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ID`, `Product`, `Description`, `Cate_ID`, `Brand_ID`, `Cost_Price`, `Retail_Price`, `Quantity`, `Barcode`, `Status`) VALUES
(7, 'Samsung S10', 'Samsung S10\n16GB RAM\n512GB Storage', 11, 7, 25000, 31500, 289, 111, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `ID` int(11) NOT NULL,
  `Date` varchar(255) NOT NULL,
  `User` varchar(255) NOT NULL,
  `Grandtotal` int(11) NOT NULL,
  `Cash` int(11) NOT NULL,
  `Balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`ID`, `Date`, `User`, `Grandtotal`, `Cash`, `Balance`) VALUES
(60, '2021/47/18', 'Raja', 31500, 32000, 500),
(61, '2021/15/18', 'Raja', 31500, 31500, 0),
(62, '2021/17/18', 'Raja', 31500, 31500, 0),
(63, '2021/21/18', 'Raja', 63000, 63000, 0),
(64, '2021/22/18', 'Raja', 126000, 126000, 0),
(65, '2021/24/18', 'Raja', 63000, 63000, 0),
(66, '2021/26/18', 'Raja', 94500, 95000, 500),
(67, '2021/35/18', 'Raja', 63000, 63000, 0),
(68, '2021/37/18', 'Raja', 252000, 252000, 0),
(69, '2021/56/18', 'Raja', 63000, 63000, 0),
(70, '2021/59/18', 'Raja', 31500, 32000, 500),
(71, '2021/02/18', 'Raja', 157500, 158000, 500),
(72, '2021/03/18', 'Raja', 63000, 63000, 0),
(73, '2021/05/18', 'Raja', 31500, 32000, 500);

-- --------------------------------------------------------

--
-- Table structure for table `salesitems`
--

CREATE TABLE `salesitems` (
  `ID` int(11) NOT NULL,
  `Sales_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Sales_Price` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Total_Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salesitems`
--

INSERT INTO `salesitems` (`ID`, `Sales_ID`, `Product_ID`, `Sales_Price`, `Quantity`, `Total_Price`) VALUES
(75, 60, 111, 31500, 1, 31500),
(76, 61, 111, 31500, 1, 31500),
(77, 62, 111, 31500, 1, 31500),
(78, 63, 111, 31500, 2, 63000),
(79, 64, 111, 31500, 4, 126000),
(80, 65, 111, 31500, 2, 63000),
(81, 66, 111, 31500, 3, 94500),
(82, 67, 111, 31500, 2, 63000),
(83, 68, 111, 31500, 8, 252000),
(84, 69, 111, 31500, 2, 63000),
(85, 70, 111, 31500, 1, 31500),
(86, 71, 111, 31500, 5, 157500),
(87, 72, 111, 31500, 2, 63000),
(88, 73, 111, 31500, 1, 31500);

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `DOB` varchar(255) NOT NULL,
  `Father` varchar(255) NOT NULL,
  `Gender` varchar(255) NOT NULL,
  `Qualification` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Designation` varchar(255) NOT NULL,
  `DOJ` varchar(255) NOT NULL,
  `Salary` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`ID`, `Name`, `DOB`, `Father`, `Gender`, `Qualification`, `Address`, `Designation`, `DOJ`, `Salary`, `Status`) VALUES
(3, 'Divya', '25-07-1985', 'Chandrasekar', 'Female', 'PG', 'North Street, Kamarajarpuram, Vadasery, Nagercoil', 'Manager', '10-010-2020', '25000', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `Username`, `Password`, `Status`) VALUES
(6, 'Raja', '12345', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `salesitems`
--
ALTER TABLE `salesitems`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `salesitems`
--
ALTER TABLE `salesitems`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
