CREATE TABLE Social_status
(
	Id INT IDENTITY PRIMARY KEY,
	current_status NVARCHAR(30) DEFAULT('unemployed') NOT NULL
);