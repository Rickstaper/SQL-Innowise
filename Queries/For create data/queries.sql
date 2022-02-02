CREATE TABLE Banks
(
	Id INT IDENTITY PRIMARY KEY,
	Bank_Name NVARCHAR(40) NOT NULL,
	CONSTRAINT UQ_Bank_Name UNIQUE(Bank_Name)
);

GO

CREATE TABLE Cities
(
	Id INT IDENTITY PRIMARY KEY,
	City_Name NVARCHAR(170) NOT NULL,
	CONSTRAINT UQ_City_Name UNIQUE(City_Name)
);

GO

CREATE TABLE Branches
(
	Id INT IDENTITY PRIMARY KEY,
	Branch_Name NVARCHAR(100) DEFAULT('Nameless'),
	Bank_Id INT NOT NULL,
	City_Id INT NOT NULL,
	CONSTRAINT FK_Branches_To_Banks FOREIGN KEY(Bank_Id) REFERENCES Banks(Id) ON DELETE CASCADE,
	CONSTRAINT FK_Branches_To_Cities FOREIGN KEY(City_Id) REFERENCES Cities(Id) ON DELETE CASCADE
);

GO

CREATE TABLE Social_status
(
	Id INT IDENTITY PRIMARY KEY,
	current_status NVARCHAR(30) DEFAULT('unemployed') NOT NULL
);

GO

CREATE TABLE Clients
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

GO

CREATE TABLE Users
(
	Id INT IDENTITY PRIMARY KEY,
	Created DATETIME NOT NULL,
	Client_id INT NOT NULL,
	Balance MONEY DEFAULT(0) CHECK (Balance >= 0),
	CONSTRAINT FK_Users_To_Clients FOREIGN KEY(Client_id) REFERENCES Clients(Id) ON DELETE CASCADE
);

GO

CREATE TABLE Cards
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

GO

INSERT INTO Banks(Bank_Name)
VALUES
('Alfa-bank'),
('Belarusbank'),
('Fransbank'),
('Paritetbank'),
('Solution bank');

GO

INSERT INTO Cities(City_Name)
VALUES
('Minsk'),
('Gomel'),
('Bobruisk'),
('Grodno'),
('Mogilev');

GO

INSERT INTO Branches(Branch_Name, Bank_Id, City_Id)
VALUES
(
	'Num 10',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Belarusbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Minsk')
),
(
	'Num 9',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Belarusbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Minsk')
),
(
	'Num 6',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Belarusbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Minsk')
),
(
	'On Uruchie',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Alfa-bank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Minsk')
),
(
	'Main office',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Alfa-bank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Minsk')
),
(
	'POV num 1',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Fransbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Minsk')
),
(
	'POV num 10',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Fransbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Minsk')
),
(
	'OP 36',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Paritetbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Minsk')
),
(
	'OP 40',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Paritetbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Minsk')
),
(
	'OP 41',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Paritetbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Minsk')
),
(
	'07/01',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Solution bank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Minsk')
),
(
	'07/02',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Solution bank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Minsk')
),
(
	'03/01',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Solution bank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Gomel')
),
(
	'Num 14',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Paritetbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Gomel')
),
(
	'POV 25',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Fransbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Gomel')
),
(
	'POV 26',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Fransbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Gomel')
),
(
	'POV 27',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Fransbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Gomel')
),
(
	'Num 300/3001',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Belarusbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Gomel')
),
(
	'Num 300/3002',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Belarusbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Gomel')
),
(
	'Num 300/3003',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Belarusbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Gomel')
),
(
	'8 March',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Alfa-bank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Gomel')
),
(
	'Num 703/7106',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Belarusbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Bobruisk')
),
(
	'Num 703/7111',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Belarusbank'),
	(SELECT Id FROM Cities WHERE City_Name = 'Bobruisk')
);

GO

