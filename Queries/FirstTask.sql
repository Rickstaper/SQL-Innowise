SELECT DISTINCT Bank_Name
FROM Banks, Branches
WHERE Branches.City_Id = (	SELECT Id 
							FROM Cities
							WHERE Citiy_Name = 'Bobruisk')
	AND Branches.Bank_Id = Banks.Id