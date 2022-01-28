CREATE TRIGGER users_update
ON Users
INSTEAD OF UPDATE
AS BEGIN
	DECLARE @changedBalance MONEY, @totalCardsBalance MONEY
	SELECT @changedBalance = (SELECT Balance FROM inserted)
	SELECT @totalCardsBalance = (SELECT SUM(Cards.Balance) AS total_balance
								FROM Cards
								WHERE Cards.[User_Id] = (SELECT Id FROM inserted)
								GROUP BY Cards.[User_Id])
	UPDATE Users
	SET Balance = @changedBalance
	WHERE Users.Id = ALL(SELECT Id FROM inserted)
		AND @changedBalance >= @totalCardsBalance
END