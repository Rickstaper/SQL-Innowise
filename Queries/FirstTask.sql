SELECT DISTINCT Bank_Name
FROM Banks
	JOIN Branches ON Branches.Bank_Id = Banks.Id
	JOIN Cities ON Cities.Id = Branches.City_Id
WHERE Cities.City_Name = 'Gomel'