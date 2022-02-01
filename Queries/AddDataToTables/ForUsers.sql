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
)