-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2021 at 12:14 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emeals_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `integrity` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `email`, `password`, `integrity`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'iphyze@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 1, '2021-10-01 11:46:40', '2021-10-01 11:46:40'),
(2, 'iphyze', 'actuator@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 0, '2021-10-05 01:40:39', '2021-10-05 01:40:39'),
(3, 'Actuator', 'actuator@yahoo.com', '608f72eb95bfaefe1a826a7dc97b3cfe', 0, '2021-10-08 19:43:51', '2021-10-08 19:43:51');

-- --------------------------------------------------------

--
-- Table structure for table `categories_table`
--

CREATE TABLE `categories_table` (
  `id` int(11) NOT NULL,
  `categories_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories_table`
--

INSERT INTO `categories_table` (`id`, `categories_name`) VALUES
(1, 'vegetable'),
(2, 'swallow'),
(3, 'drinks'),
(4, 'pasta'),
(5, 'protein'),
(6, 'rice'),
(9, 'Fruits');

-- --------------------------------------------------------

--
-- Table structure for table `food_table`
--

CREATE TABLE `food_table` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `category` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_table`
--

INSERT INTO `food_table` (`id`, `name`, `price`, `image`, `description`, `category`, `status`, `created`) VALUES
(1, 'Semo', '50', '1.jpg', 'This is a brief description of the product up for sale', 'swallow', 'available', '2021-09-07 08:15:32'),
(2, 'Beans', '12', 'food-1.jpg', 'This is a brief description of the product up for sale!', 'pasta', 'available', '2021-09-23 14:48:01'),
(3, 'Noodles', '25', '5.jpg', 'This is a brief description of the product up for sale', 'pasta', 'available', '2021-09-16 14:48:01'),
(4, 'Salad', '8', 'food-4.jpg', 'This is a light food.', 'vegetable', 'available', '2021-09-28 08:48:01'),
(5, 'Spaghetti', '80', 'nav-2.jpg', 'Jollof Rice and Chicken', 'pasta', 'available', '2021-09-17 09:35:13'),
(6, 'Burger', '55', 'nav-3.jpg', 'This is a brief description of the product up for sale', 'pasta', 'available', '2021-09-27 11:48:01'),
(7, 'Coca Cola', '20', '3.jpg', 'This is a brief description of the product up for sale', 'drinks', 'available', '2021-10-01 14:48:01'),
(8, 'Jollof Rice', '15', 'food-8.png', 'This is jollof rice mixed with chicken', 'rice', 'available', '2021-10-01 14:48:01'),
(9, 'Yam & Egg Source', '25', 'food-5.jpg', 'This has always remained one of the best meal combos ever, try it hot!!!', 'protein', 'available', '2021-09-30 04:33:01'),
(10, 'Apples', '10', 'food-3.jpg', 'These apples are fresh, just as they look and are also good for you.', 'Fruits', 'available', '2021-10-02 12:51:11');

-- --------------------------------------------------------

--
-- Table structure for table `guest_table`
--

CREATE TABLE `guest_table` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guest_table`
--

INSERT INTO `guest_table` (`id`, `username`, `email`, `password`, `created`) VALUES
(1, 'lily', 'lilyindagroup@gmail.com', '608f72eb95bfaefe1a826a7dc97b3cfe', '2021-10-05 01:21:05'),
(2, 'iphyze', 'i.nzekwue@gmail.com', '608f72eb95bfaefe1a826a7dc97b3cfe', '2021-10-05 01:21:05');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `food_id` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `spice` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_id`, `food_id`, `price`, `quantity`, `spice`, `time`) VALUES
(1, '470952', '6', '550', '2', 'medium', '2021-10-01 15:02:21'),
(2, '470952', '5', '800', '2', 'moderate', '2021-10-01 15:02:21'),
(3, '470952', '2', '1600', '1', 'none', '2021-10-01 15:02:21'),
(4, '063928', '5', '800', '1', 'medium', '2021-10-02 13:03:44'),
(5, '063928', '10', '10', '1', 'none', '2021-10-02 13:03:44');

-- --------------------------------------------------------

--
-- Table structure for table `order_table`
--

CREATE TABLE `order_table` (
  `id` int(11) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `special_notes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_table`
--

INSERT INTO `order_table` (`id`, `order_id`, `fname`, `lname`, `address`, `state`, `email`, `phone`, `status`, `username`, `time`, `special_notes`) VALUES
(1, '470952', 'Ifeanyi', 'Nzekwue', '40, Zamba Street, Ikate Surulere', 'Lagos State', 'iphyze@gmail.com', '08105342439', 'confirmed', 'Actuator', '2021-10-01 10:22:04', 'none'),
(2, '063928', 'Lilian', 'Ebubeogu', '40, Zamba Street, Ikate Surulere', 'Lagos State', 'lilyindagroup@gmail.com', '08105342439', 'pending', 'lily', '2021-10-02 13:03:44', '');

-- --------------------------------------------------------

--
-- Table structure for table `review_table`
--

CREATE TABLE `review_table` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `stars` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `food_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review_table`
--

INSERT INTO `review_table` (`id`, `name`, `comment`, `stars`, `date`, `food_id`) VALUES
(1, 'John Doe', 'This is a very delicious meal!', 3, '2021-10-09 12:38:42', 6),
(2, 'James Bond', 'This meal tastes sweet!', 2, '2021-10-09 12:39:24', 6),
(3, 'Nzekwue Ifeanyi', 'I couldn\'t ask for more, sweet, tasty and delicious!', 5, '2021-10-09 13:52:59', 5),
(4, 'Daniel James', 'The fruits are really fresh, everyone around me had the same view, please add more to your stock.', 4, '2021-10-09 13:57:40', 10),
(5, 'Dietsmann', 'I didn\'t find a fault, it was just as anticipated.', 2, '2021-10-09 14:12:14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `trending`
--

CREATE TABLE `trending` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `trend` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trending`
--

INSERT INTO `trending` (`id`, `name`, `trend`) VALUES
(1, 'Semo', 0),
(2, 'Beans', 6),
(3, 'Noodles', 0),
(4, 'Salad', 0),
(5, 'Spaghetti', 3),
(6, 'Burger', 2),
(7, 'Coca Cola', 8),
(8, 'Jollof Rice', 0),
(9, 'Yam & Egg Source', 0),
(10, 'Apples', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories_table`
--
ALTER TABLE `categories_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_table`
--
ALTER TABLE `food_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guest_table`
--
ALTER TABLE `guest_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_table`
--
ALTER TABLE `order_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review_table`
--
ALTER TABLE `review_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trending`
--
ALTER TABLE `trending`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories_table`
--
ALTER TABLE `categories_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `food_table`
--
ALTER TABLE `food_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `guest_table`
--
ALTER TABLE `guest_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_table`
--
ALTER TABLE `order_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `review_table`
--
ALTER TABLE `review_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `trending`
--
ALTER TABLE `trending`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
