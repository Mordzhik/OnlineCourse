-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 18 2020 г., 18:37
-- Версия сервера: 10.1.37-MariaDB
-- Версия PHP: 5.6.39

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `onlinecourse`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', '2017-01-24 16:21:18', '21-05-2018 03:31:37 PM');

-- --------------------------------------------------------

--
-- Структура таблицы `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `courseCode` varchar(255) DEFAULT NULL,
  `courseName` varchar(255) DEFAULT NULL,
  `courseUnit` varchar(255) DEFAULT NULL,
  `noofSeats` int(11) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `course`
--

INSERT INTO `course` (`id`, `courseCode`, `courseName`, `courseUnit`, `noofSeats`, `creationDate`, `updationDate`) VALUES
(2, 'WP01', 'Wordpress', '1-6', 1, '2017-02-11 17:52:25', '12-02-2017 12:23:35 AM'),
(4, 'MYSQL23', 'MYSQL', '1-8', 20, '2017-02-11 18:47:25', '25-08-2018 11:20:22 AM');

-- --------------------------------------------------------

--
-- Структура таблицы `courseenrolls`
--

CREATE TABLE `courseenrolls` (
  `id` int(11) NOT NULL,
  `studentRegno` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `session` int(11) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `course` int(11) DEFAULT NULL,
  `enrollDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `courseenrolls`
--

INSERT INTO `courseenrolls` (`id`, `studentRegno`, `pincode`, `session`, `department`, `level`, `semester`, `course`, `enrollDate`) VALUES
(4, '10806121', '715948', 4, 7, 6, 5, 2, '2018-05-21 10:19:41'),
(5, '12345', '131863', 4, 7, 6, 6, 1, '2018-08-25 05:52:34'),
(6, '10806121', '715948', 2, 3, 6, 4, 4, '2020-03-02 18:28:21');

-- --------------------------------------------------------

--
-- Структура таблицы `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `department` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `department`
--

INSERT INTO `department` (`id`, `department`, `creationDate`) VALUES
(1, 'Account', '2017-02-09 18:52:00'),
(2, 'HR', '2017-02-09 18:52:04'),
(3, 'Admin', '2017-02-09 18:52:08'),
(5, 'Test', '2017-02-09 18:55:08'),
(7, 'IT', '2018-05-21 10:03:15');

-- --------------------------------------------------------

--
-- Структура таблицы `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `level` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `level`
--

INSERT INTO `level` (`id`, `level`, `creationDate`) VALUES
(5, 'Level 1', '2017-02-09 19:04:04'),
(6, 'level 2', '2017-02-09 19:04:12'),
(7, 'level 4', '2017-02-09 19:04:17');

-- --------------------------------------------------------

--
-- Структура таблицы `semester`
--

