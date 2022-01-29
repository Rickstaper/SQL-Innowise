SELECT Users.Id, (Users.Balance - Cards_TotalBalance.TotalBalance) AS free_resources
FROM Users
	LEFT JOIN	(SELECT Cards.[User_Id], SUM(Cards.Balance) AS TotalBalance
				FROM Cards
				GROUP BY Cards.[User_Id]) AS Cards_TotalBalance ON Users.Id = Cards_TotalBalance.[User_Id]