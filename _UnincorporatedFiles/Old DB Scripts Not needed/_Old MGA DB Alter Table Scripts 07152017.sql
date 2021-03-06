use `mga db`;

ALTER TABLE login
ADD `LModified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ;

ALTER TABLE login
ADD `Locked` INT NOT NULL DEFAULT 0;

ALTER TABLE login
ADD `TOKEN` varchar(255);

ALTER TABLE response
ADD `Completion_Date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ;

ALTER TABLE faculty
ADD COLUMN ClassID INT,
ADD FOREIGN KEY fk_ClassID(ClassID) REFERENCES class(ClassID) ON DELETE CASCADE;

ALTER TABLE evaluation
ADD COLUMN ClassID INT,
ADD FOREIGN KEY fk_ClassID(ClassID) REFERENCES class(ClassID) ON DELETE CASCADE;

