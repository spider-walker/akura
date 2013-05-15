use `akura`;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

--
-- Table structure for table `SUBJECT`
--
ALTER TABLE `SUBJECT` 
ADD COLUMN `SUBJECT_CODE` VARCHAR(5) NULL DEFAULT NULL,
ADD UNIQUE INDEX `SUBJECT_CODE_UNIQUE` (`SUBJECT_CODE` ASC);

--
-- Table structure for table `DAILY_STUDENT_ATTENDANCE`
--
ALTER TABLE `DAILY_STUDENT_ATTENDANCE` 
DROP FOREIGN KEY `fk_STUDENT_DAILY_ATTENDANCE`;

ALTER TABLE `DAILY_STUDENT_ATTENDANCE` 
DROP INDEX `fk_STUDENT_DAILY_ATTENDANCE`;

ALTER TABLE `DAILY_STUDENT_ATTENDANCE` ENGINE=InnoDB;

ALTER TABLE `DAILY_STUDENT_ATTENDANCE` 
  ADD CONSTRAINT `fk_STUDENT_DAILY_ATTENDANCE`
  FOREIGN KEY (`STUDENT_ID` )
  REFERENCES `STUDENT` (`STUDENT_ID` )
  ON DELETE CASCADE
  ON UPDATE CASCADE;

--
-- Table structure for table `DAILY_TEACHER_ATTENDANCE`
--
ALTER TABLE `DAILY_TEACHER_ATTENDANCE` 
DROP FOREIGN KEY `fk_STAFF_DAILY_ATTENDENCE`;

ALTER TABLE `DAILY_TEACHER_ATTENDANCE` 
DROP INDEX `fk_STAFF_DAILY_ATTENDENCE`;

ALTER TABLE `DAILY_TEACHER_ATTENDANCE` ENGINE=InnoDB;

ALTER TABLE `DAILY_TEACHER_ATTENDANCE` 
ADD CONSTRAINT `fk_STAFF_DAILY_ATTENDENCE` 
FOREIGN KEY (`STAFF_ID` ) 
REFERENCES `STAFF` (`STAFF_ID`) 
ON DELETE CASCADE 
ON UPDATE CASCADE;

--
-- Table structure for table `STUDENT_SEMINAR`
--
ALTER TABLE `STUDENT_SEMINAR` 
DROP FOREIGN KEY `fk_STUDENT_SEMINAR_STUDENT1`, 
DROP FOREIGN KEY `fk_STUDENT_SEMINAR_SEMINAR1`;

ALTER TABLE `STUDENT_SEMINAR` 
DROP INDEX `fk_STUDENT_SEMINAR_STUDENT1`, 
DROP INDEX `fk_STUDENT_SEMINAR_SEMINAR1`;

ALTER TABLE `STUDENT_SEMINAR` ENGINE=InnoDB;

ALTER TABLE `STUDENT_SEMINAR` 
ADD CONSTRAINT `fk_STUDENT_SEMINAR_STUDENT1` 
FOREIGN KEY (`STUDENT_ID` ) 
REFERENCES `STUDENT` (`STUDENT_ID` ) 
ON DELETE RESTRICT 
ON UPDATE CASCADE, 
ADD CONSTRAINT `fk_STUDENT_SEMINAR_SEMINAR1` 
FOREIGN KEY (`SEMINAR_ID` ) 
REFERENCES `SEMINAR` (`SEMINAR_ID` ) 
ON DELETE RESTRICT 
ON UPDATE CASCADE;

--
-- Table structure for table `PARTICIPANT_CATEGORY`
--
ALTER TABLE `PARTICIPANT_CATEGORY` ENGINE=InnoDB;

--
-- Table structure for table `SPECIAL_EVENTS`
--
ALTER TABLE `SPECIAL_EVENTS` 
DROP FOREIGN KEY `fk_SPECIAL_EVENTS_PARTICIPANT_CATEGORY1`;

ALTER TABLE `SPECIAL_EVENTS` 
DROP INDEX `fk_SPECIAL_EVENTS_PARTICIPANT_CATEGORY1`;

ALTER TABLE `SPECIAL_EVENTS` ENGINE=InnoDB;

