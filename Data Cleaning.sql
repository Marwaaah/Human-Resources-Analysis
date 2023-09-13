ALTER TABLE `human resources`
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;



SET sql_safe_updates = 0;
UPDATE `human resources`
SET birthdate = CASE
  WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate,'%m/%d/%Y'), '%Y-%m-%d')
  WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate,'%m-%d-%Y'), '%Y-%m-%d') 
  ELSE NULL
END;

ALTER TABLE `human resources`
MODIFY COLUMN birthdate DATE;



SET sql_safe_updates = 0;
UPDATE `human resources`
SET hire_date = CASE
  WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date,'%m/%d/%Y'), '%Y-%m-%d')
  WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date,'%m-%d-%Y'), '%Y-%m-%d') 
  ELSE NULL
END;

ALTER TABLE `human resources`
MODIFY COLUMN hire_date DATE;



UPDATE `human resources`
SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != '';




ALTER TABLE `human resources` ADD COLUMN age INT;
UPDATE `human resources`
SET age = timestampdiff(YEAR, birthdate, CURDATE())