USE Lagos_rent;

/** The Datasets **/
SELECT *
FROM rent_lag;


SELECT * 
FROM rent;


SELECT * 
FROM rent_2;

UPDATE rent
SET Price = CAST(REPLACE(Price, ' / year', '') AS UNSIGNED)
WHERE Pid > 0; 



SELECT DISTINCT Location
FROM rent_lag
ORDER BY Location DESC;

SELECT DISTINCT Neighboorhood
FROM rent_2
ORDER BY Neighboorhood ASC;

SELECT DISTINCT Neighboorhood
FROM rent_2
ORDER BY Neighboorhood DESC;
/"How many locations are properties from "/
SELECT COUNT(DISTINCT Neighboorhood) AS Locations
FROM rent_2;

SELECT COUNT(DISTINCT Location) AS Locations
FROM rent_lag;

/" Separating Island and Mainland"/
SELECT 
Price, 
Address, 
Property_name, 
Neighboorhood
FROM rent_2
WHERE Neighboorhood 
IN ('VI', 'Lekki', 'Ajah', 'Ibeju-Lekki', 'Ikoyi');


SELECT 
    Price,
    Address,
    Property_name,
    Neighboorhood,
    CASE 
        WHEN Neighboorhood IN ('VI', 'VGC', 'Lekki', 'Ajah', 'Ibeju-Lekki', 'Ikoyi', 'Lagos-Island', 'Sangotedo') THEN 'Island'
        ELSE 'Mainland'
    END AS Island_Location
FROM rent_2
WHERE Neighboorhood IN ('VI', 'VGC', 'Lekki', 'Ajah', 'Ibeju-Lekki', 'Ikoyi', 'Lagos-Island', 'Sangotedo');

SELECT *
FROM rent_lag;


CREATE TABLE rentIslandProp AS
SELECT 
    Apartment_Type,
    Price,
    Beds,
    Baths,
    Toilets,
    Location,
    CASE 
        WHEN Location IN ('Ajah', 'Chervon', 'Ikate', 'Ikota', 'Ikoyi', 'Lekki', 'Victpria Island') THEN 'Island'
        ELSE 'Mainland'
    END AS Island_Location
FROM rent_lag
WHERE Location IN ('Ajah', 'Chervon', 'Ikate', 'Ikota', 'Ikoyi', 'Lekki', 'Victpria Island');

SELECT *
FROM rentIslandProp;

CREATE TABLE IslandProp AS
SELECT 
    Price,
    Address,
    Property_name,
    Neighboorhood,
    CASE 
        WHEN Neighboorhood IN ('VI', 'VGC', 'Lekki', 'Ajah', 'Ibeju-Lekki', 'Ikoyi', 'Lagos-Island', 'Obalende', 'Sangotedo') THEN 'Island'
        ELSE 'Mainland'
    END AS Island_Location
FROM rent_2
WHERE Neighboorhood IN ('VI', 'VGC', 'Lekki', 'Ajah', 'Ibeju-Lekki', 'Ikoyi', 'Lagos-Island', 'Obalende', 'Sangotedo');

SELECT *
FROM IslandProp;

SELECT *
FROM
rent_lag
WHERE Price <= 1000000;


SELECT *
FROM
rent_lag
WHERE Price <= 1000000
AND Location IN ('Ajah','Ikoyi', 'Lekki', 'Victoria Island');



SELECT *
FROM
rent_2
WHERE Price <= 1000000
AND Neighboorhood IN ('Ajah', 'Ikoyi', 'Lekki', 'VGC', 'VI')


'/* Mainlandproperties */'
SELECT DISTINCT Location
FROM rent_lag
ORDER BY Location DESC;

CREATE TABLE rentMainlandProperties AS
SELECT 
    Apartment_Type,
    Price,
    Beds,
    Baths,
    Toilets,
    Location,
    CASE 
        WHEN Location IN ('Ajao Estate', 'Alagunta', 'Alakuko',
        'Ayobo', 'Bariga', 'Folagoro', 
        'Gbagada', 'Igando', 'Ikeja', 
        'Ikotun', 'Ilaje', 'Ilupeju', 'Isolo', 'Iyana-Ipaja', 'Ketu', 'Magodo',
        'Maryland', 'Okota', 'Onike', 'Onipanu', 'Oshodi', 'Palmgrove', 'Shomolu', 'Surulere', 'Yaba') THEN 'Mainland'
        ELSE 'Island'
    END AS Mainland_Location
FROM rent_lag
WHERE Location IN ('Ajao Estate', 'Alagunta', 'Alakuko',
        'Ayobo', 'Bariga', 'Folagoro', 
        'Gbagada', 'Igando', 'Ikeja', 
        'Ikotun', 'Ilaje', 'Ilupeju', 'Isolo', 'Iyana-Ipaja', 'Ketu', 'Magodo',
        'Maryland', 'Okota', 'Onike', 'Onipanu', 'Oshodi', 'Palmgrove', 'Shomolu', 'Surulere', 'Yaba');
 
 SELECT *
 FROM rentMainlandProperties;

