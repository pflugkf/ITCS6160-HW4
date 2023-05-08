USE university;

#Question 1
INSERT INTO student VALUE ('Kristin Pflug', '801274415', '2024', 'Computer Science');
INSERT INTO student VALUE ('Monica Reese', '801291727', '2024', 'Biology');
INSERT INTO student VALUE ('Elnaz Haddadi', '801566915', '2023', 'Engineering');
INSERT INTO student VALUE ('Barret Wallace', '801189303', '2022', 'Ecology');

#Question 2
CREATE TABLE grade_report (
    student_number  CHAR(9) NOT NULL,
    section_identifier INT NOT NULL,
    course_number INT NOT NULL,
    grade CHAR(2),
    PRIMARY KEY (student_number, section_identifier, course_number),
    FOREIGN KEY (student_number) REFERENCES student(student_number),
    FOREIGN KEY (section_identifier) REFERENCES section(section_identifier),
    FOREIGN KEY (course_number) REFERENCES course(course_number)
);

#Question 3
INSERT INTO grade_report VALUE ('801274415', 1, 2215, NULL);

#Question 4
UPDATE grade_report SET grade = 'A-' WHERE student_number = '801274415';

#Question 5
ALTER TABLE section ADD location CHAR(10); 

#Question 6
UPDATE section SET location = 'BCKM 208' WHERE course_number = 2215 AND section_identifier = 1;

#Question 7
ALTER TABLE section DROP location; 

#Question 8
DELETE FROM grade_report 
WHERE student_number = '801274415' AND course_number = 2215 AND section_identifier = 1;

#Question 9
DROP TABLE grade_report;

#Question 10
DELETE FROM student WHERE student_number = '801274415';
DELETE FROM student WHERE student_number = '801291727';
DELETE FROM student WHERE student_number = '801566915';
DELETE FROM student WHERE student_number = '801189303';
