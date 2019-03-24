-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2019 at 04:16 PM
-- Server version: 5.7.24
-- PHP Version: 7.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_portfolio`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categories`
--

CREATE TABLE `tbl_categories` (
  `category_id` tinyint(3) UNSIGNED NOT NULL,
  `category_name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_categories`
--

INSERT INTO `tbl_categories` (`category_id`, `category_name`) VALUES
(1, 'Works'),
(2, 'Explorations');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_projects`
--

CREATE TABLE `tbl_projects` (
  `project_id` tinyint(3) UNSIGNED NOT NULL,
  `project_name` varchar(80) NOT NULL,
  `project_description` varchar(280) NOT NULL,
  `project_url` varchar(200) NOT NULL,
  `project_thumb_img` varchar(280) NOT NULL,
  `project_img` varchar(280) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_projects`
--

INSERT INTO `tbl_projects` (`project_id`, `project_name`, `project_description`, `project_url`, `project_thumb_img`, `project_img`) VALUES
(1, 'Dental Strategy', 'Project based on Laravel and VueJS. \r\nThe final objective was to create a learning management Web App based on  \r\na MVC structure. Axios library was used \r\nto retrieve data from Laravel Web API.    ', 'dentalstrategy.html', 'dentalStrategy_thumb.png', 'dentalStrategy.png'),
(2, 'Team Canada 1972', 'Client based project with objective to create a complete CMS structure based on PHP/MySQL.  CRUD/Admin functionality was also included.', 'https://teamcanada1972.ca/', 'teamCanada_thumb.png', 'teamCanada.png'),
(3, 'J/E Bearing ', 'Client based group project based on Laravel framework.  Phase objective: create a complete Online Industrial Training Application.  Backend responsibility handling Modules, Controllers and Blade Views.', 'jebearing.html', 'jebearing_thumb.jpg', 'jebearing.jpg'),
(4, 'Moog Sub37 - User Club', 'Full Stack capstone project; object was to create a Web Application using tools like Node.js, Express.js, MongoDB/Auth, Mocha/Chai testing, and SocketIO. ', 'https://frozen-island-73891.herokuapp.com/', 'moogClub_thumb.png', 'moogClub.png'),
(5, 'Blockchain101', 'Javascript infographic, using tools like Lottie \r\nAirBnb/Bodymovin, Adobe After Effects \r\nand Chart.js library.  Objective to create a UX/UI appealing interaction for data visualization.  ', 'https://cangelozzi.github.io/Angelozzi_Camillo_InformationGraphicApp/', 'blockchain101_thumb.png', 'blockchain101.png'),
(6, 'Blockchain Notary Service', 'Javascript based example of \r\ndecentralised Blockchain API. \r\nPracticing the main Blockchain \r\nstructure concepts, and how they \r\ncan be expressed in JS/Classes, Node.js/Express.js, and LevelDB.', 'https://github.com/cangelozzi/Blockchain_Developer_projects', 'blockchain_thumb.png', 'blockchain.png'),
(7, 'Aqua - Branding', 'Branding project, for creating an\r\ninfuser bottle, and highlight the \r\nnew brand aspects.  Tools used: \r\nAdobe XD, Illustrator and Photoshop.    ', 'data/aqua_style_guide.pdf', 'aqua_thumb.png', 'aqua.png'),
(8, 'Portfolio Reel', 'Highlight on projects related to 3D modelling and video/image manipulation, using tools like Cinema4D, Adobe Illustrator and Adobe After Effects.', 'https://www.youtube.com/watch?v=yMAi_JYL6JM', 'reel_thumb.png', 'reel.jpg'),
(9, 'Codecraft', 'Coding platform specific for kids. Opportunity to mix fun and learning.App based on Node and Express, and Handlebars as template / view engine. Heroku service used to deploy the app. The idea is going to be expanded into Phase two.', 'https://angelozzi-c-herokuproductpromo.herokuapp.com/', 'codecraft_thumb.png', 'codecraft.png'),
(10, 'HEX-to-TEXT', 'Small widget to translate hexadecimal colours values into text. Javascript functions convert values from hexadecimal to binary, and then to ASCII. Foundation and Vue.js were also implemented.  ', 'https://cangelozzi.github.io/hex-to-text/', 'hexToText_thumb.png', 'hexToText.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_proj_cat`
--

CREATE TABLE `tbl_proj_cat` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `project_id` tinyint(4) NOT NULL,
  `category_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_proj_cat`
--

INSERT INTO `tbl_proj_cat` (`id`, `project_id`, `category_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 2),
(7, 7, 2),
(8, 8, 2),
(9, 9, 2),
(10, 10, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_projects`
--
ALTER TABLE `tbl_projects`
  ADD PRIMARY KEY (`project_id`);

--
-- Indexes for table `tbl_proj_cat`
--
ALTER TABLE `tbl_proj_cat`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  MODIFY `category_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_projects`
--
ALTER TABLE `tbl_projects`
  MODIFY `project_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_proj_cat`
--
ALTER TABLE `tbl_proj_cat`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
