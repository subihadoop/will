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



LOAD DATA LOCAL INFILE "/home/datalakelab/Downloads/Stocks(3).csv" INTO TABLE dbnews.stocks_stage
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
set file_date = '2022-01-05';
set date_made = current_timestamp();

 UPDATE stocks s INNER JOIN stocks p
   ON s.Stock_Name=p.Stock_Name
   and 
   SET s.Live_Price=MAX(p.Live_Price) GROUP BY p.SERVICE_ID

CREATE TABLE `stocks_stage` (
  `Stock_Name` varchar(40) DEFAULT NULL,
  `Live_Price` double DEFAULT NULL,
  `Change_1` double DEFAULT NULL,
  `Days_Gain` double DEFAULT NULL,
  `Change_2` double DEFAULT NULL,
  `Quantity` double DEFAULT NULL,
  `Per_Unit_Cost` double DEFAULT NULL,
  `Investment_Cost` double DEFAULT NULL,
  `Weight_1` double DEFAULT NULL,
  `Latest_Value` double DEFAULT NULL,
  `Weight_2` double DEFAULT NULL,
  `Unrealized_Gain` double DEFAULT NULL,
  `Change_3` double DEFAULT NULL,
  `Realized_Profit_Loss` double DEFAULT NULL,
  `status` double DEFAULT NULL,
  `date_made` date DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `file_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


CREATE TABLE `stocks_main` (
  `Stock_Name` varchar(40) DEFAULT NULL,
  `Live_Price` double DEFAULT NULL,
  `Change_1` double DEFAULT NULL,
  `Days_Gain` double DEFAULT NULL,
  `Change_2` double DEFAULT NULL,
  `Quantity` double DEFAULT NULL,
  `Per_Unit_Cost` double DEFAULT NULL,
  `Investment_Cost` double DEFAULT NULL,
  `Weight_1` double DEFAULT NULL,
  `Latest_Value` double DEFAULT NULL,
  `Weight_2` double DEFAULT NULL,
  `Unrealized_Gain` double DEFAULT NULL,
  `Change_3` double DEFAULT NULL,
  `Realized_Profit_Loss` double DEFAULT NULL,
  `status` double DEFAULT NULL,
  `date_made` date DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `file_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


UPDATE 
  stocks_main m 
JOIN
  stocks_stage s ON m.Stock_Name=s.Stock_Name and  s.file_date > m.file_date
SET 
  m.Stock_Name = s.Stock_Name,
  m.Live_Price = s.Live_Price,
  m.Change_1 = s.Change_1,
  m.Days_Gain = s.Days_Gain,
  m.Change_2 = s.Change_2,
  m.Quantity = s.Quantity,
  m.Per_Unit_Cost = s.Per_Unit_Cost,
  m.Investment_Cost = s.Investment_Cost,
  m.Weight_1 = s.Weight_1,
  m.Latest_Value = s.Latest_Value,
  m.Weight_2 = s.Weight_2,
  m.Unrealized_Gain = s.Unrealized_Gain,
  m.Change_3 = s.Change_3,
  m.Realized_Profit_Loss = s.Realized_Profit_Loss,
  m.status = s.status,
  m.date_made = s.date_made,
  m.account = s.account,
  m.file_date = s.file_date;

