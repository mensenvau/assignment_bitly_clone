-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: linkto
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.3

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
-- Table structure for table `USERS_SESSIONS`
--

DROP TABLE IF EXISTS `USERS_SESSIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERS_SESSIONS` (
  `session_id` int DEFAULT NULL,
  `expires` char(250) DEFAULT NULL,
  `data` char(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS_SESSIONS`
--

LOCK TABLES `USERS_SESSIONS` WRITE;
/*!40000 ALTER TABLE `USERS_SESSIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERS_SESSIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linklist`
--

DROP TABLE IF EXISTS `linklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `linklist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lfrom` char(100) NOT NULL,
  `lto` char(100) NOT NULL,
  `date` date DEFAULT NULL,
  `click` int DEFAULT NULL,
  `userid` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linklist`
--

LOCK TABLES `linklist` WRITE;
/*!40000 ALTER TABLE `linklist` DISABLE KEYS */;
INSERT INTO `linklist` VALUES (1,'https://www.npmjs.com/package/shortid','dX9Bs7RO0','2020-12-29',0,7),(2,'https://www.npmjs.com/package/shortidsdc','DX1l-Qf6r','2020-12-29',0,7),(3,'\'2\', \'https://www.npmjs.com/package/shortidsdc\', \'DX1l-Qf6r\', \'2020-12-29\', \'0\', \'7\'\n','DX1l-Qf6r','2020-12-29',0,6),(4,'https://www.npmjs.com/package/dfghjk','Uuj3scznB','2020-12-29',0,7),(5,'https://www.npmjs.com/package/dfghjk','OiTGn6JcC','2020-12-29',0,7),(6,'https://www.youtube.com/watch?v=-njy4-SY-90&t=11s','ARbAid2Q_','2020-12-29',0,11),(7,'https://www.youtube.com/watch?v=-njy4-SY-90&t=11s','mJ4gavq6a','2020-12-29',1,11),(8,'https://www.youtube.com/watch?v=AqRVFf5jYOM','TE6OLl3do','2020-12-29',4,12),(9,'https://www.youtube.com/watch?v=YY2mewmIge4&t=2s','dnBXd41mI','2020-12-29',0,12);
/*!40000 ALTER TABLE `linklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` char(60) CHARACTER SET ucs2 COLLATE ucs2_general_ci NOT NULL,
  `password` char(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'z','z'),(2,'zzzz','zzz'),(4,'otkir831szdx1@gmail.com','$2a$05$pHfRA8a1KlWKDjk2BlX9a.FEHRuBXiuiowUEcO.LVtqsWQYXay6fS'),(6,'otkir8311@gmail.com','$2a$05$.0VBbgWHOWVkzAjFhBdmp.SfsFL1yQBESoRWrfMCoMMCmQzGCodYm'),(7,'v@gmail.com','$2a$05$soovy6ojRsuaDsOD9LO8KeDDnU1SEOsFWga9GE54x3N76op/YAzcq'),(8,'otkiruz@gmail.com','$2a$05$5o6zZdhxPM9FXHMjneZNieIjIb70mdTTDQ4fYJRoNQ/r8JqX.cT.2'),(11,'otkiruzbek@gmail.com','$2a$05$TqaLF/blQHnBX1nFoconAu28ydr/vw2m7QIdIzdEdMV9lzEOP858O'),(12,'admin@gmail.com','$2a$05$ZkGHXVFLmCvbuYCTltydgOfhHGO0KWuY3Oi1nVZh2TePjlKGMX0hi');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-29 20:01:40
