CREATE DATABASE IF NOT EXISTS `dbnews` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dbnews`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_posts`
--

CREATE TABLE `tbl_posts` (
  `id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `detail` text NOT NULL,
  `publish_date` datetime NOT NULL,
  `author_name` varchar(200) NOT NULL,
  `link` varchar(200) NOT NULL,
  `flg` char(2) NOT NULL,
  `phone` int(20) NOT NULL,
  `image` blob,
  `comment` varchar(200) NOT NULL,
   `will_modified` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
Alter table tbl_posts add `flg` char(2) NOT NULL;
Alter table tbl_posts add `phone` char(60) NOT NULL;
Alter table tbl_posts add `image` blob;
Alter table tbl_posts add `comment` varchar(200) NOT NULL;
Alter table tbl_posts add  `will_modified` int(200) NOT NULL;

, `phone` int(20) NOT NULL,`image` blob,`comment` varchar(200) NOT NULL, `will_modified` int(200) NOT NULL ;


SELECT `id`, `title`, `detail`, `author_name`, `link`,
 `publish_date`, `flg`, `phone`, `image`, `comment`, `will_modified`

CREATE TABLE `users` (
  `username` int(11) NOT NULL,
  `fullname` varchar(500) NOT NULL,
  `password` text NOT NULL,
  `publish_date` datetime NOT NULL,
  `author_name` varchar(200) NOT NULL,
  `link` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_posts`
--

INSERT INTO `tbl_posts` (`id`, `title`, `detail`, `publish_date`, `author_name`, `link`) VALUES
(1, 'Raspberry Pi scores UK\'s top engineering award', 'The team behind the device was awarded the Royal Academy of Engineering\'s MacRobert Prize at a ceremony in London last night.\r\n\r\nThe tiny computer launched in 2012. Its designers hoped to introduce children to coding and had modest ambitions.\r\n\r\nThey beat two other finalists, cyber-security company Darktrace and radiotherapy pioneers Vision RT, to win the prize.\r\n\r\nPrevious winners of the innovation award, which has been run since 1969, include the creators of the CT (computerised tomography) scanner; the designers of the Severn Bridge; and the team at Microsoft in Cambridge that developed the Kinect motion sensor.\r\nExceeded expectations\r\n\r\nA tiny cheap computer that might encourage youngsters to learn programming was the idea of a small team of scientists and Cambridge University academics.\r\n\r\nThey hoped to sell a few thousand units, but sales have now passed 14 million, and the Pi is widely used in factories as well as in classrooms and homes.\r\n\r\nOne of the MacRobert award judges, Dr Frances Saunders, said a small engineering team had redefined home computing.', '2017-07-02 00:00:00', 'BBC News', 'http://www.bbc.com/news/technology-40444356'),
(2, 'Future Energy: China leads world in solar power production', 'Ten years ago, Geof Moser had just graduated with a master\'s degree in solar energy from Arizona State University - but he didn\'t feel much opportunity lay at his feet in his home country.\r\n\r\nSo he headed for China.\r\n\r\n\"The solar industry was fairly small and there weren\'t a lot of jobs,\" he remembers. \"Just a few for installation.\" But the Chinese government had big ambitions to expand solar and Moser saw his chance.\r\n\r\nHe spent some years accumulating knowledge about the Chinese solar industry, before co-founding Symtech Solar, which designs solar panel systems using Chinese parts.\r\nMarket access\r\n\r\nThe idea is to make it easy for organisations outside China to access components without the hassle of having to source and assemble lots of different parts. ', '2017-07-02 00:00:00', 'BBC News', 'http://www.bbc.com/news/business-40341833'),
(3, 'Securing Your Linux System Bit by Bit', 'As daunting as securing your Linux system might seem, one thing to remember is that every extra step makes a difference. It\'s almost always better to make a modest stride than let uncertainty keep you from starting. Fortunately, there are a few basic techniques that greatly benefit users at all levels, and knowing how to securely wipe your hard drive in Linux is one of them.', '2017-07-02 00:00:00', 'Tech World', 'http://www.technewsworld.com/story/Securing-Your-Linux-System-Bit-by-Bit-84607.html');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_posts`
--
ALTER TABLE `tbl_posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_posts`
--
ALTER TABLE `tbl_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;COMMIT;

CREATE TABLE nominee
   (
       nom_id VARCHAR(6),
       fname VARCHAR(30),
       mname VARCHAR(30),
       ltname VARCHAR(30),
       city VARCHAR(15),
       mobileno VARCHAR(10),
       occupation VARCHAR(10),
       dob DATE,
       parent_id int,
       gender  VARCHAR(10),
       id int,
       CONSTRAINT nominee_pk PRIMARY KEY(nom_id),
       CONSTRAINT account_main_fk FOREIGN KEY(parent_id) REFERENCES tbl_posts(id)
   );
ALTER TABLE `nominee`
  MODIFY `nom_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;COMMIT;

Alter table nominee add created_date  DATE;

INSERT INTO `nominee` (`nom_id`, `fname`, `mname`, `ltname`, `city`, 
`mobileno`,`occupation`,`dob`,`parent_id`,`gender` ) VALUES (2,'Peter','','Parker','Hyderabad','00000000','SE','1988-01-01',1,'Male');

CREATE TABLE digi_assets
   (
       digi_id VARCHAR(6),
       digi_name VARCHAR(30),
       digi_mod_date date,
       digi_type VARCHAR(30),
       digi_parent_id int,
       id int,
       CONSTRAINT digi_pk PRIMARY KEY(digi_id),
       CONSTRAINT digi_main_fk FOREIGN KEY(digi_parent_id) REFERENCES tbl_posts(id)
   );
INSERT INTO `digi_assets` (`digi_id`, `digi_name`, `digi_mod_date`, `digi_type`, `digi_parent_id`) VALUES (1,'Shares','2022-05-02','Demat Account','1');

ALTER TABLE `digi_assets`
  MODIFY `digi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;COMMIT;