INSERT INTO Social_status(current_status)
VALUES
('student'),
('employee'),
('disabled'),
(DEFAULT);

GO

INSERT INTO Clients(FirstName, SecondName, Age, Phone, Email, Bank_id, Social_status_id)
VALUES
(
	'Alexandr',
	'Svoktunovsky',
	23,
	'33-456-83-21',
	'dhgbfh@mail.ru',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Fransbank'),
	(SELECT Id FROM Social_status WHERE current_status = 'student')
),
(
	'Grigory',
	'Shlyapkin',
	45,
	'29-456-12-63',
	'jhgjgy2f@mail.ru',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Belarusbank'),
	(SELECT Id FROM Social_status WHERE current_status = 'employee')
),
(
	'Artur',
	'Gribnoy',
	33,
	'25-748-92-11',
	'sgfyieger@gmail.com',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Alfa-bank'),
	(SELECT Id FROM Social_status WHERE current_status = 'unemployed')
),
(
	'Denis',
	'Zloy',
	63,
	'33-213-92-01',
	'jgkwtfhg@inbox.ru',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Solution bank'),
	(SELECT Id FROM Social_status WHERE current_status = 'disabled')
),
(
	'Dmitry',
	'Krutoy',
	51,
	'29-936-16-39',
	'gjgjkhe2@inbox.ru',
	(SELECT Id FROM Banks WHERE Bank_Name = 'Paritetbank'),
	(SELECT Id FROM Social_status WHERE current_status = 'employee')
);

GO

INSERT INTO Users(Created, Client_id, Balance)
VALUES
(
	'2003-12-24 10:35:00',
	(SELECT Id FROM Clients WHERE FirstName = 'Alexandr' AND SecondName = 'Svoktunovsky'),
	34.35
),
(
	'2010-9-5 11:6:32',
	(SELECT Id FROM Clients WHERE FirstName = 'Grigory' AND SecondName = 'Shlyapkin'),
	90.99
),
(
	'2015-7-22 15:18:10',
	(SELECT Id FROM Clients WHERE FirstName = 'Artur' AND SecondName = 'Gribnoy'),
	1353
),
(
	'2017-10-3 17:25:15',
	(SELECT Id FROM Clients WHERE FirstName = 'Denis' AND SecondName = 'Zloy'),
	17284.93
),
(
	'2020-3-3 14:23:22',
	(SELECT Id FROM Clients WHERE FirstName = 'Dmitry' AND SecondName = 'Krutoy'),
	3736
);

GO

INSERT INTO Cards
VALUES
(
	'3647-3726-1734-1234',
	0,
	'3745',
	'182',
	'krasivaya',
	(SELECT Id FROM Users WHERE Client_id = (SELECT Id FROM Clients WHERE FirstName = 'Alexandr' AND SecondName = 'Svoktunovsky'))
),
(
	'3738-1920-2936-3728',
	10,
	'3927',
	'392',
	'shlem',
	(SELECT Id FROM Users WHERE Client_id = (SELECT Id FROM Clients WHERE FirstName = 'Grigory' AND SecondName = 'Shlyapkin'))
),
(
	'3846-2819-2738-3748',
	23,
	'1927',
	'302',
	'ruka',
	(SELECT Id FROM Users WHERE Client_id = (SELECT Id FROM Clients WHERE FirstName = 'Artur' AND SecondName = 'Gribnoy'))
),
(
	'8496-0173-3782-7846',
	12,
	'9723',
	'178',
	'greenland',
	(SELECT Id FROM Users WHERE Client_id = (SELECT Id FROM Clients WHERE FirstName = 'Denis' AND SecondName = 'Zloy'))
),
(
	'8913-9173-6273-2738',
	11,
	'8392',
	'937',
	'river',
	(SELECT Id FROM Users WHERE Client_id = (SELECT Id FROM Clients WHERE FirstName = 'Dmitry' AND SecondName = 'Krutoy'))
);