-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2024 at 10:43 AM
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
-- Database: `task_rabbit_like_platform`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `district` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `district`, `city`, `location`, `street`) VALUES
(1, 'Huye', 'Huye City', 'Ngoma', 'Huye-Campus'),
(2, 'Rutsiro', 'kivumu', 'west', 'Rubavu-karongi'),
(4, 'Muhanga', 'Muhanga', 'South-Rwanda', 'Kigali-Huye');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `task_id` int(11) DEFAULT NULL,
  `serviceprovider_id` int(11) DEFAULT NULL,
  `booking_date` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `task_id`, `serviceprovider_id`, `booking_date`) VALUES
(1, 3, 6, '2024-05-10'),
(2, 1, 1, '2024-05-02');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'JAVA DESIGN'),
(2, 'MAINTENANCE'),
(3, 'SOFTWARE DESIGNING'),
(4, 'DATABASES'),
(5, 'ICT'),
(6, 'JAVA DESIGN'),
(7, 'JAVA DESIGN');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `message_content` text DEFAULT NULL,
  `message_type` enum('Text','Image','Video','Audio','Other') NOT NULL,
  `message_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`message_id`, `sender_id`, `receiver_id`, `message_content`, `message_type`, `message_date`) VALUES
(1, 2, 3, 'Thank you it\'s all done!!', 'Image', '2024-05-14 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `names` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`names`, `email`, `message`) VALUES
('Aime marie', 'aimemarie250@gmail.com', 'hello!'),
('Sam', 'sam@gmail.com', 'You services is great and rapidly\r\nThank you!'),
('Sam', 'sam@gmail.com', 'You services is great and rapidly\r\nThank you!'),
('Sam', 'sam@gmail.com', 'You services is great and rapidly\r\nThank you!'),
('Sam', 'sam@gmail.com', 'You services is great and rapidly\r\nThank you!'),
('Mugisha Aimable', 'mugishaima@gmail.com', 'Hello!'),
('Aime marie', 'aimemarie250@gmail.com', 'Hello!'),
('Aime marie', 'aimemarie250@gmail.com', 'Hello!'),
('Lazia RUKUNDO', 'laziaurukundo123@gmail.com', 'Its was very fantastic!!!');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL DEFAULT curdate(),
  `status` enum('Pending','Paid','Refunded') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `user_id`, `amount`, `payment_date`, `status`) VALUES
(1, 3, 12000.00, '2024-05-05', 'Pending'),
(3, 2, 50.00, '2024-05-14', 'Pending'),
(4, 2, 65000.00, '2024-05-08', 'Paid'),
(7, 2, 50.00, '2024-05-08', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `serviceprovider_id` int(11) DEFAULT NULL,
  `rating` decimal(3,2) NOT NULL,
  `comment` text DEFAULT NULL,
  `review_date` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `user_id`, `serviceprovider_id`, `rating`, `comment`, `review_date`) VALUES
(1, 2, 5, 9.99, 'we are appreciate your works!', '2024-05-10'),
(2, 3, 6, 9.99, 'your services runs like flash!!!!!!!!!!!', '2024-05-08');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `requirements` varchar(100) DEFAULT NULL,
  `duration` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `department`, `description`, `requirements`, `duration`) VALUES
(1, 'ICT', 'we support in all ICT cases', 'ICT Tools', 20.00),
(3, 'WEBSITE DESIGN', 'we are ready to support you!', 'wishes to lunch it', 15.45),
(4, 'WEBSITE DESIGN', 'we are ready to support you!', 'wishes to lunch it', 2.25);

-- --------------------------------------------------------

--
-- Table structure for table `service_providers`
--

CREATE TABLE `service_providers` (
  `serviceprovider_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `hourly_rate` decimal(10,2) DEFAULT NULL,
  `rating` decimal(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_providers`
--

INSERT INTO `service_providers` (`serviceprovider_id`, `user_id`, `address_id`, `role_id`, `description`, `hourly_rate`, `rating`) VALUES
(1, 5, 1, 1, 'I want you to create my school website on 12/07/2024', 103.00, 9.99),
(5, 6, 1, 1, 'I asked to facilitate me to install in my pc window 11 Pro', 1212.00, 9.99),
(6, 2, 1, 1, 'I want you to send me handyman work at Huye on 25/05/2024', 10.00, 3.00);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `task_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `budget` decimal(10,2) NOT NULL,
  `deadline` date DEFAULT NULL,
  `status` enum('Open','In Progress','Completed') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`task_id`, `user_id`, `category_id`, `title`, `description`, `budget`, `deadline`, `status`) VALUES
