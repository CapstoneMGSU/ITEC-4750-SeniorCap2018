
-- #1 Run NEW ITEC 4750 DB Setup First
-- #2 Run RelationshipAssignments
-- #3 Optional Class Data in Fall2017ITEC

use mga_db;
-- 
-- Table structure for table `class_assign`
-- class assignments table
--

CREATE TABLE `class_assign` (
  `ClassAssignID` int(10) NOT NULL AUTO_INCREMENT,
  `ClassID` int,
  `LoginID` int,
  PRIMARY KEY (`ClassAssignID`),
  FOREIGN KEY (`ClassID`) REFERENCES `class`(`ClassID`) ON DELETE CASCADE,
  FOREIGN KEY (`LoginID`) REFERENCES `login`(`LoginID`) ON DELETE CASCADE
  
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Dumping data for table `class_assign`
--

INSERT INTO `class_assign` (`ClassAssignID`, `ClassID`, `LoginID`) VALUES
-- Dr. Spangler's Classes
(20,  87123,  1),
(21,  86756,  1),
(19,  87361,  1),
(22,  86654,  1),
(91, 1, 1),
(23,  88489,  2),
(24,  88195,  2),
(25,  87469,  2),
(26,  87310,  2),
(27,  87309,  2),
(28,  86673,  2),
(29,  86672,  2),
(30,  86525,  2),
(31,  86524,  2),
(32,  86729,  3),
(33,  86728,  3),
(34,  86495,  3),
(35,  86492,  3),
(36,  86489,  3),
(37,  88254,  4),
(38,  87518,  4),
(39,  87100,  4),
(40,  86684,  4),
(41,  88403,  5),
(42,  88191,  5),
(43,  87335,  5),
(44,  87171,  5),
(45,  87149,  5),
(46,  86500,  5),
(47,  86498,  5),
(48,  88427,  6),
(49,  88219,  6),
(50,  88194,  6),
(51,  87930,  6),
(52,  87334,  6),
(53,  86669,  6),
(54,  86667,  6),
(55,  88498,  7),
(56,  88373,  7),
(57,  88142,  7),
(58,  87739,  7),
(59,  86734,  7),
(60,  86730,  7),
(61,  86663,  7),
(62,  88456,  8),
(63,  88448,  8),
(64,  87896,  8),
(65,  87719,  8),
(66,  87339,  8),
(67,  87718,  9),
(68,  87516,  9),
(69,  88220,  10),
(70,  87929,  10),
(71,  87922,  10),
(72,  87187,  10),
(73,  88582,  11),
(74,  88414,  11),
(75,  88374,  11),
(76,  88301,  11),
(77,  87931,  11),
(78,  87172,  11),
(79,  86754,  11),
(80,  86516,  11),
(81,  88342,  12),
(82,  87188,  12),
(83,  86727,  12),
(84,  86681,  12),
(85,  88192,  13),
(86,  87365,  13),
(87,  87345,  13),
(88,  86747,  13),
(89,  86515,  13),
(90,  86504,  13),
(18,  88124,  1),

-- Students
(1, 1, 100),
(2, 1, 101),
(3, 1, 102),
(4, 1, 103),
(5, 1, 104),
(6, 1, 105),
(7, 1, 106),
(8, 86756, 115),
(9, 86756, 116),
(10, 86756, 117),
(11, 86756, 118),
(12, 86756, 119),
(13, 86756, 120),
(14, 86756, 121),
(15, 86756, 122),
(16, 86756, 123),
(17, 86756, 124);


-- 
-- Table structure for table `group_assign`
-- Group assignments table
--

-- ++++changed group to cgroup because group is a protected word in MySqli 
--     statements++++
CREATE TABLE `group_assign` (
  `GroupAssignID` int(10) NOT NULL AUTO_INCREMENT,
  `GroupID` varchar(255),
  `LoginID` int,
  PRIMARY KEY (`GroupAssignID`),
  FOREIGN KEY (`GroupID`) REFERENCES `cgroup`(`GroupID`) ON DELETE CASCADE,
  FOREIGN KEY (`LoginID`) REFERENCES `login`(`LoginID`) ON DELETE CASCADE
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Dumping data for table `group_assign`
--

INSERT INTO `group_assign` (`GroupAssignID`, `GroupID`, `LoginID`) VALUES
-- last team
(1, '1-2', 100),
(2, '1-2', 101),
(3, '1-2', 102),
(4, '1-2', 103),
(5, '1-2', 104),
(6, '1-2', 105),
(7, '1-2', 106),
-- 2017 Fall Team
(8, '86756-2', 115),
(9, '86756-2', 116),
(10, '86756-2', 117),
(11, '86756-2', 118),
(12, '86756-2', 119),
(13, '86756-2', 120),
(14, '86756-2', 121),
(15, '86756-2', 122),
(16, '86756-2', 123),
(17, '86756-2', 124);

-- --------------------------------------------------------

--
-- Table structure for table `survey_responses`
-- Holds Responses to specific student's specific survey questions
-- Survey shows by student name will be pulled by loginid 
-- --------------------------------------------------------
--
-- Table structure for table `surveys`
-- Holds Survey Names
-- 

-- 
CREATE TABLE `surveys`(
 `GSurveyID` int(10) NOT NULL AUTO_INCREMENT,
 `GSurveyName` varchar(255),
 PRIMARY KEY (`GSurveyID`)
 )ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surveys`
--

INSERT INTO `surveys` (`GSurveyID`, `GSurveyName`) VALUES
(1,'Week 1 Team Survey'), (2, 'Week 2 Team Survey'), 
(3, 'Week 3 Team Survey'), (4, 'Week 4 Team Survey');

-- ---------------------------------------------------------

--
-- Table structure for table `group_survey_questions`
-- Assigns questions to group survey
-- When Instructor creates a class group survey
-- 

-- ++++changed group to cgroup because group is a protected word in MySqli 
--     statements++++
CREATE TABLE `group_survey_q` (
  `GroupQID` int(6) NOT NULL AUTO_INCREMENT,
  `GSurveyID` int(6) NOT NULL, 
  `QuestionNum` int(6) NOT NULL,
  `GroupID` varchar(255) NOT NULL,
  `QuestionID` int,
   PRIMARY KEY (`GroupQID`),
   FOREIGN KEY (`GSurveyID`) REFERENCES `surveys`(`GSurveyID`) ON DELETE CASCADE,
   FOREIGN KEY (`GroupID`) REFERENCES `cgroup`(`GroupID`) ON DELETE CASCADE,
   FOREIGN KEY (`QuestionID`) REFERENCES `gen_survey_q`(`QuestionID`) ON DELETE CASCADE
   
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
  
  SET foreign_key_checks = 0;

--
-- Dumping data for table `group_survey_q`
--

INSERT INTO `group_survey_q` (`GroupQID`,`GroupID`, `QuestionNum`, `GSurveyID`, `QuestionID`) VALUES
(1,'1-2', 1, 1, 1),
(2,'1-2', 2, 1, 2),
(3,'1-2', 3, 1, 3),
(4,'1-2', 4, 1, 4),
(5,'1-2', 5, 1, 5),
(6,'1-2', 6, 1, 6),
(7,'1-2', 7, 1, 7),
(8,'1-2', 8, 1, 8),
(9,'1-2', 9, 1, 9),
(10,'1-2', 10, 1, 10),
(11,'86756-2', 1, 1, 1),
(12,'86756-2', 2, 1, 2),
(13,'86756-2', 3, 1, 3),
(14,'86756-2', 4, 1, 4),
(15,'86756-2', 5, 1, 5),
(16,'86756-2', 6, 1, 6),
(17,'86756-2', 7, 1, 7),
(18,'86756-2', 8, 1, 8),
(19,'86756-2', 9, 1, 9),
(20,'86756-2', 10, 1, 10),
(21,'87123-2', 1, 1, 1),
(22,'87123-2', 2, 1, 3),
(23,'87123-2', 3, 1, 5),
(24,'87123-2', 4, 1, 6),
(25,'87123-2', 5, 1, 10),
(26,'1-2', 1, 2, 1),
(27,'1-2', 2, 2, 2),
(28,'1-2', 3, 2, 3),
(29,'1-2', 4, 2, 4),
(30,'1-2', 5, 2, 5),
(31,'1-2', 6, 2, 6),
(32,'1-2', 7, 2, 7),
(33,'1-2', 8, 2, 8),
(34,'1-2', 9, 2, 9),
(35,'1-2', 10, 2, 10),
(41,'86756-2', 1, 3, 1),
(42,'86756-2', 2, 3, 9),
(43,'86756-2', 3, 3, 2),
(44,'86756-2', 4, 3, 12),
(45,'86756-2', 5, 3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `survey_responses`
-- Holds Responses to specific student's specific survey questions
-- Survey shows by student name will be pulled by loginid 

-- 
CREATE TABLE `survey_responses`(
 `ResponseID` int(10) NOT NULL AUTO_INCREMENT,
 `LoginID` int,
 `GSurveyID` int,
 `QuestionID` int,
 `TeamMemberID` int,
 `ResponseValue` int(2),
  PRIMARY KEY (`ResponseID`),
  FOREIGN KEY (`LoginID`)  REFERENCES `login`(`LoginID`) ON DELETE CASCADE,
  FOREIGN KEY (`GSurveyID`)  REFERENCES `surveys`(`GSurveyID`) ON DELETE CASCADE,
  FOREIGN KEY (`QuestionID`) REFERENCES `gen_survey_q`(`QuestionID`) ON DELETE CASCADE,
  FOREIGN KEY (`TeamMemberID`) REFERENCES `login`(`LoginID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