CREATE TABLE MainlandProperties AS
SELECT 
    Price,
    Address,
    Property_name,
    Neighboorhood,
    CASE 
        WHEN Neighboorhood IN ('Abule-Egba', 'Alapere', 'Alimosho',
        'Amuwo-Odofin', 'Apapa', 'Badagry', 'Bariga', 'Ejigbo', 'Epe', 
        'Gbagada', 'Idimu', 'Ifako-Ijaiye', 'Igando', 'Ijora', 'Ikeja', 
        'Ikorodu', 'Ikosi', 'Ilupeju', 'Ipaja', 'Isolo', 'Kosofe', 
        'Maryland', 'Mushin', 'Ogba', 'Ogudu', 'Ojo', 'Ojota', 'Okota', 'Orile', 'Oshodi', 'Shomolu', 'Surulere', 'Yaba') THEN 'Mainland'
        ELSE 'Island'
    END AS Mainland_Location
FROM rent_2
WHERE Neighboorhood IN ('Abule-Egba', 'Alapere', 'Alimosho',
        'Amuwo-Odofin', 'Apapa', 'Badagry', 'Bariga', 'Ejigbo', 'Epe', 
        'Gbagada', 'Idimu', 'Ifako-Ijaiye', 'Igando', 'Ijora', 'Ikeja', 
        'Ikorodu', 'Ikosi', 'Ilupeju', 'Ipaja', 'Isolo', 'Kosofe', 
        'Maryland', 'Mushin', 'Ogba', 'Ogudu', 'Ojo', 'Ojota', 'Okota', 'Orile', 'Oshodi', 'Shomolu', 'Surulere', 'Yaba');
        
        
        
        
	SELECT * 
    FROM MainlandProperties;
    
    SELECT DISTINCT
    Neighboorhood,
    Address,
    Price
    FROM MainlandProperties
    WHERE Price >= 1000000
        ;
        
        
        SELECT DISTINCT
    Neighboorhood,
    Address,
    Price
    FROM MainlandProperties
    WHERE Price >= 3500000
        ;


SELECT Neighboorhood, Address, Price
FROM MainlandProperties
WHERE Price >= 3500000
ORDER BY Price DESC
LIMIT 1;

SELECT Neighboorhood, Address, Price
FROM IslandProperties
WHERE Price >= 3500000
ORDER BY Price DESC
LIMIT 1;

SELECT
    Neighboorhood,
    Address,
    Price
FROM IslandProp
WHERE Price >= 3500000 
ORDER BY Price DESC
;

'/MIN PRICE/'

SELECT Neighboorhood, 
MIN(Price) 
AS Min_Price
FROM IslandProp
GROUP BY Neighboorhood;

SELECT Neighboorhood, 
MIN(Price) 
AS Min_Price
FROM MainlandProperties
GROUP BY Neighboorhood;

SELECT Location, 
MIN(Price) 
AS Min_Price
FROM rentIslandProp
GROUP BY Location;

SELECT Location, 
MIN(Price) 
AS Min_Price
FROM rentMainlandProperties
GROUP BY Location;

'/MAX PRICE/'

SELECT Neighboorhood, 
MAX(Price) 
AS Max_Price
FROM IslandProp
GROUP BY Neighboorhood;

SELECT Neighboorhood, 
MAX(Price) 
AS Max_Price
FROM MainlandProperties
GROUP BY Neighboorhood;

SELECT Location, 
MAX(Price) 
AS Max_Price
FROM rentIslandProp
GROUP BY Location;

SELECT Location, 
MAX(Price) 
AS Max_Price
FROM rentMainlandProperties
GROUP BY Location;

SELECT Neighboorhood, 
AVG(Price) 
AS Average_Price
FROM IslandProp
GROUP BY Neighboorhood;

SELECT Neighboorhood, COUNT(*) AS Number_of_Apartments
FROM IslandProp
GROUP BY Neighboorhood
ORDER BY Number_of_Apartments DESC
;


SELECT Neighboorhood, 
AVG(Price) 
AS Average_Price
FROM MainlandProperties
GROUP BY Neighboorhood
;

SELECT Neighboorhood, COUNT(*) AS Number_of_Apartments
FROM MainlandProperties
GROUP BY Neighboorhood
ORDER BY Number_of_Apartments DESC
LIMIT 10;

SELECT Apartment_Type, COUNT(*) AS Most_Type
FROM rentIslandProp
GROUP BY Apartment_Type
ORDER BY Most_Type DESC;




SELECT *
FROM rent_lag;

DESCRIBE
rent_lag;

ALTER TABLE rent_lag
CHANGE COLUMN `Apartment _Type` Apartment_Type text;


SELECT Apartment_Type, COUNT(*) AS Num_Apartments
FROM rent_lag
GROUP BY Apartment_Type
ORDER BY Num_Apartments DESC;


SELECT Location, SUM(Beds) AS Total_Beds, SUM(Baths) AS Total_Baths
FROM rent_lag
GROUP BY Location;

SELECT *
FROM rent_lag;

'/* most expensive apartments based on price per bedroom*/'
SELECT  Apartment_Type, Price, Beds, Baths, Toilets, Location, Description
FROM rent_lag
ORDER BY (Price / Beds) DESC
LIMIT 10;

'/**Most Apartment type**/'
SELECT Apartment_Type, COUNT(*) AS Most_Apartments
FROM rentIslandProp
GROUP BY Apartment_Type
ORDER BY Most_Apartments DESC;

SELECT Apartment_Type, COUNT(*) AS Most_Apartments
FROM rentMainlandProperties
GROUP BY Apartment_Type
ORDER BY Most_Apartments DESC;



