﻿CREATE TABLE Branches
(
	Id INT IDENTITY PRIMARY KEY,
	Branch_Name NVARCHAR(100) DEFAULT('Nameless'),
	Bank_Id INT NOT NULL,
	City_Id INT NOT NULL,
	CONSTRAINT FK_Branches_To_Banks FOREIGN KEY(Bank_Id) REFERENCES Banks(Id) ON DELETE CASCADE,
	CONSTRAINT FK_Branches_To_Cities FOREIGN KEY(City_Id) REFERENCES Cities(Id) ON DELETE CASCADE
);