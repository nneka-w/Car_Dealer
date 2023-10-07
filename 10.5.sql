SELECT SFirstName, SLastName, SHireDate, Salary
FROM SalesPerson$
ORDER BY SHireDate DESC

SELECT CFirstName, CLastName
FROM Customer$
WHERE CLastName LIKE '[M]%'
ORDER BY CLastName DESC

SELECT c.CFirstName, c.CLastName, c.AnnualIncome
FROM Customer$ AS c
INNER JOIN Encounter$ AS e
ON c.CustomerID = e.CustomerID
WHERE AnnualIncome > 80000 
AND SalesID = 5
AND Purchase = 1

SELECT c.CFirstName, c.CLastName, c.CreditID
FROM Customer$ AS c
INNER JOIN Encounter$ AS e 
ON c.CustomerID = e.CustomerID
WHERE CreditID <= 3
AND SalesID = 4
AND Purchase = 1

SELECT CFirstName, CLastName, CPhone
FROM Customer$
WHERE CLastName LIKE 'Hans%n'

SELECT COUNT (DISTINCT EncID) AS Encounters
FROM Encounter$
WHERE Purchase = 0

SELECT SFirstName, SLastName, COUNT(*) AS encounter_count
FROM SalesPerson$ AS s
JOIN Encounter$ AS e
ON e.SalesID = s.SalesID 
JOIN Customer$ AS c 
ON c.CustomerID = e.CustomerID 
WHERE CreditID <= 2
OR AnnualIncome < 25000
GROUP BY SFirstName, SLastName
ORDER BY SLastName

SELECT AVG(AnnualIncome) AS average_income
FROM Customer$ AS c
JOIN Encounter$ as e 
ON c.CustomerID = e.CustomerID 
WHERE Purchase = 1

SELECT CFirstName, CLastName, AnnualIncome, CreditID
FROM Customer$
WHERE CreditID BETWEEN 1 AND 4
AND AnnualIncome > 100000

SELECT c.CreditID AS CreditDescription,
COUNT(e.EncID) AS encounter_count
FROM Encounter$ AS e
JOIN Customer$ AS c ON e.CustomerID = c.CustomerID
WHERE YEAR(e.EncDate) = 2015
AND MONTH(e.EncDate) = 7
AND DATEPART(WEEKDAY, e.EncDate) = 1 --Sunday
GROUP BY c.CreditID
ORDER BY c.CreditID


