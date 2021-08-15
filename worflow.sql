-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: workflow
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `msg_id` int NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `message_type` varchar(10) NOT NULL,
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (14,'don\'t expect that any time sooner !! lol','approve'),(15,'hahahahah','approve'),(16,'You dont get to enjoy . I get ,hahaha','deny'),(17,'Sorry Got Rejected','deny'),(18,'kuddos !!','approve'),(19,'working','approve'),(20,'working','approve'),(21,'gooo booyys','approve'),(22,'as','approve');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages_has_users`
--

DROP TABLE IF EXISTS `messages_has_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages_has_users` (
  `messages_msg_id` int NOT NULL,
  `users_user_id` int NOT NULL,
  PRIMARY KEY (`messages_msg_id`,`users_user_id`),
  KEY `fk_messages_has_users_users1_idx` (`users_user_id`),
  KEY `fk_messages_has_users_messages1_idx` (`messages_msg_id`),
  CONSTRAINT `fk_messages_has_users_messages1` FOREIGN KEY (`messages_msg_id`) REFERENCES `messages` (`msg_id`),
  CONSTRAINT `fk_messages_has_users_users1` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages_has_users`
--

LOCK TABLES `messages_has_users` WRITE;
/*!40000 ALTER TABLE `messages_has_users` DISABLE KEYS */;
INSERT INTO `messages_has_users` VALUES (15,2),(19,2),(20,2),(17,4),(14,6),(18,6),(21,6),(22,6),(16,7);
/*!40000 ALTER TABLE `messages_has_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `path`
--

DROP TABLE IF EXISTS `path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `path` (
  `path_id` int NOT NULL AUTO_INCREMENT,
  `state` tinyint NOT NULL DEFAULT '0',
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`path_id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `path`
--

LOCK TABLES `path` WRITE;
/*!40000 ALTER TABLE `path` DISABLE KEYS */;
INSERT INTO `path` VALUES (131,2,'Manager'),(132,1,'Lead'),(133,2,'developer'),(134,1,'Lead'),(135,2,'manager'),(136,1,'Lead'),(137,1,'manager'),(138,0,'developer'),(139,0,'lead'),(140,1,'manager'),(141,0,'developer'),(142,0,'Lead'),(143,2,'manager'),(144,1,'developer'),(145,0,'Lead'),(146,1,'developer'),(147,0,'lead'),(148,1,'developer'),(149,0,'manager'),(150,1,'manager'),(151,0,'developer');
/*!40000 ALTER TABLE `path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `path_has_steptracker`
--

DROP TABLE IF EXISTS `path_has_steptracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `path_has_steptracker` (
  `Path_path_id` int NOT NULL,
  `steptracker_step_id` int NOT NULL,
  PRIMARY KEY (`Path_path_id`,`steptracker_step_id`),
  KEY `fk_Path_has_steptracker_steptracker1_idx` (`steptracker_step_id`),
  KEY `fk_Path_has_steptracker_Path1_idx` (`Path_path_id`),
  CONSTRAINT `fk_Path_has_steptracker_Path1` FOREIGN KEY (`Path_path_id`) REFERENCES `path` (`path_id`),
  CONSTRAINT `fk_Path_has_steptracker_steptracker1` FOREIGN KEY (`steptracker_step_id`) REFERENCES `steptracker` (`step_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `path_has_steptracker`
--

LOCK TABLES `path_has_steptracker` WRITE;
/*!40000 ALTER TABLE `path_has_steptracker` DISABLE KEYS */;
INSERT INTO `path_has_steptracker` VALUES (131,18),(133,19),(135,20),(137,21),(140,22),(143,23),(146,24),(148,25),(150,26);
/*!40000 ALTER TABLE `path_has_steptracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL,
  `role_name` varchar(45) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Developer'),(2,'Manager'),(3,'Lead'),(4,'Ceo');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_has_messages`
--

DROP TABLE IF EXISTS `roles_has_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_has_messages` (
  `roles_role_id` int NOT NULL,
  `messages_msg_id` int NOT NULL,
  PRIMARY KEY (`roles_role_id`,`messages_msg_id`),
  KEY `fk_roles_has_messages_messages1_idx` (`messages_msg_id`),
  KEY `fk_roles_has_messages_roles1_idx` (`roles_role_id`),
  CONSTRAINT `fk_roles_has_messages_messages1` FOREIGN KEY (`messages_msg_id`) REFERENCES `messages` (`msg_id`),
  CONSTRAINT `fk_roles_has_messages_roles1` FOREIGN KEY (`roles_role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_has_messages`
--

LOCK TABLES `roles_has_messages` WRITE;
/*!40000 ALTER TABLE `roles_has_messages` DISABLE KEYS */;
INSERT INTO `roles_has_messages` VALUES (1,14),(3,15),(1,16),(2,17),(3,18),(3,19),(3,20),(3,21),(1,22);
/*!40000 ALTER TABLE `roles_has_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `steptracker`
--

DROP TABLE IF EXISTS `steptracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `steptracker` (
  `step_id` int NOT NULL AUTO_INCREMENT,
  `step_start` int NOT NULL,
  `step_end` int NOT NULL,
  PRIMARY KEY (`step_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `steptracker`
--

LOCK TABLES `steptracker` WRITE;
/*!40000 ALTER TABLE `steptracker` DISABLE KEYS */;
INSERT INTO `steptracker` VALUES (18,131,132),(19,133,134),(20,135,136),(21,137,139),(22,140,142),(23,143,145),(24,146,147),(25,148,149),(26,150,151);
/*!40000 ALTER TABLE `steptracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `first_Name` varchar(30) NOT NULL,
  `last_Name` varchar(30) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `phone_No` varchar(10) DEFAULT NULL,
  `Role` varchar(25) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Eren','Yeager','yeagar_eren@titan.com','Sparkes','1239114569','developer','eren_Vanguard_titan'),(4,'Nezuko','Chan','nezuko@tslayer.com','tanjiro','1239114567','developer','eren_Vanguard_tit'),(6,'Tanjiro','Kamado','kamado@demon_corpse.in','kamado','1245865258','manager','kamado12'),(7,'Naruto','Uzumaki','uzumake@konaha.in','hinata','5655891566','lead','naruto_kyubi'),(8,'Sasuke','Uchiha','uchiha@anbu.na','sarada','9945171799','lead','Sasuke_uchiha6'),(9,'Tsunade','Senju','tsunade@konaha.in','jiraiya','9980164443','manager','senju_5th_hokage');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_has_roles`
--

DROP TABLE IF EXISTS `users_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_has_roles` (
  `Users_user_id` int NOT NULL,
  `roles_role_id` int NOT NULL,
  PRIMARY KEY (`Users_user_id`,`roles_role_id`),
  KEY `fk_Users_has_roles_roles1_idx` (`roles_role_id`),
  KEY `fk_Users_has_roles_Users1_idx` (`Users_user_id`),
  CONSTRAINT `fk_Users_has_roles_roles1` FOREIGN KEY (`roles_role_id`) REFERENCES `roles` (`role_id`),
  CONSTRAINT `fk_Users_has_roles_Users1` FOREIGN KEY (`Users_user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_has_roles`
--

LOCK TABLES `users_has_roles` WRITE;
/*!40000 ALTER TABLE `users_has_roles` DISABLE KEYS */;
INSERT INTO `users_has_roles` VALUES (2,1),(4,1),(6,2),(9,2),(7,3),(8,3);
/*!40000 ALTER TABLE `users_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_has_workflow`
--

DROP TABLE IF EXISTS `users_has_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_has_workflow` (
  `Users_user_id` int NOT NULL,
  `workflow_workflow_id` int NOT NULL,
  PRIMARY KEY (`Users_user_id`,`workflow_workflow_id`),
  KEY `fk_Users_has_workflow_workflow1_idx` (`workflow_workflow_id`),
  KEY `fk_Users_has_workflow_Users_idx` (`Users_user_id`),
  CONSTRAINT `fk_Users_has_workflow_Users` FOREIGN KEY (`Users_user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_Users_has_workflow_workflow1` FOREIGN KEY (`workflow_workflow_id`) REFERENCES `workflow` (`workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_has_workflow`
--

LOCK TABLES `users_has_workflow` WRITE;
/*!40000 ALTER TABLE `users_has_workflow` DISABLE KEYS */;
INSERT INTO `users_has_workflow` VALUES (6,11),(7,11),(8,11),(9,11),(2,12),(4,12),(7,12),(8,12),(6,13),(7,13),(8,13),(9,13),(2,14),(4,14),(6,14),(7,14),(8,14),(9,14),(2,15),(4,15),(6,15),(7,15),(8,15),(9,15),(2,16),(4,16),(6,16),(7,16),(8,16),(9,16),(2,17),(4,17),(7,17),(8,17),(2,18),(4,18),(6,18),(9,18),(2,19),(4,19),(6,19),(9,19);
/*!40000 ALTER TABLE `users_has_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow`
--

DROP TABLE IF EXISTS `workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow` (
  `workflow_id` int NOT NULL AUTO_INCREMENT,
  `workflow_name` varchar(45) NOT NULL,
  PRIMARY KEY (`workflow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow`
--

LOCK TABLES `workflow` WRITE;
/*!40000 ALTER TABLE `workflow` DISABLE KEYS */;
INSERT INTO `workflow` VALUES (11,'Amazeball'),(12,'Awesome'),(13,'Fanatic'),(14,'Fanatic'),(15,'Astounding'),(16,'Titan'),(17,'Kyubi'),(18,'Shukaku'),(19,'hotel management');
/*!40000 ALTER TABLE `workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_has_path`
--

DROP TABLE IF EXISTS `workflow_has_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_has_path` (
  `workflow_workflow_id` int NOT NULL,
  `Path_path_id` int NOT NULL,
  PRIMARY KEY (`workflow_workflow_id`,`Path_path_id`),
  KEY `fk_workflow_has_Path_Path1_idx` (`Path_path_id`),
  KEY `fk_workflow_has_Path_workflow1_idx` (`workflow_workflow_id`),
  CONSTRAINT `fk_workflow_has_Path_Path1` FOREIGN KEY (`Path_path_id`) REFERENCES `path` (`path_id`),
  CONSTRAINT `fk_workflow_has_Path_workflow1` FOREIGN KEY (`workflow_workflow_id`) REFERENCES `workflow` (`workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_has_path`
--

LOCK TABLES `workflow_has_path` WRITE;
/*!40000 ALTER TABLE `workflow_has_path` DISABLE KEYS */;
INSERT INTO `workflow_has_path` VALUES (11,131),(12,133),(13,135),(14,137),(15,140),(16,143),(17,146),(18,148),(19,150);
/*!40000 ALTER TABLE `workflow_has_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'workflow'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-15 19:24:13
