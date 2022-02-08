SELECT Users.Id, (Users.Balance - SUM(Cards.Balance)) AS Free_Resources
FROM Users
	LEFT JOIN Cards ON Cards.[User_id] = Users.Id
GROUP BY Users.Id, Users.Balance