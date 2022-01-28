SELECT Social_status.Id AS Social_status, COUNT(*) AS CardsCount
FROM Cards 
	LEFT JOIN Users ON Users.Id = Cards.[User_Id]
	LEFT JOIN Clients ON Clients.Id = Users.Client_id
	LEFT JOIN Social_status ON Social_status.Id = Clients.Social_status_id
GROUP BY Social_status.Id