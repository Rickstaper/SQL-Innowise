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
)