-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: jspbeginner
-- ------------------------------------------------------
-- Server version	5.6.45-log

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `num` int(11) NOT NULL,
  `id` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `price` int(50) DEFAULT NULL,
  `count` int(50) DEFAULT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `kind` int(5) DEFAULT NULL,
  `pro_num` int(20) DEFAULT NULL,
  `inventory` int(200) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,'','초콜릿만들기 세트 Mon ',8,1,'ffc18d3f2e15aeeea0617062d5c21020.png','2020-02-13 09:26:43',1,8,NULL),(2,'admin1','초콜릿만들기 세트 Mon ',25000,2,'ffc18d3f2e15aeeea0617062d5c21020.png','2020-02-13 10:49:09',0,8,NULL),(4,'admin1','초콜릿만들기 세트 Mon ',25000,1,'ffc18d3f2e15aeeea0617062d5c21020.png','2020-02-13 16:35:41',0,8,NULL),(5,'admin1','감성 용돈케이크 ',85000,1,'[크기변환]1_shop1_174752.jpg','2020-02-13 16:35:46',0,7,NULL);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon` (
  `num` int(11) NOT NULL,
  `id` varchar(20) DEFAULT NULL,
  `subject` varchar(20) DEFAULT NULL,
  `content` varchar(50) DEFAULT NULL,
  `multi` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `day1` date DEFAULT NULL,
  `day2` date DEFAULT NULL,
  `percent` int(11) DEFAULT NULL,
  `after` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES (1,'admin','서얼날',NULL,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `couponlist`
--

DROP TABLE IF EXISTS `couponlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `couponlist` (
  `num` int(11) NOT NULL,
  `subject` varchar(20) DEFAULT NULL,
  `content` varchar(50) DEFAULT NULL,
  `multi` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `day1` date DEFAULT NULL,
  `day2` date DEFAULT NULL,
  `percent` int(11) DEFAULT NULL,
  `after` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `couponlist`
--

LOCK TABLES `couponlist` WRITE;
/*!40000 ALTER TABLE `couponlist` DISABLE KEYS */;
INSERT INTO `couponlist` VALUES (1,'발렌타인데이 쿠폰','발렌타인 맞이 특별 쿠폰',1,10000,'2020-02-05','2020-02-20',11,0);
/*!40000 ALTER TABLE `couponlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id` varchar(10) NOT NULL,
  `pass` varchar(11) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `address_2` varchar(20) DEFAULT NULL,
  `address_3` varchar(20) DEFAULT NULL,
  `tel` varchar(10) DEFAULT NULL,
  `tel_2` varchar(10) DEFAULT NULL,
  `dday_1` varchar(10) DEFAULT NULL,
  `ddate_1` varchar(10) DEFAULT NULL,
  `dday_2` varchar(10) DEFAULT NULL,
  `ddate_2` varchar(10) DEFAULT NULL,
  `dday_3` varchar(10) DEFAULT NULL,
  `ddate_3` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('admin','admin00!','관리자','giftyou940@gmail.com','08782','서울 관악구 봉천동 945-17','ww','9494','9494',NULL,NULL,NULL,NULL,NULL,NULL),('admin1','admin200!!','관리자1','admin1@naver.com','06375','서울 강남구 세곡동 533','ㄷㄷㄷ','1112','1111',NULL,NULL,NULL,NULL,NULL,NULL),('admin2','admin200!','관리자2','admin2@naver.com','08814','서울 관악구 신림동 240-1','신림실ㄴ림','1112','2121',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_table`
--

DROP TABLE IF EXISTS `new_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_table` (
  `num` int(11) NOT NULL DEFAULT '0',
  `pass` varchar(11) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `subject` varchar(20) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `re_ref` int(20) DEFAULT NULL,
  `readcount` int(50) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `notice` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_table`
--

LOCK TABLES `new_table` WRITE;
/*!40000 ALTER TABLE `new_table` DISABLE KEYS */;
INSERT INTO `new_table` VALUES (1,'1111','admin1','일반1','일반1',0,4,'2019-12-23 15:28:34','0:0:0:0:0:0:0:1','normal'),(1,'admin100!','admin1','공지1','공지1',0,4,'2019-12-23 15:16:18','0:0:0:0:0:0:0:1','notice'),(2,'admin100!','admin1','공지1','공지1',0,3,'2019-12-23 15:37:38','0:0:0:0:0:0:0:1','notice'),(3,'admin100!','admin1','공지1','ee',0,19,'2019-12-23 15:43:58','0:0:0:0:0:0:0:1','notice'),(4,'1111','admin1','공지2','공지2',0,17,'2019-12-23 15:49:00','0:0:0:0:0:0:0:1','notice'),(5,'admin100!','hye','h공지','h공지',0,3,'2019-12-24 09:17:23','0:0:0:0:0:0:0:1','notice');
/*!40000 ALTER TABLE `new_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `num` int(11) NOT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` varchar(3000) DEFAULT NULL,
  `file` varchar(30) DEFAULT NULL,
  `readcount` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `multi` int(11) DEFAULT NULL,
  `banner` varchar(20) DEFAULT NULL,
  `coupon` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'가가가가가','나나나나나','다다다',145,'2020-01-07 15:44:26',0,NULL,NULL),(2,'나는야 공지사항이다','가나가나 가나가나 가가가가가가ㅏ 김김김 강 강고로아고라오가로아아아가가가가가가ㅏ 김김김 강 강고로아고라오가로아아아가가가가가가ㅏ 김김김 강 강고로아고라오가로아아아아','다다다',42,'2020-01-07 15:44:26',0,NULL,NULL),(5,'타르트','가나다가 마바사 아자\r\n 마바사 아자\r\n강낭콩','abc.jpg',109,'2020-01-15 16:19:10',0,NULL,NULL),(6,'가나다라마바사아자차카타파하가나다라마바사아자차카타파하','가나다라마바사아자차카타파하가나다라마바사아자차카타파하\r\n가나다라마바사아자차카타파하가나다라마바사아자차카타파하\r\n가나다라마바사아자차카타파하가나다라마바사아자차카타파하\r\n가나다라마바사아자차카타파하가나다라마바사아자차카타파하\r\n','',35,'2020-01-20 12:36:11',1,NULL,NULL),(7,'내가그린기린그림은','긴 기린그림','',33,'2020-01-20 12:37:46',0,NULL,NULL),(8,'뺑뺑뺑','뱅뱅뱅','로그인.PNG',6,'2020-01-20 12:46:55',0,NULL,NULL),(9,'ㅁㅁㄴㅇㄴㅁㅇ','<p>ㅁㄴㅇㄴㅁㅇㄴㅁㅇ</p>','회원가입.PNG',10,'2020-01-20 17:32:32',0,NULL,NULL),(10,'ㅁㄴㅇㅁㄴㅇㄴㅁsaa','<p><span style=\"background-color: rgb(255, 255, 0);\">ㄹㄷㅈㄹㄷㅈㄹㅈㄷㄹㄷㅈㄹㅈㄷㄹㄷㅈㄹdasaads</span></p>','',29,'2020-01-20 17:33:06',0,NULL,NULL),(11,'개취향abdgfefezz','abcdefgfewfewberbbssssddwfewfe','',34,'2020-01-20 19:18:54',0,NULL,NULL),(12,'내가그린기린그림은','<p><span style=\"color: rgb(115, 24, 66); background-color: rgb(255, 255, 0);\">내</span><span style=\"color: rgb(255, 255, 0); background-color: rgb(115, 24, 66);\">가</span><span style=\"color: rgb(115, 24, 66); background-color: rgb(255, 255, 0);\"> 그</span><span style=\"color: rgb(255, 255, 0); background-color: rgb(115, 24, 66);\">린</span><span style=\"color: rgb(115, 24, 66); background-color: rgb(255, 255, 0);\"> 기</span><span style=\"color: rgb(255, 255, 0); background-color: rgb(115, 24, 66);\">린</span><span style=\"color: rgb(115, 24, 66); background-color: rgb(255, 255, 0);\"> 그</span><span style=\"background-color: rgb(115, 24, 66); color: rgb(255, 255, 0);\">림</span><span style=\"color: rgb(115, 24, 66); background-color: rgb(255, 255, 0);\">은&nbsp;</span></p>','',34,'2020-01-28 07:23:09',1,NULL,NULL),(13,'','<p>ㄴㅁㅇㄴㅁㅇㅇㄴㅁ</p>','',34,'2020-01-28 08:08:16',0,NULL,NULL),(14,'LemonAde','','',67,'2020-01-28 08:09:04',0,NULL,NULL),(15,'강형욱ㅎㅎㅎㅎ아조시','성생님ㅎㅎㅎㅎㅎ','캡처.PNG',30,'2020-01-30 05:45:28',1,NULL,NULL),(16,'이벤트','335,4874,725,4983','aser.jpg',19,'2020-01-31 02:16:44',1,NULL,NULL),(17,'이벤트','335,4874,725,4983','aser.jpg',23,'2020-01-31 02:17:45',1,NULL,NULL),(18,'아서','335,4874,725,4983','aser.jpg',8,'2020-01-31 06:19:36',1,'aser - 복사본.jpg',NULL),(19,'LemonAde','','',8,'2020-01-31 06:20:09',0,'',NULL),(20,'진진자라','','',4,'2020-01-31 06:23:41',0,'',NULL),(21,'내가그린기린그림은','<p>긴기린그림</p>','',4,'2020-01-31 06:25:59',0,'',NULL),(22,'갯강구','','aser.jpg',5,'2020-01-31 06:26:30',1,'aser - 복사본.jpg',NULL),(23,'칼날부리','','aser.jpg',5,'2020-01-31 06:28:49',1,'aser - 복사본.jpg',NULL),(24,'진진자라','','popup1.png',25,'2020-01-31 06:31:32',1,'eve.PNG',NULL),(25,'내가그린기린그림은기기기아아앙ㅇㄴㅇ','15,15,31,2','popup1.png',36,'2020-01-31 06:33:41',1,'aser - 복사본.jpg',NULL),(26,'ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅁㄴㅇ','<p>ㅋㅋ개웃경ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅁㄴㅇ</p>',NULL,35,'2020-01-31 06:34:34',0,NULL,NULL),(27,'진진자라','지리지리자','',3,'2020-02-03 00:51:14',1,'','2'),(28,'ㅁㄴㅇ','ㅁㄴㅇㄴㅁㅇ','',3,'2020-02-03 00:52:18',1,'','3'),(29,'ㅇㄴㅁ','ㄹㄷㅈ','',3,'2020-02-03 00:52:30',1,'','2'),(30,'아서','335,4874,724,4982','aser.jpg',2,'2020-02-03 01:24:21',1,'aser - 복사본.jpg','4'),(31,'진진자라','335,4874,724,4982','aser.jpg',5,'2020-02-03 01:27:18',1,'aser - 복사본.jpg','겨울'),(32,'이응','335,4874,724,4982','aser.jpg',10,'2020-02-03 01:28:38',1,'aser - 복사본.jpg','겨울'),(34,'진진자라','335,4874,724,4982','aser.jpg',20,'2020-02-06 02:32:02',1,'aser - 복사본.jpg','김필'),(35,'신규','304,285,365,406','coupon.png',18,'2020-02-06 06:53:10',1,'coupon - 복사본.png','서얼날'),(36,'신규회원 축하선물','473,285,542,420','coupon1.png',41,'2020-02-06 07:02:30',1,'coupon1 - 복사본.png','겨울'),(37,'연휴 간 배송 공지','<p>안녕하세요 기프트유 입니다.</p><p>연휴 간 배송관련하여 공지드립니다.</p>',NULL,44,'2020-02-10 02:35:10',0,NULL,'0'),(38,'LemonAde','473,285,542,420','coupon1.png',39,'2020-02-10 06:56:35',1,'coupon1 - 복사본.png','서얼날');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p_board`
--

DROP TABLE IF EXISTS `p_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `p_board` (
  `num` int(10) DEFAULT NULL,
  `pass` varchar(11) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `subject` varchar(20) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `file` varchar(20) DEFAULT NULL,
  `re_ref` int(20) DEFAULT NULL,
  `re_lev` int(20) DEFAULT NULL,
  `re_seq` int(20) DEFAULT NULL,
  `readcount` int(50) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_board`
--

LOCK TABLES `p_board` WRITE;
/*!40000 ALTER TABLE `p_board` DISABLE KEYS */;
INSERT INTO `p_board` VALUES (1,'admin100!','admin1','1','1(수정)',NULL,1,0,0,6,'2019-12-23 15:14:19','0:0:0:0:0:0:0:1'),(2,'admin100!','hye','글쓰기','글쓰기',NULL,2,0,0,1,'2019-12-24 09:16:50','0:0:0:0:0:0:0:1'),(3,'111','hye','첫번째글','1111',NULL,3,0,0,3,'2019-12-24 17:27:55','192.168.2.200');
/*!40000 ALTER TABLE `p_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p_comment`
--

DROP TABLE IF EXISTS `p_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `p_comment` (
  `num_c` int(10) NOT NULL,
  `pass_c` varchar(11) DEFAULT NULL,
  `name_c` varchar(10) DEFAULT NULL,
  `subject_c` varchar(20) DEFAULT NULL,
  `content_c` varchar(100) DEFAULT NULL,
  `date_c` datetime DEFAULT NULL,
  `ip_c` varchar(20) DEFAULT NULL,
  `num` int(10) DEFAULT NULL,
  `re_ref_c` int(20) DEFAULT NULL,
  PRIMARY KEY (`num_c`),
  UNIQUE KEY `re_ref_c_UNIQUE` (`re_ref_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_comment`
--

LOCK TABLES `p_comment` WRITE;
/*!40000 ALTER TABLE `p_comment` DISABLE KEYS */;
INSERT INTO `p_comment` VALUES (1,'1111','답글1','답글1','답글1','2019-12-23 15:14:59','0:0:0:0:0:0:0:1',1,1),(2,'1111','댓글','ee','ee','2019-12-24 17:28:07','192.168.2.200',3,2);
/*!40000 ALTER TABLE `p_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p_notice`
--

DROP TABLE IF EXISTS `p_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `p_notice` (
  `num` int(10) NOT NULL,
  `pass` varchar(11) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `subject` varchar(20) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `re_ref` int(20) DEFAULT NULL,
  `readcount` int(50) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `notice` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_notice`
--

LOCK TABLES `p_notice` WRITE;
/*!40000 ALTER TABLE `p_notice` DISABLE KEYS */;
INSERT INTO `p_notice` VALUES (1,'1111','admin1','일반1','일반1',0,0,'2019-12-23 15:28:34','0:0:0:0:0:0:0:1','normal');
/*!40000 ALTER TABLE `p_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p_notice2`
--

DROP TABLE IF EXISTS `p_notice2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `p_notice2` (
  `num` int(10) NOT NULL,
  `pass` varchar(11) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `subject` varchar(20) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `re_ref` int(20) DEFAULT NULL,
  `readcount` int(50) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `notice` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_notice2`
--

LOCK TABLES `p_notice2` WRITE;
/*!40000 ALTER TABLE `p_notice2` DISABLE KEYS */;
INSERT INTO `p_notice2` VALUES (1,'admin100!','admin1','공지1','공지1',0,0,'2019-12-23 15:16:18','0:0:0:0:0:0:0:1','notice'),(2,'admin100!','admin1','공지1','공지1',0,0,'2019-12-23 15:37:38','0:0:0:0:0:0:0:1','notice'),(3,'admin100!','admin1','공지1','ee',0,0,'2019-12-23 15:43:58','0:0:0:0:0:0:0:1','notice'),(4,'1111','admin1','공지2','공지2',0,0,'2019-12-23 15:49:00','0:0:0:0:0:0:0:1','notice'),(5,'admin100!','hye','h공지','h공지',0,0,'2019-12-24 09:17:23','0:0:0:0:0:0:0:1','notice');
/*!40000 ALTER TABLE `p_notice2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymenthistory`
--

DROP TABLE IF EXISTS `paymenthistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymenthistory` (
  `id` varchar(20) COLLATE utf8_bin NOT NULL,
  `order_number` varchar(45) COLLATE utf8_bin NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `price` int(20) NOT NULL,
  `count` int(20) NOT NULL,
  `phone` varchar(45) COLLATE utf8_bin NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `filename` varchar(100) COLLATE utf8_bin NOT NULL,
  `product_name` varchar(300) COLLATE utf8_bin NOT NULL,
  `payment_type` varchar(45) COLLATE utf8_bin NOT NULL,
  `all_price` int(20) NOT NULL,
  `address` varchar(300) COLLATE utf8_bin NOT NULL,
  `detail_address` varchar(300) COLLATE utf8_bin NOT NULL,
  `postcode` varchar(50) COLLATE utf8_bin NOT NULL,
  `msg` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `delivery` varchar(100) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `order_number_UNIQUE` (`order_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymenthistory`
--

LOCK TABLES `paymenthistory` WRITE;
/*!40000 ALTER TABLE `paymenthistory` DISABLE KEYS */;
INSERT INTO `paymenthistory` VALUES ('admin','11111111','2020-02-12 17:29:21',2000,1,'010-9969-4424','백동규','ffc18d3f2e15aeeea0617062d5c21020.png','넥타이 외  1 ','creditcard',4600,'부산 해운대구 APEC로 17','아파트','48060','','배송중'),('admin','11111112','2020-02-12 17:29:21',2000,1,'010-9969-4424','백동규','ffc18d3f2e15aeeea0617062d5c21020.png','지갑 외  1 ','creditcard',4600,'부산 해운대구 APEC로 17','아파트','48060','','배송중'),('admin','11111113','2020-02-12 17:29:21',1000,1,'010-9969-4424','백동규','ffc18d3f2e15aeeea0617062d5c21020.png','지갑','creditcard',4000,'부산 해운대구 APEC로 17','아파트','48060','','배송중'),('admin','11111114','2020-02-12 17:29:21',10000,1,'010-9969-4424','백동규','ffc18d3f2e15aeeea0617062d5c21020.png','지갑','creditcard',11000,'부산 해운대구 APEC로 17','아파트','48060','배송 빨리해주세요~!!!! 배송 빨리해주세요~!!!! 배송 빨리해주세요~!!!! 배송 빨리','배송중'),('admin','11111115','2020-02-12 17:29:21',22000,1,'010-9969-4424','백동규','ffc18d3f2e15aeeea0617062d5c21020.png','넥타이 외  1 ','creditcard',25000,'부산 해운대구 APEC로 17','아파트','48060','','배송중'),('admin','11111116','2020-02-12 17:29:21',12000,1,'010-9969-4424','백동규','ffc18d3f2e15aeeea0617062d5c21020.png','넥타이','creditcard',12600,'부산 해운대구 APEC로 17','아파트','48060','','배송중'),('admin','11111117','2020-02-12 17:29:21',12000,1,'010-9969-4424','백동규','ffc18d3f2e15aeeea0617062d5c21020.png','넥타이','creditcard',12600,'부산 해운대구 APEC로 17','아파트','48060','주말에 배송해주세요~!!','배송중'),('admin','11111118','2020-02-12 17:29:21',12000,1,'010-9969-4424','백동규','ffc18d3f2e15aeeea0617062d5c21020.png','넥타이','creditcard',12600,'부산 해운대구 APEC로 17','아파트','48060','','배송중'),('admin','11111119','2020-02-12 17:29:21',12000,1,'010-9969-4424','백동규','ffc18d3f2e15aeeea0617062d5c21020.png','넥타이','creditcard',12600,'부산 해운대구 APEC로 17','아파트','48060','평일에 배송해주세요~!!','배송중'),('admin','11111120','2020-02-12 17:29:21',10000,1,'010-9969-4424','백동규','ffc18d3f2e15aeeea0617062d5c21020.png','지갑','creditcard',11000,'부산 해운대구 APEC로 17','아파트','48060','','배송중'),('admin','11111121','2020-02-12 17:29:21',12000,1,'010-9969-4424','백동규','ffc18d3f2e15aeeea0617062d5c21020.png','넥타이','creditcard',12600,'부산 해운대구 APEC로 17','아파트','48060','','배송중'),('admin','11111122','2020-02-12 17:29:21',10000,1,'010-9969-4424','백동규','ffc18d3f2e15aeeea0617062d5c21020.png','지갑','creditcard',11000,'부산 해운대구 APEC로 17','아파트','48060','','배송중'),('admin1','11111123','2020-02-12 17:29:21',10000,1,'010-0000-0000','관리자1','ffc18d3f2e15aeeea0617062d5c21020.png','넥타이 외 1','creditcard',10000,'부산','아파트','48060','배송','배송중');
/*!40000 ALTER TABLE `paymenthistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point`
--

DROP TABLE IF EXISTS `point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `point` (
  `num` int(11) NOT NULL,
  `id` varchar(20) DEFAULT NULL,
  `betwen` varchar(10) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `day` date DEFAULT NULL,
  `content` varchar(50) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point`
--

LOCK TABLES `point` WRITE;
/*!40000 ALTER TABLE `point` DISABLE KEYS */;
INSERT INTO `point` VALUES (1,'admin','+',2000,'2020-02-11','gergqr',2000),(2,'admin','+',2000,'2020-02-11','gergqr',4000),(3,'admin','+',2000,'2020-02-11','gergqr',6000);
/*!40000 ALTER TABLE `point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `num` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `price` int(30) NOT NULL,
  `event` varchar(20) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `inventory` int(11) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `filename` varchar(200) NOT NULL,
  `readcount` int(20) NOT NULL,
  `date` datetime DEFAULT NULL,
  `sell` int(11) DEFAULT NULL,
  `count` int(50) DEFAULT NULL,
  `filename1` varchar(200) DEFAULT NULL,
  `filename2` varchar(200) DEFAULT NULL,
  `review_count` int(10) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'마블 어벤져스 머그컵 머그잔',30000,'생일','man',20,5,'마블의 영웅들이 머그컵으로 변신','8979cd505cb05dcafd83487c95303fc5.gif',18,'2020-02-11 15:15:51',0,NULL,'아이언맨1_shop1_101524.jpg','아이언맨2_shop1_101524.jpg',NULL),(2,'엄마아빠 카네이션 자수손수건 ',14500,'생일','nomatter',40,20,'사랑하는 부모님께 마음을 담아 선물해 보세요♡','6fe70e00196b2c16a8c71c622b80bd49.png',0,'2020-02-11 15:18:23',0,NULL,'','',NULL),(3,'LED 조명/무드등 ',29900,'생일, 발렌타인데이','woman',20,5,'언제나 당신 곁에 로맨틱한 나날을 선사합니다 :)','cce501175e48788e79ef4baae135ee84.gif',1,'2020-02-11 15:22:16',0,NULL,'','',NULL),(4,'간식의 정석',3900,'','nomatter',10,30,'친구한테 주면 \"옛날에 많이 먹었는데\" 함 100%','3326_shop1_638547.png',1,'2020-02-11 15:24:02',0,NULL,'','',NULL),(5,'공부집중 페이퍼 칸막이 ',7500,'생일','nomatter',10,20,'공부효율 200% 올리는 수험생,공시생 선물 (스카이캐슬 강예서 따라잡기!!)','a63d4733ca9c903c8f49a9e37e252b0c.jpg',3,'2020-02-11 15:25:10',0,NULL,'','',NULL),(6,'사랑꾼 앙금쿠키세트(16입) ',29000,'발렌타인데이','man',20,5,'저감미 고급앙금으로 만든 앙금쿠키','689fce70ffb5b2335b7e1e083a7abfbb.jpg',14,'2020-02-11 15:26:20',0,NULL,'','',NULL),(7,'감성 용돈케이크 ',85000,'생일','nomatter',40,10,'예쁜 꽃과 함께 용돈을 선물할 수 있는 용돈 케이크♡','[크기변환]1_shop1_174752.jpg',6,'2020-02-11 15:27:22',0,NULL,'[크기변환]5_shop1_174854.jpg','',NULL),(8,'초콜릿만들기 세트 Mon ',25000,'발렌타인데이','man',20,20,'소중한 마음을 담아 정성스럽게 만들어 선물하세요:)','ffc18d3f2e15aeeea0617062d5c21020.png',108,'2020-02-11 15:28:52',0,NULL,'','',NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_comment`
--

DROP TABLE IF EXISTS `product_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_comment` (
  `num_c` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `ref` int(11) DEFAULT NULL,
  `lev` int(11) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `comment_num` int(11) DEFAULT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `starcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_c`),
  UNIQUE KEY `ref_UNIQUE` (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_comment`
--

LOCK TABLES `product_comment` WRITE;
/*!40000 ALTER TABLE `product_comment` DISABLE KEYS */;
INSERT INTO `product_comment` VALUES (1,'admin1','리리리릴ㄴㄴㄷㄹㄷㄹ','2020-02-13 16:13:12',8,1,0,0,2,'money_cake.png',3),(2,'admin1','냐하하하항','2020-02-13 10:40:06',8,2,0,0,1,'emi.gif',0),(3,'admin1','ㄷㄷㄷㄷ','2020-02-13 10:46:15',8,3,0,0,1,'emi.gif',0);
/*!40000 ALTER TABLE `product_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `id` varchar(10) DEFAULT NULL,
  `pass` varchar(11) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `email_2` varchar(20) DEFAULT NULL,
  `tel` varchar(10) DEFAULT NULL,
  `tel_2` varchar(10) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `address_2` varchar(20) DEFAULT NULL,
  `address_3` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('admin1','admin100!','관리자','admin1','naver.com','8989','8989','06313','서울 강남구 양재대로 333','dd','female'),('admin','admin00!','관리자','admin','naver.com','1111','1111','46729','부산 강서구 가달1로 7','주소주소',NULL);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna` (
  `num` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` varchar(2000) DEFAULT NULL,
  `readcount` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `secret` int(11) DEFAULT NULL,
  `answer` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES (1,'오태식','xotlr@xotlr.com','LemonAde','gl;akregmopiaemoigjroioijijo',23,'2020-01-02 12:10:43','0:0:0:0:0:0:0:1',0,NULL),(2,'dasads','sik5@naver.com','abbasd','geggre4r654gr651',22,'2020-01-02 16:39:42','0:0:0:0:0:0:0:1',0,NULL),(4,'오태식','grrkmge@fkmw.com','tkljlaekrglkre','fawegarehreah',4,'2020-01-07 15:38:46','0:0:0:0:0:0:0:1',0,'가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나'),(5,'dasads','grlknalgam','rg,lkmgeklgelkegm','klmgrlkrgmlkae;mg;lm;ggae',17,'2020-01-07 15:42:12','0:0:0:0:0:0:0:1',0,'눅누굽ㄱ2ㅜㅂ 수고하세요'),(6,'킹정빈','arlkrjeanagelkg','lkrgmalkemrlkgm','klgmral;kem;lamlg',17,'2020-01-07 15:44:26','0:0:0:0:0:0:0:1',0,'almnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllge'),(7,'오태식','fgergeg@knmre.com','aerrgrearg','eargarejgtkmre6yjjsr',13,'2020-01-07 15:47:34','0:0:0:0:0:0:0:1',0,NULL),(8,'dasads','sik5@naver.com','진진자라','지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자',80,'2020-01-07 15:48:58','0:0:0:0:0:0:0:1',0,'지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자지리지리자'),(9,'오태식','ergraaga','1gr321321g3','g23r1ae31gr65r16',29,'2020-01-07 15:49:38','0:0:0:0:0:0:0:1',0,'hahreg'),(10,'htrhrthrts','htrhrthrts','hrthrhrst','trhshsrthsrthsrt',57,'2020-01-07 15:50:47','0:0:0:0:0:0:0:1',0,'garge'),(11,'graegr1','gr23ea1ga3e21','23gr1aer32g1a','g321ar32ga1ge',57,'2020-01-07 16:00:33','0:0:0:0:0:0:0:1',0,'asdasd'),(12,'fawe','fewf','fwfwe','안녕하세요\r\n저는 \r\n홍길동ㅇㅂ니다.',17,'2020-01-09 11:40:17','0:0:0:0:0:0:0:1',0,'a\r\na\r\na'),(13,'gakjrjgl','gklajerlgkrj','klgrmaelkg','lkmaewrlkgmarelkm\r\nagklrmral\'ga\r\nlkaglk\r\n',19,'2020-01-09 11:41:20','0:0:0:0:0:0:0:1',0,'강\r\n사\r\n시'),(14,'few','fewffwe','fw','fwfw',35,'2020-01-09 11:42:08','0:0:0:0:0:0:0:1',0,NULL),(15,'fewf','fewf','gharthtrrthh','eewf\r\nfewf',78,'2020-01-09 11:42:16','0:0:0:0:0:0:0:1',0,'감\r\n사 합\r\n니 다 ㅋㅋ'),(16,'htrhrthrts','htrhrthrts','hrthrhrst','trhshsrthsrthsrt',62,'2020-01-07 15:50:47','0:0:0:0:0:0:0:1',0,NULL),(17,'강하늘','gksmf@gksmf.com','하늘하늘','김하늘',11,'2020-01-10 10:00:30','0:0:0:0:0:0:0:1',0,NULL),(18,'12','faere@fjkewrn.comw','awf','wafawefrt4eg',8,'2020-01-15 15:49:15','0:0:0:0:0:0:0:1',0,NULL),(19,'admin','xotlr@xotlr.com','내가그린기린그림은','개길어요 아세요?',5,'2020-02-06 02:25:23','0:0:0:0:0:0:0:1',0,'ㅇㅋ'),(20,'admin','xotlr@xotlr.com','내가그린기린그림은','dqwqd',0,'2020-02-06 05:55:28','0:0:0:0:0:0:0:1',0,NULL),(21,'admin','king@king.com','내가그린기린그림은','dwq',23,'2020-02-06 05:58:14','0:0:0:0:0:0:0:1',0,NULL),(22,'admin','king@king.com','LemonAde','dsadas',1,'2020-02-06 06:00:19','0:0:0:0:0:0:0:1',0,NULL),(24,'admin','fgergeg@knmre.com','LemonAde','dwqdwq',31,'2020-02-06 06:05:00','0:0:0:0:0:0:0:1',0,'내 오늘 기분이 좋아 답변을 해 주도록 하겠느'),(25,'admin','sik5@naver.com','굥굥','ㅇㅂㅇㅂㅇ',7,'2020-02-06 06:05:35','0:0:0:0:0:0:0:1',0,NULL),(26,'admin','sik5@naver.com','내가그린기린그림은','gerger',9,'2020-02-06 06:07:19','0:0:0:0:0:0:0:1',0,NULL),(27,'admin','sik5@naver.com','LemonAde','wefewf',12,'2020-02-06 06:07:40','0:0:0:0:0:0:0:1',0,NULL),(28,'admin','xotlr@xotlr.com','내가그린기린그림은','dwq',11,'2020-02-06 06:13:53','0:0:0:0:0:0:0:1',1,NULL),(29,'admin','king@king.com','내가그린기린그림은','문의드립니다.',33,'2020-02-10 09:33:09','0:0:0:0:0:0:0:1',0,NULL),(30,'신민섭','king@king.com','wqe','qwe',24,'2020-02-12 14:48:33','0:0:0:0:0:0:0:1',0,'abc'),(31,'신민섭','fgergeg@knmre.com','fwf','fewfwef',8,'2020-02-12 14:57:51','0:0:0:0:0:0:0:1',0,NULL);
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `num` int(10) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `tel` varchar(10) DEFAULT NULL,
  `tel_2` varchar(10) DEFAULT NULL,
  `time` int(10) DEFAULT NULL,
  `subject` varchar(20) DEFAULT NULL,
  `mon` int(10) DEFAULT NULL,
  `date` int(10) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'aa','0000','0000',10,'Americano',1,1),(2,'aa','0000','0000',10,'Americano',1,13),(3,'aa','0000','0000',10,'Americano',1,23),(4,'관리자','7777','7777',15,'Jamong Ade',1,4),(5,'관리자','8989','8989',11,'Cafe Moca',1,2),(6,'관리자','8989','8989',16,'Caramel Machiatto',1,4);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teamboard`
--

DROP TABLE IF EXISTS `teamboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teamboard` (
  `num` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` varchar(2000) DEFAULT NULL,
  `readcount` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `secret` int(11) DEFAULT NULL,
  `answer` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teamboard`
--

LOCK TABLES `teamboard` WRITE;
/*!40000 ALTER TABLE `teamboard` DISABLE KEYS */;
INSERT INTO `teamboard` VALUES (1,'오태식','xotlr@xotlr.com','LemonAde','gl;akregmopiaemoigjroioijijo',23,'2020-01-02 12:10:43','0:0:0:0:0:0:0:1',0,NULL),(2,'dasads','sik5@naver.com','abbasd','geggre4r654gr651',20,'2020-01-02 16:39:42','0:0:0:0:0:0:0:1',0,'부루렀다\r\n기다렸다리라리라리라리\r\n오로로로'),(4,'오태식','grrkmge@fkmw.com','tkljlaekrglkre','fawegarehreah',2,'2020-01-07 15:38:46','0:0:0:0:0:0:0:1',0,'가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나가나'),(5,'dasads','grlknalgam','rg,lkmgeklgelkegm','klmgrlkrgmlkae;mg;lm;ggae',15,'2020-01-07 15:42:12','0:0:0:0:0:0:0:1',0,'눅누굽ㄱ2ㅜㅂ 수고하세요'),(6,'킹정빈','arlkrjeanagelkg','lkrgmalkemrlkgm','klgmral;kem;lamlg',16,'2020-01-07 15:44:26','0:0:0:0:0:0:0:1',0,'almnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllgealmnakllge'),(7,'오태식','fgergeg@knmre.com','aerrgrearg','eargarejgtkmre6yjjsr',12,'2020-01-07 15:47:34','0:0:0:0:0:0:0:1',0,NULL),(8,'관리자','admin1@naver.com','공지1','공지 수정',4,'2020-01-09 16:58:42','0:0:0:0:0:0:0:1',0,'답글 쓰기'),(9,'관리자','giftyou940@gmail.com','공지2','ㄷㄱㄷㄹㄷㄱㄷㄹ',7,'2020-01-09 17:29:11','0:0:0:0:0:0:0:1',0,'efef');
/*!40000 ALTER TABLE `teamboard` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-14 17:24:28
