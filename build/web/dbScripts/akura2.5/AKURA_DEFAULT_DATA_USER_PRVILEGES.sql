
USE `akura`;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

--
-- Dumping data for table `TAB`
--

LOCK TABLES `TAB` WRITE;
/*!40000 ALTER TABLE `TAB` DISABLE KEYS */;
INSERT INTO `TAB` (TAB_ID,NAME,PARENT_TAB_ID,MODULE_ID,INDEX_NO,MODIFIED_TIME) VALUES (51, 'Attendance Dashboard', 33, 6, 4,'2013-01-29 02:29:16');
/*!40000 ALTER TABLE `TAB` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `PAGE`
--

LOCK TABLES `PAGE` WRITE;
/*!40000 ALTER TABLE `PAGE` DISABLE KEYS */;
INSERT INTO `PAGE` (PAGE_ID,NAME,URL,TAB_ID,INDEX_NO,MODIFIED_TIME) VALUES (95, 'Attendance Dashboard', 'attendanceDashboard.htm', 51, 47,'2013-01-29 02:29:16');
/*!40000 ALTER TABLE `PAGE` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `PRIVILEGE`
--

LOCK TABLES `PRIVILEGE` WRITE;
/*!40000 ALTER TABLE `PRIVILEGE` DISABLE KEYS */;
INSERT INTO `PRIVILEGE` (PRIVILEGE_ID,NAME,PAGE_ID,MODIFIED_TIME) VALUES (299,'Attendance Dashboard',95,'2013-01-29 02:29:16'),(300,'View Grade Wise Best Student Attendance Report',61,'2013-01-29 02:29:16');
/*!40000 ALTER TABLE `PRIVILEGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ROLE_PRIVILEGE`
--
LOCK TABLES `ROLE_PRIVILEGE` WRITE;
/*!40000 ALTER TABLE `ROLE_PRIVILEGE` DISABLE KEYS */;
INSERT INTO `ROLE_PRIVILEGE` (USER_ROLE_ID,PRIVILEGE_ID,MODIFIED_TIME) VALUES (2,289,'2013-01-09 07:17:45'),(2,294,'2013-01-11 07:17:45'),(1,299,'2013-01-29 02:29:16'),(2,299,'2013-01-29 02:29:16'),(1,300,'2013-01-29 02:29:16'),(2,300,'2013-01-29 02:29:16');
/*!40000 ALTER TABLE `ROLE_PRIVILEGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ROLE_TAB`
--

LOCK TABLES `ROLE_TAB` WRITE;
/*!40000 ALTER TABLE `ROLE_TAB` DISABLE KEYS */;
INSERT INTO `ROLE_TAB` (TAB_ID,USER_ROLE_ID,MODIFIED_TIME) VALUES (51, 1,'2013-01-09 07:17:45'),(51, 2,'2013-01-09 07:17:45');
/*!40000 ALTER TABLE `ROLE_TAB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Name Changes of the page tables
-- 
UPDATE PAGE SET `NAME`='Manage Classes' WHERE `PAGE_ID`='47';
UPDATE PAGE SET `NAME`='Manage Donation Type' WHERE `PAGE_ID`='48';
UPDATE PAGE SET `NAME`='Manage Grading Information' WHERE `PAGE_ID`='50';


--
-- Student Anual report data changes.
--
LOCK TABLES `PRIVILEGE` WRITE;
/*!40000 ALTER TABLE `PRIVILEGE` DISABLE KEYS */;
UPDATE PRIVILEGE SET `NAME`='View Annual Student Attendance Report', `PAGE_ID`=61 WHERE `PRIVILEGE_ID`='294';
UPDATE `PRIVILEGE` SET NAME='View Grade Wise Term Marks Graph' WHERE PRIVILEGE_ID=187;
/*!40000 ALTER TABLE `PRIVILEGE` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `PAGE` WRITE;
/*!40000 ALTER TABLE `PAGE` DISABLE KEYS */;
DELETE FROM PAGE WHERE `PAGE_ID`='92';
/*!40000 ALTER TABLE `PAGE` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Delete Blood donation, role privillages' table data.
--
LOCK TABLES `ROLE_PRIVILEGE` WRITE;
/*!40000 ALTER TABLE `ROLE_PRIVILEGE` DISABLE KEYS */;
DELETE FROM ROLE_PRIVILEGE WHERE `ROLE_PRIVILEGE_ID`='18';
DELETE FROM ROLE_PRIVILEGE WHERE `ROLE_PRIVILEGE_ID`='66';
DELETE FROM ROLE_PRIVILEGE WHERE `ROLE_PRIVILEGE_ID`='250';
DELETE FROM ROLE_PRIVILEGE WHERE `ROLE_PRIVILEGE_ID`='8';
/*!40000 ALTER TABLE `ROLE_PRIVILEGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Delete Blood donation privilege_dependencys' table data.
--

LOCK TABLES `PRIVILEGE_DEPENDENCY` WRITE;
/*!40000 ALTER TABLE `PRIVILEGE_DEPENDENCY` DISABLE KEYS */;
DELETE FROM PRIVILEGE_DEPENDENCY WHERE `PRIVILEGE_DEPENDENCY_ID`='317';
DELETE FROM PRIVILEGE_DEPENDENCY WHERE `PRIVILEGE_DEPENDENCY_ID`='318';
DELETE FROM PRIVILEGE_DEPENDENCY WHERE `PRIVILEGE_DEPENDENCY_ID`='319';
DELETE FROM PRIVILEGE_DEPENDENCY WHERE `PRIVILEGE_DEPENDENCY_ID`='320';
DELETE FROM PRIVILEGE_DEPENDENCY WHERE `PRIVILEGE_DEPENDENCY_ID`='321';

--
-- Update Dependency_previlage of Terminate student to relatively view student details.
--
UPDATE PRIVILEGE_DEPENDENCY SET `DEPENDENCY_ID`=32 WHERE `PRIVILEGE_DEPENDENCY_ID`='498';
/*!40000 ALTER TABLE `PRIVILEGE_DEPENDENCY` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Delete Blood donation, privileges' table data.
--

LOCK TABLES `PRIVILEGE` WRITE;
/*!40000 ALTER TABLE `PRIVILEGE` DISABLE KEYS */;
DELETE FROM PRIVILEGE WHERE `PRIVILEGE_ID`='160';
DELETE FROM PRIVILEGE WHERE `PRIVILEGE_ID`='161';
DELETE FROM PRIVILEGE WHERE `PRIVILEGE_ID`='162';
/*!40000 ALTER TABLE `PRIVILEGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Delete Blood donation, pages' table data.
--
LOCK TABLES `PAGE` WRITE;
/*!40000 ALTER TABLE `PAGE` DISABLE KEYS */;
DELETE FROM PAGE WHERE `PAGE_ID`='52';
/*!40000 ALTER TABLE `PAGE` ENABLE KEYS */;
UNLOCK TABLES;


/*!40014 SET FOREIGN_KEY_CHECKS=1 */;