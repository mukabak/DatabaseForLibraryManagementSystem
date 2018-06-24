-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 21, 2017 at 10:15 AM
-- Server version: 5.7.19-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstoredb`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `name` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `name`) VALUES
(1001, 'Nora Roberts'),
(1002, 'Katie Mcgarry'),
(1003, 'Lisa Kleypas'),
(1004, 'Sawyer Bennett'),
(1005, 'Sylvia Day');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `publisher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `category_id`, `title`, `isbn`, `publisher_id`) VALUES
(1001, 32, 'Come Sundown', '99-7224-567-5', 6),
(1002, 32, 'Take Me On', '99-7245-777-1', 6),
(1003, 32, 'Chasing Impossible', '99-9059-068-0', 7),
(1004, 32, 'Crash Into You', '99-9054-266-1', 7),
(1005, 32, 'Scandal in Spring', '99-9058-160-6', 6),
(1006, 32, 'Devil in Winter', '99-9056-056-0', 7),
(1007, 32, 'It Happened One Autumn', '99-9055-765-9', 7),
(1008, 32, 'Secrets of a Summer Night', '99-9050-459-8', 8),
(1009, 32, 'Seduce Me At Sunrise', '99-7857-655-1', 8),
(1010, 32, 'Mine Till Midnight', '99-7854-376-7', 8),
(1011, 33, 'Blood of Elves', '99-7860-457-1', 6),
(1012, 33, 'Sword of Destiny', '99-7856-671-6', 6),
(1013, 33, 'The Last Wish', '99-7835-640-1', 6),
(1014, 33, 'Midnight', '99-7836-265-7', 7),
(1015, 33, 'The Blinding Knife', '99-7860-960-1', 7),
(1016, 33, 'City of Dragons', '99-7861-748-5', 7),
(1017, 33, 'The Killing Moon', '99-7877-752-0', 6),
(1018, 33, 'Some Kind of Fairy Tale', '99-7815-675-5', 8),
(1019, 33, 'Alif the Unseen', '99-7833-341-1', 8),
(1020, 33, 'Depths of Madness', '99-7875-452-0', 8),
(1021, 34, 'Dog Songs', '99-7811-664-8', 6),
(1022, 34, 'Incarnadine: Poems', '99-7861-846-5', 6),
(1023, 34, 'Metaphysical Dog', '99-7846-443-3', 6),
(1024, 34, 'Rhymes of a Roughneck', '99-7835-255-4', 6),
(1025, 34, 'Personal Reminiscences of James Mapes Dodge', '99-7861-448-6', 7),
(1026, 34, 'A New Way to Win a Fortune', '99-7889-143-9', 7),
(1027, 34, 'Indianas Roll of Honor volume 2', '99-7853-555-1', 7),
(1028, 34, 'The Minor Historical Works ', '99-7811-557-9', 8),
(1029, 34, 'East And West a Poem', '99-7844-875-6', 8),
(1030, 34, 'Norse Myth in English Poetry', '99-7850-440-0', 8);

-- --------------------------------------------------------

--
-- Table structure for table `books_authors`
--

CREATE TABLE `books_authors` (
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books_authors`
--

INSERT INTO `books_authors` (`book_id`, `author_id`) VALUES
(1001, 1001),
(1002, 1001),
(1003, 1001),
(1004, 1001),
(1005, 1002),
(1006, 1002),
(1007, 1002),
(1008, 1002),
(1009, 1002),
(1010, 1002),
(1011, 1003),
(1012, 1003),
(1013, 1003),
(1014, 1003),
(1015, 1003),
(1028, 1003),
(1029, 1003),
(1016, 1004),
(1017, 1004),
(1018, 1004),
(1019, 1004),
(1020, 1004),
(1030, 1004),
(1021, 1005),
(1022, 1005),
(1023, 1005),
(1024, 1005),
(1025, 1005),
(1026, 1005),
(1027, 1005);

-- --------------------------------------------------------

--
-- Table structure for table `books_category`
--

CREATE TABLE `books_category` (
  `id` int(11) NOT NULL,
  `title` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books_category`
--

INSERT INTO `books_category` (`id`, `title`) VALUES
(32, 'Romance'),
(33, 'Fantasy'),
(34, 'Poetry');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL,
  `member_id` bigint(20) NOT NULL,
  `book_id` bigint(20) NOT NULL,
  `qty` int(11) NOT NULL,
  `final_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `member_id`, `book_id`, `qty`, `final_price`) VALUES
(1, 1003, 1028, 1, 25),
(2, 1006, 1028, 2, 98),
(3, 1003, 1030, 3, 20);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rate` int(2) NOT NULL DEFAULT '0',
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `book_id`, `order_id`, `user_id`, `rate`, `comment`) VALUES
(1, 1027, 1, 1003, 9, 'Very nice book I liked it. though it was overpriced here.'),
(2, 1002, 1, 1003, 4, 'Not really nice book.'),
(3, 1004, 2, 1002, 4, 'Bad book dont read it.'),
(4, 1006, 2, 1002, 9, 'Very nice one.');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `publisher` int(11) NOT NULL DEFAULT '0',
  `added_by` int(11) NOT NULL DEFAULT '0',
  `qty` int(11) NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `book_id`, `publisher`, `added_by`, `qty`, `price`) VALUES
