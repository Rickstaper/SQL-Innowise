﻿CREATE TABLE Cards
(
	Id INT IDENTITY PRIMARY KEY,
	Number NVARCHAR(19) NOT NULL,
	Balance MONEY DEFAULT(0) CHECK(Balance >= 0),
	Pass NVARCHAR(4) NOT NULL,
	Special_code NVARCHAR(3) NOT NULL,
	Secret_word NVARCHAR(25) NOT NULL,
	[User_id] INT NOT NULL,
	CONSTRAINT FK_Cards_To_Users FOREIGN KEY([User_id]) REFERENCES Users(Id) ON DELETE CASCADE,
	CONSTRAINT UQ_Number UNIQUE(Number)
);