ALTER TABLE `SPECIAL_EVENTS`
ADD CONSTRAINT `fk_SPECIAL_EVENTS_PARTICIPANT_CATEGORY1` 
FOREIGN KEY (`PARTICIPANT_CATEGORY_ID`) 
REFERENCES `PARTICIPANT_CATEGORY` (`PARTICIPANT_CATEGORY_ID`) 
ON DELETE RESTRICT 
ON UPDATE CASCADE;

--
-- Table structure for table `SPECIAL_EVENT_PARTICIPATION`
--
ALTER TABLE `SPECIAL_EVENT_PARTICIPATION` 
DROP FOREIGN KEY `fk_SPECIALEVENT_SPECIALEVENT1`, 
DROP FOREIGN KEY `fk_SPECIALEVENT_CLASSGRADE1`, 
DROP FOREIGN KEY `fk_SPECIALEVENT_SPORTCATEGORY1`, 
DROP FOREIGN KEY `fk_SPECIALEVENT_CLUBSOCIETY1`;

ALTER TABLE `SPECIAL_EVENT_PARTICIPATION` 
DROP INDEX `fk_SPECIALEVENT_SPECIALEVENT1`, 
DROP INDEX `fk_SPECIALEVENT_CLASSGRADE1`, 
DROP INDEX `fk_SPECIALEVENT_SPORTCATEGORY1`, 
DROP INDEX `fk_SPECIALEVENT_CLUBSOCIETY1`;

ALTER TABLE `SPECIAL_EVENT_PARTICIPATION` ENGINE=InnoDB;

ALTER TABLE `SPECIAL_EVENT_PARTICIPATION` 
ADD CONSTRAINT `fk_SPECIALEVENT_SPECIALEVENT1`
    FOREIGN KEY (`SPECIAL_EVENT_ID` )
    REFERENCES `SPECIAL_EVENTS` (`SPECIAL_EVENTS_ID` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
ADD CONSTRAINT `fk_SPECIALEVENT_CLASSGRADE1`
    FOREIGN KEY (`CLASS_GRADE_ID` )
    REFERENCES `CLASS_GRADE` (`CLASS_GRADE_ID` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
ADD CONSTRAINT `fk_SPECIALEVENT_SPORTCATEGORY1`
    FOREIGN KEY (`SPORT_CATEGORY_ID` )
    REFERENCES `SPORT_CATEGORY` (`SPORT_CATEGORY_ID` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
ADD CONSTRAINT `fk_SPECIALEVENT_CLUBSOCIETY1`
    FOREIGN KEY (`CLUB_SOCIETY_ID` )
    REFERENCES `CLUB_SOCIETY` (`CLUB_SOCIETY_ID` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE;


--
-- Table structure for table `SPECIAL_EVENT_ATTENDANCE`
--
ALTER TABLE `SPECIAL_EVENT_ATTENDANCE` 
DROP FOREIGN KEY `fk_SPECIALEVENT_PARTICIPATION1`,
DROP FOREIGN KEY `fk_SPECIALEVENT_STUDENT1`;

ALTER TABLE `SPECIAL_EVENT_ATTENDANCE` 
DROP INDEX `fk_SPECIALEVENT_PARTICIPATION1`,
DROP INDEX `fk_SPECIALEVENT_STUDENT1`;

ALTER TABLE `SPECIAL_EVENT_ATTENDANCE` ENGINE=InnoDB;

ALTER TABLE `SPECIAL_EVENT_ATTENDANCE` 
ADD CONSTRAINT `fk_SPECIALEVENT_PARTICIPATION1` 
FOREIGN KEY (`SPECIAL_EVENT_PARTICIPATION_ID` ) 
REFERENCES `SPECIAL_EVENT_PARTICIPATION` (`SPECIAL_EVENT_PARTICIPATION_ID` ) 
ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT `fk_SPECIALEVENT_STUDENT1` 
FOREIGN KEY (`STUDENT_ID` ) 
REFERENCES `STUDENT` (`STUDENT_ID` ) 
ON DELETE RESTRICT 
ON UPDATE CASCADE;

--
-- Table structure for table `SCHOOL`
--
ALTER TABLE `SCHOOL` 
CHANGE COLUMN `DISTRICT_ID` `DISTRICT_ID` INT(11) NULL  , 
CHANGE COLUMN `PROVINCE_ID` `PROVINCE_ID` INT(11) NULL ;


/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40014 SET UNIQUE_CHECKS=1 */;