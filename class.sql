-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: ams
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKq0uja26qgu1atulenwup9rxyr` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `is_present` bit(1) NOT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `students_id` int DEFAULT NULL,
  `timeslot_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9ngrhj2tsxh09cjjwbutb1neq` (`students_id`),
  KEY `FKmxo6kmqvybtka4cp6uc3pcdgm` (`timeslot_id`),
  CONSTRAINT `FK9ngrhj2tsxh09cjjwbutb1neq` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`),
  CONSTRAINT `FKmxo6kmqvybtka4cp6uc3pcdgm` FOREIGN KEY (`timeslot_id`) REFERENCES `timeslot` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `course_name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK61og8rbqdd2y28rx2et5fdnxd` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semester` (
  `id` int NOT NULL AUTO_INCREMENT,
  `end_date` date DEFAULT NULL,
  `semester_name` varchar(45) NOT NULL,
  `start_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL,
  `dob` date NOT NULL,
  `major` varchar(45) NOT NULL,
  `nrc_no` varchar(45) NOT NULL,
  `phone_no` varchar(45) NOT NULL,
  `register_date` date NOT NULL,
  `roll_no` varchar(45) NOT NULL,
  `semester` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKkxxyhbxd4ng0ng0l6ldsi47cc` (`nrc_no`),
  UNIQUE KEY `UKdqf52k0x0xhaoxq9a3vqkd457` (`roll_no`),
  CONSTRAINT `FKohos3j4bencc3qw2ecbmb2k3x` FOREIGN KEY (`id`) REFERENCES `account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `takes`
--

DROP TABLE IF EXISTS `takes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `takes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `section` varchar(45) DEFAULT NULL,
  `couses_id` int DEFAULT NULL,
  `students_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgp2er6y94xb0feok08ftfd7el` (`couses_id`),
  KEY `FKcpsu8jinx0t4ftrfl4e58c4oi` (`students_id`),
  CONSTRAINT `FKcpsu8jinx0t4ftrfl4e58c4oi` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`),
  CONSTRAINT `FKgp2er6y94xb0feok08ftfd7el` FOREIGN KEY (`couses_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teacher_has_course`
--

DROP TABLE IF EXISTS `teacher_has_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_has_course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `section` varchar(45) DEFAULT NULL,
  `courses_id` int DEFAULT NULL,
  `teaches_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdmjcgdo5vjaw498nqa4knwkfp` (`courses_id`),
  KEY `FKk8psgvw90i34y6ufwgax5rd5s` (`teaches_id`),
  CONSTRAINT `FKdmjcgdo5vjaw498nqa4knwkfp` FOREIGN KEY (`courses_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `FKk8psgvw90i34y6ufwgax5rd5s` FOREIGN KEY (`teaches_id`) REFERENCES `teachers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `id` int NOT NULL,
  `dob` date NOT NULL,
  `faculty` varchar(255) DEFAULT NULL,
  `highest_degree` varchar(45) NOT NULL,
  `nrc_no` varchar(45) NOT NULL,
  `phone_no` varchar(45) NOT NULL,
  `register_date` date NOT NULL,
  `semester` varchar(45) DEFAULT NULL,
  `teacher_rank` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKgmd0waqraquo45k5vqh3968tm` (`nrc_no`),
  CONSTRAINT `FK54999dn6y0suq6f4ofuvhopun` FOREIGN KEY (`id`) REFERENCES `account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timeslot`
--

DROP TABLE IF EXISTS `timeslot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timeslot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `day_of_week` varchar(45) NOT NULL,
  `end_time` varchar(45) NOT NULL,
  `start_time` varchar(45) NOT NULL,
  `courses_id` int DEFAULT NULL,
  `semester_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKi099h3slm8x3gllcufmgdg2mr` (`courses_id`),
  KEY `FKkj7e36is3mawyng82piqi0mdm` (`semester_id`),
  CONSTRAINT `FKi099h3slm8x3gllcufmgdg2mr` FOREIGN KEY (`courses_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `FKkj7e36is3mawyng82piqi0mdm` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'ams'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-08 20:39:42
