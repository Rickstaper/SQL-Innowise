SELECT Cards.Number, SelectedClient.FirstName, SelectedClient.SecondName, Cards.Balance, SelectedBank.Bank_Name
FROM Cards
	JOIN Users ON Users.Id = Cards.[User_id]

	JOIN (	SELECT Id, Bank_id, FirstName, SecondName 
			FROM Clients) AS SelectedClient ON SelectedClient.Id = Users.Client_id

	JOIN (	SELECT Id, Bank_Name 
			FROM Banks) AS SelectedBank ON SelectedBank.Id = SelectedClient.Bank_id