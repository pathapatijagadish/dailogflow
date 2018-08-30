-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 30, 2018 at 04:13 PM
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
  `answer` varchar(100) NOT NULL,
  `action_name` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `context_questions`
--

INSERT INTO `context_questions` (`id`, `question_id`, `question`, `answer`, `action_name`, `is_active`) VALUES
(1, 4, 'CQ1', 'CA1', NULL, NULL),
(2, 4, 'CQ2', 'CA2', NULL, NULL),
(3, 4, 'CQ3', 'CA3', NULL, NULL),
(4, 17, 'tgutyuy', 'utututyu', NULL, NULL),
(5, 17, 'hjkjhkhkjh', 'tutyutuytu', NULL, NULL),
(6, 17, 'tgutyuy', 'utututyu', NULL, NULL),
(7, 17, 'hjkjhkhkjh', 'tutyutuytu', NULL, NULL),
(8, 21, 'sdaffsd', 'ghkkk', NULL, NULL),
(9, 21, 'trytryry', 'rytrytrytry', NULL, NULL),
(10, 21, 'rytrytrytry', 'rytrytrytrytrytry', NULL, NULL),
(11, 22, 'ergertetert', 'utututyu', NULL, NULL),
(12, 22, 'tetertert', 'yrtytrytrytrytryr', NULL, NULL),
(13, 43, '', '', NULL, NULL),
(14, 44, '', '', NULL, NULL),
(15, 46, '', '', NULL, NULL),
(16, 49, 'has_one ', 'for single relation', NULL, NULL),
(17, 49, 'many-many', 'has_many', NULL, NULL),
(18, 51, '', '', NULL, NULL),
(19, 55, 'i want to learn sql', 'here the document', NULL, 0),
(20, 64, 'i want to learn sqlsd', 'here the sdocument', '', 0),
(21, 64, 'i need blog template', 'ok i will send', 'send mail', 0),
(22, 72, 'where ru working ', 'i am working with genpact', '', 1),
(23, 72, 'please send your details', 'ok i will send', 'send mail', 1),
(24, 73, 'context_q1', 'context_a1', '', 1),
(25, 73, 'context_q2', 'context_a2', 'call', 1),
(26, 75, 'sdafadf', 'sdfadsfads', '', 1),
(27, 75, 'adfsadfa', 'adsfsadfa', '', 1);

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
(55, 'what is SQL', 'structured query languge', 'SQLintent', 'd1332660-044f-46fb-92e4-8e5b3c3a2164', NULL, 0),
(56, 'what is the design patterens', 'jquery is client side languate', NULL, NULL, NULL, 1),
(57, 'what is the design patterens', 'jquery is client side languate', NULL, NULL, NULL, 1),
(58, 'what is the design patterens', 'jquery is client side languate', NULL, NULL, NULL, 1),
(59, 'what is the design patterens', 'jquery is client side languate', NULL, NULL, NULL, 1),
(60, 'what is the design patterens', 'jquery is client side languate', NULL, NULL, NULL, 1),
(61, 'where is kashmir', 'kashmir is located in jammu', NULL, NULL, NULL, 1),
(62, 'where is kashmir', 'kashmir is located in jammu', NULL, NULL, NULL, 1),
(63, 'what is context test', 'context test checking', NULL, NULL, NULL, 1),
(64, 'what is context test', 'context test checking', 'ContextIntent', 'e2bef10d-f153-4850-9894-a82601b1c3bc', NULL, 0),
(65, 'what is your name', 'my name is gina', NULL, NULL, NULL, 1),
(66, 'what is your name', 'my name is gina', NULL, NULL, NULL, 1),
(67, 'what is your name', 'my name is gina', NULL, NULL, NULL, 1),
(68, 'what is your name', 'my name is gina', NULL, NULL, NULL, 1),
(69, 'what is your name', 'my name is gina', NULL, NULL, NULL, 1),
(70, 'what is your name', 'my name is gina', NULL, NULL, NULL, 1),
(71, 'what is your name', 'my name is gina', NULL, NULL, NULL, 1),
(72, 'what is your name', 'my name is gina', 'SelfDetailIntent', '6a3373f0-07f3-4901-b13d-c0fbd146897e', NULL, 0),
(73, 'who is the genpact founder', 'tiger', NULL, NULL, NULL, 1),
(74, 'founder ge', 'tyagarajan', 'GaneralKnowledge', '41512df2-b4f0-4fb3-866d-1a0060226bf2', 1, 1),
(75, 'tell me the shortest way to chennai', 'ljdfklmadf', NULL, NULL, NULL, 1);

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
(44, 55, 'database language'),
(45, 61, 'dsafadsfad'),
(46, 61, 'dsafadsfad'),
(47, 61, 'dsafadsfad'),
(48, 61, 'dsafadsfad'),
(49, 61, 'dsafadsfad'),
(50, 61, 'dsafadsfad'),
(51, 61, 'dsafadsfad'),
(52, 61, 'test1'),
(53, 61, 'test1'),
(54, 61, 'test1'),
(55, 61, 'test1'),
(56, 61, 'test11'),
(57, 61, 'test11'),
(58, 61, 'test12'),
(59, 61, 'test13'),
(60, 61, 'test14'),
(61, 61, 'test11'),
(62, 61, 'test12'),
(63, 61, 'test13'),
(64, 61, 'test14'),
(65, 61, 'test111'),
(66, 61, 'test111'),
(67, 61, 'test111'),
(68, 61, 'test122'),
(69, 61, 'test134'),
(70, 61, 'test145'),
(71, 63, 'context'),
(72, 63, 'test'),
(73, 63, 'context test'),
(74, 63, 'test context'),
(75, 72, 'tell me about yoursef'),
(76, 72, 'tell about yourself'),
(77, 72, 'yourself'),
(78, 72, 'about your self'),
(79, 73, 'genpact ceo'),
(80, 73, 'founder of genpact'),
(81, 73, 'genpact owner'),
(82, 73, 'genpact head'),
(83, 75, 'adfsadfsad'),
(84, 75, 'dsafsadfdsf'),
(85, 75, 'adfadfdf'),
(86, 75, 'dsfadfsad');

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
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `sub_questions`
--
ALTER TABLE `sub_questions`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
