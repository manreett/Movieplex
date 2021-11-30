CREATE DATABASE  IF NOT EXISTS `movie` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `movie`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: movie
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `City_ID` int NOT NULL,
  `Name` varchar(75) NOT NULL,
  `State` varchar(75) NOT NULL,
  `Province` varchar(45) DEFAULT NULL,
  `ZipCode` varchar(20) NOT NULL,
  `Country` varchar(75) NOT NULL,
  PRIMARY KEY (`City_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1210,'Toronto','ON','Ontario','M1X5G1','Canada'),(1212,'Brampton','ON','Ontario','M1L4F8','Canada'),(1213,'Pickering','ON','Ontario','L1L4D7\'','Canada'),(1214,'Vancouver','BC','British Columbia','V1V4X2','Canada'),(1215,'Edmonton','AB','Alberta','X1X0G3','Canada'),(1216,'Oshawa','ON','Ontario','L12318','Canada');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `Movie_ID` int NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Director` varchar(100) DEFAULT NULL,
  `Cast` varchar(1024) DEFAULT NULL,
  `Description` text,
  `Duration_min` time DEFAULT NULL,
  `ReleaseDate` datetime DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Movie_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (2001,'Venom: Let There Be Carnage','Andy Serkis','Tom Hardy, Michelle Williams, Naomie Harris, Reid Scott, Stephen Graham, Woody Harrelson','Eddie Brock attempts to reignite his career by interviewing serial killer Cletus Kasady, who becomes the host of the symbiote Carnage and escapes prison after a failed execution.','01:37:00','2021-09-14 00:00:00','United States of America'),(2002,'Shang-Chi and the Legend of the Ten Rings','Destin Daniel Cretton','Simu Liu, Awkwafina, Menger Zhang, Fala Chen, Florian Munteanu, Benedict Wong, Michelle Yeoh, Ben Kingsley, Tony Leung ','Shang-Chi, the master of weaponry-based Kung Fu, is forced to confront his past after being drawn into the Ten Rings organization.','02:12:00','2021-08-16 00:00:00','United States of America'),(2003,'Dune','Denis Villeneuve','Timothée Chalamet, Rebecca Ferguson, Oscar Isaac, and more','Feature adaptation of Frank Herberts science fiction novel, about the son of a noble family entrusted with the protection of the most valuable asset and most vital element in the galaxy.','02:36:00','2021-09-03 00:00:00','United States of America'),(2004,'Last Night in Soho','Edgar Wright','Thomasin McKenzie, Anya Taylor-Joy, Matt Smithr Wright, and more','An aspiring fashion designer is mysteriously able to enter the 1960s where she encounters a dazzling wannabe singer. But the glamour is not all it appears to be and the dreams of the past start to crack \nand splinter into something darker.','01:58:00','2021-10-29 00:00:00','United Kingdom'),(2005,'Rons Gone Wrong','Sarah Smith, Jean-Philippe Vine','Zach Galifianakis, Jack Dylan Grazer, Ed Helms and more','The story of Barney, an awkward middle-schooler and Ron, his new walking, talking, digitally-connected device. Rons malfunctions set against the backdrop of the social media age launch them on a journey to learn about true friendship.','01:55:00','2021-10-15 00:00:00','United States of America, United Kingdom'),(2006,'Clifford the Big Red Dog','Walt Becker','Walt Becker\',\'Jack Whitehall, Darby Camp, Tony Hale and more','A young girls love for a tiny puppy named Clifford makes the dog grow to an enormous size.','01:37:00','2021-11-10 00:00:00','United States of America, Canada');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `Payment_ID` int NOT NULL,
  `Amount` decimal(10,0) DEFAULT NULL,
  `DiscountNo` int DEFAULT NULL,
  `Transaction_ID` int DEFAULT NULL,
  `PaymentMethod` int DEFAULT NULL,
  `Reservation_ID` int NOT NULL,
  PRIMARY KEY (`Payment_ID`),
  UNIQUE KEY `Transaction_ID_UNIQUE` (`Transaction_ID`),
  KEY `Reservation_idx_idx` (`Reservation_ID`),
  CONSTRAINT `Reservation_idx` FOREIGN KEY (`Reservation_ID`) REFERENCES `reservation` (`Reservation_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (100001,12,6,9783217,1,545001),(100002,15,12,6307829,3,545002),(100003,8,9,7758019,2,545006),(100004,10,4,3107276,1,545003),(100005,9,1,2743617,1,545004),(100006,11,8,7425381,1,545005);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `Reservation_ID` int NOT NULL,
  `TotalSeats` int NOT NULL,
  `TimeChosen` datetime NOT NULL,
  `Status` int DEFAULT NULL,
  `ShowSlot_ID` int NOT NULL,
  `User_ID` int NOT NULL,
  PRIMARY KEY (`Reservation_ID`),
  KEY `ShowSlot_ID_idx` (`ShowSlot_ID`),
  KEY `User_Id_idx` (`User_ID`),
  CONSTRAINT `ShowSlot_ID` FOREIGN KEY (`ShowSlot_ID`) REFERENCES `showslot` (`showslot_id`),
  CONSTRAINT `User_Id` FOREIGN KEY (`User_ID`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (545001,5,'2021-11-11 00:00:00',1,6001,400120),(545002,4,'2021-11-21 00:00:00',1,6002,400124),(545003,2,'2021-11-30 00:00:00',1,6003,400121),(545004,1,'2021-12-01 00:00:00',1,6005,400122),(545005,3,'2021-12-01 00:00:00',1,6004,400123),(545006,3,'2021-12-09 00:00:00',1,6006,400125);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showseat`
--

DROP TABLE IF EXISTS `showseat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `showseat` (
  `Showseat_ID` int NOT NULL,
  `Price` decimal(9,2) DEFAULT NULL,
  `TheaterSeat_ID` int NOT NULL,
  `ShowSlot_ID` int NOT NULL,
  `Reservation_ID` int NOT NULL,
  PRIMARY KEY (`Showseat_ID`),
  KEY `TheaterSeatid_idx` (`TheaterSeat_ID`),
  KEY `ShowSlotidx_idx` (`ShowSlot_ID`),
  KEY `ReservationIdx_idx` (`Reservation_ID`),
  CONSTRAINT `ReservationIdx` FOREIGN KEY (`Reservation_ID`) REFERENCES `reservation` (`Reservation_ID`),
  CONSTRAINT `ShowSlotidx` FOREIGN KEY (`ShowSlot_ID`) REFERENCES `showslot` (`showslot_id`),
  CONSTRAINT `TheaterSeatid` FOREIGN KEY (`TheaterSeat_ID`) REFERENCES `theater_seat` (`theaterseat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showseat`
--

LOCK TABLES `showseat` WRITE;
/*!40000 ALTER TABLE `showseat` DISABLE KEYS */;
INSERT INTO `showseat` VALUES (141001,15.00,77702,6001,545002),(141002,13.00,77701,6005,545006),(141003,11.00,77704,6006,545005),(141004,10.00,77703,6003,545003),(141005,7.00,77706,6002,545001),(141006,12.00,77705,6004,545004);
/*!40000 ALTER TABLE `showseat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showslot`
--

DROP TABLE IF EXISTS `showslot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `showslot` (
  `ShowSlot_ID` int NOT NULL,
  `Date` datetime NOT NULL,
  `StartTime` datetime NOT NULL,
  `Movie_ID` int NOT NULL,
  `TheaterHall_ID` int NOT NULL,
  PRIMARY KEY (`ShowSlot_ID`),
  KEY `MovieId_idx` (`Movie_ID`),
  KEY `TheaterHallid_idx` (`TheaterHall_ID`),
  CONSTRAINT `MovieId` FOREIGN KEY (`Movie_ID`) REFERENCES `movie` (`Movie_ID`),
  CONSTRAINT `TheaterHallid` FOREIGN KEY (`TheaterHall_ID`) REFERENCES `theaterhall` (`theaterhall_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showslot`
--

LOCK TABLES `showslot` WRITE;
/*!40000 ALTER TABLE `showslot` DISABLE KEYS */;
INSERT INTO `showslot` VALUES (6001,'2021-11-11 00:00:00','2021-11-11 00:00:00',2001,1),(6002,'2021-11-15 00:00:00','2021-11-15 00:00:00',2004,2),(6003,'2021-11-30 00:00:00','2021-11-30 00:00:00',2003,3),(6004,'2021-12-08 00:00:00','2021-12-08 00:00:00',2002,4),(6005,'2021-12-05 00:00:00','2021-12-05 00:00:00',2005,6),(6006,'2021-11-20 00:00:00','2021-11-20 00:00:00',2006,5);
/*!40000 ALTER TABLE `showslot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theater`
--

DROP TABLE IF EXISTS `theater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theater` (
  `Theater_ID` int NOT NULL,
  `Name` varchar(75) DEFAULT NULL,
  `TotalTheaterHalls` int DEFAULT NULL,
  `City_ID` int NOT NULL,
  PRIMARY KEY (`Theater_ID`),
  KEY `City_ID_idx` (`City_ID`),
  CONSTRAINT `City_ID` FOREIGN KEY (`City_ID`) REFERENCES `city` (`City_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater`
--

LOCK TABLES `theater` WRITE;
/*!40000 ALTER TABLE `theater` DISABLE KEYS */;
INSERT INTO `theater` VALUES (111,'Paradise Theater',13,1210),(222,'Paradise Theater',13,1212),(333,'Maple Theater',9,1213),(444,'Theater Flight',15,1214),(555,'Maple Theater',13,1215),(666,'Paradise Theater',13,1216);
/*!40000 ALTER TABLE `theater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theater_seat`
--

DROP TABLE IF EXISTS `theater_seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theater_seat` (
  `TheaterSeat_ID` int NOT NULL,
  `SeatNumber` int NOT NULL,
  `TheaterHall_ID` int NOT NULL,
  PRIMARY KEY (`TheaterSeat_ID`),
  KEY `TheaterHall_ID_idx` (`TheaterHall_ID`),
  CONSTRAINT `TheaterHall_ID` FOREIGN KEY (`TheaterHall_ID`) REFERENCES `theaterhall` (`TheaterHall_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater_seat`
--

LOCK TABLES `theater_seat` WRITE;
/*!40000 ALTER TABLE `theater_seat` DISABLE KEYS */;
INSERT INTO `theater_seat` VALUES (77701,5,1),(77702,65,3),(77703,79,2),(77704,45,5),(77705,1,4),(77706,27,6);
/*!40000 ALTER TABLE `theater_seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theaterhall`
--

DROP TABLE IF EXISTS `theaterhall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theaterhall` (
  `TheaterHall_ID` int NOT NULL,
  `Name` varchar(75) DEFAULT NULL,
  `Total_Seats` int DEFAULT NULL,
  `Theater_ID` int NOT NULL,
  KEY `Theater_ID_idx` (`TheaterHall_ID`),
  KEY `Theater_ID_idx1` (`Theater_ID`),
  CONSTRAINT `Theater_ID` FOREIGN KEY (`Theater_ID`) REFERENCES `theater` (`Theater_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theaterhall`
--

LOCK TABLES `theaterhall` WRITE;
/*!40000 ALTER TABLE `theaterhall` DISABLE KEYS */;
INSERT INTO `theaterhall` VALUES (1,'Theater Hall 1',250,111),(2,'Theater Hall 2',300,222),(3,'Theater Hall 3',250,444),(4,'Theater Hall 4',400,222),(5,'Theater Hall 5',150,333),(6,'Theater Hall 6',200,555);
/*!40000 ALTER TABLE `theaterhall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `User_ID` int NOT NULL,
  `Name` varchar(75) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Email` varchar(65) DEFAULT NULL,
  `Phone` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (400120,'Mary Clareson','mary1001','mary@gmail.com','1465554444'),(400121,'Wendy Zhu','unicornlover','wwkk@gmail.com','4167548962'),(400122,'Frank Wilson','thisismypassword','franky32@hotmail.com','4163216549'),(400123,'Jamal Brooks','123xx0GH','jamaljamal@hotmail.com','6478889999'),(400124,'Joey Peter','spacerockz101','galaxyjoey@gmail.com','4162225555'),(400125,'Elaine Miller','randompassword','redandblue@hotmail.com','6472154789');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-06 23:58:23
