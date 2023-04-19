-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2023 at 04:37 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinefoodorder`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getOrderDetails` (IN `oid` INT(10))   select customer_name,customer_contact,food from tbl_order where oid=id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `cdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `food_id`, `action`, `cdate`) VALUES
(1, 40, 'inserted', '2023-02-08 18:24:34'),
(2, 21, 'inserted', '2023-02-08 21:05:49');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `full_name`, `username`, `password`) VALUES
(13, 'Sanjana Sogimatt', 'sanjana', '1234'),
(14, 'Pratibha Javalagi', 'pratibha', '9876');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `title`, `image_name`, `featured`, `active`) VALUES
(4, 'Namma Breakfast', 'Food_Category_752.jpeg', 'Yes', 'Yes'),
(5, 'Beverages', 'Food_Category_384.png', 'Yes', 'Yes'),
(9, 'Dessert', 'Food_Category_770.jpeg', 'Yes', 'Yes'),
(12, 'North Indian', 'Food_Category_268.jpeg', 'Yes', 'Yes'),
(13, 'South Indian', 'Food_Category_229.png', 'Yes', 'Yes'),
(14, 'Cake', 'Food_Category_919.jpeg', 'Yes', 'Yes'),
(18, 'Street Food', 'Food_Category_734.png', 'Yes', 'Yes'),
(19, 'Italian Cuisine', 'Food_Category_798.jpeg', 'Yes', 'Yes'),
(20, 'Chinese Cuisine', 'Food_Category_553.jpeg', 'Yes', 'Yes'),
(21, 'samosa', 'Food_Category_655.png', 'Yes', 'Yes');

--
-- Triggers `tbl_category`
--
DELIMITER $$
CREATE TRIGGER `insertcat` AFTER INSERT ON `tbl_category` FOR EACH ROW INSERT INTO logs VALUES(null,NEW.id,'inserted',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `Full_name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_no` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`Full_name`, `username`, `email`, `phone_no`, `password`) VALUES
('Pratibha', 'Prati@', 'pratibhakj02@gmail.com', '6360424399', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_food`
--

CREATE TABLE `tbl_food` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL,
  `restaurant_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_food`
--

