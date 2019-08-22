-- MySQL dump 10.13  Distrib 5.6.43, for Win64 (x86_64)
--
-- Host: cs336projectdb.ch1cjkbtzwo1.us-east-2.rds.amazonaws.com    Database: VehicleAuctionSite
-- ------------------------------------------------------
-- Server version	5.6.40-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Account` (
  `Username` varchar(45) NOT NULL DEFAULT '',
  `Password` varchar(40) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Email` varchar(50) NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES ('-deletedAccount-','sfdjhhfalfahaf','DONT DELETE','DONT DELETE'),('ADMIN','ADMIN','SITE_ADMIN','ADMIN@ADMIN.ADMIN'),('ALERT','asddfddas','ALERT','ALERT@ALERT.ALERT'),('Autobid_Alert','sdajdjdcddd','Autobid_Alert','aut0@auto.auto'),('b','b','b','b'),('Buy3r','buy','Buyer','buyer'),('donkey33','shrek','donkey','layers321@gmail.com'),('joe','joe','Joe Shmo','Joe@aol.com'),('jsmith','apples','John Smith','jsmith@gmail.com'),('Malky','rawr','Malcolm','rawr'),('Mike','Mike','Mike','Mike'),('REP','REP','REP','REP'),('REP3','3','rep3','rep3asbdsajbd@gmail.moc'),('repNumberTwo','cs336','Rep Jr.','asdf@qwerty.com'),('RobDoran1','rob123','Rob Doran','robbyd@gmail.com'),('shrek22','donkey','shrek','shrekislove@gmail.com');
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Admin_Account`
--

DROP TABLE IF EXISTS `Admin_Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Admin_Account` (
  `Admin_id` int(11) DEFAULT NULL,
  `Username` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`Username`),
  CONSTRAINT `Admin_Account_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `Account` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin_Account`
--

LOCK TABLES `Admin_Account` WRITE;
/*!40000 ALTER TABLE `Admin_Account` DISABLE KEYS */;
INSERT INTO `Admin_Account` VALUES (1,'-deletedAccount-'),(0,'ADMIN'),(2,'ALERT'),(3,'Autobid_Alert');
/*!40000 ALTER TABLE `Admin_Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Auction`
--

DROP TABLE IF EXISTS `Auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Auction` (
  `Post_ID` int(11) NOT NULL DEFAULT '0',
  `Item_ID` int(11) DEFAULT NULL,
  `Starting_price` double DEFAULT NULL,
  `Seller_username` varchar(45) DEFAULT NULL,
  `Min_bid_interval` double DEFAULT NULL,
  `Auction_end_date` datetime DEFAULT NULL,
  `Reserve` double DEFAULT NULL,
  `Current_Bid` double DEFAULT NULL,
  `End_Bid` double DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  PRIMARY KEY (`Post_ID`),
  KEY `Item_ID` (`Item_ID`),
  KEY `Seller_username` (`Seller_username`),
  CONSTRAINT `Auction_ibfk_1` FOREIGN KEY (`Item_ID`) REFERENCES `Item` (`Item_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Auction_ibfk_2` FOREIGN KEY (`Seller_username`) REFERENCES `Account` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auction`
--

