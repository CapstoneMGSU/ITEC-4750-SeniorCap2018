-- #1 Run NEW ITEC 4750 DB Setup First
-- #2 Run RelationshipAssignments
-- #3 Optional Class Data in Fall2017ITEC


-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 25, 2017 at 12:20 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

-- Dummy Database setup Combined from Summer Team's MySQL Script
-- Changed password data inserted into 'login table' to SHA1 checksum to agree with current login page 
-- Added Current team members' 'login table' information for 'default' insert

-- Config file should be setup for localhost for running locally --


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mga_db`
--

-- --------------------------------------------------------
CREATE SCHEMA `mga_db` ;
use `mga_db`;

 
CREATE TABLE `semester`(
  `SemesterID` int(8) NOT NULL,
  `SemesterName` varchar(10) NOT NULL,
  `Year` varchar(4) NOT NULL,
  PRIMARY KEY (`SemesterID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`SemesterID`, `SemesterName`, `Year`) VALUES
(1, 'Spring', '2017'),
(2, 'Summer', '2017'),
(3, 'Fall', '2017'),
(4, 'Spring', '2018'),
(5, 'Summer', '2018'),
(6, 'Fall', '2018'),
(7, 'Spring', '2019'),
(8, 'Summer', '2019'),
(9, 'Fall', '2019');
-- --------------------------------------------------------

--
-- Table structure for table `login`
-- Student & Faculty ID is LoginID
-- Distinguished by Role
--

