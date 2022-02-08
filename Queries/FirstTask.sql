SELECT DISTINCT Bank_Name
FROM Banks
	JOIN Branches ON Branches.Bank_Id = Banks.Id
WHERE Branches.City_Id = (	SELECT Id 
							FROM Cities
							WHERE City_Name = 'Bobruisk')