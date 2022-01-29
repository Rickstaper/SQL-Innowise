SELECT Social_status.Id AS Social_status,
	(SELECT COUNT(*)
	FROM Cards, Users, Clients
	WHERE Cards.[User_Id] = Users.Id
		AND Users.Client_id = Clients.Id
		AND Clients.Social_status_id = Social_status.Id) AS CardsCount
FROM Social_status