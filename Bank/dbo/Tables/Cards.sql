CREATE TABLE [dbo].[Cards] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [Number]       NVARCHAR (19) NOT NULL,
    [Balance]      MONEY         DEFAULT ((0)) NULL,
    [Pass]         NVARCHAR (4)  NOT NULL,
    [Special_code] NVARCHAR (3)  NOT NULL,
    [Secret_word]  NVARCHAR (25) NOT NULL,
    [User_Id]      INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CHECK ([Balance]>=(0)),
    CONSTRAINT [FK_Cards_To_Users] FOREIGN KEY ([User_Id]) REFERENCES [dbo].[Users] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [UQ_Number] UNIQUE NONCLUSTERED ([Number] ASC)
);


GO
CREATE TRIGGER cards_update
ON Cards
INSTEAD OF UPDATE
AS BEGIN
	DECLARE @userBalance MONEY, 
			@currentTotalCardsBalance MONEY, 
			@resultTotalCardsBalance MONEY, 
			@cardBalanceBeforeUpdate MONEY, 
			@cardBalanceAfterUpdate MONEY

	SELECT @userBalance = (	SELECT Balance
							FROM Users
							WHERE Users.Id = (	SELECT [User_id] 
												FROM inserted))

	SELECT @currentTotalCardsBalance = (SELECT SUM(Cards.Balance)
										FROM Cards
										WHERE Cards.[User_Id] = (	SELECT Id 
																	FROM inserted)
										GROUP BY Cards.[User_Id])

	SELECT @cardBalanceBeforeUpdate = (	SELECT Balance
										FROM Cards
										WHERE Cards.Id = (	SELECT Id 
															FROM inserted))

	SELECT @cardBalanceAfterUpdate = (	SELECT Balance
										FROM inserted)

	SELECT @resultTotalCardsBalance = @currentTotalCardsBalance - @cardBalanceBeforeUpdate + @cardBalanceAfterUpdate

	UPDATE Cards
	SET Balance = @cardBalanceAfterUpdate
	WHERE Cards.Id = (	SELECT Id 
						FROM inserted)
		AND @userBalance >= @resultTotalCardsBalance
END