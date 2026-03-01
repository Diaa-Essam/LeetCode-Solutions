SELECT C.name AS customers
FROM Customers C LEFT Join Orders O 
ON C.id = O.customerId
WHERE O.id IS NULL;