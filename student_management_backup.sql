-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: student_management
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `course_id` int NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `duration_years` int DEFAULT NULL,
  `fees` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'MCA',2,120000.00),(2,'MBA',2,150000.00),(3,'BCA',3,90000.00),(4,'B.Com',3,60000.00),(5,'BBA',3,100000.00);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marks`
--

DROP TABLE IF EXISTS `marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marks` (
  `mark_id` int NOT NULL,
  `student_id` int DEFAULT NULL,
  `subject_name` varchar(100) NOT NULL,
  `marks_obtained` int DEFAULT NULL,
  `max_marks` int DEFAULT NULL,
  PRIMARY KEY (`mark_id`),
  KEY `idx_marks_student` (`student_id`),
  KEY `idx_marks_subject` (`subject_name`),
  CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marks`
--

LOCK TABLES `marks` WRITE;
/*!40000 ALTER TABLE `marks` DISABLE KEYS */;
INSERT INTO `marks` VALUES (1,101,'Java',85,100),(2,101,'Database',90,100),(3,101,'Operating Systems',78,100),(4,102,'C Programming',82,100),(5,102,'Mathematics',75,100),(6,102,'Computer Networks',88,100),(7,103,'Java',92,100),(8,103,'Database',86,100),(9,103,'Operating Systems',89,100),(10,104,'Accounting',80,100),(11,104,'Management',88,100),(12,104,'Business Economics',84,100),(13,105,'Financial Accounting',76,100),(14,105,'Business Law',81,100),(15,105,'Economics',79,100),(16,106,'Marketing',87,100),(17,106,'Management',83,100),(18,106,'Business Economics',91,100),(19,107,'C Programming',90,100),(20,107,'Mathematics',85,100),(21,107,'Computer Networks',80,100),(22,108,'Accounting',89,100),(23,108,'Management',77,100),(24,108,'Business Economics',86,100),(25,109,'Financial Accounting',92,100),(26,109,'Business Law',88,100),(27,109,'Economics',84,100),(28,110,'Marketing',79,100),(29,110,'Management',90,100),(30,110,'Business Economics',82,100);
/*!40000 ALTER TABLE `marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` int NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_students_name` (`student_name`),
  KEY `idx_students_course` (`course_id`),
  CONSTRAINT `fk_students_courses` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (101,'Gnaneswar','gnaneswar@gmail.com','Male',1),(102,'Yogendra','yogendra@gmail.com','Male',3),(103,'Reddy','reddy@gmail.com','Male',1),(104,'Priya','priya@gmail.com','Female',2),(105,'Sravani','sravani@gmail.com','Female',4),(106,'Kiran','kiran@gmail.com','Male',5),(107,'Harika','harika@gmail.com','Female',3),(108,'Manoj','manoj@gmail.com','Male',2),(109,'Divya','divya@gmail.com','Female',4),(110,'Arjun','arjun@gmail.com','Male',5);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-12 17:48:02
