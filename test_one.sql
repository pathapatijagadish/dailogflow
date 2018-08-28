-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2018 at 12:43 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_one`
--

-- --------------------------------------------------------

--
-- Table structure for table `context_questions`
--

CREATE TABLE `context_questions` (
  `id` int(6) UNSIGNED NOT NULL,
  `question_id` int(6) DEFAULT NULL,
  `question` varchar(100) NOT NULL,
  `answer` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `context_questions`
--

INSERT INTO `context_questions` (`id`, `question_id`, `question`, `answer`) VALUES
(1, 4, 'CQ1', 'CA1'),
(2, 4, 'CQ2', 'CA2'),
(3, 4, 'CQ3', 'CA3'),
(4, 17, 'tgutyuy', 'utututyu'),
(5, 17, 'hjkjhkhkjh', 'tutyutuytu'),
(6, 17, 'tgutyuy', 'utututyu'),
(7, 17, 'hjkjhkhkjh', 'tutyutuytu'),
(8, 21, 'sdaffsd', 'ghkkk'),
(9, 21, 'trytryry', 'rytrytrytry'),
(10, 21, 'rytrytrytry', 'rytrytrytrytrytry'),
(11, 22, 'ergertetert', 'utututyu'),
(12, 22, 'tetertert', 'yrtytrytrytrytryr'),
(13, 43, '', ''),
(14, 44, '', ''),
(15, 46, '', ''),
(16, 49, 'has_one ', 'for single relation'),
(17, 49, 'many-many', 'has_many'),
(18, 51, '', ''),
(19, 55, 'i want to learn sql', 'here the document');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `question` varchar(100) NOT NULL,
  `answer` varchar(100) NOT NULL,
  `intent` varchar(30) DEFAULT NULL,
  `intent_id` varchar(40) DEFAULT NULL,
  `predefined_intent` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `answer`, `intent`, `intent_id`, `predefined_intent`, `is_active`) VALUES
(1, 'who is the founder of google', 'it is in delhi', NULL, NULL, NULL, NULL),
(2, 'who is the founder of google', 'it is in delhi', NULL, NULL, NULL, NULL),
(3, 'who is the founder of genpact', 'it is in delhi', NULL, NULL, NULL, NULL),
(4, 'who is the founder of google', 'ramesh', NULL, NULL, NULL, NULL),
(5, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(6, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(7, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(8, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(9, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(10, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(11, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(12, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(13, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(14, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(15, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(16, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(17, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(18, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(19, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(20, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(21, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(22, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(23, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(24, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(25, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(26, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(27, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(28, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(29, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(30, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(31, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(32, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(33, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(34, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(35, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(36, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(37, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(38, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(39, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(40, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(41, 'who is the founder of microsoft', 'satya', NULL, NULL, NULL, NULL),
(42, 'who is the founder of microsoft', 'satya', 'MSintent', '4b0878e2-30bb-4bb9-94df-ca532371da1b', NULL, 0),
(43, 'what is full form of html', 'Hyper Text Markup Language', 'HTMLIntent', 'a95c5e34-3773-4b66-bdb7-56037d48377e', NULL, 0),
(44, 'What is java script', 'Java script is an object-oriented computer programming language commonly used to create interactive ', 'Scripting Language', '2cddeb19-2b36-4cff-9e71-7b1a166341ea', NULL, NULL),
(45, 'who is Indian PM', 'Modi', NULL, NULL, NULL, NULL),
(46, 'what is nodejs', 'node js is backend framework', 'NodeFramework', 'fc627b05-73a9-49b9-87ae-8a984f6d2a36', NULL, NULL),
(47, 'qweqwe', 'ewww', NULL, NULL, NULL, NULL),
(48, 'what is rest', 'REST meand representatl state transfer', 'REST_Intent', '2d5152ba-a940-4f17-b3f3-2cfa8b8dca91', NULL, NULL),
(49, 'what is associations', 'association means relations b&#x2F;w models', 'RailsIntent', 'bc7c5baa-0501-4ba2-9e87-1193bca06213', NULL, NULL),
(50, 'what is ruby', 'ruby is oops language', 'favorite color', NULL, 1, 1),
(51, 'what is mongodb', 'mongodb is a document database', 'Database', '38cfc25e-6e7e-47dc-84e3-0b980aeb391b', NULL, NULL),
(52, 'is rails is mvc', 'yes rails is mvc architecture', 'RailsIntent', NULL, 1, 1),
(53, 'who is matz', 'matz is ruby founder', 'GaneralKnowledge', '38cfc25e-6e7e-47dc-84e3-0b980aeb391b', 1, 0),
(54, 'ORM', 'object relational maping', 'RailsIntent', 'bc7c5baa-0501-4ba2-9e87-1193bca06213', 1, 0),
(55, 'what is SQL', 'structured query languge', 'SQLintent', 'd1332660-044f-46fb-92e4-8e5b3c3a2164', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sub_questions`
--

CREATE TABLE `sub_questions` (
  `id` int(6) UNSIGNED NOT NULL,
  `question_id` int(6) DEFAULT NULL,
  `question` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_questions`
--

INSERT INTO `sub_questions` (`id`, `question_id`, `question`) VALUES
(1, 4, 'google founder'),
(2, 4, 'google invented'),
(3, 4, 'founder '),
(4, 4, 'invented'),
(5, 17, ''),
(6, 17, ''),
(7, 17, ''),
(8, 17, ''),
(9, 17, ''),
(10, 17, ''),
(11, 17, ''),
(12, 17, ''),
(13, 21, ''),
(14, 21, ''),
(15, 21, ''),
(16, 21, ''),
(17, 22, ''),
(18, 22, ''),
(19, 22, ''),
(20, 22, ''),
(21, 43, 'what is html'),
(22, 43, 'what is the use of html'),
(23, 43, 'static web sites develop with which languge'),
(24, 43, 'what is browser rendered language '),
(25, 44, 'What is the use of Java script'),
(26, 44, 'what is js'),
(27, 44, 'what is advantage of js'),
(28, 44, 'js'),
(29, 46, 'what is node'),
(30, 46, 'which backend technology you used?'),
(31, 46, 'nodejs'),
(32, 46, 'wt node'),
(33, 49, 'what association'),
(34, 49, 'relations in rails '),
(35, 49, 'how many wasy tot mention relations'),
(36, 49, 'relations'),
(37, 51, 'what is document database'),
(38, 51, 'mongodb'),
(39, 51, 'nosql'),
(40, 51, 'which database is most speed'),
(41, 55, 'query language'),
(42, 55, 'query'),
(43, 55, 'sql language'),
(44, 55, 'database language');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `age` int(3) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(15) NOT NULL,
  `user_role` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `age`, `email`, `password`, `user_role`) VALUES
(1, 'jagadish', 29, 'p.jagadish777@gmail.com', 'jagadish', 'SME'),
(2, 'raju', 0, 'raju@gmail.com', 'raju', 'Change Manager');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `context_questions`
--
ALTER TABLE `context_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_questions`
--
ALTER TABLE `sub_questions`
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
-- AUTO_INCREMENT for table `context_questions`
--
ALTER TABLE `context_questions`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `sub_questions`
--
ALTER TABLE `sub_questions`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
