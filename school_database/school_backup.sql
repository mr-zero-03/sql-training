-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: school
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.10.1

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
-- Table structure for table `class_groups`
--

DROP TABLE IF EXISTS `class_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `monitor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class_id` (`class_id`,`group_id`),
  KEY `group_id` (`group_id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `monitor_id` (`monitor_id`),
  CONSTRAINT `class_groups_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `class_groups_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `subjects` (`id`),
  CONSTRAINT `class_groups_ibfk_3` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`),
  CONSTRAINT `class_groups_ibfk_4` FOREIGN KEY (`monitor_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_groups`
--

LOCK TABLES `class_groups` WRITE;
/*!40000 ALTER TABLE `class_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_topics`
--

DROP TABLE IF EXISTS `class_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `topic_number` int(11) NOT NULL,
  `topic` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class_topics` (`class_id`,`topic_number`),
  CONSTRAINT `class_topics_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `subjects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_topics`
--

LOCK TABLES `class_topics` WRITE;
/*!40000 ALTER TABLE `class_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` VALUES (1,10),(2,11);
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `grade_id` int(11) NOT NULL,
  `school_day` varchar(10) NOT NULL,
  `director_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groups` (`name`,`grade_id`,`school_day`),
  KEY `grade_id` (`grade_id`),
  KEY `director_id` (`director_id`),
  CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`id`),
  CONSTRAINT `groups_ibfk_2` FOREIGN KEY (`director_id`) REFERENCES `teachers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'10A-M',1,'MORNING',1),(2,'10B-M',1,'MORNING',2),(3,'10A-A',1,'AFTERNOON',2),(4,'10B-A',1,'AFTERNOON',3),(5,'11A-M',2,'MORNING',6),(6,'11B-M',2,'MORNING',5),(7,'11A-A',2,'AFTERNOON',4),(8,'11B-A',2,'AFTERNOON',1);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_notes`
--

DROP TABLE IF EXISTS `student_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `note` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_topic` (`topic_id`,`student_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `student_notes_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  CONSTRAINT `student_notes_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `subject_topics` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_notes`
--

LOCK TABLES `student_notes` WRITE;
/*!40000 ALTER TABLE `student_notes` DISABLE KEYS */;
INSERT INTO `student_notes` VALUES (1,1,1,5),(2,1,2,1.5),(3,1,3,4.5),(4,1,4,3.6),(5,1,5,4.2),(6,1,6,4.3),(7,1,7,2.6),(8,1,8,2.9),(9,1,9,1.9),(10,2,1,1.3),(11,2,2,4.5),(12,2,3,4.2),(13,2,4,4.2),(14,2,5,4.2),(15,2,6,3.3),(16,2,7,0.6),(17,2,8,4.8),(18,2,9,4.8),(19,3,1,4.9),(20,3,2,4.9),(21,3,3,3.1),(22,3,4,0.7),(23,3,5,2.7),(24,3,6,4.7),(25,3,7,0.3),(26,3,8,2.4),(27,3,9,4.2),(28,4,1,1.7),(29,4,2,3.8),(30,4,3,2.2),(31,4,4,0.8),(32,4,5,0.7),(33,4,6,0.6),(34,4,7,1.3),(35,4,8,0.1),(36,4,9,3.6),(37,5,1,2),(38,5,2,0.2),(39,5,3,0.2),(40,5,4,2.3),(41,5,5,4.5),(42,5,6,3.5),(43,5,7,1.8),(44,5,8,1.5),(45,5,9,3.5),(46,6,1,0.7),(47,6,2,3.5),(48,6,3,3.1),(49,6,4,2.6),(50,6,5,2.3),(51,6,6,1),(52,6,7,4.2),(53,6,8,2.8),(54,6,9,4.4),(55,7,1,2.4),(56,7,2,2.4),(57,7,3,4.2),(58,7,4,4.7),(59,7,5,0.2),(60,7,6,4.2),(61,7,7,0.3),(62,7,8,2.3),(63,7,9,4.2),(64,8,1,0.5),(65,8,2,0.2),(66,8,3,4.4),(67,8,4,0.8),(68,8,5,3.7),(69,8,6,0.4),(70,8,7,4.3),(71,8,8,3.1),(72,8,9,3.4),(73,9,1,3.6),(74,9,2,2),(75,9,3,1.5),(76,9,4,3.7),(77,9,5,0.6),(78,9,6,2.5),(79,9,7,4),(80,9,8,0.5),(81,9,9,1.2),(82,10,1,2.2),(83,10,2,2.5),(84,10,3,0.7),(85,10,4,3.1),(86,10,5,0.2),(87,10,6,0.6),(88,10,7,0.7),(89,10,8,4.6),(90,10,9,1.5),(91,11,1,4.5),(92,11,2,1.8),(93,11,3,2.2),(94,11,4,5),(95,11,5,1.5),(96,11,6,3.2),(97,11,7,1.2),(98,11,8,2.1),(99,11,9,2.7),(100,12,1,1.7),(101,12,2,3.6),(102,12,3,3.2),(103,12,4,0.5),(104,12,5,3.3),(105,12,6,5),(106,12,7,4),(107,12,8,3.2),(108,12,9,0.4),(109,13,1,1.9),(110,13,2,3.9),(111,13,3,3.3),(112,13,4,0.5),(113,13,5,1.7),(114,13,6,2.1),(115,13,7,1.9),(116,13,8,0.3),(117,13,9,0.1),(118,14,10,0.6),(119,14,11,4.1),(120,14,12,0.9),(121,14,13,2.8),(122,14,14,1),(123,14,15,3.3),(124,14,16,3.3),(125,14,17,0.2),(126,14,18,2.5),(127,15,10,2.3),(128,15,11,0.5),(129,15,12,4.9),(130,15,13,1.7),(131,15,14,4.5),(132,15,15,4.7),(133,15,16,1),(134,15,17,2.1),(135,15,18,0.6),(136,16,10,2.6),(137,16,11,4.7),(138,16,12,4.8),(139,16,13,4.1),(140,16,14,2.9),(141,16,15,0.8),(142,16,16,1.6),(143,16,17,3.3),(144,16,18,3.5),(145,17,10,4.8),(146,17,11,4.2),(147,17,12,4.6),(148,17,13,1.7),(149,17,14,1),(150,17,15,2.6),(151,17,16,0.8),(152,17,17,4.9),(153,17,18,4.5),(154,18,10,0.2),(155,18,11,3.6),(156,18,12,2),(157,18,13,2.6),(158,18,14,1.5),(159,18,15,2.9),(160,18,16,1.2),(161,18,17,2.3),(162,18,18,3.1),(163,19,10,4.1),(164,19,11,4.8),(165,19,12,4),(166,19,13,4.2),(167,19,14,3.2),(168,19,15,1.6),(169,19,16,0.7),(170,19,17,2.4),(171,19,18,0.3),(172,20,10,2.7),(173,20,11,2.7),(174,20,12,4.6),(175,20,13,1.2),(176,20,14,1.6),(177,20,15,2),(178,20,16,1),(179,20,17,2.1),(180,20,18,1.8),(181,21,10,0.5),(182,21,11,2.2),(183,21,12,0.8),(184,21,13,0.7),(185,21,14,3.3),(186,21,15,2.3),(187,21,16,1.7),(188,21,17,3.8),(189,21,18,2.8),(190,22,10,1.6),(191,22,11,3.6),(192,22,12,2.7),(193,22,13,0.3),(194,22,14,3.1),(195,22,15,1.7),(196,22,16,0.6),(197,22,17,4.5),(198,22,18,2.3),(199,23,10,0.5),(200,23,11,4.4),(201,23,12,0.5),(202,23,13,0.1),(203,23,14,4.5),(204,23,15,0.9),(205,23,16,1.1),(206,23,17,1.2),(207,23,18,1.1);
/*!40000 ALTER TABLE `student_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identity_card` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identity_card` (`identity_card`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,912345678,'Ximena','Barbosa Gaitan','M',1),(2,456789123,'Manuel Esteban','Palacio Calderón','M',1),(3,678912345,'Karla Sofia','Pedraza Rojas','F',1),(4,345678912,'Glendel Joubert','Fyne Acosta','M',2),(5,123456789,'Daniel Santiago','Pérez Ducuara','M',2),(6,789123456,'Alejandra','Viera Rojas','F',2),(7,234567891,'Julian David','Galindo León','M',2),(8,891234567,'Nicol Alejandra','Ducuara Tocora','F',3),(9,123456798,'Laura','Pérez Osorio','F',3),(10,123456879,'Mia','Rodriguez Pedraza','M',3),(11,987654321,'Elizabeth Sofia','Acosta Figueroa','F',4),(12,876543219,'Kevin','León Patiño','M',4),(13,765432198,'Sara Alejandra','Osorio León','F',4),(14,654321987,'Cesar Adrián','Pérez Osorio','M',5),(15,543219876,'Gabriel Felipe','Patiño López','M',5),(16,432198765,'Héctor Iván','Martínez Sánchez','M',5),(17,321987654,'Lily','Sánchez Restrepo','F',6),(18,219876543,'Sara Isabella','Tocora Pino','F',6),(19,198765432,'Jaime','Velez López','M',7),(20,102030405,'Omar','Guerra Molina','M',7),(21,203040500,'Chloe','Molina Osorio','F',7),(22,906040805,'Alessia Sara','Toro Estrada','F',8),(23,105070903,'Miguel Angel','Piedrahita Castro','M',8);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_groups`
--

DROP TABLE IF EXISTS `subject_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `monitor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject_id` (`subject_id`,`group_id`),
  KEY `group_id` (`group_id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `monitor_id` (`monitor_id`),
  CONSTRAINT `subject_groups_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `subject_groups_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  CONSTRAINT `subject_groups_ibfk_3` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`),
  CONSTRAINT `subject_groups_ibfk_4` FOREIGN KEY (`monitor_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_groups`
--

LOCK TABLES `subject_groups` WRITE;
/*!40000 ALTER TABLE `subject_groups` DISABLE KEYS */;
INSERT INTO `subject_groups` VALUES (1,1,1,1,1),(2,1,2,2,1),(3,1,3,5,2),(4,2,1,6,4),(5,2,2,4,5),(6,2,3,3,6),(7,3,1,6,8),(8,3,2,2,8),(9,3,3,6,8),(10,4,1,1,11),(11,4,2,2,13),(12,4,3,3,12),(13,5,4,5,15),(14,5,5,1,16),(15,5,6,2,16),(16,6,4,6,17),(17,6,5,6,17),(18,6,6,4,18),(19,7,4,1,20),(20,7,5,1,20),(21,7,6,2,21),(22,8,4,3,22),(23,8,5,5,23),(24,8,6,4,23);
/*!40000 ALTER TABLE `subject_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_topics`
--

DROP TABLE IF EXISTS `subject_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject_topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) NOT NULL,
  `topic_number` int(11) NOT NULL,
  `topic` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject_topics` (`subject_id`,`topic_number`),
  CONSTRAINT `subject_topics_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_topics`
--

LOCK TABLES `subject_topics` WRITE;
/*!40000 ALTER TABLE `subject_topics` DISABLE KEYS */;
INSERT INTO `subject_topics` VALUES (1,1,1,'Linear Equations'),(2,1,2,'Inequalities'),(3,1,3,'Functions'),(4,2,1,'History of the country'),(5,2,2,'Social Movements'),(6,2,3,'Human Rights'),(7,3,1,'Sine(sin) and Cosine(cos)'),(8,3,2,'Tangent(tan) and Cotangent(cot)'),(9,3,3,'Secant(sec) and Cosecant(csc)'),(10,4,1,'Limits and Continuity'),(11,4,2,'Integrals'),(12,4,3,'Series'),(13,5,1,'Spaces and Vectors'),(14,5,2,'Matrix Transformations'),(15,5,3,'Bases'),(16,6,1,'Existentialism'),(17,6,2,'Stoicism'),(18,6,3,'Logic and Argumentation');
/*!40000 ALTER TABLE `subject_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `grade_id` int(11) NOT NULL,
  `coordinator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grade_id` (`grade_id`),
  KEY `coordinator_id` (`coordinator_id`),
  CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`id`),
  CONSTRAINT `subjects_ibfk_2` FOREIGN KEY (`coordinator_id`) REFERENCES `teachers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Algebra',1,5),(2,'Social Sciences',1,4),(3,'Trigonometry ',1,3),(4,'Calculus',2,5),(5,'Linear Algebra',2,5),(6,'Philosophy',2,4);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenship_card` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `sex` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenship_card` (`citizenship_card`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,12345,'Hugo Ernesto','Francois Rosas','M'),(2,23451,'Ava','García Hernandez','F'),(3,34512,'Lucas Nicolas','Gómez Lopez','M'),(4,45123,'Alba María','Sánchez Pérez','F'),(5,51234,'Walter Sebastián','López Gómez','M'),(6,13524,'Ainara','Rosas Céspedes','F');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-21 14:43:34
