CREATE TRIGGER cards_update
ON Cards
INSTEAD OF UPDATE
AS BEGIN
	DECLARE @userBalance MONEY, 
			@currentTotalCardsBalance MONEY, 
			@resultTotalCardsBalance MONEY, 
			@cardBalanceBeforeUpdate MONEY, 
			@cardBalanceAfterUpdate MONEY

	SELECT @userBalance =	(SELECT Balance
							FROM Users
							WHERE Users.Id =	(SELECT [User_id] 
												FROM inserted))

	SELECT @currentTotalCardsBalance = (SELECT SUM(Cards.Balance)
										FROM Cards
										WHERE Cards.[User_Id] =	(SELECT [User_id] 
																FROM inserted)
										GROUP BY Cards.[User_Id])

	SELECT @cardBalanceBeforeUpdate =	(SELECT Balance
										FROM Cards
										WHERE Cards.Id =	(SELECT Id 
															FROM inserted))

	SELECT @cardBalanceAfterUpdate =	(SELECT Balance
										FROM inserted)

	SELECT @resultTotalCardsBalance = @currentTotalCardsBalance - @cardBalanceBeforeUpdate + @cardBalanceAfterUpdate

	UPDATE Cards
	SET Balance = @cardBalanceAfterUpdate
	WHERE Cards.Id =	(SELECT Id 
						FROM inserted)
		AND @userBalance >= @resultTotalCardsBalance

	IF @@ROWCOUNT = 0
		PRINT 'WARNING:No rows were updated';
	ELSE
		PRINT 'Balance was updated successfully';
END