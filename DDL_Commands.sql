
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
CREATE DATABASE IF NOT EXISTS `bookstoredb`
DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bookstoredb`;

CREATE TABLE IF NOT EXISTS `authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `books_fk0` (`publisher_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `books_authors` (
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`book_id`,`author_id`),
  KEY `books_authors_fk1` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `books_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NOT NULL,
  `book_id` bigint(20) NOT NULL,
  `qty` int(11) NOT NULL,
  `final_price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rate` int(2) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `feedback_fk0` (`book_id`),
  KEY `feedback_fk1` (`order_id`),
  KEY `feedback_fk2` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `publisher` int(11) NOT NULL DEFAULT '0',
  `added_by` int(11) NOT NULL DEFAULT '0',
  `qty` int(11) NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `inventory_fk0` (`book_id`),
  KEY `inventory_fk1` (`publisher`),
  KEY `inventory_fk2` (`added_by`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `managers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `firstname` varchar(35) NOT NULL,
  `middlename` varchar(35) NOT NULL,
  `lastname` varchar(35) NOT NULL,
  `mobile_contact` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile_contact` (`mobile_contact`) USING BTREE,
  KEY `managers_fk0` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `manager_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_id` int(11) NOT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `order_date` datetime NOT NULL,
  `billing_address_id` int(11) NOT NULL,
  `shipping_address_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk0_manager_id_idx` (`manager_id`),
  KEY `fk1_publisher_id_idx` (`publisher_id`),
  KEY `fk2_billing_address_id_idx` (`billing_address_id`),
  KEY `fk2_shipping_address_id_idx` (`shipping_address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `manager_order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '1',
  `final_price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk0_book_id_idx` (`book_id`),
  KEY `fk1_order_id_idx` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `members_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memeber_id` int(11) NOT NULL,
  `type` int(1) NOT NULL DEFAULT '1',
  `isbilling` int(1) NOT NULL DEFAULT '1',
  `isshiping` int(1) NOT NULL DEFAULT '1',
  `country` varchar(32) NOT NULL,
  `zipcode` varchar(20) DEFAULT NULL,
  `state` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `city` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `street` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `notes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `members_addresses_fk0` (`memeber_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `memebers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `firstname` varchar(35) NOT NULL,
  `middlename` varchar(35) NOT NULL,
  `lastname` varchar(35) NOT NULL,
  `gender` tinyint(4) NOT NULL,
  `mobile_contact` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile_contact` (`mobile_contact`),
  KEY `memebers_fk0` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `billing_address_id` int(11) NOT NULL,
  `shipping_address_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_fk0` (`member_id`),
  KEY `orders_fk1_idx` (`shipping_address_id`),
  KEY `orders_fk2` (`billing_address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `orders_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `status_code` int(1) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_status_fk0` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '1',
  `final_price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_fk0` (`book_id`),
  KEY `order_items_fk1` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `publishers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(35) NOT NULL,
  `logoURL` text,
  `mobile_contact` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile_contact` (`mobile_contact`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `publishers_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_id` int(11) NOT NULL,
  `type` int(1) NOT NULL DEFAULT '1',
  `isbilling` int(1) NOT NULL DEFAULT '1',
  `isshiping` int(1) NOT NULL DEFAULT '1',
  `country` varchar(32) NOT NULL,
  `zipcode` varchar(20) DEFAULT NULL,
  `state` tinytext CHARACTER SET utf8,
  `city` text CHARACTER SET utf8,
  `street` text CHARACTER SET utf8,
  `notes` text CHARACTER SET utf8,
  PRIMARY KEY (`id`),
  KEY `fk0_publisher_id_publishers_idx` (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `request_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_id` int(11) NOT NULL,
  `request_by` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `request_lists_fk0` (`publisher_id`),
  KEY `request_lists_fk1` (`request_by`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `request_list_books` (
  `list_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`list_id`,`book_id`),
  KEY `request_list_books_fk1` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(255) NOT NULL,
  `usertype` int(1) NOT NULL DEFAULT '0',
  `activated` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;

ALTER TABLE `books`
  ADD CONSTRAINT `books_fk0` FOREIGN KEY (`publisher_id`)
  REFERENCES `publishers` (`id`),
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`category_id`)
  REFERENCES `books_category` (`id`);

ALTER TABLE `books_authors`
  ADD CONSTRAINT `books_authors_fk0` FOREIGN KEY (`book_id`)
  REFERENCES `books` (`id`),
  ADD CONSTRAINT `books_authors_fk1` FOREIGN KEY (`author_id`)
  REFERENCES `authors` (`id`);

ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_fk0` FOREIGN KEY (`book_id`)
  REFERENCES `books` (`id`),
  ADD CONSTRAINT `feedback_fk1` FOREIGN KEY (`order_id`)
  REFERENCES `orders` (`id`),
  ADD CONSTRAINT `feedback_fk2` FOREIGN KEY (`user_id`)
  REFERENCES `memebers` (`id`);

ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_fk0` FOREIGN KEY (`book_id`)
  REFERENCES `books` (`id`),
  ADD CONSTRAINT `inventory_fk1` FOREIGN KEY (`publisher`)
  REFERENCES `publishers` (`id`),
  ADD CONSTRAINT `inventory_fk2` FOREIGN KEY (`added_by`)
  REFERENCES `managers` (`id`);

ALTER TABLE `managers`
  ADD CONSTRAINT `managers_fk0` FOREIGN KEY (`user_id`)
  REFERENCES `users` (`id`);

ALTER TABLE `manager_orders`
  ADD CONSTRAINT `fk0_manager_id` FOREIGN KEY (`manager_id`)
  REFERENCES `managers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk1_publisher_id` FOREIGN KEY (`publisher_id`)
  REFERENCES `publishers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk2_billing_address_id` FOREIGN KEY (`billing_address_id`)
  REFERENCES `publishers_addresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk2_shipping_address_id` FOREIGN KEY (`shipping_address_id`)
  REFERENCES `publishers_addresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `manager_order_items`
  ADD CONSTRAINT `fk0_book_id` FOREIGN KEY (`book_id`)
  REFERENCES `books` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk1_order_id` FOREIGN KEY (`order_id`)
  REFERENCES `manager_orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `members_addresses`
  ADD CONSTRAINT `members_addresses_fk0` FOREIGN KEY (`memeber_id`)
  REFERENCES `memebers` (`id`);

ALTER TABLE `memebers`
  ADD CONSTRAINT `memebers_fk0` FOREIGN KEY (`user_id`)
  REFERENCES `users` (`id`);

ALTER TABLE `orders`
  ADD CONSTRAINT `orders_fk0` FOREIGN KEY (`member_id`)
  REFERENCES `memebers` (`id`),
  ADD CONSTRAINT `orders_fk1` FOREIGN KEY (`shipping_address_id`)
  REFERENCES `members_addresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `orders_fk2` FOREIGN KEY (`billing_address_id`)
  REFERENCES `members_addresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `orders_status`
  ADD CONSTRAINT `orders_status_fk0` FOREIGN KEY (`order_id`)
  REFERENCES `orders` (`id`);

ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_fk0` FOREIGN KEY (`book_id`)
  REFERENCES `books` (`id`),
  ADD CONSTRAINT `order_items_fk1` FOREIGN KEY (`order_id`)
  REFERENCES `orders` (`id`);

ALTER TABLE `publishers_addresses`
  ADD CONSTRAINT `fk0_publisher_id_publishers` FOREIGN KEY (`publisher_id`)
  REFERENCES `publishers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `request_lists`
  ADD CONSTRAINT `request_lists_fk0` FOREIGN KEY (`publisher_id`)
  REFERENCES `publishers` (`id`),
  ADD CONSTRAINT `request_lists_fk1` FOREIGN KEY (`request_by`)
  REFERENCES `managers` (`id`);

ALTER TABLE `request_list_books`
  ADD CONSTRAINT `request_list_books_fk0` FOREIGN KEY (`list_id`)
  REFERENCES `request_lists` (`id`),
  ADD CONSTRAINT `request_list_books_fk1` FOREIGN KEY (`book_id`)
  REFERENCES `books` (`id`);