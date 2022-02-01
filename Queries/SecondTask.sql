﻿SELECT Number 
FROM Cards, Users,
	(	SELECT Id 
		FROM Banks
		WHERE Bank_Name = 'Fransbank') AS SelectedBank,

	(	SELECT Id, Bank_id 
		FROM Clients
		WHERE FirstName = 'Alexandr'
		AND SecondName = 'Svoktunovsky') AS SelectedClient

WHERE Cards.Balance = 0
	AND SelectedBank.Id = SelectedClient.Bank_id
	AND SelectedClient.Id = Users.Client_id
	AND Users.Id = Cards.[User_Id]