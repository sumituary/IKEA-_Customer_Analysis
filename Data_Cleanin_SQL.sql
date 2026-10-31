-- CHECK 1 - MISSING CUSTOMER ID
SELECT COUNT(*) AS Missing_CustomerID
FROM dbo.RetailedCombined WHERE Customer_ID IS NULL;


-- CHECK 2 - NEGATIVE OR ZERO QUANTITY
SELECT COUNT(*) AS Negative_Qty
FROM dbo.RetailedCombined WHERE Quantity <= 0;


-- CHECK 3 - MISSING DESCRIPTION
SELECT COUNT(*) AS Missing_Description
FROM dbo.RetailedCombined
WHERE Description IS NULL;


-- CHECK 4 - EXACT DUPLICATE ROWS
SELECT Invoice, StockCode, Description, Quantity, InvoiceDate, Price, Customer_ID, Country,
       COUNT(*) AS ExactDupeCount
FROM dbo.RetailedCombined
GROUP BY Invoice, StockCode, Description, Quantity, InvoiceDate, Price, Customer_ID, Country
HAVING COUNT(*) > 1;