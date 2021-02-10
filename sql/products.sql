SELECT
    P.Name,
    P.ProductNumber,
    P.Color,
    P.StandardCost,
    P.ListPrice,
    P.[Size],
    P.Weight,
    PC.Name AS Category,
    PM.Name AS Model,
    PD.[Description] AS [Description],
    P.SellStartDate,
    P.SellEndDate,
    P.DiscontinuedDate
FROM SalesLT.Product AS P
LEFT OUTER JOIN SalesLT.ProductCategory AS PC
    ON P.ProductCategoryID = PC.ProductCategoryID
LEFT OUTER JOIN SalesLT.ProductModel AS PM
    ON P.ProductModelID = PM.ProductModelID
LEFT OUTER JOIN SalesLT.ProductModelProductDescription AS PMPD
    ON PM.ProductModelID = PMPD.ProductModelID
LEFT OUTER JOIN SalesLT.ProductDescription PD
    ON PMPD.ProductDescriptionID = PD.ProductDescriptionID