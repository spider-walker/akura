/*
 * < �KURA, This application manages the daily activities of a Teacher and a Student of a School>
 *
 * Copyright (C) 2012 Virtusa Corporation.
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of 
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

USE `akura`;

--
-- Dumping data for table `USER_ROLE`
--
LOCK TABLES `USER_ROLE` WRITE;
/*!40000 ALTER TABLE `USER_ROLE` DISABLE KEYS */;
INSERT INTO `USER_ROLE` (`USER_ROLE_ID`,`ROLE`,`DESCRIPTION`,`MODIFIED_TIME`) 
VALUES (1,'Admin','admin','2011-10-21 18:25:59'),
(2,'Teacher','Teacher','2011-10-21 18:25:59'),
(3,'Student','Student','2011-10-21 18:25:59'),
(4,'Clerical Staff','Clerical Staff Member Role','2012-01-23 13:35:09');
/*!40000 ALTER TABLE `USER_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `USER_LOGIN`
--
LOCK TABLES `USER_LOGIN` WRITE;
/*!40000 ALTER TABLE `USER_LOGIN` DISABLE KEYS */;
INSERT INTO `USER_LOGIN` (`USER_LOGIN_ID`,`USER_ROLE_ID`,`FIRST_NAME`,`LAST_NAME`,`EMAIL`,`USERNAME`,`PASSWORD`,`STATUS`,`LOGIN_ATTEMPTS`,`USER_IDENTIFICATION_NO`,`MODIFIED_TIME`) 
VALUES (1,1,'Administrator','User','user@mail.com','admin','ceb4f32325eda6142bd65215f4c0f371',1,0,NULL,'2011-11-17 11:23:05');
/*!40000 ALTER TABLE `USER_LOGIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `CLASS`
--
LOCK TABLES `CLASS` WRITE;
/*!40000 ALTER TABLE `CLASS` DISABLE KEYS */;
INSERT INTO `CLASS` (`CLASS_ID`,`DESCRIPTION`,`MODIFIED_TIME`) VALUES 
 (1,'A','2011-09-06 15:20:36'),
 (2,'B','2011-09-06 15:38:51'),
 (3,'C','2011-09-06 15:38:51'),
 (4,'D','2011-09-06 15:38:51'),
 (5,'E','2011-09-06 15:38:51'),
 (6,'F','2011-09-06 15:38:51'),
 (7,'G','2011-09-06 15:38:51'),
 (8,'H','2011-09-06 15:38:51'),
 (9,'I','2011-09-06 15:38:51'),
 (10,'J','2011-09-06 15:38:51');
/*!40000 ALTER TABLE `CLASS` ENABLE KEYS */;
UNLOCK TABLES;
 
