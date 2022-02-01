﻿CREATE TABLE Clients
(
	Id INT IDENTITY PRIMARY KEY,
	FirstName NVARCHAR(30) NOT NULL,
	SecondName NVARCHAR(30) NOT NULL,
	Age INT NOT NULL,
	Phone NVARCHAR(12) NOT NULL,
	Email NVARCHAR(30),
	Bank_id INT NOT NULL,
	Social_status_id INT NOT NULL,
	CONSTRAINT CK_Age CHECK(Age > 16 AND Age < 120),
	CONSTRAINT FK_Clients_To_Bank FOREIGN KEY(Bank_id) REFERENCES Banks(Id) ON DELETE CASCADE,
	CONSTRAINT FK_Clients_To_Social_status FOREIGN KEY(Social_status_id) REFERENCES Social_status(Id) ON DELETE CASCADE,
	CONSTRAINT UQ_Socual_status_id UNIQUE(Social_status_id)
);