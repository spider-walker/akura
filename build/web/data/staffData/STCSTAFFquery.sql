USE `akura`;
TRUNCATE TABLE `SECTION`;
INSERT INTO `akura`.`SECTION` (`DESCRIPTION`) VALUES ('LowerSchool');
INSERT INTO `akura`.`SECTION` (`DESCRIPTION`) VALUES ('MiddleSchool');
INSERT INTO `akura`.`SECTION` (`DESCRIPTION`) VALUES ('UpperSchool');
INSERT INTO `akura`.`SECTION` (`DESCRIPTION`) VALUES ('CollegeScience');
INSERT INTO `akura`.`SECTION` (`DESCRIPTION`) VALUES ('London A/L Section');
INSERT INTO `akura`.`SECTION` (`DESCRIPTION`) VALUES ('CollegeCommerce');

TRUNCATE TABLE `STAFF_CATEGORY`;
INSERT INTO `akura`.`STAFF_CATEGORY` (`DESCRIPTION`,`IS_ACADEMIC`) VALUES ('Teacher',1);
INSERT INTO `akura`.`STAFF_CATEGORY` (`DESCRIPTION`,`IS_ACADEMIC`) VALUES ('Administrative Staff',0);
INSERT INTO `akura`.`STAFF_CATEGORY` (`DESCRIPTION`,`IS_ACADEMIC`) VALUES ('Tutorial Staff',0);
INSERT INTO `akura`.`STAFF_CATEGORY` (`DESCRIPTION`,`IS_ACADEMIC`) VALUES ('Support Staff',0);

TRUNCATE TABLE `SUBJECT`;
INSERT INTO `akura`.`SUBJECT` (`DESCRIPTION`) VALUES ('English');


SET FOREIGN_KEY_CHECKS = 0;
LOAD DATA LOCAL INFILE '/home/local/VIRTUSA/jsamaraweera/STCSTAFFDATA/LowerSchool.csv' 
INTO TABLE `akura`.`STAFF`  
FIELDS TERMINATED BY ',' 
enclosed by '"' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES
(REGISTRATION_NO,STAFF_CATEGORY_ID,DATE_OF_HIRE,FULL_NAME,NAME_WT_INITIALS,LAST_NAME,NATIONAL_ID_NO,DOB,SUBJECT_ID,STUDY_MEDIUM_ID,SECTION_ID,GENDER,BASIC_SALARY);
LOAD DATA LOCAL INFILE '/home/local/VIRTUSA/jsamaraweera/STCSTAFFDATA/MiddleSchool.csv' 
INTO TABLE `akura`.`STAFF`  
FIELDS TERMINATED BY ',' 
enclosed by '"' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES
(REGISTRATION_NO,STAFF_CATEGORY_ID,DATE_OF_HIRE,FULL_NAME,NAME_WT_INITIALS,LAST_NAME,NATIONAL_ID_NO,DOB,SUBJECT_ID,STUDY_MEDIUM_ID,SECTION_ID,GENDER,BASIC_SALARY);
LOAD DATA LOCAL INFILE '/home/local/VIRTUSA/jsamaraweera/STCSTAFFDATA/UpperSchool.csv' 
INTO TABLE `akura`.`STAFF`  
FIELDS TERMINATED BY ',' 
enclosed by '"' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES
(REGISTRATION_NO,STAFF_CATEGORY_ID,DATE_OF_HIRE,FULL_NAME,NAME_WT_INITIALS,LAST_NAME,NATIONAL_ID_NO,DOB,SUBJECT_ID,STUDY_MEDIUM_ID,SECTION_ID,GENDER,BASIC_SALARY);
LOAD DATA LOCAL INFILE '/home/local/VIRTUSA/jsamaraweera/STCSTAFFDATA/CollegeScience.csv' 
INTO TABLE `akura`.`STAFF`  
FIELDS TERMINATED BY ',' 
enclosed by '"' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES
(REGISTRATION_NO,STAFF_CATEGORY_ID,DATE_OF_HIRE,FULL_NAME,NAME_WT_INITIALS,LAST_NAME,NATIONAL_ID_NO,DOB,SUBJECT_ID,STUDY_MEDIUM_ID,SECTION_ID,GENDER,BASIC_SALARY);
LOAD DATA LOCAL INFILE '/home/local/VIRTUSA/jsamaraweera/STCSTAFFDATA/CollegeCommerce.csv' 
INTO TABLE `akura`.`STAFF`  
FIELDS TERMINATED BY ',' 
enclosed by '"' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES
(REGISTRATION_NO,STAFF_CATEGORY_ID,DATE_OF_HIRE,FULL_NAME,NAME_WT_INITIALS,LAST_NAME,NATIONAL_ID_NO,DOB,SUBJECT_ID,STUDY_MEDIUM_ID,SECTION_ID,GENDER,BASIC_SALARY);
LOAD DATA LOCAL INFILE '/home/local/VIRTUSA/jsamaraweera/STCSTAFFDATA/LondonSection.csv' 
INTO TABLE `akura`.`STAFF`  
FIELDS TERMINATED BY ',' 
enclosed by '"' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES
(REGISTRATION_NO,STAFF_CATEGORY_ID,DATE_OF_HIRE,FULL_NAME,NAME_WT_INITIALS,LAST_NAME,NATIONAL_ID_NO,DOB,SUBJECT_ID,STUDY_MEDIUM_ID,SECTION_ID,GENDER,BASIC_SALARY);
LOAD DATA LOCAL INFILE '/home/local/VIRTUSA/jsamaraweera/STCSTAFFDATA/AdministrativeStaff.csv' 
INTO TABLE `akura`.`STAFF`  
FIELDS TERMINATED BY ',' 
enclosed by '"' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES
(REGISTRATION_NO,STAFF_CATEGORY_ID,DATE_OF_HIRE,FULL_NAME,NAME_WT_INITIALS,LAST_NAME,NATIONAL_ID_NO,DOB,SUBJECT_ID,STUDY_MEDIUM_ID,SECTION_ID,GENDER,BASIC_SALARY);
LOAD DATA LOCAL INFILE '/home/local/VIRTUSA/jsamaraweera/STCSTAFFDATA/SupportStaff.csv' 
INTO TABLE `akura`.`STAFF`  
FIELDS TERMINATED BY ',' 
enclosed by '"' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES
(REGISTRATION_NO,STAFF_CATEGORY_ID,DATE_OF_HIRE,FULL_NAME,NAME_WT_INITIALS,LAST_NAME,NATIONAL_ID_NO,DOB,SUBJECT_ID,STUDY_MEDIUM_ID,SECTION_ID,GENDER,BASIC_SALARY);
LOAD DATA LOCAL INFILE '/home/local/VIRTUSA/jsamaraweera/STCSTAFFDATA/TutorialStaff.csv' 
INTO TABLE `akura`.`STAFF`  
FIELDS TERMINATED BY ',' 
enclosed by '"' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES
(REGISTRATION_NO,STAFF_CATEGORY_ID,DATE_OF_HIRE,FULL_NAME,NAME_WT_INITIALS,LAST_NAME,NATIONAL_ID_NO,DOB,SUBJECT_ID,STUDY_MEDIUM_ID,SECTION_ID,GENDER,BASIC_SALARY);
SET FOREIGN_KEY_CHECKS = 1;