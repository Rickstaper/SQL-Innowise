CREATE PROCEDURE AddMoneyFromUserToCard
	@cardNumber NVARCHAR(19),
	@sum MONEY
AS
BEGIN
	UPDATE Cards
	SET Balance = Balance + @sum
	WHERE 0 <= ALL(SELECT Users.Balance - CardsTotalBalance.total_balance - @sum
					FROM Users
						LEFT JOIN (SELECT Cards.[User_Id], SUM(Cards.Balance) AS total_balance
									FROM Cards
									GROUP BY Cards.[User_Id]) AS CardsTotalBalance ON Users.Id = CardsTotalBalance.[User_Id]
						LEFT JOIN (SELECT Number, [User_Id] FROM Cards) AS CardsNumber ON CardsNumber.[User_Id] = Users.Id
					WHERE CardsNumber.Number = @cardNumber)
		AND Cards.Id = ALL(SELECT Id FROM Cards
						WHERE Cards.Number = @cardNumber)
END