SELECT DISTINCT Bank_Name
FROM Banks, Branches,
	(SELECT Id 
	FROM Cities
	WHERE Citiy_Name = 'Grodno') AS Selected
WHERE Branches.City_Id = Selected.Id
	AND Branches.Bank_Id = Banks.Id	