--
-- Dumping data for table `WARNING_LEVEL`
--
LOCK TABLES `WARNING_LEVEL` WRITE;
/*!40000 ALTER TABLE `WARNING_LEVEL` DISABLE KEYS */;
INSERT INTO `WARNING_LEVEL` (`WARNING_LEVEL_ID`,`DESCRIPTION`,`COLOUR`,`MODIFIED_TIME`) VALUES 
(1,'Bad','Red','2011-09-06 15:20:36'),
(2,'Average','Amber','2011-09-06 15:20:36');
/*!40000 ALTER TABLE `WARNING_LEVEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `LANGUAGE`
--
LOCK TABLES `LANGUAGE` WRITE;
/*!40000 ALTER TABLE `LANGUAGE` DISABLE KEYS */;
INSERT INTO `LANGUAGE` (`LANGUAGE_ID`,`LANGUAGE`,`MODIFIED_TIME`) VALUES 
(1,'Sinhala','2011-10-10 00:00:00'),
(2,'Tamil','2011-11-17 17:06:57'),
(3,'English','2011-11-17 17:06:57');
/*!40000 ALTER TABLE `LANGUAGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `PREFECT_TYPE`
--
LOCK TABLES `PREFECT_TYPE` WRITE;
/*!40000 ALTER TABLE `PREFECT_TYPE` DISABLE KEYS */;
INSERT INTO `PREFECT_TYPE` (`PREFECT_TYPE_ID`,`DESCRIPTION`,`MODIFIED_TIME`) VALUES 
(1,'Prefect - Head','2011-10-20 12:53:21'),
(2,'Prefect - Deputy','2011-10-20 12:53:21'),
(3,'Prefect - Senior','2011-10-20 12:53:21'),
(4,'Prefect - Junior','2011-10-20 12:53:21');
/*!40000 ALTER TABLE `PREFECT_TYPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `PROVINCE`
--
LOCK TABLES `PROVINCE` WRITE;
/*!40000 ALTER TABLE `PROVINCE` DISABLE KEYS */;
INSERT INTO `PROVINCE` VALUES (1,'Western','2012-01-03 11:28:24'),(2,'Central','2012-01-03 11:28:33'),(3,'North Central','2012-01-03 11:32:09'),(4,'North Eastern','2012-01-03 11:32:41'),(5,'North Western','2012-01-03 11:32:57'),(6,'Uva','2012-01-03 11:33:15'),(7,'Eastern','2012-01-03 11:35:55'),(8,'Southern','2012-01-03 11:36:15'),(9,'Sabaragamuwa','2012-01-03 11:36:32');
/*!40000 ALTER TABLE `PROVINCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `DISTRICT`
--
LOCK TABLES `DISTRICT` WRITE;
/*!40000 ALTER TABLE `DISTRICT` DISABLE KEYS */;
INSERT INTO `DISTRICT` VALUES (1,'Colombo District',1,'2012-01-03 11:39:50'),(2,'Gampaha District',1,'2012-01-03 11:40:10'),(3,'Kaluthara District',1,'2012-01-03 11:40:26');
/*!40000 ALTER TABLE `DISTRICT` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `CITY`
--
LOCK TABLES `CITY` WRITE;
/*!40000 ALTER TABLE `CITY` DISABLE KEYS */;
INSERT INTO `CITY` VALUES (1,'Colombo',1,'2012-01-03 11:40:46'),(2,'Gampaha',2,'2012-01-03 11:41:01'),(3,'Kaluthara',3,'2012-01-03 11:41:10'),(4,'Dehiwala - Mount Lavinia',1,'2012-01-03 11:41:38'),(5,'Homagama',1,'2012-01-03 11:41:53'),(6,'Maharagama',1,'2012-01-03 11:42:05'),(7,'Moratuwa',1,'2012-01-03 11:42:47'),(8,'Nittambuwa',2,'2012-01-03 11:43:22'),(9,'Wattala',2,'2012-01-03 11:46:35'),(10,'Negombo',2,'2012-01-03 11:46:54'),(11,'Panadura',3,'2012-01-03 11:45:03'),(12,'Ja-Ela',2,'2012-01-03 11:45:25'),(13,'Awissawella',1,'2012-01-03 11:48:01');
/*!40000 ALTER TABLE `CITY` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `METHOD_OF_TRAVEL`
--
LOCK TABLES `METHOD_OF_TRAVEL` WRITE;
/*!40000 ALTER TABLE `METHOD_OF_TRAVEL` DISABLE KEYS */;
INSERT INTO `METHOD_OF_TRAVEL` VALUES (1,'By School van','2012-01-03 12:04:10'),(2,'By School Bus','2012-01-03 12:04:19'),(3,'By Train','2012-01-03 12:04:29'),(4,'By Private Vehicle','2012-01-03 12:04:59'),(5,'Public Transport','2012-01-03 12:07:23');
/*!40000 ALTER TABLE `METHOD_OF_TRAVEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `BLOOD_GROUP`
--
LOCK TABLES `BLOOD_GROUP` WRITE;
/*!40000 ALTER TABLE `BLOOD_GROUP` DISABLE KEYS */;
INSERT INTO `BLOOD_GROUP` VALUES (1,'A+','2012-01-03 12:02:48'),(2,'A-','2012-01-03 12:02:53'),(3,'B+','2012-01-03 12:03:04'),(4,'B-','2012-01-03 12:03:09'),(5,'AB+','2012-01-03 12:03:20'),(6,'AB-','2012-01-03 12:03:25'),(7,'O+','2012-01-03 12:03:31'),(8,'O-','2012-01-03 12:03:36');
/*!40000 ALTER TABLE `BLOOD_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `RELIGION`
--
LOCK TABLES `RELIGION` WRITE;
/*!40000 ALTER TABLE `RELIGION` DISABLE KEYS */;
INSERT INTO `RELIGION` VALUES (1,'Buddhism','2012-01-03 11:50:15'),(2,'Islam','2012-01-03 11:50:29'),(3,'Hinduism','2012-01-03 11:51:08'),(4,'Christianity','2012-01-03 11:51:34');
/*!40000 ALTER TABLE `RELIGION` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `NATIONALITY`
--
LOCK TABLES `NATIONALITY` WRITE;
/*!40000 ALTER TABLE `NATIONALITY` DISABLE KEYS */;
INSERT INTO `NATIONALITY` VALUES (1,'Sri Lankan','2012-01-03 12:00:41'),(2,'Indian','2012-01-03 12:00:48'),(3,'American','2012-01-03 12:00:54'),(4,'British','2012-01-03 12:01:00');
/*!40000 ALTER TABLE `NATIONALITY` ENABLE KEYS */;

--
-- Dumping data for table `DONATION_TYPE`
--
LOCK TABLES `DONATION_TYPE` WRITE;
/*!40000 ALTER TABLE `DONATION_TYPE` DISABLE KEYS */;
INSERT INTO `DONATION_TYPE` VALUES (1,'Money','2012-01-03 12:00:41'),(2,'Goods','2012-01-03 12:00:48');
/*!40000 ALTER TABLE `DONATION_TYPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `TERM`
--

LOCK TABLES `TERM` WRITE;
/*!40000 ALTER TABLE `TERM` DISABLE KEYS */;
INSERT INTO `TERM` VALUES (1,'Term 1','2012-01-01','2012-04-15','2012-02-13 07:14:46'),(2,'Term 2','2012-05-01','2012-08-15','2012-02-13 07:15:09'),(3,'Term 3','2012-09-01','2012-12-31','2012-02-13 07:15:33');
/*!40000 ALTER TABLE `TERM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `SUB_TERM`
--

LOCK TABLES `SUB_TERM` WRITE;
/*!40000 ALTER TABLE `SUB_TERM` DISABLE KEYS */;
INSERT INTO `SUB_TERM` VALUES (1,1,'I','2012-01-01','2012-02-20','2012-02-13 07:16:09'),(2,1,'II','2012-02-21','2012-04-15','2012-02-13 07:16:30'),(3,2,'I','2012-05-01','2012-06-20','2012-02-13 07:16:57'),(4,2,'II','2012-06-21','2012-08-15','2012-02-13 07:19:01'),(5,3,'I','2012-09-01','2012-10-20','2012-02-13 07:17:58'),(6,3,'II','2012-10-21','2012-12-31','2012-02-13 07:18:16');
/*!40000 ALTER TABLE `SUB_TERM` ENABLE KEYS */;
UNLOCK TABLES;