(1, 1003, 6, 1, 150, 25),
(2, 1007, 8, 1, 157, 30),
(3, 1025, 8, 1, 90, 60),
(4, 1028, 7, 1, 88, 98),
(5, 1030, 7, 1, 100, 30);

-- --------------------------------------------------------

--
-- Table structure for table `managers`
--

CREATE TABLE `managers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `firstname` varchar(35) NOT NULL,
  `middlename` varchar(35) NOT NULL,
  `lastname` varchar(35) NOT NULL,
  `mobile_contact` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `managers`
--

INSERT INTO `managers` (`id`, `user_id`, `firstname`, `middlename`, `lastname`, `mobile_contact`) VALUES
(1, 1007, 'Mustafa', 'Ahmed', 'Ahmed', '60176669966');

-- --------------------------------------------------------

--
-- Table structure for table `manager_orders`
--

CREATE TABLE `manager_orders` (
  `id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `order_date` datetime NOT NULL,
  `billing_address_id` int(11) NOT NULL,
  `shipping_address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manager_orders`
--

INSERT INTO `manager_orders` (`id`, `manager_id`, `publisher_id`, `order_date`, `billing_address_id`, `shipping_address_id`) VALUES
(1, 1, 8, '2017-08-20 00:00:00', 1004, 1004),
(2, 1, 6, '2017-07-04 00:00:00', 1001, 1003);

-- --------------------------------------------------------

--
-- Table structure for table `manager_order_items`
--

CREATE TABLE `manager_order_items` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '1',
  `final_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manager_order_items`
--

INSERT INTO `manager_order_items` (`id`, `book_id`, `order_id`, `qty`, `final_price`) VALUES
(1, 1029, 1, 30, 50),
(2, 1028, 1, 60, 30),
(3, 1030, 2, 6, 100),
(4, 1029, 2, 5, 50);

-- --------------------------------------------------------

--
-- Table structure for table `members_addresses`
--

