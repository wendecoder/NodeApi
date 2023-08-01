-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 01, 2023 at 06:40 PM
-- Server version: 10.5.19-MariaDB-cll-lve
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ethiopiandigital_edf`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_us`
--

CREATE TABLE `about_us` (
  `id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `platforms` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `about_us`
--

INSERT INTO `about_us` (`id`, `description`, `company`, `platforms`) VALUES
(1, 'Welcome to EDF (Ethiopian Digital Farmers) agricultural e-commerce platform, where you can find everything you need to grow your farm and boost your yields. We offer a wide range of product categories, all of which are carefully selected and tested to ensure their quality and effectiveness. We understand that farming can be a challenging and unpredictable business, which is why we strive to provide our customers with the best possible products and service. With our easy-to-use platform, you can browse and purchase products from the comfort of your home and have them delivered right to your doorstep. Agricultural e-commerce is revolutionizing the way farmers and consumers buy and sell products. With the convenience of online shopping, farmers can access a wider range of customers, and consumers can purchase fresh, high-quality produce directly from the source. The four main categories of products on agricultural e-commerce platforms are crops, livestock, equipment, and services. By offering a user-friendly interface, detailed product information, and secure payment options, agricultural e-commerce platforms are transforming the agricultural industry. As technology continues to evolve, we can expect to see further growth in the agricultural e-commerce sector, providing new opportunities for farmers and consumers alike. That’s why the Ethiopian digital farmers are giving a first step to agricultural e-commerce to modernize society and making it easier than before.', 'Ethiopian Digital Farmers (EDF) is an innovative agricultural e-commerce platform that aims to revol', '[\"Website\", \"Mobile App\", \"Customer Support\", \"Farmer\'s Dashboard\", \"Delivery and Logistics\", \"Reviews and Ratings\", \"Loyalty Program\", \"Social Media Platforms\"]');

-- --------------------------------------------------------

--
-- Table structure for table `billing_information`
--

CREATE TABLE `billing_information` (
  `user_id` int(11) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `apartment` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `checkout_products`
--

CREATE TABLE `checkout_products` (
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `checkout_products`
--

INSERT INTO `checkout_products` (`user_id`, `product_id`, `product_name`, `quantity`, `total_price`, `status`) VALUES
(3, 1, 'Mango', 5, 250.00, 'pending'),
(3, 2, '100% Organic Mung beans', 10, 370.00, 'pending'),
(4, 1, 'Mango', 2, 100.00, 'pending'),
(4, 2, '100% Organic Mung beans', 4, 148.00, 'pending'),
(4, 3, 'High quality sesame seed', 1, 62.00, 'pending'),
(4, 5, 'Cotton', 6, 648.00, 'pending'),
(4, 10, 'Pure Natural Mango', 7, 476.00, 'pending'),
(7, 2, '100% Organic Mung beans', 100, 3700.00, 'pending'),
(9, 1, 'Mango', 50, 2500.00, 'pending'),
(9, 1, 'Mango', 45, 2250.00, 'pending'),
(9, 1, 'Mango', 90, 4500.00, 'pending'),
(9, 1, 'Mango', 34, 1700.00, 'pending'),
(9, 3, 'High quality sesame seed', 21, 1302.00, 'pending'),
(9, 5, 'Cotton', 8, 864.00, 'pending'),
(9, 6, 'Quality Cabbage', 10, 480.00, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `gotera_checkout_products`
--

CREATE TABLE `gotera_checkout_products` (
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gotera_product_table`
--

CREATE TABLE `gotera_product_table` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL,
  `product_image_url` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `product_description` varchar(1000) DEFAULT NULL,
  `data_sheet` varchar(1000) DEFAULT NULL,
  `more_info` varchar(1000) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gotera_product_table`
--

INSERT INTO `gotera_product_table` (`product_id`, `product_name`, `product_price`, `product_image_url`, `quantity`, `product_description`, `data_sheet`, `more_info`, `category`) VALUES
(1, 'Mango', 50.00, 'img/product/man.jpg', 1, 'Mango is a delicious tropical fruit known for its sweet and juicy flavor. It is rich in vitamins, minerals, and antioxidants, making it a healthy choice. With its vibrant orange color and refreshing taste, mango is perfect for enjoying on its own or adding to various dishes, such as salads, smoothies, and desserts.', 'Mango,Short Sleeve:Cotton,Sweet and juicy', 'Short Sleeve - This product features a short sleeve design, making it perfect for warm weather and casual occasions.', 'Fruits'),
(2, '100% Organic Mung beans', 37.00, 'img/product/image-370x439.jpg', 10, '100% Organic Mung Beans: These mung beans are organically grown, ensuring that they are free from pesticides and chemicals. Mung beans are a nutritious legume packed with protein, fiber, vitamins, and minerals. They are a versatile ingredient used in various cuisines, including soups, curries, stir-fries, and sprouts.', '100% Organic Mung beans,Casual:Cotton,Nutritious and easy to cook', 'Casual - These 100% organic mung beans are great for casual cooking and provide a healthy and nutritious option for meals.', 'Seeds'),
(3, 'High quality sesame seed', 62.00, 'img/product/image-370x439 (1).jpg', 20, 'High-Quality Sesame Seeds: Our high-quality sesame seeds are carefully selected and processed to maintain their natural flavor and nutritional benefits. Sesame seeds are rich in healthy fats, protein, and minerals like calcium and iron. They add a delightful nutty flavor and crunchy texture to dishes and are commonly used in baking, cooking, and as a topping for salads and sushi.', 'High quality sesame seed,Cotton,Rich in flavor and aroma', 'Cotton - Made from high-quality sesame seeds, this product offers a rich and nutty flavor, perfect for adding depth to your dishes.', 'Seeds'),
(4, 'Ethiopian Coffee', 98.00, 'img/product/image-370x439 (2).jpg', 15, 'Ethiopian Coffee is renowned for its exceptional quality and distinct flavors. Grown in the fertile highlands of Ethiopia, this coffee is known for its floral and fruity notes, along with a rich and smooth taste. Ethiopian coffee is traditionally prepared using a unique brewing method called \"jebena\" and is enjoyed for its aromatic experience and cultural significance.', 'Ethiopian Coffee,Cotton,Bold and aromatic', 'Properties - Ethiopian Coffee is known for its unique flavors and aroma, with a rich and bold taste that will satisfy coffee enthusiasts.', 'Crops'),
(5, 'Cotton', 108.00, 'img/product/image-370x439 (6).jpg', 12, 'Cotton is a natural and versatile fiber widely used in textile production. It is known for its softness, breathability, and durability, making it a preferred choice for clothing, bedding, and various other textile applications. Our cotton is sourced from high-quality cotton plants, ensuring a premium product that meets the highest standards of comfort and quality.', 'Cotton,Cotton,Soft and breathable', 'Styles - This cotton fabric is versatile and can be used for various purposes, including clothing, home decor, and crafts.', 'Cotton'),
(6, 'Quality Cabbage', 48.00, 'img/product/image-370x439 (7).jpg', 18, 'Quality Cabbage: Our quality cabbage is fresh, crisp, and packed with nutrients. Cabbage is a versatile vegetable that can be enjoyed raw in salads or cooked in various dishes like stir-fries, soups, and stews. It is known for its high vitamin C content and is a great source of fiber, antioxidants, and beneficial plant compounds.', 'Quality Cabbage,Cotton,Fresh and crispy', 'Compositions - Our quality cabbage is grown with care, ensuring freshness and providing essential nutrients for a healthy diet.', 'Vegetables'),
(7, 'Healthy Tomatoes', 38.00, 'img/product/image-370x439 (2).jpg', 25, 'Healthy Tomatoes: Tomatoes are a nutritious and flavorful fruit that adds brightness to any dish. Packed with vitamins, minerals, and antioxidants, tomatoes offer numerous health benefits. Whether used in salads, sauces, or roasted dishes, tomatoes provide a burst of tangy sweetness and are a staple in many cuisines around the world.', 'Healthy Tomatoes,Cotton,Vibrant and flavorful', 'Healthy Tomatoes - These tomatoes are packed with vitamins and antioxidants, making them a nutritious choice for salads, sauces, and more.', 'Vegetables'),
(8, '100% Organic Avocado', 78.00, 'img/product/avo.jpg', 30, '100% Organic Avocado: Our 100% organic avocados are grown without the use of synthetic pesticides or fertilizers. Avocados are known for their creamy texture and rich taste. They are a great source of healthy fats, vitamins, and minerals. Enjoy them sliced on toast, in salads, or as the star ingredient in guacamole.', '100% Organic Avocado,Casual:Cotton,Creamy and nutritious', '100% Organic Avocado - This avocado is grown using organic farming practices, free from pesticides and chemicals, ensuring a pure and natural taste.', 'Fruits'),
(9, 'Pure Organic Banana', 53.00, 'img/product/ban.jpg', 22, 'Pure Organic Banana: Our pure organic bananas are grown in a sustainable and eco-friendly manner, ensuring a high-quality fruit. Bananas are a popular and nutritious snack, rich in potassium, vitamins, and dietary fiber. They are a versatile fruit used in smoothies, baked goods, and enjoyed on their own as a quick energy boost.', 'Pure Organic Banana,Cotton,Rich in potassium', 'Pure Organic Banana - These bananas are organically grown, offering a delicious and healthy snack option for all ages.', 'Fruits'),
(10, 'Pure Natural Mango', 68.00, 'img/product/man.jpg', 17, 'Pure Natural Mango: Our pure natural mangoes are grown using natural farming methods, without the use of artificial chemicals or preservatives. Mangoes are known for their luscious sweetness and tropical flavor. They are packed with vitamins, minerals, and antioxidants. Enjoy them fresh, in fruit salads, or blended into refreshing smoothies.', 'Pure Natural Mango,Short Sleeve:Cotton,Sweet and tropical', 'Pure Natural Mango - Our mangoes are grown naturally, without any artificial additives or preservatives, providing a sweet and refreshing taste.', 'Fruits');

-- --------------------------------------------------------

--
-- Table structure for table `gotera_subscriber_table`
--

CREATE TABLE `gotera_subscriber_table` (
  `id` int(11) NOT NULL,
  `fullname` varchar(30) DEFAULT NULL,
  `phonenumber` varchar(15) DEFAULT NULL,
  `location` point DEFAULT NULL,
  `preferedpayment` varchar(40) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `pass` varchar(30) DEFAULT NULL,
  `profilepicture` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gotera_user_bought_product`
--

CREATE TABLE `gotera_user_bought_product` (
  `user_id` int(11) NOT NULL,
  `bought_product_id` int(11) NOT NULL,
  `prod_quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gotera_user_carted_product`
--

CREATE TABLE `gotera_user_carted_product` (
  `user_id` int(11) NOT NULL,
  `carted_product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gotera_user_table`
--

CREATE TABLE `gotera_user_table` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `profile_picture` longblob DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_table`
--

CREATE TABLE `product_table` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL,
  `product_image_url` varchar(200) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `product_description` varchar(1000) DEFAULT NULL,
  `data_sheet` varchar(1000) DEFAULT NULL,
  `more_info` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_table`
--

INSERT INTO `product_table` (`product_id`, `product_name`, `product_price`, `product_image_url`, `quantity`, `product_description`, `data_sheet`, `more_info`) VALUES
(1, 'Mango', 50.00, 'img/product/man.jpg', 1, 'Mango is a delicious tropical fruit known for its sweet and juicy flavor. It is rich in vitamins, minerals, and antioxidants, making it a healthy choice. With its vibrant orange color and refreshing taste, mango is perfect for enjoying on its own or adding to various dishes, such as salads, smoothies, and desserts.', 'Mango,Short Sleeve:Cotton,Sweet and juicy', 'Short Sleeve - This product features a short sleeve design, making it perfect for warm weather and casual occasions.'),
(2, '100% Organic Mung beans', 37.00, 'img/product/image-370x439.jpg', 10, '100% Organic Mung Beans: These mung beans are organically grown, ensuring that they are free from pesticides and chemicals. Mung beans are a nutritious legume packed with protein, fiber, vitamins, and minerals. They are a versatile ingredient used in various cuisines, including soups, curries, stir-fries, and sprouts.', '100% Organic Mung beans,Casual:Cotton,Nutritious and easy to cook', 'Casual - These 100% organic mung beans are great for casual cooking and provide a healthy and nutritious option for meals.'),
(3, 'High quality sesame seed', 62.00, 'img/product/image-370x439 (1).jpg', 20, 'High-Quality Sesame Seeds: Our high-quality sesame seeds are carefully selected and processed to maintain their natural flavor and nutritional benefits. Sesame seeds are rich in healthy fats, protein, and minerals like calcium and iron. They add a delightful nutty flavor and crunchy texture to dishes and are commonly used in baking, cooking, and as a topping for salads and sushi.', 'High quality sesame seed,Cotton,Rich in flavor and aroma', 'Cotton - Made from high-quality sesame seeds, this product offers a rich and nutty flavor, perfect for adding depth to your dishes.'),
(4, 'Ethiopian Coffee', 98.00, 'img/product/image-370x439 (2).jpg', 15, 'Ethiopian Coffee is renowned for its exceptional quality and distinct flavors. Grown in the fertile highlands of Ethiopia, this coffee is known for its floral and fruity notes, along with a rich and smooth taste. Ethiopian coffee is traditionally prepared using a unique brewing method called \"jebena\" and is enjoyed for its aromatic experience and cultural significance.', 'Ethiopian Coffee,Cotton,Bold and aromatic', 'Properties - Ethiopian Coffee is known for its unique flavors and aroma, with a rich and bold taste that will satisfy coffee enthusiasts.'),
(5, 'Cotton', 108.00, 'img/product/image-370x439 (6).jpg', 12, 'Cotton is a natural and versatile fiber widely used in textile production. It is known for its softness, breathability, and durability, making it a preferred choice for clothing, bedding, and various other textile applications. Our cotton is sourced from high-quality cotton plants, ensuring a premium product that meets the highest standards of comfort and quality.', 'Cotton,Cotton,Soft and breathable', 'Styles - This cotton fabric is versatile and can be used for various purposes, including clothing, home decor, and crafts.'),
(6, 'Quality Cabbage', 48.00, 'img/product/image-370x439 (7).jpg', 18, 'Quality Cabbage: Our quality cabbage is fresh, crisp, and packed with nutrients. Cabbage is a versatile vegetable that can be enjoyed raw in salads or cooked in various dishes like stir-fries, soups, and stews. It is known for its high vitamin C content and is a great source of fiber, antioxidants, and beneficial plant compounds.', 'Quality Cabbage,Cotton,Fresh and crispy', 'Compositions - Our quality cabbage is grown with care, ensuring freshness and providing essential nutrients for a healthy diet.'),
(7, 'Healthy Tomatoes', 38.00, 'img/product/image-370x439 (2).jpg', 25, 'Healthy Tomatoes: Tomatoes are a nutritious and flavorful fruit that adds brightness to any dish. Packed with vitamins, minerals, and antioxidants, tomatoes offer numerous health benefits. Whether used in salads, sauces, or roasted dishes, tomatoes provide a burst of tangy sweetness and are a staple in many cuisines around the world.', 'Healthy Tomatoes,Cotton,Vibrant and flavorful', 'Healthy Tomatoes - These tomatoes are packed with vitamins and antioxidants, making them a nutritious choice for salads, sauces, and more.'),
(8, '100% Organic Avocado', 78.00, 'img/product/avo.jpg', 30, '100% Organic Avocado: Our 100% organic avocados are grown without the use of synthetic pesticides or fertilizers. Avocados are known for their creamy texture and rich taste. They are a great source of healthy fats, vitamins, and minerals. Enjoy them sliced on toast, in salads, or as the star ingredient in guacamole.', '100% Organic Avocado,Casual:Cotton,Creamy and nutritious', '100% Organic Avocado - This avocado is grown using organic farming practices, free from pesticides and chemicals, ensuring a pure and natural taste.'),
(9, 'Pure Organic Banana', 53.00, 'img/product/ban.jpg', 22, 'Pure Organic Banana: Our pure organic bananas are grown in a sustainable and eco-friendly manner, ensuring a high-quality fruit. Bananas are a popular and nutritious snack, rich in potassium, vitamins, and dietary fiber. They are a versatile fruit used in smoothies, baked goods, and enjoyed on their own as a quick energy boost.', 'Pure Organic Banana,Cotton,Rich in potassium', 'Pure Organic Banana - These bananas are organically grown, offering a delicious and healthy snack option for all ages.'),
(10, 'Pure Natural Mango', 68.00, 'img/product/man.jpg', 17, 'Pure Natural Mango: Our pure natural mangoes are grown using natural farming methods, without the use of artificial chemicals or preservatives. Mangoes are known for their luscious sweetness and tropical flavor. They are packed with vitamins, minerals, and antioxidants. Enjoy them fresh, in fruit salads, or blended into refreshing smoothies.', 'Pure Natural Mango,Short Sleeve:Cotton,Sweet and tropical', 'Pure Natural Mango - Our mangoes are grown naturally, without any artificial additives or preservatives, providing a sweet and refreshing taste.');

-- --------------------------------------------------------

--
-- Table structure for table `review_table`
--

CREATE TABLE `review_table` (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_bought_product`
--

CREATE TABLE `user_bought_product` (
  `user_id` int(11) NOT NULL,
  `bought_product_id` int(11) NOT NULL,
  `prod_quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_carted_product`
--

CREATE TABLE `user_carted_product` (
  `user_id` int(11) NOT NULL,
  `carted_product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_carted_product`
--

INSERT INTO `user_carted_product` (`user_id`, `carted_product_id`) VALUES
(1, 3),
(1, 8),
(1, 10),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(4, 3),
(4, 5),
(4, 10),
(5, 1),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(7, 2),
(9, 1),
(9, 3),
(9, 5),
(9, 6);

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `u_password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`id`, `first_name`, `last_name`, `email`, `u_password`) VALUES
(1, 'wende', 'dufera', 'wenonezra258@gmail.com', '04c0fc66f8814811dc6f47b9dbc96b76'),
(2, 'Tzi', 'Getu', 'tsion1424@gmail.com', 'b698ef35216e8fef20c00fb3b1015ecc'),
(3, 'Oliyad', 'Kedir', 'olioba@gmail.com', 'de4b17f05a47d4cf0a956f99eebcf3f7'),
(4, 'wende', 'dufera', 'wenonezra2589@gmail.com', 'c98703aed69284552ffffea25a1706d9'),
(5, 'Wonde', 'Dufera', 'dufWen@gmail.com', '508df4cb2f4d8f80519256258cfb975f'),
(6, 'Tare', 'Mek', 'tare.meke2010@gmail.com', '25d55ad283aa400af464c76d713c07ad'),
(7, 'halleli', 'endashewu', 'hal245@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
(8, 'Naom', 'Senay', 'naisenay@gmail.com', 'e65d0020f5141b7d39682d6dabaa3ebd'),
(9, 'mike', 'sol', 'mikesol@gmail.com', 'e35cf7b66449df565f93c607d5a81d09'),
(10, 'redu', 'sol', 'redusol@gmail.com', 'e10adc3949ba59abbe56e057f20f883e');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_information`
--
ALTER TABLE `billing_information`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `gotera_product_table`
--
ALTER TABLE `gotera_product_table`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `gotera_subscriber_table`
--
ALTER TABLE `gotera_subscriber_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gotera_user_bought_product`
--
ALTER TABLE `gotera_user_bought_product`
  ADD PRIMARY KEY (`user_id`,`bought_product_id`),
  ADD KEY `bought_product_id` (`bought_product_id`);

--
-- Indexes for table `gotera_user_carted_product`
--
ALTER TABLE `gotera_user_carted_product`
  ADD PRIMARY KEY (`user_id`,`carted_product_id`),
  ADD KEY `carted_product_id` (`carted_product_id`);

--
-- Indexes for table `gotera_user_table`
--
ALTER TABLE `gotera_user_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_table`
--
ALTER TABLE `product_table`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `review_table`
--
ALTER TABLE `review_table`
  ADD PRIMARY KEY (`user_id`,`product_id`);

--
-- Indexes for table `user_bought_product`
--
ALTER TABLE `user_bought_product`
  ADD PRIMARY KEY (`user_id`,`bought_product_id`),
  ADD KEY `bought_product_id` (`bought_product_id`);

--
-- Indexes for table `user_carted_product`
--
ALTER TABLE `user_carted_product`
  ADD PRIMARY KEY (`user_id`,`carted_product_id`),
  ADD KEY `carted_product_id` (`carted_product_id`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_us`
--
ALTER TABLE `about_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gotera_product_table`
--
ALTER TABLE `gotera_product_table`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `gotera_subscriber_table`
--
ALTER TABLE `gotera_subscriber_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gotera_user_table`
--
ALTER TABLE `gotera_user_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_table`
--
ALTER TABLE `product_table`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gotera_user_bought_product`
--
ALTER TABLE `gotera_user_bought_product`
  ADD CONSTRAINT `fk_user_bought_product_product` FOREIGN KEY (`bought_product_id`) REFERENCES `product_table` (`product_id`),
  ADD CONSTRAINT `fk_user_bought_product_user` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`id`);

--
-- Constraints for table `gotera_user_carted_product`
--
ALTER TABLE `gotera_user_carted_product`
  ADD CONSTRAINT `fk_user_carted_product_product` FOREIGN KEY (`carted_product_id`) REFERENCES `gotera_product_table` (`product_id`),
  ADD CONSTRAINT `fk_user_carted_product_user` FOREIGN KEY (`user_id`) REFERENCES `gotera_user_table` (`id`);

--
-- Constraints for table `user_bought_product`
--
ALTER TABLE `user_bought_product`
  ADD CONSTRAINT `user_bought_product_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`id`),
  ADD CONSTRAINT `user_bought_product_ibfk_2` FOREIGN KEY (`bought_product_id`) REFERENCES `product_table` (`product_id`);

--
-- Constraints for table `user_carted_product`
--
ALTER TABLE `user_carted_product`
  ADD CONSTRAINT `user_carted_product_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`id`),
  ADD CONSTRAINT `user_carted_product_ibfk_2` FOREIGN KEY (`carted_product_id`) REFERENCES `product_table` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