(1, 2, 2, 'Client ', 'I want you to create my company website', 124.00, '2024-05-05', 'Completed'),
(3, 4, 1, 'Service Provider', 'we are ready to support you!', 1500.00, '2024-05-01', 'Open'),
(4, 4, 1, 'Service Provider', 'we are ready to support you', 1500.00, '2024-05-06', 'Completed'),
(5, 4, 1, 'Service Provider', 'we are ready to support you', 1500.00, '2024-05-01', 'In Progress');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` enum('Client','Service Provider') NOT NULL,
  `registration_date` date NOT NULL DEFAULT curdate(),
  `gender` enum('Male','Female') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `user_type`, `registration_date`, `gender`) VALUES
(1, 'Ishimwe Joy', 'ishimwejoy@gmail.com', '$2y$10$cqfz6ZxOYgQdlAyM7dzU/.z4o0Mi04uNzsrsjBBODfenmBdG0HWOK', 'Service Provider', '2024-05-14', 'Female'),
(2, 'Sam', 'sam@gmail.com', '$2y$10$kMfXU.FsFcUYpOouqLxRDerTYMkX2hKXAitfEMowkU/kmgsWi2rvS', 'Service Provider', '2024-04-30', 'Male'),
(3, 'Vestine', 'vestine25@gmail.com', '$2y$10$6XTmeaVltAZLq31p.bjRouWA2T11OxOyN3x4MwzQ0GW08n.DtCHvi', 'Service Provider', '2024-05-05', 'Female'),
(4, 'Manzi', 'manzi@gmail.com', '$2y$10$zDLehXW3wU534VvVA/KFo.6kyVA9PZb4eqmX0wI4xD7IsSs29oY6K', 'Client', '2024-05-06', 'Male'),
(5, 'Eric', 'niyobyoselyse3@gmail.com', '$2y$10$Lqw5cKSbClpK8cAepZgH7uyWBVNCAWgT5wuBg3bYYOgaGJXUtGDDe', 'Client', '2024-05-06', 'Male'),
(6, 'Nshuti', 'Isaac', '$2y$10$YaBAekurwWoxmESmkFtui.vOPhbPfooRF/yjspRWA1KnQrAKDJoN.', 'Client', '2024-05-07', 'Male'),
(32, 'Emmy', 'emmy10@gmail.com', '$2y$10$cTieoAVDUz6dVsl34ay03.yF83ymSpT14VpDKwxrT.MXD0ohIviOK', 'Service Provider', '2024-05-21', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `task_id` (`task_id`),
  ADD KEY `serviceprovider_id` (`serviceprovider_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `serviceprovider_id` (`serviceprovider_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `service_providers`
--
ALTER TABLE `service_providers`
  ADD PRIMARY KEY (`serviceprovider_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `address_id` (`address_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`task_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `service_providers`
--
ALTER TABLE `service_providers`
  MODIFY `serviceprovider_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`serviceprovider_id`) REFERENCES `service_providers` (`serviceprovider_id`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`serviceprovider_id`) REFERENCES `service_providers` (`serviceprovider_id`);

--
-- Constraints for table `service_providers`
--
ALTER TABLE `service_providers`
  ADD CONSTRAINT `service_providers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `service_providers_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `service_providers_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