CREATE TABLE `members_addresses` (
  `id` int(11) NOT NULL,
  `memeber_id` int(11) NOT NULL,
  `type` int(1) NOT NULL DEFAULT '1',
  `isbilling` int(1) NOT NULL DEFAULT '1',
  `isshiping` int(1) NOT NULL DEFAULT '1',
  `country` varchar(32) NOT NULL,
  `zipcode` varchar(20) DEFAULT NULL,
  `state` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `city` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `street` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `notes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members_addresses`
--

INSERT INTO `members_addresses` (`id`, `memeber_id`, `type`, `isbilling`, `isshiping`, `country`, `zipcode`, `state`, `city`, `street`, `notes`) VALUES
(1001, 1001, 1, 1, 1, 'Malaysia', '43300', 'Selangor', 'Seri Kembangan', 'Taman Serdang Perdana', 'East Lake E-12-22'),
(1003, 1002, 1, 1, 1, 'Malaysia', '43300', 'Selangor', 'Seri Kembangan', 'Taman Serdang Perdana', 'One South E-18-2'),
(1004, 1003, 1, 1, 1, 'Malaysia', '43300', 'Selangor', 'Seri Kembangan', 'Taman Serdang Perdana', 'Flora E-99-99'),
(1005, 1004, 1, 1, 1, 'Malaysia', '43300', 'Selangor', 'Seri Kembangan', 'Taman Serdang Perdana', 'Sky Villa D-17-8'),
(1006, 1005, 1, 1, 1, 'Malaysia', '43300', 'Selangor', 'Seri Kembangan', 'Taman Serdang Perdana', 'South City A-12-8'),
(1007, 1006, 1, 1, 1, 'Malaysia', '43300', 'Selangor', 'Seri Kembangan', 'Sri Petaling', 'Endah Promenade C-17-2');

-- --------------------------------------------------------

--
-- Table structure for table `memebers`
--

CREATE TABLE `memebers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `firstname` varchar(35) NOT NULL,
  `middlename` varchar(35) NOT NULL,
  `lastname` varchar(35) NOT NULL,
  `gender` tinyint(4) NOT NULL,
  `mobile_contact` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `memebers`
--

INSERT INTO `memebers` (`id`, `user_id`, `firstname`, `middlename`, `lastname`, `gender`, `mobile_contact`) VALUES
(1001, 1001, 'Alexander', 'Petrovich', 'Petrov', 1, '60173814015'),
(1002, 1002, 'Dasha', 'Timur', 'Al Saudi', 1, '60176984569'),
(1003, 1003, 'Dora', 'Diego', 'Maria', 2, '60173855555'),
(1004, 1004, 'Andrey', 'Mekailovich', 'Akbar', 1, '60173333333'),
(1005, 1005, 'Sashenko', 'Mashendovich', 'Tashenkov', 2, '60175598379'),
(1006, 1006, 'Putin', 'Valadimirovich', 'Valadimir', 1, '60178988888');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `billing_address_id` int(11) NOT NULL,
  `shipping_address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `member_id`, `order_date`, `billing_address_id`, `shipping_address_id`) VALUES
(1, 1003, '2017-08-20 05:51:32', 1004, 1004),
(2, 1002, '2017-08-16 00:00:00', 1003, 1003);

-- --------------------------------------------------------

--
-- Table structure for table `orders_status`
--

CREATE TABLE `orders_status` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `status_code` int(1) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_status`
--

INSERT INTO `orders_status` (`id`, `message`, `status_code`, `order_id`) VALUES
(1, 'Order Created', 0, 1),
(2, 'Delivered', 3, 1),
(3, 'Delivered', 3, 2),
(4, 'Order Created', 0, 2),
(5, 'Processing', 1, 1),
(6, 'Processing', 1, 2),
(7, 'In Transit', 2, 1),
(8, 'In Transit', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '1',
  `final_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `book_id`, `order_id`, `qty`, `final_price`) VALUES
