SELECT
    C.Title,
    C.FirstName,
    C.MiddleName,
    C.LastName,
    C.Suffix,
    C.CompanyName,
    C.EmailAddress,
    C.Phone,
    A.AddressLine1,
    A.AddressLine2,
    A.City,
    A.StateProvince,
    A.CountryRegion,
    A.PostalCode
FROM SalesLT.Customer AS C
LEFT OUTER JOIN SalesLT.CustomerAddress AS CA
    ON C.CustomerID = CA.CustomerID
LEFT OUTER JOIN SalesLT.Address AS A
    ON CA.AddressID = A.AddressID
