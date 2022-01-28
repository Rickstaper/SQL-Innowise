CREATE PROCEDURE AddTenDollars
	@status NVARCHAR(30)
AS
UPDATE Users
SET Balance = Balance + 10
WHERE Users.Id = ANY(SELECT Users.Id
					FROM Social_status, Clients, Users
					WHERE Social_status.current_status = @status
						AND Social_status.id = Clients.Social_status_id
						AND Users.Client_id = Clients.Id)