INSERT INTO `tbl_food` (`id`, `title`, `description`, `price`, `image_name`, `category_id`, `featured`, `active`, `restaurant_id`) VALUES
(14, 'Paddu', 'Ball shaped crisp dumplings made with fermented urad dal and rice batter. Made in both sweet and savory variations.', '45.00', 'Food-Name-2252.jpeg', 4, 'Yes', 'Yes', 16),
(15, 'Medu Vada Sambar', 'Medu vada is a South Indian breakfast snack. It is usually made in a doughnut shape, with a crispy exterior and soft interior.', '30.00', 'Food-Name-1135.jpeg', 4, 'Yes', 'Yes', 16),
(16, 'Dosa', 'A dosa, is a thin pancake in South Indian cuisine made from a fermented batter of ground black lentils and rice.', '60.00', 'Food-Name-9286.jpeg', 4, 'Yes', 'Yes', 16),
(17, 'Puri', 'Puri is a deep-fried bread made from unleavened whole-wheat flour that originated in the Indian subcontinent.', '55.00', 'Food-Name-9147.jpeg', 4, 'Yes', 'Yes', 16),
(19, 'Sev puri', 'Sev puri is an Indian cuisine snack and a type of chaat. It is a speciality that originates from Pune, Maharashtra, India.', '40.00', 'Food-Name-4458.png', 18, 'Yes', 'Yes', 18),
(20, 'Pani Puri', 'Panipuri, phuchka, gupchup, golgappa, or pani ke patashe is a type of snack originating in the Indian subcontinent', '30.00', 'Food-Name-1429.jpeg', 18, 'Yes', 'Yes', 18),
(21, 'Vada Pav', 'The dish consists of a deep fried potato dumpling placed inside a bread bun sliced almost in half through the middle', '30.00', 'Food-Name-6047.jpeg', 18, 'Yes', 'Yes', 18),
(22, 'Pasta', 'Pasta is a type of food typically made from dough of wheat flour mixed with water or eggs, and formed into sheets or other shapes', '120.00', 'Food-Name-2857.jpeg', 19, 'Yes', 'Yes', 17),
(23, 'Pizza', 'Pizza is a dish of Italian origin consisting of a usually round, dough topped with tomatoes, cheese', '99.00', 'Food-Name-1678.jpeg', 19, 'Yes', 'Yes', 17),
(24, 'French Fries', 'French fries,deep-fried potatoes of disputed . hey are prepared by cutting potatoes into even strips', '60.00', 'Food-Name-5670.jpeg', 19, 'Yes', 'Yes', 17),
(25, 'Burger', 'A hamburger, or simply burger, is a food consisting of filling placed inside a sliced bun or bread roll.', '149.00', 'Food-Name-5506.jpeg', 19, 'Yes', 'Yes', 17),
(26, 'Rajasthani Thali', 'A Thali is a platter that is made up of several different dishes to create a perfectly balanced meal. ', '149.00', 'Food-Name-6608.png', 12, 'Yes', 'Yes', 15),
(27, 'Curd Rice', 'Curd rice is a South Indian dish made with precooked rice, Curd herbs & tempering spices.', '50.00', 'Food-Name-6715.jpeg', 13, 'Yes', 'Yes', 15),
(29, 'Veg Biryani', 'Vegetable biryani is an aromatic rice dish made with basmati rice, mix veggies, herbs & biryani spices. ', '250.00', 'Food-Name-3107.jpeg', 12, 'Yes', 'Yes', 15),
(30, 'Aloo Paratha', 'Aloo paratha is a paratha stuffed with potato and spices originating from punjab of South Asia ', '60.00', 'Food-Name-9183.jpeg', 12, 'Yes', 'Yes', 0),
(31, 'Noodles', 'Noodles is a food made from unleavened dough ,stretched, or extruded, into long strips or strings.', '55.00', 'Food-Name-6759.png', 20, 'Yes', 'Yes', 14),
(32, 'Fried Rice', 'Fried rice is a dish of cooked rice that has been stir-fried in a wok or a frying pan and is usually mixed with other ingredients .', '45.00', 'Food-Name-9886.jpeg', 20, 'Yes', 'Yes', 14),
(33, 'Fried Momos', 'Pan-fried momo is also known as kothey momo. Steamed momo served in hot sauce is called C-momo.', '60.00', 'Food-Name-7444.jpeg', 20, 'Yes', 'Yes', 14),
(34, 'Paneer Kathi Roll', 'Paneer Kathi Rolls are a popular Indian street food made with Indian flatbread called paratha, then stuffed with paneer', '80.00', 'Food-Name-1085.jpeg', 20, 'Yes', 'Yes', 14),
(35, 'Oreo Cake', 'All you need to prepare this easy oreo cake recipe are Oreo cookies, baking powder and powdered sugar and voila!', '450.00', 'Food-Name-3276.jpeg', 14, 'Yes', 'Yes', 0),
(36, 'Gulab Jamun', 'Gulab jamun is a sweet or dessert, originating in the India is a type of mithai popular in India, Nepa', '20.00', 'Food-Name-6315.jpeg', 9, 'Yes', 'Yes', 13),
(37, 'Orange Juice', 'Orange juice is a liquid extract of the orange tree fruit, produced by squeezing or reaming oranges.', '30.00', 'Food-Name-4837.jpeg', 5, 'Yes', 'Yes', 13),
(38, 'Glossy Floral Cake', 'Cake is a flour confection made from flour, sugar, and other ingredients, and is usually baked. ', '600.00', 'Food-Name-640.jpeg', 14, 'Yes', 'Yes', 13),
(39, 'Bhelpuri', 'Bhelpuri is a savoury snack. It is made of puffed rice, vegetables and a tangy tamarind sauce, and has a crunchy texture', '40.00', 'Food-Name-8300.jpeg', 18, 'Yes', 'Yes', 18),
(40, 'Bajji', 'Mirchi Bajji is a popular South Indian street fried snack made with gram flour, spices and green chilies. ', '30.00', 'Food-Name-2352.jpeg', 18, 'Yes', 'Yes', 18);