CREATE TABLE `semester` (
  `id` int(11) NOT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `semester`
--

INSERT INTO `semester` (`id`, `semester`, `creationDate`, `updationDate`) VALUES
(4, 'Second sem', '2017-02-09 18:47:59', ''),
(5, 'Third Sem', '2017-02-09 18:48:04', ''),
(6, 'Fourth Sem', '2018-05-21 10:02:56', '');

-- --------------------------------------------------------

--
-- Структура таблицы `session`
--

CREATE TABLE `session` (
  `id` int(11) NOT NULL,
  `session` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `session`
--

INSERT INTO `session` (`id`, `session`, `creationDate`) VALUES
(1, '2015', '2017-02-09 18:16:51'),
(2, '2016', '2017-02-09 18:27:41'),
(3, '2017', '2018-05-21 10:01:54'),
(4, '2018', '2018-05-21 10:01:58');

-- --------------------------------------------------------

--
-- Структура таблицы `students`
--

CREATE TABLE `students` (
  `StudentRegno` varchar(255) NOT NULL,
  `studentPhoto` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `studentName` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `session` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `cgpa` decimal(10,2) DEFAULT NULL,
  `creationdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `students`
--

INSERT INTO `students` (`StudentRegno`, `studentPhoto`, `password`, `studentName`, `pincode`, `session`, `department`, `semester`, `cgpa`, `creationdate`, `updationDate`) VALUES
('10806121', '', '202cb962ac59075b964b07152d234b70', 'Ð•Ð´Ð¸Ð³Ðµ ', '715948', '', '', '', '7.25', '2017-02-11 19:38:32', '02-03-2020 11:54:09 PM'),
('12345', NULL, 'f925916e2754e5e03f75dd58a5733251', 'John', '131863', '', '', '', '0.00', '2018-08-25 05:50:51', ''),
('125966', '', 'f925916e2754e5e03f75dd58a5733251', 'Test user', '385864', '', '', '', '0.00', '2017-02-11 19:48:03', ''),
('admin', NULL, 'f925916e2754e5e03f75dd58a5733251', 'TEST test', '713174', NULL, NULL, NULL, NULL, '2020-03-03 07:11:52', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `studentRegno` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `userlog`
--

INSERT INTO `userlog` (`id`, `studentRegno`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, '10806121', 0x3a3a3100000000000000000000000000, '2017-02-11 20:05:58', '', 1),
(2, '10806121', 0x3a3a3100000000000000000000000000, '2017-02-11 20:07:18', '', 1),
(3, '10806121', 0x3a3a3100000000000000000000000000, '2017-02-11 20:08:46', '', 1),
(4, '10806121', 0x3a3a3100000000000000000000000000, '2017-02-11 20:26:15', '', 1),
(5, '10806121', 0x3a3a3100000000000000000000000000, '2017-02-11 20:27:11', '', 1),
(6, '10806121', 0x3a3a3100000000000000000000000000, '2017-02-11 20:28:19', '', 1),
(7, '10806121', 0x3a3a3100000000000000000000000000, '2017-02-11 20:29:30', '', 1),
(8, '10806121', 0x3a3a3100000000000000000000000000, '2017-02-11 20:30:39', '12-02-2017 02:00:40 AM', 1),
(9, '10806121', 0x3a3a3100000000000000000000000000, '2017-02-11 20:32:12', '12-02-2017 02:21:40 AM', 1),
(10, '10806121', 0x3a3a3100000000000000000000000000, '2017-02-11 20:51:50', '12-02-2017 05:14:45 AM', 1),
(11, '10806121', 0x3a3a3100000000000000000000000000, '2017-02-12 05:41:24', '12-02-2017 11:49:58 AM', 1),
(12, '10806121', 0x3a3a3100000000000000000000000000, '2017-02-12 06:20:05', '', 1),
(13, '10806121', 0x3a3a3100000000000000000000000000, '2017-02-12 06:20:23', '12-02-2017 12:09:59 PM', 1),
(14, '10806121', 0x3a3a3100000000000000000000000000, '2018-05-21 09:49:06', '21-05-2018 03:30:53 PM', 1),
(15, '10806121', 0x3a3a3100000000000000000000000000, '2018-05-21 10:19:15', '', 1),
(16, '12345', 0x3a3a3100000000000000000000000000, '2018-08-25 05:51:42', '25-08-2018 11:23:02 AM', 1),
(17, '10806121', 0x3a3a3100000000000000000000000000, '2020-03-02 18:23:54', '02-03-2020 11:54:41 PM', 1),
(18, '10806121', 0x3a3a3100000000000000000000000000, '2020-03-02 18:27:16', NULL, 1),
(19, '10806121', 0x3a3a3100000000000000000000000000, '2020-03-02 20:20:00', '03-03-2020 01:50:25 AM', 1),
(20, '10806121', 0x3a3a3100000000000000000000000000, '2020-03-02 20:26:52', '03-03-2020 01:57:08 AM', 1),
(21, '10806121', 0x3a3a3100000000000000000000000000, '2020-03-02 20:33:11', '03-03-2020 02:06:30 AM', 1),
(22, '10806121', 0x3a3a3100000000000000000000000000, '2020-03-02 20:36:57', '03-03-2020 02:07:19 AM', 1),
(23, '10806121', 0x3a3a3100000000000000000000000000, '2020-03-02 20:38:14', '03-03-2020 02:14:30 AM', 1),
(24, '10806121', 0x3a3a3100000000000000000000000000, '2020-03-02 20:46:12', '03-03-2020 02:33:45 AM', 1),
(25, '10806121', 0x3a3a3100000000000000000000000000, '2020-03-02 21:11:20', NULL, 1),
(26, '10806121', 0x3a3a3100000000000000000000000000, '2020-03-02 21:12:08', '03-03-2020 02:43:22 AM', 1),
(27, '10806121', 0x3a3a3100000000000000000000000000, '2020-03-02 21:13:26', '03-03-2020 02:43:34 AM', 1),
(28, '10806121', 0x3a3a3100000000000000000000000000, '2020-03-02 21:17:21', NULL, 1),
(29, '10806121', 0x3a3a3100000000000000000000000000, '2020-03-02 21:19:25', '03-03-2020 02:51:03 AM', 1),
(30, '10806121', 0x3a3a3100000000000000000000000000, '2020-03-02 21:21:10', '03-03-2020 02:51:22 AM', 1),
(31, '10806121', 0x3a3a3100000000000000000000000000, '2020-03-02 21:21:59', NULL, 1),
(32, '10806121', 0x3a3a3100000000000000000000000000, '2020-03-03 07:11:04', '03-03-2020 12:41:10 PM', 1),
(33, '10806121', 0x3a3a3100000000000000000000000000, '2020-03-03 07:12:45', NULL, 1),
(34, '10806121', 0x3a3a3100000000000000000000000000, '2020-03-03 07:12:57', '03-03-2020 01:16:41 PM', 1),
(35, 'admin', 0x3a3a3100000000000000000000000000, '2020-04-02 17:47:15', '02-04-2020 11:18:00 PM', 1),
(36, '10806121', 0x3a3a3100000000000000000000000000, '2020-04-02 17:48:38', '02-04-2020 11:19:01 PM', 1),
(37, '10806121', 0x3a3a3100000000000000000000000000, '2020-04-03 11:56:38', '03-04-2020 05:26:53 PM', 1),
(38, '10806121', 0x3a3a3100000000000000000000000000, '2020-04-03 12:01:15', NULL, 1),
(39, '10806121', 0x3a3a3100000000000000000000000000, '2020-04-09 11:25:20', '09-04-2020 04:55:39 PM', 1),
(40, '10806121', 0x3a3a3100000000000000000000000000, '2020-04-09 14:49:20', '09-04-2020 09:49:21 PM', 1),
(41, 'admin', 0x3a3a3100000000000000000000000000, '2020-04-17 19:23:33', '18-04-2020 12:53:44 AM', 1),
(42, 'admin', 0x3a3a3100000000000000000000000000, '2020-04-17 19:25:01', '18-04-2020 01:22:29 AM', 1),
(43, '10806121', 0x3a3a3100000000000000000000000000, '2020-04-17 20:03:37', NULL, 1),
(44, '10806121', 0x3a3a3100000000000000000000000000, '2020-04-17 20:08:26', '18-04-2020 01:39:36 AM', 1),
(45, '10806121', 0x3a3a3100000000000000000000000000, '2020-04-17 20:15:15', NULL, 1),
(46, '10806121', 0x3a3a3100000000000000000000000000, '2020-04-18 12:03:33', NULL, 1),
(47, '10806121', 0x3a3a3100000000000000000000000000, '2020-04-18 16:31:52', NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `PostTitle` mediumtext CHARACTER SET latin1 NOT NULL,
  `PostUrl` mediumtext CHARACTER SET latin1 NOT NULL,
  `PostFile` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `video`
--

INSERT INTO `video` (`id`, `PostTitle`, `PostUrl`, `PostFile`) VALUES
(4, 'Ð˜Ð·ÑƒÑ‡Ð¸Ñ‚ÑŒ ÑÐ¾ÑÑ‚Ð°Ð² Ð½ÐµÑ„Ñ‚Ð¸, ÑÐ¿Ð¾ÑÐ¾Ð±Ñ‹ ÐµÐµ Ð¿ÐµÑ€ÐµÑ€Ð°Ð±Ð¾Ñ‚ÐºÐ¸. ÐžÐ·Ð½Ð°ÐºÐ¾Ð¼Ð¸Ñ‚ÑŒÑÑ Ñ ÑÐ¾ÑÑ‚Ð°Ð²Ð¾Ð¼ Ð½ÐµÑ„Ñ‚ÑÐ½Ñ‹Ñ… Ñ„Ñ€Ð°ÐºÑ†Ð¸Ð¹, Ð¿Ñ€Ð¸Ð¼ÐµÐ½ÐµÐ½Ð¸ÐµÐ¼ Ð½ÐµÑ„Ñ‚ÐµÐ¿Ñ€Ð¾Ð´ÑƒÐºÑ‚Ð¾Ð².', 'Ð˜Ð·ÑƒÑ‡Ð¸Ñ‚ÑŒ-ÑÐ¾ÑÑ‚Ð°Ð²-Ð½ÐµÑ„Ñ‚Ð¸,-ÑÐ¿Ð¾ÑÐ¾Ð±Ñ‹-ÐµÐµ-Ð¿ÐµÑ€ÐµÑ€Ð°Ð±Ð¾Ñ‚ÐºÐ¸.-ÐžÐ·Ð½Ð°ÐºÐ¾Ð¼Ð¸Ñ‚ÑŒÑÑ-Ñ-ÑÐ¾ÑÑ‚Ð°Ð²Ð¾Ð¼-Ð½ÐµÑ„Ñ‚ÑÐ½Ñ‹Ñ…-Ñ„Ñ€Ð°ÐºÑ†Ð¸Ð¹,-Ð¿Ñ€Ð¸Ð¼ÐµÐ½ÐµÐ½Ð¸ÐµÐ¼-Ð½ÐµÑ„Ñ‚ÐµÐ¿Ñ€Ð¾Ð´ÑƒÐºÑ‚Ð¾Ð².', '630aa9d603d6b356979376de1eae6ef8.mp4'),
(5, 'ÐŸÑ€Ð¾Ð´Ð¾Ð»Ð¶Ð¸Ñ‚ÑŒ Ñ„Ð¾Ñ€Ð¼Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸Ðµ ÑƒÐ¼ÐµÐ½Ð¸Ð¹ Ð°Ð½Ð°Ð»Ð¸Ð·Ð¸Ñ€Ð¾Ð²Ð°Ñ‚ÑŒ, ÑÐ¾Ð¿Ð¾ÑÑ‚Ð°Ð²Ð»ÑÑ‚ÑŒ Ð´Ð°Ð½Ð½Ñ‹Ðµ Ð¾Ð¿Ñ‹Ñ‚Ð° Ñ Ñ‚ÐµÐ¾Ñ€ÐµÑ‚Ð¸Ñ‡ÐµÑÐºÐ¸Ð¼Ð¸ Ð·Ð½Ð°Ð½Ð¸ÑÐ¼Ð¸. ÐŸÑ€Ð¾Ð´Ð¾Ð»Ð¶Ð¸Ñ‚ÑŒ Ñ„Ð¾Ñ€Ð¼Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸Ðµ Ð½Ð°Ð²Ñ‹ÐºÐ° Ñ€Ð°Ð±Ð¾Ñ‚Ñ‹ Ñ Ð¸ÑÑ‚Ð¾Ñ‡Ð½Ð¸ÐºÐ°Ð¼Ð¸ Ð¸Ð½Ñ„Ð¾Ñ€Ð¼Ð°Ñ†Ð¸Ð¸.', 'ÐŸÑ€Ð¾Ð´Ð¾Ð»Ð¶Ð¸Ñ‚ÑŒ-Ñ„Ð¾Ñ€Ð¼Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸Ðµ-ÑƒÐ¼ÐµÐ½Ð¸Ð¹-Ð°Ð½Ð°Ð»Ð¸Ð·Ð¸Ñ€Ð¾Ð²Ð°Ñ‚ÑŒ,-ÑÐ¾Ð¿Ð¾ÑÑ‚Ð°Ð²Ð»ÑÑ‚ÑŒ-Ð´Ð°Ð½Ð½Ñ‹Ðµ-Ð¾Ð¿Ñ‹Ñ‚Ð°-Ñ-Ñ‚ÐµÐ¾Ñ€ÐµÑ‚Ð¸Ñ‡ÐµÑÐºÐ¸Ð¼Ð¸-Ð·Ð½Ð°Ð½Ð¸ÑÐ¼Ð¸.-ÐŸÑ€Ð¾Ð´Ð¾Ð»Ð¶Ð¸Ñ‚ÑŒ-Ñ„Ð¾Ñ€Ð¼Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸Ðµ-Ð½Ð°Ð²Ñ‹ÐºÐ°-Ñ€Ð°Ð±Ð¾Ñ‚Ñ‹-Ñ-Ð¸ÑÑ‚Ð¾Ñ‡Ð½Ð¸ÐºÐ°Ð¼Ð¸-Ð¸Ð½Ñ„Ð¾Ñ€Ð¼Ð°Ñ†Ð¸Ð¸.', '630aa9d603d6b356979376de1eae6ef8.mp4');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `courseenrolls`
--
ALTER TABLE `courseenrolls`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`StudentRegno`);

--
-- Индексы таблицы `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `courseenrolls`
--
ALTER TABLE `courseenrolls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `semester`
--
ALTER TABLE `semester`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `session`
--
ALTER TABLE `session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT для таблицы `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