LOCK TABLES `Auction` WRITE;
/*!40000 ALTER TABLE `Auction` DISABLE KEYS */;
INSERT INTO `Auction` VALUES (1,1,5000,'RobDoran1',5,'2020-12-12 12:45:00',6000,4000,-1,'2019-04-22 19:08:48'),(2,2,30000,'RobDoran1',100,'2019-04-25 12:00:00',35000,50000,-1,'2019-04-22 19:10:44'),(3,3,1500,'RobDoran1',10,'2019-04-22 19:15:00',0,0,-1,'2019-04-22 19:12:26'),(5,5,10000,'RobDoran1',100,'2020-12-12 12:00:00',15000,52000,-1,'2019-04-22 19:16:06'),(6,6,5000,'RobDoran1',50,'2019-04-22 19:20:00',100000,0,-1,'2019-04-22 19:19:27'),(7,7,0,'-deletedAccount-',25,'2019-04-22 19:30:00',3700,0,-1,'2019-04-22 19:23:12'),(8,8,22000,'-deletedAccount-',250,'2019-04-22 19:50:00',22000,22500,22500,'2019-04-22 19:46:14'),(10,10,40000,'shrek22',100,'2019-04-22 19:55:00',45000,0,-1,'2019-04-22 19:52:52'),(11,11,500,'shrek22',5,'2030-05-15 12:45:00',1000,400,-1,'2019-04-22 19:54:05'),(12,12,100000,'shrek22',1000,'2020-04-20 04:45:00',150000,0,-1,'2019-04-22 19:56:54'),(13,18,25000,'Mike',500,'2019-04-23 10:50:00',28000,33000,33000,'2019-04-23 10:41:28'),(14,19,28000,'Mike',10,'2019-04-23 11:25:00',30000,29000,-1,'2019-04-23 11:12:42'),(15,20,24000,'Mike',0,'2019-04-23 17:40:00',0,30000,30000,'2019-04-23 17:31:51'),(16,21,15000,'Mike',0,'2050-04-25 13:00:00',0,25000,-1,'2019-04-23 17:44:23'),(17,22,28000,'joe',0,'2023-06-19 00:00:00',0,30000,-1,'2019-04-23 17:48:54');
/*!40000 ALTER TABLE `Auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Auto_Bid`
--

DROP TABLE IF EXISTS `Auto_Bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Auto_Bid` (
  `Post_ID` int(11) NOT NULL DEFAULT '0',
  `Time` datetime DEFAULT NULL,
  `Amount` double NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Max_bid` double DEFAULT NULL,
  `Starting_bid` double DEFAULT NULL,
  PRIMARY KEY (`Username`,`Post_ID`,`Amount`),
  KEY `Post_ID` (`Post_ID`),
  CONSTRAINT `Auto_Bid_ibfk_1` FOREIGN KEY (`Post_ID`) REFERENCES `Auction` (`Post_ID`) ON DELETE CASCADE,
  CONSTRAINT `Auto_Bid_ibfk_2` FOREIGN KEY (`Username`) REFERENCES `Account` (`Username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auto_Bid`
--

LOCK TABLES `Auto_Bid` WRITE;
/*!40000 ALTER TABLE `Auto_Bid` DISABLE KEYS */;
INSERT INTO `Auto_Bid` VALUES (14,'2019-04-23 11:17:44',250,'ADMIN',35000,28200),(14,'2019-04-23 11:21:43',500,'b',34000,29000),(13,'2019-04-23 10:45:01',250,'buy3r',32000,26000),(2,'2019-04-23 17:29:44',100,'donkey33',50000,45000),(11,'2019-04-23 17:28:16',100,'donkey33',600,400),(15,'2019-04-23 17:39:34',1000,'donkey33',26000,24500),(16,'2019-04-23 17:45:15',100,'donkey33',20000,15000),(1,'2019-04-23 17:19:31',100,'shrek22',10000,4000),(5,'2019-04-22 19:47:01',100,'shrek22',55000,15000);
/*!40000 ALTER TABLE `Auto_Bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bid`
--

DROP TABLE IF EXISTS `Bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bid` (
  `Post_ID` int(11) NOT NULL DEFAULT '0',
  `Time` datetime DEFAULT NULL,
  `Amount` double NOT NULL,
  `Username` varchar(45) NOT NULL,
  PRIMARY KEY (`Username`,`Post_ID`,`Amount`),
  KEY `Post_ID` (`Post_ID`),
  CONSTRAINT `Bid_ibfk_1` FOREIGN KEY (`Post_ID`) REFERENCES `Auction` (`Post_ID`),
  CONSTRAINT `Bid_ibfk_2` FOREIGN KEY (`Username`) REFERENCES `Account` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bid`
--

LOCK TABLES `Bid` WRITE;
/*!40000 ALTER TABLE `Bid` DISABLE KEYS */;
INSERT INTO `Bid` VALUES (14,'2019-04-23 11:16:57',28200,'ADMIN'),(14,'2019-04-23 11:21:43',29000,'b'),(2,'2019-04-22 19:49:16',45000,'buy3r'),(5,'2019-04-22 19:50:40',32000,'buy3r'),(8,'2019-04-22 19:48:08',22500,'buy3r'),(13,'2019-04-23 10:45:01',26000,'buy3r'),(13,'2019-04-23 10:48:06',28250,'buy3r'),(2,'2019-04-23 17:29:44',45000,'donkey33'),(2,'2019-04-23 17:29:24',45100,'donkey33'),(2,'2019-04-23 17:30:29',45200,'donkey33'),(2,'2019-04-23 17:30:29',45300,'donkey33'),(2,'2019-04-23 17:30:47',50000,'donkey33'),(5,'2019-04-22 19:48:52',16000,'donkey33'),(5,'2019-04-22 19:49:03',30000,'donkey33'),(11,'2019-04-23 17:28:16',400,'donkey33'),(11,'2019-04-23 17:28:02',505,'donkey33'),(15,'2019-04-23 17:39:34',24500,'donkey33'),(15,'2019-04-23 17:39:06',25000,'donkey33'),(15,'2019-04-23 17:40:45',30000,'donkey33'),(16,'2019-04-23 17:45:15',15000,'donkey33'),(16,'2019-04-23 17:44:53',20000,'donkey33'),(16,'2019-04-23 17:46:43',25000,'donkey33'),(17,'2019-04-23 17:49:36',30000,'donkey33'),(5,'2019-04-22 23:54:02',33000,'Malky'),(5,'2019-04-22 23:55:35',34000,'Malky'),(5,'2019-04-22 23:57:22',35000,'Malky'),(5,'2019-04-23 00:09:13',36000,'Malky'),(5,'2019-04-23 00:13:33',36200,'Malky'),(5,'2019-04-23 00:14:44',36350,'Malky'),(5,'2019-04-23 00:24:13',36500,'Malky'),(5,'2019-04-23 00:25:10',36700,'Malky'),(5,'2019-04-23 01:02:17',37000,'Malky'),(5,'2019-04-23 01:02:45',41000,'Malky'),(5,'2019-04-23 01:22:44',42000,'Malky'),(5,'2019-04-23 01:23:32',43000,'Malky'),(5,'2019-04-23 01:29:37',43300,'Malky'),(5,'2019-04-23 01:30:24',46000,'Malky'),(5,'2019-04-23 04:35:15',51000,'Malky'),(5,'2019-04-23 04:39:16',52000,'Malky'),(13,'2019-04-23 10:48:06',28000,'REP'),(13,'2019-04-23 10:48:38',33000,'REP'),(1,'2019-04-23 17:19:31',4000,'shrek22'),(1,'2019-04-23 17:19:05',5005,'shrek22'),(5,'2019-04-22 19:47:01',15000,'shrek22'),(5,'2019-04-22 19:48:52',16100,'shrek22'),(5,'2019-04-22 20:04:08',31000,'shrek22'),(5,'2019-04-23 01:02:17',37100,'shrek22'),(5,'2019-04-23 01:22:44',42100,'shrek22'),(5,'2019-04-23 01:23:32',43100,'shrek22'),(5,'2019-04-23 01:29:37',43400,'shrek22');
/*!40000 ALTER TABLE `Bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer_Rep_Account`
--

DROP TABLE IF EXISTS `Customer_Rep_Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer_Rep_Account` (
  `Rep_id` int(11) DEFAULT NULL,
  `Username` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`Username`),
  CONSTRAINT `Customer_Rep_Account_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `Account` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_Rep_Account`
--

LOCK TABLES `Customer_Rep_Account` WRITE;
/*!40000 ALTER TABLE `Customer_Rep_Account` DISABLE KEYS */;
INSERT INTO `Customer_Rep_Account` VALUES (4,'REP'),(3,'REP3'),(2,'repNumberTwo');
/*!40000 ALTER TABLE `Customer_Rep_Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `End_User_Account`
--

DROP TABLE IF EXISTS `End_User_Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `End_User_Account` (
  `Address` varchar(75) DEFAULT NULL,
  `CardNo` int(11) DEFAULT NULL,
  `Username` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`Username`),
  CONSTRAINT `End_User_Account_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `Account` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `End_User_Account`
--

LOCK TABLES `End_User_Account` WRITE;
/*!40000 ALTER TABLE `End_User_Account` DISABLE KEYS */;
INSERT INTO `End_User_Account` VALUES (NULL,NULL,'b'),(NULL,NULL,'Buy3r'),(NULL,NULL,'donkey33'),(NULL,NULL,'joe'),(NULL,NULL,'jsmith'),(NULL,NULL,'Malky'),(NULL,NULL,'Mike'),(NULL,NULL,'RobDoran1'),(NULL,NULL,'shrek22');
/*!40000 ALTER TABLE `End_User_Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Item`
--

DROP TABLE IF EXISTS `Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Item` (
  `Item_ID` int(11) NOT NULL DEFAULT '0',
  `Class` varchar(50) DEFAULT NULL,
  `Subclass` varchar(30) DEFAULT NULL,
  `Color` varchar(20) DEFAULT NULL,
  `VIN` varchar(100) NOT NULL,
  `Make` varchar(30) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Year` int(11) NOT NULL,
  `Tranny` varchar(30) DEFAULT NULL,
  `Drive` varchar(20) DEFAULT NULL,
  `Mileage` int(11) NOT NULL,
  `Cond` varchar(50) DEFAULT NULL,
  `Location` varchar(50) NOT NULL,
  `Title_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Item_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Item`
--

LOCK TABLES `Item` WRITE;
/*!40000 ALTER TABLE `Item` DISABLE KEYS */;
INSERT INTO `Item` VALUES (1,'Car','Coupe','Brown','1234567890','Chevy','Camaro',1978,'Manual','RWD',20000,'Excellent','NJ','Clean'),(2,'Truck','Crew-cab','Blue','0987654321','Ford','Raptor',2013,'Auto','4x4',1000,'New','NJ','Clean'),(3,'Van','Mini-van','Green','9876','Ford','Windstar',1997,'CVT','FWD',5000,'Fair','NY','Rebuilt'),(5,'Car','Sedan','Red','555555555','Honda','Civic Type R',2018,'DCT','FWD',0,'New','NJ','Clean'),(6,'SUV','Small','White','112233','Honda','CRV',2008,'Auto','AWD',4000,'Good','NJ','Rebuilt'),(7,'Van','Utility van','Green','1234','Ford','E-150',1974,'Manual','RWD',2500,'Good','PA','Salvage'),(8,'SUV','Small','White','18954','Honda','HRV',2017,'CVT','AWD',10,'New','NJ','Clean'),(10,'SUV','Mid-size','Burgundy','8736','Cadillac','CTS',2004,'Auto','AWD',40000,'New','NJ','Clean'),(11,'Van','Passenger van','Turquoise','9090909','Volkswagen','Bus',1980,'Auto','FWD',150000,'Salvage','NJ','Parts only'),(12,'Car','Sedan','Orange','8786786','BMW','850i',2013,'DCT','RWD',200,'Excellent','NJ','Clean'),(13,'Car','Sedan',' ','1171','Chevy','Camero',1998,' ',' ',100,' ','New Jersey',' '),(14,'Car','Sedan',' ','1117','Chevy','Camero',1998,' ',' ',100,' ','NJ',' '),(15,'Car','Sedan',' ','1117','Chevy','Camero',1998,' ',' ',100,' ','NJ',' '),(16,'Car','Sedan',' ','1119','Chevy','Camero',1998,' ',' ',100,' ','NJ',' '),(17,'Car','Sedan',' ','1119','Honda','Civic',1999,' ',' ',100,' ','NJ',' '),(18,'Car','Convertible',' ','189','Chevrolet','Corvette',1969,' ',' ',75000,' ','NJ',' '),(19,'Car','Coupe','Green','001q','Chevrolet','Belair',1955,' ',' ',87,' ','NY',' '),(20,'Car','Coupe','Red','qwerty6','Chevrolet','Nova',1970,'Auto',' ',36000,' ','NJ','Clean'),(21,'Truck','Extended-cab','Grey','123456','Ford','Ranger',2011,'Auto','4x4',15000,'Excellent','NJ','Clean'),(22,'Car','Coupe','Grey','567890','Ford','Mustang',2019,' ',' ',1,' ','nj',' ');
/*!40000 ALTER TABLE `Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Item_Alert`
--

DROP TABLE IF EXISTS `Item_Alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Item_Alert` (
  `Owner` varchar(45) NOT NULL DEFAULT '',
  `alertID` int(11) NOT NULL DEFAULT '0',
  `year` int(11) DEFAULT NULL,
  `make` varchar(30) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Owner`,`alertID`),
  CONSTRAINT `Item_Alert_ibfk_1` FOREIGN KEY (`Owner`) REFERENCES `Account` (`Username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Item_Alert`
--

LOCK TABLES `Item_Alert` WRITE;
/*!40000 ALTER TABLE `Item_Alert` DISABLE KEYS */;
INSERT INTO `Item_Alert` VALUES ('ADMIN',2,1970,'chevrolet','nova'),('ADMIN',3,1969,'chevrolet','corvette'),('Mike',4,2019,'ford','mustang'),('Mike',5,2018,'subaru','wrx');
/*!40000 ALTER TABLE `Item_Alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Question`
--

DROP TABLE IF EXISTS `Question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Question` (
  `Question_ID` int(11) NOT NULL DEFAULT '0',
  `Username` varchar(45) NOT NULL DEFAULT '',
  `answerUser` varchar(45) DEFAULT NULL,
  `Post_ID` int(11) NOT NULL DEFAULT '0',
  `Body` varchar(1000) NOT NULL,
  `answer` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Question_ID`,`Username`,`Post_ID`),
  KEY `answerUser` (`answerUser`),
  KEY `Username` (`Username`),
  KEY `Post_ID` (`Post_ID`),
  CONSTRAINT `Question_ibfk_1` FOREIGN KEY (`answerUser`) REFERENCES `Account` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Question_ibfk_2` FOREIGN KEY (`Username`) REFERENCES `Account` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Question_ibfk_3` FOREIGN KEY (`Post_ID`) REFERENCES `Auction` (`Post_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Question`
--

LOCK TABLES `Question` WRITE;
/*!40000 ALTER TABLE `Question` DISABLE KEYS */;
INSERT INTO `Question` VALUES (1,'buy3r',NULL,8,'Sunroof?','N/A'),(1,'buy3r','REP',13,'How much Rust is there?','None, thats why I outbid you '),(1,'Malky','ADMIN',1,'Can I have a free camero','No Sir you cannot have a free camero'),(1,'Mike',NULL,16,'Why are you selling?','N/A'),(2,'REP',NULL,13,'when can I come get it','N/A');
/*!40000 ALTER TABLE `Question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email` (
  `toUsername` varchar(45) NOT NULL DEFAULT '',
  `fromUsername` varchar(45) NOT NULL DEFAULT '',
  `msgsubject` varchar(100) DEFAULT NULL,
  `msgBody` varchar(2000) DEFAULT NULL,
  `msgTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`toUsername`,`fromUsername`,`msgTime`),
  KEY `fromUsername` (`fromUsername`),
  CONSTRAINT `email_ibfk_1` FOREIGN KEY (`toUsername`) REFERENCES `Account` (`Username`) ON DELETE CASCADE,
  CONSTRAINT `email_ibfk_2` FOREIGN KEY (`fromUsername`) REFERENCES `Account` (`Username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` VALUES ('ADMIN','ADMIN','to Self','hi','2019-04-23 16:53:59'),('ADMIN','ALERT','Listing Alert','Your Alert # 4 has been triggered!','2019-04-23 11:12:01'),('ADMIN','ALERT','Higher bid placed','A higher bid has been placed on Post: 14','2019-04-23 11:16:57'),('ADMIN','ALERT','Listing Alert','Your Alert # 2 has been triggered!','2019-04-23 17:31:15'),('ADMIN','buy3r','test','testing user to admin','2019-04-23 10:33:37'),('ADMIN','Malky','First!','I sent the first email yay','2019-04-22 19:17:01'),('ADMIN','Mike','TEST','Hi admin','2019-04-23 16:47:04'),('Mike','ALERT','Listing Alert','Your Alert # 4 has been triggered!','2019-04-23 17:48:28'),('Mike','Mike','test','to self','2019-04-23 16:47:26'),('REP','ALERT','Higher bid placed','A higher bid has been placed on Post: 13','2019-04-23 10:48:06'),('REP','ALERT','Higher bid placed','A higher bid has been placed on Post: 13','2019-04-23 10:48:38');
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-23 18:42:14
