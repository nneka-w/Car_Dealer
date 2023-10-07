--q1--
SELECT SFirstName, SLastName, SHireDate, Salary
FROM SalesPerson$
ORDER BY SHireDate DESC

--q2--
SELECT CFirstName, CLastName
FROM Customer$
WHERE CLastName LIKE '[M]%'
ORDER BY CLastName DESC

--q3--
SELECT c.CFirstName, c.CLastName, c.AnnualIncome
FROM Customer$ AS c
INNER JOIN Encounter$ AS e
ON c.CustomerID = e.CustomerID
WHERE AnnualIncome > 80000 
AND SalesID = 5
AND Purchase = 1

--q4--
SELECT c.CFirstName, c.CLastName, c.CreditID
FROM Customer$ AS c
INNER JOIN Encounter$ AS e 
ON c.CustomerID = e.CustomerID
WHERE CreditID <= 3
AND SalesID = 4
AND Purchase = 1

--q5--
SELECT CFirstName, CLastName, CPhone
FROM Customer$
WHERE CLastName LIKE 'Hans%n'

--q6--
SELECT COUNT (DISTINCT EncID) AS Encounters
FROM Encounter$
WHERE Purchase = 0

--q7--
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

--q8--
SELECT AVG(AnnualIncome) AS average_income
FROM Customer$ AS c
JOIN Encounter$ as e 
ON c.CustomerID = e.CustomerID 
WHERE Purchase = 1

--q9--
SELECT CFirstName, CLastName, AnnualIncome, CreditID
FROM Customer$
WHERE CreditID BETWEEN 1 AND 4
AND AnnualIncome > 100000

--q10--
SELECT c.CreditID AS CreditDescription,
COUNT(e.EncID) AS encounter_count
FROM Encounter$ AS e
JOIN Customer$ AS c ON e.CustomerID = c.CustomerID
WHERE YEAR(e.EncDate) = 2015
AND MONTH(e.EncDate) = 7
AND DATEPART(WEEKDAY, e.EncDate) = 1 --Sunday
GROUP BY c.CreditID
ORDER BY c.CreditID


