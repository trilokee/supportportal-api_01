CREATE DATABASE  IF NOT EXISTS `supportportal` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `supportportal`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: supportportal
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (25);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `unit_price` decimal(13,2) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `units_in_stock` int DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category` (`category_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'big 10','10\" big pizza serves 1-2 people','rainy day',119.00,'assets/images/products/placeholder.png',_binary '',100,'2021-08-29 18:20:36.000000',NULL,1),(2,'big 7','10\" big pizza serves 1 person','rainy day',100.00,'assets/images/products/placeholder.png',_binary '',100,'2021-08-29 18:20:36.000000',NULL,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'Pizza');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL,
  `authorities` tinyblob,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `is_not_locked` bit(1) NOT NULL,
  `join_date` datetime(6) DEFAULT NULL,
  `last_login_date` datetime(6) DEFAULT NULL,
  `last_login_date_display` datetime(6) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile_image_url` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (21,_binary '¬\í\0ur\0[Ljava.lang.String;­\ÒV\ç\é{G\0\0xp\0\0\0t\0	user:readt\0user:createt\0user:updatet\0user:delete','trilokeekumargupta@gmail.com','trilokee',_binary '',_binary '','2022-11-19 21:39:16.735000','2022-11-19 21:42:08.683000','2022-11-19 21:39:59.148000','gupta','$2a$10$ZBjdRQpU2AsR0KnzPp9R0.dv1KRF1efHo0oVAl5h0n7Rd1GE6aYvO','http://localhost:8082/user/image/trilokee/trilokee.jpg','ROLE_SUPER_ADMIN','2617145200','trilokee'),(22,_binary '¬\í\0ur\0[Ljava.lang.String;­\ÒV\ç\é{G\0\0xp\0\0\0t\0	user:readt\0user:update','trilokeekumargupta1@gmal.com','santosh',_binary '',_binary '','2022-11-19 21:42:58.108000',NULL,NULL,'gupta','$2a$10$gZVm4LGpbB7XnhoBdrGZuOlXHyo8o1Il3u/i0y04/GMyuU9DNm6y6','http://localhost:8082/user/image/santosh/santosh.jpg','ROLE_MANAGER','5046265774','santosh'),(23,_binary '¬\í\0ur\0[Ljava.lang.String;­\ÒV\ç\é{G\0\0xp\0\0\0t\0	user:readt\0user:createt\0user:update','trilokeegupta8688','akhmadina',_binary '',_binary '','2022-11-19 23:38:33.597000',NULL,NULL,'akhmadina','$2a$10$HE78MsAnOXXukiW1oM.YKOTDUcsHFIlfIjeec8UZIaMInldnGvrLG','http://localhost:8082/user/image/akhmadina/akhmadina.jpg','ROLE_ADMIN','2496858582','akhmadina'),(24,_binary '¬\í\0ur\0[Ljava.lang.String;­\ÒV\ç\é{G\0\0xp\0\0\0t\0	user:readt\0user:update','trilokeegupta8688@gmail.com','ruchi',_binary '',_binary '','2022-11-20 00:49:12.485000','2022-12-19 22:37:31.135000','2022-11-28 13:37:49.809000','gupta','$2a$10$ilPMVm2znScrnt3f8KVM2e/Zw/5zmWbbjcZgQDtFUMcvY/jUF1MtS','http://localhost:8082/user/image/ruchi/ruchi.jpg','ROLE_HR','6834106670','ruchi');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'supportportal'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-11 15:47:09
