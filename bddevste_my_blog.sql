-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2017 at 03:16 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bddevste_my_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(0, 'akmal110130@gmail.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `blog_admin`
--

CREATE TABLE `blog_admin` (
  `id` int(11) NOT NULL DEFAULT '1',
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog_admin`
--

INSERT INTO `blog_admin` (`id`, `username`, `password`) VALUES
(1, 'akmal', '123');

-- --------------------------------------------------------

--
-- Table structure for table `blog_category`
--

CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL,
  `cat_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog_category`
--

INSERT INTO `blog_category` (`id`, `cat_name`) VALUES
(1, 'Web Design'),
(2, 'Web Development'),
(3, 'WordPress'),
(4, 'Software Development'),
(5, 'PHP-MYSQLI'),
(6, 'LARAVEL'),
(8, 'Video Courses'),
(9, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` int(11) NOT NULL,
  `cmt_id` int(11) NOT NULL,
  `user` varchar(200) NOT NULL,
  `comment` text NOT NULL,
  `status` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reply` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog_comments`
--

INSERT INTO `blog_comments` (`id`, `cmt_id`, `user`, `comment`, `status`, `date`, `reply`) VALUES
(1, 0, 'Akmal Hossain', 'Nice tutorial.......bro', '1', '2017-08-02 02:12:18', 'Really nice'),
(2, 6, 'Akmal Hossain', 'another awesome tutorial', '1', '2017-08-02 02:12:18', 'really awesome...'),
(3, 6, 'Alal ', 'carry on...', '0', '2017-08-02 02:12:18', ''),
(6, 6, 'akmalhossain307@gmail.com', 'Amar sonamr bangla ami tomay valobashi....demmo text Amar sonamr bangla ami tomay valobashi....demmo textAmar sonamr bangla ami tomay valobashi....demmo textAmar sonamr bangla ami tomay valobashi....demmo textAmar sonamr bangla ami tomay valobashi....demmo textAmar sonamr bangla ami tomay valobashi....demmo textAmar sonamr bangla ami tomay valobashi....demmo textAmar sonamr bangla ami tomay valobashi....demmo textAmar sonamr bangla ami tomay valobashi....demmo text', '0', '2017-08-02 03:16:57', ''),
(7, 6, 'akmalhossain307@yahoo.com', 'I need an advanced project in laravel. can you manage it for me?', '1', '2017-08-02 09:44:39', ''),
(8, 3, 'Alamin Siddik', 'Waiting for nice tutorials....', '1', '2017-08-02 11:06:28', '');

-- --------------------------------------------------------

--
-- Table structure for table `blog_contact`
--

CREATE TABLE `blog_contact` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(150) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog_contact`
--

INSERT INTO `blog_contact` (`id`, `name`, `email`, `mobile`, `subject`, `message`, `date`) VALUES
(1, 'Akmal', 'akmal110130@gmail.com', '01738279545', 'This is simple test message', 'This is my first message. I want to meet you very soon....', '2017-07-31 15:05:53'),
(3, 'Alal', 'alal@yahoo.com', '01738279545', 'This is simple test message', 'sefthr ykyujyuj', '2017-07-31 15:05:53'),
(5, 'Shaon Ahmed', 'shaonahmed@gmail.com', '01723274169', 'This is my testing message', 'This is my testing message. I am sending this to the admin of this website...', '2017-07-31 15:33:53');

-- --------------------------------------------------------

--
-- Table structure for table `blog_footer`
--

CREATE TABLE `blog_footer` (
  `id` int(11) NOT NULL DEFAULT '1',
  `copyright` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog_footer`
--

INSERT INTO `blog_footer` (`id`, `copyright`) VALUES
(1, 'Copyright Â© 2016-2017<a href="http://bddevsteam4web.com" target="_blank"> BDDEVSTEAM4WEB</a>. All rights reserved.');

-- --------------------------------------------------------

--
-- Table structure for table `blog_logo`
--

CREATE TABLE `blog_logo` (
  `id` int(11) NOT NULL DEFAULT '1',
  `logo` text NOT NULL,
  `banner` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog_logo`
--

INSERT INTO `blog_logo` (`id`, `logo`, `banner`) VALUES
(1, 'clogo.jpg', 'ad.gif');

-- --------------------------------------------------------

--
-- Table structure for table `blog_post`
--

CREATE TABLE `blog_post` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` varchar(150) NOT NULL,
  `author` varchar(100) NOT NULL,
  `image` text NOT NULL,
  `content` text NOT NULL,
  `tags` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `comments` int(11) NOT NULL DEFAULT '0',
  `pp_count` int(11) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog_post`
--

INSERT INTO `blog_post` (`id`, `title`, `category`, `author`, `image`, `content`, `tags`, `status`, `comments`, `pp_count`, `date`) VALUES
(1, 'this is 1st post title', 'Web Development', 'akmal', '44beca84ec.jpg', 'this is content.....\r\n', 'html,html5', 1, 0, 18, '2017-07-29 16:05:53'),
(3, 'this is second post title', 'PHP', 'akmal', '48cb58ecce.jpg', 'this is another post content....\r\n', 'html,html5', 1, 1, 6, '2017-07-29 16:11:35'),
(4, 'this is post title', 'LARAVEL', 'Alal Sardar', '4a089e9098.jpg', 'cdncvnvkdfn df gjdjgjdfgjdfl gjd\r\n', 'html,html5', 1, 0, 11, '2017-07-29 17:22:14'),
(5, 'Lorem Ipsum', 'Web Design', 'Md. Akmal Hossain', '222c4571fb.jpg', 'What is Lorem Ipsum?\r\n\r\nLorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n&nbsp;\r\n\r\nWhy do we use it?\r\n\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n', 'html,html5', 1, 0, 3, '2017-07-30 15:44:16'),
(6, 'css3 nice tutorials', 'Web Development', 'Shaon Ahmed', '7bb3a7b568.jpg', 'Where does it come from?\r\n\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\r\n', 'css,css3', 1, 4, 83, '2017-07-30 15:45:21'),
(7, 'This is post title 90', 'Web Design', 'akmal', '', 'What is Lorem Ipsum?\r\n\r\nLorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\nLorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n', 'html,html5', 1, 0, 0, '2017-08-04 04:49:51'),
(8, 'This is post title 91', 'Web Development', 'Alal Sardar', '', 'Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n&nbsp;\r\n\r\nLorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n', 'html,html5', 1, 0, 10, '2017-08-04 04:50:23'),
(9, 'This is post title 92', 'Software Development', 'Shaon Ahmed', '8cfd8bb830.jpg', 'Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n&nbsp;\r\n\r\nLorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n', 'css,css3', 1, 0, 5, '2017-08-04 04:50:52'),
(10, 'This is post title 94', 'WordPress', 'Alal Sardar', '75e503e632.jpg', 'Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n&nbsp;\r\n\r\nLorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n', 'css,css3', 0, 0, 1, '2017-08-04 04:51:17'),
(11, 'This is post title 99', 'WordPress', 'Md. Akmal Hossain', '', 'Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n&nbsp;\r\n\r\nLorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n', 'css,css3', 1, 0, 4, '2017-08-04 04:51:50'),
(12, 'this is 1st post title', 'LARAVEL', 'Alal Sardar', '', 'Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n&nbsp;\r\n\r\nLorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n', 'html,html5', 0, 0, 0, '2017-08-04 04:52:43');

-- --------------------------------------------------------

--
-- Table structure for table `blog_subscriber`
--

CREATE TABLE `blog_subscriber` (
  `subs_id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog_subscriber`
--

INSERT INTO `blog_subscriber` (`subs_id`, `email`) VALUES
(1, 'akmal110130@gmail.com'),
(2, 'akmalhossain307@gmail.com'),
(3, 'akmal@yahoo.com'),
(4, 'akmal110130@gmail.com'),
(5, 'shaon.admin@yahoo.com');

-- --------------------------------------------------------

--
-- Table structure for table `blog_title`
--

CREATE TABLE `blog_title` (
  `id` int(11) NOT NULL DEFAULT '1',
  `title` varchar(200) NOT NULL,
  `icon` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog_title`
--

INSERT INTO `blog_title` (`id`, `title`, `icon`) VALUES
(1, 'Web and Software Development', 'bddevsicon');

-- --------------------------------------------------------

--
-- Table structure for table `blog_user`
--

CREATE TABLE `blog_user` (
  `userid` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `comments` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `date`, `name`, `email`, `mobile`, `subject`, `message`, `status`) VALUES
(1, '2017-06-05 10:04:06', 'Akmal', 'akmal110130@gmail.com', '01738279545', 'Test Message', 'This message is only for testing..........', 1),
(5, '2017-06-05 14:26:27', 'Akmal', 'akmal110130@gmail.com', '01738279545', 'This is simple test message', 'Akmal Hossain ', 0);

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `s_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`s_id`, `date`, `email`) VALUES
(1, '2017-06-05 10:23:06', 'akmalhossain307@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`cat_id`, `cat_name`) VALUES
(1, 'HTML5'),
(2, 'CSS'),
(3, 'JavaScript'),
(4, 'LARAVEL'),
(5, 'JS'),
(6, 'WORDPRESS');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_headeroptions`
--

CREATE TABLE `tbl_headeroptions` (
  `id` int(11) NOT NULL,
  `logo` text NOT NULL,
  `banner_ad` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_headeroptions`
--

INSERT INTO `tbl_headeroptions` (`id`, `logo`, `banner_ad`) VALUES
(1, 'clogo.jpg', 'ad.gif');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_posts`
--

CREATE TABLE `tbl_posts` (
  `post_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `category` varchar(150) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image` text NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_posts`
--

INSERT INTO `tbl_posts` (`post_id`, `title`, `category`, `date`, `image`, `content`) VALUES
(1, 'this is title updated1', 'CSS', '2017-05-29 07:02:14', 'a3.png', '<p>This is content.. updated</p>'),
(2, 'This is title 1', 'LARAVEL', '2017-05-29 08:58:51', 'IMG_20151018_081406.jpg', '<p>This is laravel tutorial content....This is laravel tutorial content....This is laravel tutorial content....This is laravel tutorial content....This is laravel tutorial content....This is laravel tutorial content....This is laravel tutorial content....This is laravel tutorial content....This is laravel tutorial content....This is laravel tutorial content....</p>'),
(3, 'This is title 2', 'HTML5', '2017-05-29 08:58:51', 'IMG_20150905_110534.jpg', '<p>This is html content..This is html content..This is html content..This is html content..This is html content..This is html content..This is html content..This is html content..This is html content..This is html content..This is html content..This is html content..</p>'),
(4, 'csddsfsd', 'CSS', '2017-06-01 07:38:36', 'file.jpg', '<p>cdsc</p>'),
(5, 'amar sonar Bangla ami tomay valobashi', 'JS', '2017-06-01 07:40:44', 'clogo.jpg', '<p>fccccccccccccccccccccccc</p>'),
(6, 'amar sonar Bangla ami tomay valobashi', 'WORDPRESS', '2017-06-01 08:01:39', 'File.png', 'bdbfg tfhggggggggggggggggggg'),
(7, 'sdfcse', 'CSS', '2017-06-01 09:20:16', 'stripe.png', 'bjsdcs uhseuf fgw u hdfuhdfu d fgdu fhdududu d  dfu susui h  sufhsihsduicsdg'),
(14, 'amar sonar Bangla ami tomay valobashi', 'HTML5', '2017-06-02 06:16:46', 'Pakshi.jpg', '<p>bfgbnfgnghnghmghm</p>'),
(15, 'amar sonar Bangla ami tomay valobashi', 'HTML5', '2017-06-02 06:33:54', 'Tea_Garden.jpg', '<p>xdasd</p>'),
(16, 'amar sonar Bangla ami tomay valobashi', 'HTML5', '2017-06-02 06:34:53', 'a1.jpg', '<p>amar sonar bangla ami tomay valobashi...</p>'),
(17, 'csddsfsd', 'JavaScript', '2017-06-02 06:42:26', 'clogo.jpg', '&lt;p&gt;HTML Tutorials will be posted here....&lt;/p&gt;'),
(18, 'amar sonar Bangla ami tomay valobashi', 'WORDPRESS', '2017-06-02 06:43:21', '', '&lt;p&gt;nnnnnnnnnnnnnnnnnnnn&lt;/p&gt;');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_category`
--
ALTER TABLE `blog_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_contact`
--
ALTER TABLE `blog_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_post`
--
ALTER TABLE `blog_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_subscriber`
--
ALTER TABLE `blog_subscriber`
  ADD PRIMARY KEY (`subs_id`);

--
-- Indexes for table `blog_user`
--
ALTER TABLE `blog_user`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `tbl_headeroptions`
--
ALTER TABLE `tbl_headeroptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_posts`
--
ALTER TABLE `tbl_posts`
  ADD PRIMARY KEY (`post_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog_category`
--
ALTER TABLE `blog_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `blog_contact`
--
ALTER TABLE `blog_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `blog_post`
--
ALTER TABLE `blog_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `blog_subscriber`
--
ALTER TABLE `blog_subscriber`
  MODIFY `subs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `blog_user`
--
ALTER TABLE `blog_user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_headeroptions`
--
ALTER TABLE `tbl_headeroptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_posts`
--
ALTER TABLE `tbl_posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