--
-- Triggers `tbl_food`
--
DELIMITER $$
CREATE TRIGGER `insertLog` AFTER INSERT ON `tbl_food` FOR EACH ROW INSERT INTO logs VALUES(null,NEW.id,'inserted',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `food` varchar(150) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `order_date` datetime NOT NULL,
  `status` varchar(50) NOT NULL,
  `customer_name` varchar(150) NOT NULL,
  `customer_contact` varchar(20) NOT NULL,
  `customer_email` varchar(150) NOT NULL,
  `customer_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `food`, `price`, `qty`, `total`, `order_date`, `status`, `customer_name`, `customer_contact`, `customer_email`, `customer_address`) VALUES
(2, 'Best Burger', '4.00', 4, '16.00', '2020-11-30 03:52:43', 'Delivered', 'Kelly Dillard', '7896547800', 'kelly@gmail.com', '308 Post Avenue'),
(3, 'Mixed Pizza', '10.00', 2, '20.00', '2020-11-30 04:07:17', 'Delivered', 'Thomas Gilchrist', '7410001450', 'thom@gmail.com', '1277 Sunburst Drive'),
(4, 'Mixed Pizza', '10.00', 1, '10.00', '2021-05-04 01:35:34', 'Delivered', 'Martha Woods', '78540001200', 'marthagmail.com', '478 Avenue Street'),
(6, 'Chicken Wrap', '7.00', 1, '7.00', '2021-07-20 06:10:37', 'Delivered', 'Charlie', '7458965550', 'charlie@gmail.com', '3140 Bartlett Avenue'),
(7, 'Cheeseburger', '4.00', 2, '8.00', '2021-07-20 06:40:21', 'On Delivery', 'Claudia Hedley', '7451114400', 'hedley@gmail.com', '1119 Kinney Street'),
(8, 'Smoky BBQ Pizza', '6.00', 1, '6.00', '2021-07-20 06:40:57', 'Ordered', 'Vernon Vargas', '7414744440', 'venno@gmail.com', '1234 Hazelwood Avenue'),
(9, 'Chicken Wrap', '5.00', 4, '20.00', '2021-07-20 07:06:06', 'Cancelled', 'Carlos Grayson', '7401456980', 'carlos@gmail.com', '2969 Hartland Avenue'),
(10, 'Grilled Cheese Sandwich', '3.00', 4, '12.00', '2021-07-20 07:11:06', 'Delivered', 'Jonathan Caudill', '7410256996', 'jonathan@gmail.com', '1959 Limer Street'),
(11, 'Bhelpuri', '40.00', 1, '40.00', '2023-02-08 11:41:28', 'Ordered', 'Sanjana Sogimatt', '9874563212', 'pratibhakj02@gmail.com', 'MARKET ROAD UPPIN BETAGERI'),
(12, 'Bhelpuri', '40.00', 2, '80.00', '2023-02-08 12:29:23', 'Delivered', 'Sadanand Javalagi', '6360424399', 'pratibhakj02@gmail.com', 'Javalagi Printers Subhash Chandra Bose Road market road\r\nDharwad');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_restaurant`
--

CREATE TABLE `tbl_restaurant` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_restaurant`
--

INSERT INTO `tbl_restaurant` (`id`, `name`, `image`, `Address`, `contact`) VALUES
(13, 'Crest Cafe', 'Food_Category_667.jpeg', 'Kormangala', '6360424399'),
(14, 'Chops & Hops', 'Food_Category_299.jpeg', 'Nagarbhavi', '8431473765'),
(15, 'Sliver River', 'Food_Category_73.png', 'Whitefield', '6363237203'),
(16, 'Daily Grill', 'Food_Category_366.jpeg', 'Yestwantpur', '9281536471'),
(17, 'Hubtown', 'Food_Category_717.jpeg', 'Vijayanagar', '7894561238'),
(18, 'Baa guru chats thinnu', 'Food_Category_647.jpeg', 'Bagarpet', '8529637415');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`Full_name`);

--
-- Indexes for table `tbl_food`
--
ALTER TABLE `tbl_food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_restaurant`
--
ALTER TABLE `tbl_restaurant`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_food`
--
ALTER TABLE `tbl_food`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_restaurant`
--
ALTER TABLE `tbl_restaurant`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