(15, 1027, 1, 3, 0),
(16, 1002, 1, 5, 0),
(17, 1004, 2, 1, 0),
(18, 1006, 2, 3, 0),
(19, 1019, 2, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `publishers`
--

CREATE TABLE `publishers` (
  `id` int(11) NOT NULL,
  `name` varchar(35) NOT NULL,
  `logoURL` text,
  `mobile_contact` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`id`, `name`, `logoURL`, `mobile_contact`) VALUES
(6, 'iBook', 'http://geeknewscentral.com/wp-content/uploads/2016/04/Unknown.jpeg', '60173336655'),
(7, 'MyBook', 'http://www.brandcrowd.com/gallery/brands/pictures/picture13704486508059.jpg', '60179866636'),
(8, 'Brilliant Creations', 'https://brilliantcreations.co.za/wp-content/uploads/2017/06/BC-long-logo.png', '60178963258');

-- --------------------------------------------------------

--
-- Table structure for table `publishers_addresses`
--

CREATE TABLE `publishers_addresses` (
  `id` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `type` int(1) NOT NULL DEFAULT '1',
  `isbilling` int(1) NOT NULL DEFAULT '1',
  `isshiping` int(1) NOT NULL DEFAULT '1',
  `country` varchar(32) NOT NULL,
  `zipcode` varchar(20) DEFAULT NULL,
  `state` tinytext CHARACTER SET utf8,
  `city` text CHARACTER SET utf8,
  `street` text CHARACTER SET utf8,
  `notes` text CHARACTER SET utf8
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `publishers_addresses`
--

INSERT INTO `publishers_addresses` (`id`, `publisher_id`, `type`, `isbilling`, `isshiping`, `country`, `zipcode`, `state`, `city`, `street`, `notes`) VALUES
(1001, 6, 1, 1, 1, 'Eygpt', '43300', 'Selangor', 'Seri Kembangan', 'Sri Putra', '5-12'),
(1003, 6, 1, 1, 1, 'Malaysia', '43300', 'Selangor', 'Seri Kembangan', 'Bukit Jalil', '12-8'),
(1004, 8, 1, 1, 1, 'Iraq', '44400', 'Kuala Lumpur', 'Bukit Bintang', 'Chankat', '22-8');

-- --------------------------------------------------------

--
-- Table structure for table `request_lists`
--

CREATE TABLE `request_lists` (
  `id` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `request_by` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request_lists`
--

INSERT INTO `request_lists` (`id`, `publisher_id`, `request_by`, `title`, `created_at`) VALUES
(1, 8, 1, 'Technology books request', '2017-08-20 00:00:00'),
(2, 6, 1, 'History books', '2017-07-19 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `request_list_books`
--

CREATE TABLE `request_list_books` (
  `list_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request_list_books`
--

INSERT INTO `request_list_books` (`list_id`, `book_id`, `qty`) VALUES
(1, 1013, 30),
(1, 1029, 60),
(2, 1028, 60);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(255) NOT NULL,
  `usertype` int(1) NOT NULL DEFAULT '0',
  `activated` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `usertype`, `activated`) VALUES
(1001, 'alex', '12345', 'alex@gmail.com', 1, 1),
(1002, 'dasha', '12345', 'dasha@gmail.com', 1, 1),
(1003, 'dora', '12345', 'dora@gmail.com', 1, 1),
(1004, 'andrey', '12345', 'andrey@gmail.com', 1, 1),
(1005, 'sasha', '12345', 'sasha@gmail.com', 1, 1),
(1006, 'valad', '12345', 'valad@gmail.com', 1, 1),
(1007, 'mustafa', '12345', 'mustafa.naruto@gmail.com', 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `books_fk0` (`publisher_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `books_authors`
--
ALTER TABLE `books_authors`
  ADD PRIMARY KEY (`book_id`,`author_id`),
  ADD KEY `books_authors_fk1` (`author_id`);

--
-- Indexes for table `books_category`
--
ALTER TABLE `books_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feedback_fk0` (`book_id`),
  ADD KEY `feedback_fk1` (`order_id`),
  ADD KEY `feedback_fk2` (`user_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_fk0` (`book_id`),
  ADD KEY `inventory_fk1` (`publisher`),
  ADD KEY `inventory_fk2` (`added_by`);

--
-- Indexes for table `managers`
--
ALTER TABLE `managers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mobile_contact` (`mobile_contact`) USING BTREE,
  ADD KEY `managers_fk0` (`user_id`);

--
-- Indexes for table `manager_orders`
--
ALTER TABLE `manager_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk0_manager_id_idx` (`manager_id`),
  ADD KEY `fk1_publisher_id_idx` (`publisher_id`),
  ADD KEY `fk2_billing_address_id_idx` (`billing_address_id`),
  ADD KEY `fk2_shipping_address_id_idx` (`shipping_address_id`);

--
-- Indexes for table `manager_order_items`
--
ALTER TABLE `manager_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk0_book_id_idx` (`book_id`),
  ADD KEY `fk1_order_id_idx` (`order_id`);

--
-- Indexes for table `members_addresses`
--
ALTER TABLE `members_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `members_addresses_fk0` (`memeber_id`);

--
-- Indexes for table `memebers`
--
ALTER TABLE `memebers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mobile_contact` (`mobile_contact`),
  ADD KEY `memebers_fk0` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_fk0` (`member_id`),
  ADD KEY `orders_fk1_idx` (`shipping_address_id`),
  ADD KEY `orders_fk2` (`billing_address_id`);

--
-- Indexes for table `orders_status`
--
ALTER TABLE `orders_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_status_fk0` (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_fk0` (`book_id`),
  ADD KEY `order_items_fk1` (`order_id`);

--
-- Indexes for table `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mobile_contact` (`mobile_contact`) USING BTREE;

--
-- Indexes for table `publishers_addresses`
--
ALTER TABLE `publishers_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk0_publisher_id_publishers_idx` (`publisher_id`);

--
-- Indexes for table `request_lists`
--
ALTER TABLE `request_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_lists_fk0` (`publisher_id`),
  ADD KEY `request_lists_fk1` (`request_by`);

--
-- Indexes for table `request_list_books`
--
ALTER TABLE `request_list_books`
  ADD PRIMARY KEY (`list_id`,`book_id`),
  ADD KEY `request_list_books_fk1` (`book_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1006;
--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1031;
--
-- AUTO_INCREMENT for table `books_category`
--
ALTER TABLE `books_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `managers`
--
ALTER TABLE `managers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `manager_orders`
--
ALTER TABLE `manager_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `manager_order_items`
--
ALTER TABLE `manager_order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `members_addresses`
--
ALTER TABLE `members_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1008;
--
-- AUTO_INCREMENT for table `memebers`
--
ALTER TABLE `memebers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1011;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `orders_status`
--
ALTER TABLE `orders_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `publishers`
--
ALTER TABLE `publishers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `publishers_addresses`
--
ALTER TABLE `publishers_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1005;
--
-- AUTO_INCREMENT for table `request_lists`
--
ALTER TABLE `request_lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1011;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_fk0` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`),
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `books_category` (`id`);

--
-- Constraints for table `books_authors`
--
ALTER TABLE `books_authors`
  ADD CONSTRAINT `books_authors_fk0` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `books_authors_fk1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_fk0` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `feedback_fk1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `feedback_fk2` FOREIGN KEY (`user_id`) REFERENCES `memebers` (`id`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_fk0` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `inventory_fk1` FOREIGN KEY (`publisher`) REFERENCES `publishers` (`id`),
  ADD CONSTRAINT `inventory_fk2` FOREIGN KEY (`added_by`) REFERENCES `managers` (`id`);

--
-- Constraints for table `managers`
--
ALTER TABLE `managers`
  ADD CONSTRAINT `managers_fk0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `manager_orders`
--
ALTER TABLE `manager_orders`
  ADD CONSTRAINT `fk0_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `managers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk1_publisher_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk2_billing_address_id` FOREIGN KEY (`billing_address_id`) REFERENCES `publishers_addresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk2_shipping_address_id` FOREIGN KEY (`shipping_address_id`) REFERENCES `publishers_addresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `manager_order_items`
--
ALTER TABLE `manager_order_items`
  ADD CONSTRAINT `fk0_book_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk1_order_id` FOREIGN KEY (`order_id`) REFERENCES `manager_orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `members_addresses`
--
ALTER TABLE `members_addresses`
  ADD CONSTRAINT `members_addresses_fk0` FOREIGN KEY (`memeber_id`) REFERENCES `memebers` (`id`);

--
-- Constraints for table `memebers`
--
ALTER TABLE `memebers`
  ADD CONSTRAINT `memebers_fk0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_fk0` FOREIGN KEY (`member_id`) REFERENCES `memebers` (`id`),
  ADD CONSTRAINT `orders_fk1` FOREIGN KEY (`shipping_address_id`) REFERENCES `members_addresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `orders_fk2` FOREIGN KEY (`billing_address_id`) REFERENCES `members_addresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `orders_status`
--
ALTER TABLE `orders_status`
  ADD CONSTRAINT `orders_status_fk0` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_fk0` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `order_items_fk1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `publishers_addresses`
--
ALTER TABLE `publishers_addresses`
  ADD CONSTRAINT `fk0_publisher_id_publishers` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `request_lists`
--
ALTER TABLE `request_lists`
  ADD CONSTRAINT `request_lists_fk0` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`),
  ADD CONSTRAINT `request_lists_fk1` FOREIGN KEY (`request_by`) REFERENCES `managers` (`id`);

--
-- Constraints for table `request_list_books`
--
ALTER TABLE `request_list_books`
  ADD CONSTRAINT `request_list_books_fk0` FOREIGN KEY (`list_id`) REFERENCES `request_lists` (`id`),
  ADD CONSTRAINT `request_list_books_fk1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
