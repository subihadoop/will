CREATE DATABASE IF NOT EXISTS `dbnews` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dbnews`;

 create TABLE `users` (
  `username` int(11) NOT NULL,
  `fullname` varchar(500) NOT NULL,
  `password` text NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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


--
-- Dumping data for table `tbl_posts`
--

INSERT INTO `tbl_posts` (`id`, `title`, `detail`, `publish_date`, `author_name`, `link`,flg,phone,image,comment,will_modified) VALUES
(1, 'Digital will of Mr Jhon', 'Exordium clause:,I state that I am the owner and have absolute right, title and interest on the following immovable properties. (i) {Specify the address of all the immovable properties owned by you.\r\n\r\nwith the details like Area of the property, Schedule of the property (Boundaries)} (ii){In.\r\n\r\n case you are the co-holder of the property with other family members, furnish the full details of other co-holders and their percentage of shares in the property}.\r\n\r\nI state that I have been maintaining the average cash balance in hand or at \r\n\r\nhome to the tune of Rs….for the purpose of emergency purposes.\r\n\r\nI state that I have Bank deposits, Insurance, PPF account, mutual funds, Jewellery, \r\n\r\nShares, and Dmat account  Name of the Depository  in my individual name,  the original records,receipt,PPF passbook,Jewels etc  are kept in the locker No. , (Bank & Branch). The details of above financial products are as under', '2017-07-02 00:00:00', 'Jhon', 'www.wellsfargo.com','Y','90000000','abc.png','Hi',1);

INSERT INTO `tbl_posts` (`id`, `title`, `detail`, `publish_date`, `author_name`, `link`) VALUES
(1, 'Digital will of Mr Jhon', 'Exordium clause:,I state that I am the owner and have absolute right, title and interest on the following immovable properties. (i) {Specify the address of all the immovable properties owned by you.\r\n\r\nwith the details like Area of the property, Schedule of the property (Boundaries)} (ii){In.\r\n\r\n case you are the co-holder of the property with other family members, furnish the full details of other co-holders and their percentage of shares in the property}.\r\n\r\nI state that I have been maintaining the average cash balance in hand or at \r\n\r\nhome to the tune of Rs….for the purpose of emergency purposes.\r\n\r\nI state that I have Bank deposits, Insurance, PPF account, mutual funds, Jewellery, \r\n\r\nShares, and Dmat account  Name of the Depository  in my individual name,  the original records,receipt,PPF passbook,Jewels etc  are kept in the locker No. , (Bank & Branch). The details of above financial products are as under', '2017-07-02 00:00:00', 'Jhon', 'www.wellsfargo.com');
(2, 'Digital will for Mr Rambo', 'Exordium clause:, Geof Moser had just graduated with a master\'s degree in solar energy from Arizona State University - but he didn\'t feel much opportunity lay at his feet in his home country.\r\n\r\nSo he headed for China.\r\n\r\n\"The solar industry was fairly small and there weren\'t a lot of jobs,\" he remembers. \"Just a few for installation.\" But the Chinese government had big ambitions to expand solar and Moser saw his chance.\r\n\r\nHe spent some years accumulating knowledge about the Chinese solar industry, before co-founding Symtech Solar, which designs solar panel systems using Chinese parts.\r\nMarket access\r\n\r\nThe idea is to make it easy for organisations outside China to access components without the hassle of having to source and assemble lots of different parts. ', '2017-07-02 00:00:00', 'Rambo', 'www.wellsfargo.com'),
(3, 'Digital will for Mr Arnold', 'Exordium clause :, one thing to remember is that every extra step makes a difference. It\'s almost always better to make a modest stride than let uncertainty keep you from starting. Fortunately, there are a few basic techniques that greatly benefit users at all levels, and knowing how to securely wipe your hard drive in Linux is one of them.', '2017-07-02 00:00:00', 'Arnold', 'www.wellsfargo.com');

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
       created_date date
   );
ALTER TABLE `nominee`
  MODIFY `nom_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;COMMIT;

INSERT INTO `nominee` (`nom_id`, `fname`, `mname`, `ltname`, `city`, 
`mobileno`,`occupation`,`dob`,`parent_id`,`gender` ) VALUES (1,'Peter','','Parker','Hyderabad','00000000','SE','1988-01-01',1,'Male');

CREATE TABLE digi_assets
   (
       digi_id int(6),
       digi_name VARCHAR(30),
       digi_mod_date date,
       digi_type VARCHAR(30),
       digi_parent_id int,
       id int,
       nom_id varchar(6),
       Value int,
       percentage_share int,
       CONSTRAINT digi_pk PRIMARY KEY(digi_id)       
       );
ALTER TABLE `digi_assets` MODIFY digi_id int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;
COMMIT;