CREATE TABLE `login` (
  `LoginID` int(6)  NOT NULL AUTO_INCREMENT,
  `Email` varchar(60) NOT NULL UNIQUE,
  `Pword` varchar(40) NOT NULL,
  `Role` varchar(8) NOT NULL,
  `FName` varchar(15) NOT NULL,
  `LName` varchar(20) NOT NULL,
  `LModified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Locked` INT NOT NULL DEFAULT 0,  
  `TOKEN` varchar(255),
  PRIMARY KEY (`LoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping faculty data for table `login`
--

INSERT INTO `login` (`LoginID`, `Email`, `Pword`, `Role`, `FName`, `LName`) VALUES
-- instructors
(1, 'scott.spangler@mga.edu', SHA1('sspangler17'), 'Faculty', 'Scott', 'Spangler'),
(2, 'alan.stines@mga.edu', SHA1('astines17'), 'Faculty', 'Alan', 'Stines'),
(3, 'tina.ashford@mga.edu', SHA1('tashford17'), 'Faculty', 'Tina', 'Ashford'),
(4, 'shannon.beasley@mga.edu', SHA1('sbeasley17'), 'Faculty', 'Shannon', 'Beasley'),
(5, 'pedro.colon1@mga.edu', SHA1('pcolon17'), 'Faculty', 'Pedro', 'Colon'),
(6, 'myungjae.kwak@mga.edu', SHA1('mkwak17'), 'Faculty', 'Myungjae', 'Kwak'),
(7, 'neil.rigole@mga.edu', SHA1('nrigole17'), 'Faculty', 'Neil', 'Rigole'),
(8, 'johnathan.yerby@mga.edu', SHA1('jyerby17'), 'Faculty', 'Johnathan', 'Yerby'),
(9, 'john.girard@mga.edu', SHA1('jgirard17'), 'Faculty', 'John', 'Girard'),
(10, 'yingfeng.wang@mga.edu', SHA1('ywang17'), 'Faculty', 'Yingfeng', 'Wang'),
(11, 'nelbert.stclair@mga.edu', SHA1('nstclair17'), 'Faculty', 'Doc', 'St. Clair'),
(12, 'kimbley.lingelback@mga.edu', SHA1('klingelback17'), 'Faculty', 'Kimbley', 'Lingelback'),
(13, 'jonathan.jenkins2@mga.edu', SHA1('jjenkins17'), 'Faculty', 'Jonathan', 'Jenkins');

-- --------------------------------------------------------

--
-- Dumping student data for table `login`
--

INSERT INTO `login` (`LoginID`, `Email`, `Pword`, `Role`, `FName`, `LName`) VALUES
-- previous teams
(100, 'chase.cummings@mga.edu', SHA1('ccummings17'), 'Student', 'Chase', 'Cummings'),
(101, 'chelsea.bennett@mga.edu', SHA1('cbennett17'), 'Student', 'Chelsea', 'Bennett'),
(102, 'luke.ayler@mga.edu', SHA1('layler17'), 'Student', 'Luke', 'Ayler'),
(103, 'andrea.day@mga.edu', SHA1('aday17'), 'Student', 'Andrea', 'Day'),
(104, 'johnathan.brown3@mga.edu', SHA1('jbrown17'), 'Student', 'Johnathan', 'Brown'),
(105, 'duane.crampton@mga.edu', SHA1('dcrampton17'), 'Student', 'Duane', 'Crampton'),
(106, 'ryan.bennett@mga.edu', SHA1('rbennett17'), 'Student', 'Ryan', 'Bennett'),
(107, 'richard.dorminey@mga.edu', SHA1('rdorminey17'), 'Student', 'Richard', 'Dorminey'),
(108, 'alexander.bos@mga.edu', SHA1('abos17'), 'Student', 'Alexander', 'Bos'),
(109, 'jamison.hampton@mga.edu', SHA1('jhampton17'), 'Student', 'Jamison', 'Hampton'),
(110, 'deodrick.baugh@mga.edu', SHA1('dbaugh17'), 'Student', 'Deodrick', 'Baugh'),
(111, 'colby.carr@mga.edu', SHA1('ccarr17'), 'Student', 'Colby', 'Carr'),
(112, 'jack.campbell@mga.edu', SHA1('jcampbell17'), 'Student', 'Jack', 'Campbell'),
(113, 'theresa.brown@mga.edu', SHA1('tbrown17'), 'Student', 'theresa', 'Brown'),
(114, 'ronak.brahmbhatt@mga.edu', SHA1('rbrahmbhatt17'), 'Student', 'Ronak', 'Brahmbhatt'),

-- 2017 Fall Team
(115, 'joseph.dent@mga.edu', SHA1('jdent17'), 'Student', 'Joe', 'Dent'),
(116, 'andrew.dixon@mga.edu', SHA1('adixon17'), 'Student', 'Andrew', 'Dixon'),
(117, 'sarah.goodman@mga.edu', SHA1('sgoodman17'), 'Student', 'Sarah', 'Goodman'),
(118, 'joel.gregory@mga.edu', SHA1('jgregory17'), 'Student', 'Joel', 'Gregory'),
(119, 'thomas.haastrup@mga.edu', SHA1('thaastrup17'), 'Student', 'Thomas', 'Haastrup'),
(120, 'molly.hester@mga.edu', SHA1('mhester17'), 'Student', 'Macenzie', 'Hester'),
(121, 'adam.hudnall@mga.edu', SHA1('ahudnall17'), 'Student', 'Adam', 'Hudnall'), 
(122, 'angela.ivey@mga.edu', SHA1('livey17'), 'Student', 'Leigh', 'Ivey'),
(123, 'katie.hodnett@mga.edu', SHA1('kmarkham17'), 'Student', 'Katie', 'Markham'),
(124, 'michael.mathews@mga.edu', SHA1('mmathews17'), 'Student', 'Mike', 'Mathews'),

-- 2018 Spring Team
(125, 'michael.elder@mga.edu', SHA1('medler18'), 'Student', 'Michael', 'Elder'),
(126, 'holly.belcher@mga.edu', SHA1('hbelcher18'), 'Student', 'Holly', 'Belcher'),
(127, 'travis.castle@mga.edu', SHA1('tcastle18'), 'Student', 'Travis', 'Castle'),
(128, 'jack.carter@mga.edu', SHA1('jcarter18'), 'Student', 'Jack', 'Carter'),
(129, 'justin.braer@mga.edu', SHA1('jbraer18'), 'Student', 'Justin', 'Braer'),
(130, 'fernandex.cheely@mga.edu', SHA1('fcheely18'), 'Student', 'Fernandex', 'Cheely'),
(131, 'srujana.chandupatla@mga.edu', SHA1('schandupatla18'), 'Student', 'Srujana', 'Chandupatla'),
(132, 'evan.blain@mga.edu', SHA1('eblain18'), 'Student', 'Evan', 'Blain'),
(133, 'james.dowdy@mga.edu', SHA1('jdowdy18'), 'Student', 'James', 'Dowdy');

-- --------------------------------------------------------
--
-- Table structure for table `class`
--

   CREATE TABLE `class`(
  `ClassID` int(8) NOT NULL,
  `ClassNO` varchar(12) NOT NULL,
  `ClassName` varchar(255) NOT NULL,
  `ExpDate` DATE,
  `SemesterID`int,
  PRIMARY KEY (`ClassID`),
  FOREIGN KEY (`SemesterID`) REFERENCES `semester`(`SemesterID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`ClassID`, `ClassNO`, `ClassName`, `ExpDate`, `SemesterID`) VALUES
(1, 'ITEC 4750','Senior Capstone', '2017-08-01', 1),
(86756,'ITEC 4750','ONLINE Senior Capstone','2017-12-13', 2),
(87123,'ITEC 4750','V-CON Senior Capstone', '2017-12-13', 2),
(87361,'ITEC 3235','ONLINE Human Comp Interaction', '2017-12-13', 2),
(86654,'ITEC 3235','Human Computer Interaction', '2017-12-13', 2),
(86489,'ITEC 2215','HYBRID Introduction to IT', '2017-12-13', 2),
(86492,'ITEC 2215','ONLINE Introduction to IT', '2017-12-13', 2),
(86495,'ITEC 2215','ONLINE Introduction to IT',  '2017-12-13', 2),
(86728,'ITEC 4205','Legal Ethical Iss','2017-12-13', 2),
(86729,'ITEC 4205','ONLINE Legal and Ethical Issue', '2017-12-13', 2),
(86684,'ITEC 3328','ONLINE Linux Systems Admin','2017-12-13', 2),
(87100,'ITEC 4329','Data Communications', '2017-12-13', 2),
(87518,'ITEC 6210','ONLINE Network & Info Security', '2017-12-13', 2),
(88254,'ITEC 3325','ONLINE Windows Systems Admin', '2017-12-13', 2),
(86498,'ITEC 2260','ONLINE Intro to Compr Prog', '2017-12-13', 2),
(86500,'ITEC 2260','V-CON Intro to Comp Prog', '2017-12-13', 2),
(87149,'ITEC 2215','HYBRID Introduction to IT', '2017-12-13', 2),
(87171,'ITEC 2260','ONLINE Intro to Compr Prog', '2017-12-13', 2),
(87335,'ITEC 2260','V-CON Intro to Comp Prog', '2017-12-13', 2),
(88191,'ITEC 2260','V-CON Intro to Comp Prog', '2017-12-13', 2),
(88403,'ITEC 4261','ONLINE JAVA Programming', '2017-12-13', 2),
(87516,'ITEC 5100','ONLINE Current & Emerg Iss IT', '2017-12-13', 2),
(87718,'ITEC 5110','ONLINE IT Leader & Str Plan', '2017-12-13', 2),
(86504,'ITEC 2270','V-CON Application Development', '2017-12-13', 2),
(86515,'ITEC 2270','ONLINE Application Development', '2017-12-13', 2),
(86747,'ITEC 4261','ONLINE JAVA Programming', '2017-12-13', 2),
(87345,'ITEC 2270','V-CON Application Development', '2017-12-13', 2),
(87365,'ITEC 2270','ONLINE Application Development', '2017-12-13', 2),
(88192,'ITEC 2270','V-CON Application Development', '2017-12-13', 2),
(86667,'ITEC 3245','ONLINE Database Principles', '2017-12-13', 2),
(86669,'ITEC 3245','V-CON Database Principles', '2017-12-13', 2),
(87334,'ITEC 3245','V-CON Database Principles', '2017-12-13', 2),
(87930,'ITEC 6410','ONLINE Object Oriented Analy', '2017-12-13', 2),
(88194,'ITEC 3245','V-CON Database Principles', '2017-12-13', 2),
(88219,'ITEC 4244','ONLINE Database Programming', '2017-12-13', 2),
(88427,'ITEC 2299','IT Topics - Robotics', '2017-12-13', 2),
(86681,'ITEC 3300','Project Management', '2017-12-13', 2),
(86727,'ITEC 4200','ONLINE Found of Info Assurance', '2017-12-13', 2),
(87188,'ITEC 4200','ONLINE Found of Info Assurance', '2017-12-13', 2),
(88342,'ITEC 4344','ONLINE Ethical Hacking', '2017-12-13', 2),
(86663,'ITEC 3236','V-CON Interactive Digl Media', '2017-12-13', 2),
(86730,'ITEC 4230','ONLINE Graphic Imaging', '2017-12-13', 2),
(86734,'ITEC 4238','ONLINE 2D Comp Animation', '2017-12-13', 2),
(87739,'ITEC 3236','V-CON Interactive Digl Media', '2017-12-13', 2),
(88142,'ITEC 6900','ONLINE Graduate Capstone', '2017-12-13', 2),
(88373,'ITEC 2400','eCampus Indus Trends/Dis Tech', '2017-12-13', 2),
(88498,'ITEC 4501','ONLINE Special Projects in IT', '2017-12-13', 2),
(88124,'ITEC 4750','V-CON Senior Capstone', '2017-12-13', 2),
(86516,'ITEC 2320','P-ONLINE Networking Essentials', '2017-12-13', 2),
(86754,'ITEC 4341','ONLINE Incident Resp/Conting', '2017-12-13', 2),
(87172,'ITEC 4200','HYBRID Found of Info Assurance', '2017-12-13', 2),
(87931,'ITEC 4344','ONLINE Ethical Hacking', '2017-12-13', 2),
(88301,'ITEC 2320','P-ONLINE Networking Essentials', '2017-12-13', 2),
(88374,'ITEC 2430','eCampus Cybersecurity', '2017-12-13', 2),
(88414,'ITEC 4501','ONLINE Special Projects in IT', '2017-12-13', 2),
(88582,'ITEC 4701','ONLINE Internship in IT', '2017-12-13', 2),
(86524,'ITEC 2380','V-CON Web Development', '2017-12-13', 2),
(86525,'ITEC 2380','ONLINE Web Development', '2017-12-13', 2),
(86672,'ITEC 3280','V-CON Web Programming', '2017-12-13', 2),
(86673,'ITEC 3280','ONLINE Web Programming', '2017-12-13', 2),
(87309,'ITEC 3280','V-CON Web Programming', '2017-12-13', 2),
(87310,'ITEC 2380','V-CON Web Development', '2017-12-13', 2),
(87469,'ITEC 2380','ONLINE Web Development', '2017-12-13', 2),
(88195,'ITEC 3280','V-CON Web Programming', '2017-12-13', 2),
(88489,'ITEC 229A2','Special Topic Web App Devel.', '2017-12-13', 2),
(87187,'ITEC 3264','P-ONLINE Data Structures', '2017-12-13', 2),
(87922,'ITEC 3264','ONLINE Data Structures', '2017-12-13', 2),
(87929,'ITEC 6400','ONLINE Prog & Data Structures', '2017-12-13', 2),
(88220,'ITEC 3265','ONLINE Operating Systems', '2017-12-13', 2),
(87339,'ITEC 4321','ONLINE Forensics/Data Recovery', '2017-12-13', 2),
(87719,'ITEC 4321','Forensics/Data Recovery', '2017-12-13', 2),
(87896,'ITEC 6200','ONLINE Digital Forensics', '2017-12-13', 2),
(88448,'ITEC 4321','ONLINE Forensics/Data Recovery', '2017-12-13', 2),
(88456,'ITEC 4701','ONLINE Internship in IT', '2017-12-13', 2);
-- --------------------------------------------------------

--
-- Table structure for table `group`
--
-- ++++changed group to cgroup because group is a protected word in MySqli 
--     statements++++
CREATE TABLE `cgroup`(
  `GroupID` varchar(110) NOT NULL,
  `GroupName` varchar(25),
  `ClassID` int,
  PRIMARY KEY (`GroupID`),
  FOREIGN KEY (`ClassID`) REFERENCES class(`ClassID`) ON DELETE CASCADE
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Dumping data for table `group`
--
-- ++++changed group to cgroup because group is a protected word in MySqli 
--     statements++++
INSERT INTO `cgroup` (`GroupID`, `ClassID`, `GroupName`) VALUES
('1-1', 1, 'GROUP 1'),
('1-2', 1, 'GROUP 2'),
('86756-1', 86756, 'GROUP 1'),
('86756-2', 86756, 'GROUP 2'),
('87123-1', 87123, 'GROUP 1'),
('87123-2', 87123, 'GROUP 2');

-- -----------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `gen_survey_q` (
  `QuestionID` int(6) NOT NULL AUTO_INCREMENT,
  `QuestionTxt` varchar(110) NOT NULL,
  `QKey` varchar(25) NOT NULL, 
   PRIMARY KEY (`QuestionID`),
   UNIQUE KEY (`QKey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `gen_survey_q` (`QuestionID`, `QuestionTxt`, `QKey`) VALUES
(1, 'Rate this group member on his/her QUALITY of contribtuion','Quality'),
(2, 'Rate this group member on his/her QUANTITY of contribution', 'Quantity'),
(3, 'Rate this group member on his/her CREATIVITY','Creativity'),
(4, 'Rate this group member on his/her TURN TAKING or allowing others to participant', 'Turn Taking'),
(5, 'Rate this group member on his/her EFFORT or time spent on project', 'Effort'),
(6, 'Rate this group member on his/her ATTITUDE toward the group', 'Attitude'),
(7, 'Rate this group member on his/her ATTENDANCE to group meetings', 'Attendance'),
(8, 'Rate this group member on his/her PREPARATION for group meetings', 'Preparation'),
(9, 'Rate this group member on his/her WILLINGNESS to accept and complete tasks', 'Willingness'),
(10, 'Rate this group member on his/her COMPLETION of tasks ON TIME', 'Completion'),
(11, 'Rate this group member on his/her RESPONSIVENESS to team communications', 'Responsiveness'),
(12, 'Rate this group member on his/her COMMITMENT to the project', 'Commitment');



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
