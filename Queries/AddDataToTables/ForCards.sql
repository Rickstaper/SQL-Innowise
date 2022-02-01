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
)