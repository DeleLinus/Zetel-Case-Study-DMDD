-- 1---------------------------------
SELECT 
    COUNT(DISTINCT (ConnectID)) AS connect_count
FROM
    mobile.connect;


-- 2---------------------------------
SELECT 
    *
FROM
    staff
WHERE
    LCASE(Address) LIKE '%st%';


-- 3---------------------------------
SELECT DISTINCT
    (c.CustomerID),
    CONCAT(c.Surname, ' ', c.Given) AS InctiveCustomersName
FROM
    customer c
        JOIN
    mobile m ON (c.CustomerID = m.CustomerID)
WHERE
    m.Cancelled IS NOT NULL;


-- 4---------------------------------
SELECT 
    PlanName
FROM
    plan
ORDER BY DataAllowance DESC
LIMIT 1 , 1;


-- 5---------------------------------
SELECT 
    StaffID, Surname, Given, DOB, Sex, Suburb, RatePerHour
FROM
    mobile.staff
WHERE
    RatePerHour > (SELECT 
            AVG(RatePerHour)
        FROM
            mobile.staff);


-- 6---------------------------------
SELECT 
    PlanName, COUNT(PlanName) AS count
FROM
    mobile.mobile
GROUP BY PlanName
ORDER BY count DESC
LIMIT 2;


-- 7---------------------------------
SELECT 
    CustomerID, Surname, Given, Sex, Suburb
FROM
    customer
WHERE
    CustomerID IN (SELECT 
            CustomerID
        FROM
            mobile
        WHERE
            PlanName = 'ExtraSmall');


-- 8---------------------------------
SELECT 
    t2.TowerID,
    DATEDIFF(CURRENT_TIMESTAMP(), t1.CallDate) AS recency
FROM
    calls t1,
    connect t2
WHERE
    t1.CallsID = t2.CallsID
ORDER BY recency ASC;


-- 9---------------------------------
SELECT 
    CustomerID, Surname
FROM
    customer
WHERE
    CustomerID IN (SELECT DISTINCT
            (CustomerID)
        FROM
            mobile
        WHERE
            PhoneColour IN (SELECT 
                    PhoneColour
                FROM
                    mobile
                WHERE
                    CustomerID IN (SELECT 
                            CustomerID
                        FROM
                            customer
                        WHERE
                            Surname = 'Rajoo')));

-- 10---------------------------------
SELECT 
    c.CustomerID, c.Surname, c.Given
FROM
    customer c,
    (SELECT 
        CustomerID, COUNT(CustomerID) AS number_of_phone
    FROM
        mobile
    GROUP BY CustomerID
    HAVING number_of_phone > 1) many_phone
WHERE
    c.CustomerID = many_phone.CustomerID;


-- 11------------------------------------
SET SQL_SAFE_UPDATES = 0;

UPDATE mobile 
SET 
    PlanName = 'Budget3Extra'
WHERE
    PlanName = 'Budget3';

UPDATE plan 
SET 
    PlanName = 'Budget3Extra'
WHERE
    PlanName = 'Budget3';

SET SQL_SAFE_UPDATES = 1;


-- 12---------------------------------
SELECT 
    staff_with_supervisor.StaffID,
    staff_with_supervisor.Surname,
    staff_with_supervisor.Given,
    CONCAT(s.Surname, ', ', s.Given) AS Supervisor_Names
FROM
    staff s,
    (SELECT 
        StaffID, Surname, Given, SupervisorID
    FROM
        staff
    WHERE
        SupervisorID > 0) staff_with_supervisor
WHERE
    staff_with_supervisor.SupervisorID = s.StaffID;
   
   
-- 13---------------------------------
SELECT 
    StaffID,
    CONCAT(Surname, ', ', Given) AS FullName,
    DATE(Joined) AS Joined,
    TIMESTAMPDIFF(YEAR, Joined, CURDATE()) AS TotalYears
FROM
    staff
ORDER BY TotalYears DESC
LIMIT 1;


-- 14a---------------------------------
SELECT 
    PlanName
FROM
    plan
WHERE
    PlanName NOT IN (SELECT DISTINCT
            (PlanName)
        FROM
            mobile);
            
-- 14b---------------------------------
SELECT DISTINCT
    (p.PlanName)
FROM
    plan p
        LEFT JOIN
    mobile m ON (p.PlanName = m.PlanName)
WHERE
    m.PlanName IS NULL;
    
    
-- 15---------------------------------
SELECT 
    cs.CustomerID,
    CONCAT(cs.Surname, ', ', cs.Given) AS CustomerName,
    m.PhoneNumber,
    SUM(c.CallDuration) / 3600 AS TotalHours
FROM
    calls c
        JOIN
    mobile m ON c.MobileID = m.MobileID
        JOIN
    customer cs ON m.CustomerID = cs.CustomerID
WHERE
    (MONTHNAME(c.CallDate) = 'August'
        AND YEAR(c.CallDate) = 2019)
GROUP BY m.PhoneNumber
ORDER BY TotalHours DESC;


-- 16---------------------------------
CREATE VIEW PopularityView AS
    SELECT 
        PlanName, COUNT(PlanName) AS populaity
    FROM
        mobile
    GROUP BY PlanName;

SELECT 
    PlanName
FROM
    PopularityView
ORDER BY populaity DESC
LIMIT 1;


-- 17---------------------------------
SELECT 
    t.Location, COUNT(t.Location) AS TotalConnections
FROM
    connect co
        JOIN
    calls ca ON (co.CallsID = ca.CallsID)
        JOIN
    tower t ON (co.TowerID = t.TowerID)
WHERE
    YEAR(CallDate) > 2018
GROUP BY t.Location;


-- 18---------------------------------
(SELECT 
    c.*,
    m.BrandName,
    TIMESTAMPDIFF(YEAR, m.Joined, CURDATE()) AS YearofUsage
FROM
    customer c
        JOIN
    mobile m ON (c.CustomerID = m.CustomerID)
WHERE
    (m.BrandName = 'Samsung')
ORDER BY YearofUsage
LIMIT 1) UNION ALL (SELECT 
    c.*,
    m.BrandName,
    TIMESTAMPDIFF(YEAR, m.Joined, CURDATE()) AS YearofUsage
FROM
    customer c
        JOIN
    mobile m ON (c.CustomerID = m.CustomerID)
WHERE
    (m.BrandName = 'Samsung')
ORDER BY YearofUsage DESC
LIMIT 1);


-- 19---------------------------------
SELECT 
    MONTHNAME(Joined) AS JoinedMonth,
    Joined AS JoinedDate,
    CONCAT(Surname, ' ', Given) AS StaffName
FROM
    staff
ORDER BY JoinedMonth DESC;

