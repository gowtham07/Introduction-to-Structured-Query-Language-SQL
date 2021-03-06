DROP TABLE IF EXISTS Member;
DROP TABLE IF EXISTS `User`;
DROP TABLE IF EXISTS Course;

CREATE TABLE `User` (
    user_id     INTEGER NOT NULL AUTO_INCREMENT,
    name        VARCHAR(128) UNIQUE,
    PRIMARY KEY(user_id)
) ENGINE=InnoDB CHARACTER SET=utf8;

CREATE TABLE Course (
    course_id     INTEGER NOT NULL AUTO_INCREMENT,
    title         VARCHAR(128) UNIQUE,
    PRIMARY KEY(course_id)
) ENGINE=InnoDB CHARACTER SET=utf8;

CREATE TABLE Member (
    user_id       INTEGER,
    course_id     INTEGER,
    role          INTEGER,

    CONSTRAINT FOREIGN KEY (user_id) REFERENCES `User` (user_id)
      ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY (course_id) REFERENCES Course (course_id)
       ON DELETE CASCADE ON UPDATE CASCADE,
       PRIMARY KEY (user_id, course_id)

) ENGINE=InnoDB CHARACTER SET=utf8;


INSERT INTO `member` (`user_id`, `course_id`, `role`) VALUES
(1, 1, 1),
(2, 1, 0),
(3, 1, 0),
(4, 1, 0),
(5, 1, 0),
(6, 2, 1),
(7, 2, 0),
(8, 2, 0),
(9, 2, 0),
(10, 2, 0),
(11, 3, 1),
(12, 3, 0),
(13, 3, 0),
(14, 3, 0),
(15, 3, 0);

-- --------------------------------------------------------




INSERT INTO `user` (`user_id`, `name`) VALUES

(1 ,'Taliesin'),
(2, 'Denver'),
(3 ,'Juwairiyah'),

(4, 'Kainui'),
(5, 'Zoya'),
(6 ,'Aisha')
(7, 'Artemis'),
(8, 'Danna'),
(9, 'Dennis'),
(10,  'Tyler'),
(11  ,'Kirstin')
(12 ,'Allisha'),
(13 , 'Carra'),
(14  ,'Idahosa')
(15,'Iliana');



/*
Taliesin, si106, Instructor
Denver, si106, Learner
Juwairiyah, si106, Learner
Kainui, si106, Learner
Zoya, si106, Learner
Aisha, si110, Instructor
Artemis, si110, Learner
Danna, si110, Learner
Dennis, si110, Learner
Tyler, si110, Learner
Kirstin, si206, Instructor
Allisha, si206, Learner
Carra, si206, Learner
Idahosa, si206, Learner
Iliana, si206, Learner
*/



SELECT `User`.name, Course.title, Member.role
    FROM `User` JOIN Member JOIN Course
    ON `User`.user_id = Member.user_id AND Member.course_id = Course.course_id
    ORDER BY Course.title, Member.role DESC, `User`.name
