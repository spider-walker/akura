use `akura`;

DELIMITER // 

DROP PROCEDURE IF EXISTS LANGUAGE_ID_TO_STUDY_MEDIUM_MIGRATION//


CREATE PROCEDURE LANGUAGE_ID_TO_STUDY_MEDIUM_MIGRATION()

BEGIN

    DECLARE studyMediumId INT(11);
    DECLARE languageId INT(11);
    DECLARE X INT(11);
   
    DECLARE studyMediumCount INT(11);
    DECLARE language varchar(45);
    
    DECLARE  cur_language CURSOR FOR
    SELECT LANGUAGE_ID FROM `LANGUAGE`;
    
    ALTER TABLE `STUDY_MEDIUM` MODIFY STUDY_MEDIUM_ID int(11) AUTO_INCREMENT; 
    ALTER TABLE `STUDENT` DROP FOREIGN KEY `fk_STUDENT_LANGUAGE1` ;
    
        
    SELECT @X:= COUNT(*) FROM `LANGUAGE`;
    
    OPEN cur_language;
  
    REPEAT
    
    FETCH  cur_language INTO languageId;
    
    SELECT @languageId:=l.LANGUAGE_ID, @language:=l.LANGUAGE FROM `LANGUAGE` l WHERE l.LANGUAGE_ID = languageId;
        
    SELECT @studyMediumCount:=COUNT(*) FROM `STUDY_MEDIUM` sm WHERE sm.STUDY_MEDIUM_NAME = @language;
    
    SET @X = @X-1;
    
    IF(@studyMediumCount = 0) THEN
    
        INSERT INTO `STUDY_MEDIUM` (STUDY_MEDIUM_NAME) VALUES (@language);
        Select @studyMediumId:=LAST_INSERT_ID();
        
    ELSE
         SELECT @studyMediumId:= STUDY_MEDIUM_ID FROM `STUDY_MEDIUM` WHERE STUDY_MEDIUM_NAME = @language;
    END IF;
    
    UPDATE `STUDENT` s SET s.LANGUAGE_ID= @studyMediumId WHERE s.LANGUAGE_ID = languageId;
    

    
    UNTIL @X = 0  
    END REPEAT;
    CLOSE cur_language;
         
		 
    ALTER TABLE `STUDENT` 
    ADD CONSTRAINT `fk_STUDENT_LANGUAGE1`
    FOREIGN KEY (`LANGUAGE_ID`)
    REFERENCES `STUDY_MEDIUM` (`STUDY_MEDIUM_ID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE;
    
    

END//

DELIMITER ;

CALL LANGUAGE_ID_TO_STUDY_MEDIUM_MIGRATION();

DROP PROCEDURE IF EXISTS LANGUAGE_ID_TO_STUDY_MEDIUM_MIGRATION;



