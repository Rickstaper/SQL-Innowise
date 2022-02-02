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
)