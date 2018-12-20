-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: GiveAway
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

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
-- Table structure for table `gatherings`
--

DROP TABLE IF EXISTS `gatherings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gatherings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `city` varchar(40) COLLATE utf8_polish_ci NOT NULL,
  `created` datetime NOT NULL,
  `date` date NOT NULL,
  `description` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `street` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `telephone` varchar(9) COLLATE utf8_polish_ci NOT NULL,
  `time` time NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKj35oiru9lvlm07i0l7h6m8rle` (`user_id`),
  CONSTRAINT `FKj35oiru9lvlm07i0l7h6m8rle` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gatherings`
--

LOCK TABLES `gatherings` WRITE;
/*!40000 ALTER TABLE `gatherings` DISABLE KEYS */;
/*!40000 ALTER TABLE `gatherings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gatherings_goods`
--

DROP TABLE IF EXISTS `gatherings_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gatherings_goods` (
  `gathering_id` bigint(20) NOT NULL,
  `goods_id` bigint(20) NOT NULL,
  PRIMARY KEY (`gathering_id`,`goods_id`),
  KEY `FKrpe1d7whjc8hhsqqvst8xpkr` (`goods_id`),
  CONSTRAINT `FKm51dj9a25ywdw1nnjs8x0x11a` FOREIGN KEY (`gathering_id`) REFERENCES `gatherings` (`id`),
  CONSTRAINT `FKrpe1d7whjc8hhsqqvst8xpkr` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gatherings_goods`
--

LOCK TABLES `gatherings_goods` WRITE;
/*!40000 ALTER TABLE `gatherings_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `gatherings_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gatherings_receivers`
--

DROP TABLE IF EXISTS `gatherings_receivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gatherings_receivers` (
  `gathering_id` bigint(20) NOT NULL,
  `receivers_id` bigint(20) NOT NULL,
  PRIMARY KEY (`gathering_id`,`receivers_id`),
  KEY `FKlnwsueachcdcky9sf833h2gl1` (`receivers_id`),
  CONSTRAINT `FKgubtl8tp05pmhulh8e2mibayl` FOREIGN KEY (`gathering_id`) REFERENCES `gatherings` (`id`),
  CONSTRAINT `FKlnwsueachcdcky9sf833h2gl1` FOREIGN KEY (`receivers_id`) REFERENCES `receivers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gatherings_receivers`
--

LOCK TABLES `gatherings_receivers` WRITE;
/*!40000 ALTER TABLE `gatherings_receivers` DISABLE KEYS */;
/*!40000 ALTER TABLE `gatherings_receivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'reusable clothes'),(2,'damaged clothes'),(3,'toys'),(4,'books'),(5,'other');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutions`
--

DROP TABLE IF EXISTS `institutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institutions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhb5jjadakkcss55lag0loy9ho` (`location_id`),
  CONSTRAINT `FKhb5jjadakkcss55lag0loy9ho` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutions`
--

LOCK TABLES `institutions` WRITE;
/*!40000 ALTER TABLE `institutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `additional_instructions` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `bag_num` bigint(20) NOT NULL,
  `city` varchar(40) COLLATE utf8_polish_ci NOT NULL,
  `created` datetime NOT NULL,
  `date` date NOT NULL,
  `postal_code` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `sent` bit(1) NOT NULL,
  `street` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `telephone` varchar(9) COLLATE utf8_polish_ci NOT NULL,
  `time` time NOT NULL,
  `institution_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5msj6k8isqx58wdpi2jqvwgn6` (`institution_id`),
  KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`),
  CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK5msj6k8isqx58wdpi2jqvwgn6` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_goods`
--

DROP TABLE IF EXISTS `orders_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_goods` (
  `offer_id` bigint(20) NOT NULL,
  `goods_id` bigint(20) NOT NULL,
  PRIMARY KEY (`offer_id`,`goods_id`),
  KEY `FKnsv6m7fvy9pmg1b122f7o62x1` (`goods_id`),
  CONSTRAINT `FKgwhbnjyleb4sm8ncsg6u4wnxa` FOREIGN KEY (`offer_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FKnsv6m7fvy9pmg1b122f7o62x1` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_goods`
--

LOCK TABLES `orders_goods` WRITE;
/*!40000 ALTER TABLE `orders_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_receivers`
--

DROP TABLE IF EXISTS `orders_receivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_receivers` (
  `offer_id` bigint(20) NOT NULL,
  `receivers_id` bigint(20) NOT NULL,
  PRIMARY KEY (`offer_id`,`receivers_id`),
  KEY `FKk677xm75rufeietg6sr245ivy` (`receivers_id`),
  CONSTRAINT `FKk677xm75rufeietg6sr245ivy` FOREIGN KEY (`receivers_id`) REFERENCES `receivers` (`id`),
  CONSTRAINT `FKroebf0t11phbtycpp60if2p09` FOREIGN KEY (`offer_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_receivers`
--

LOCK TABLES `orders_receivers` WRITE;
/*!40000 ALTER TABLE `orders_receivers` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_receivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receivers`
--

DROP TABLE IF EXISTS `receivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receivers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receivers`
--

LOCK TABLES `receivers` WRITE;
/*!40000 ALTER TABLE `receivers` DISABLE KEYS */;
INSERT INTO `receivers` VALUES (1,'kids'),(2,'mothers'),(3,'homeless'),(4,'disabled'),(5,'elders');
/*!40000 ALTER TABLE `receivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `enabled` bit(1) NOT NULL,
  `first_name` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `useruuid` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `validated` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@admin.pl',_binary '','Admin','Admin','$2a$10$tI9r/Ix1C5eeMA7eJJu6r.rZeho5CM2wYxAXpY9R3ZAulhbYTDpA6','8cf152d5-a1ae-455e-8e85-929f7e96880b',_binary '');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `user_id` bigint(20) NOT NULL,
  `roles_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`roles_id`),
  KEY `FKa62j07k5mhgifpp955h37ponj` (`roles_id`),
  CONSTRAINT `FK2o0jvgh89lemvvo17cbqvdxaa` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKa62j07k5mhgifpp955h37ponj` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-20 11:58:08
