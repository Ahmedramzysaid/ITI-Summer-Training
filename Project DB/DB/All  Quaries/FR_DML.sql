-- 1️⃣ SalesOffice first (Number auto-generates: 101, 201, 301, ...)
INSERT INTO SalesOffice (Loc, ManageerId)
VALUES
('Cairo', NULL),
('Alexandria', NULL),
('Giza', NULL),
('Mansoura', NULL),
('Aswan', NULL),
('Luxor', NULL),
('Tanta', NULL),
('Ismailia', NULL),
('Port Said', NULL),
('Suez', NULL);

-- 2️⃣ Emp (NumberSales references SalesOffice.Number)
INSERT INTO Emp (Name, NumberSales)
VALUES
('Ahmed', 101),
('Mona', 201),
('Omar', 301),
('Sara', 401),
('Ali', 501),
('Nour', 601),
('Khaled', 701),
('Laila', 801),
('Mahmoud', 901),
('Hassan', 1001);

-- 3️⃣ Update SalesOffice to set ManagerId to actual Emp IDs (optional)
UPDATE SalesOffice SET ManageerId = Id FROM Emp WHERE SalesOffice.Number = Emp.NumberSales;

-- 4️⃣ Owner (Id auto-generates: 10, 20, 30, ...)
INSERT INTO Owner (Name)
VALUES
('Owner1'), ('Owner2'), ('Owner3'), ('Owner4'), ('Owner5'),
('Owner6'), ('Owner7'), ('Owner8'), ('Owner9'), ('Owner10');

-- 5️⃣ Property (NumberSales references SalesOffice.Number)
INSERT INTO propety (Address, City, State, Zip, NumberSales)
VALUES
('Addr1', 'Alex', 'State1', 10001, 101),
('Addr2', 'Alex', 'State1', 10002, 201),
('Addr3', 'Alex', 'State1', 10003, 301),
('Addr4', 'Alex', 'State1', 10004, 401),
('Addr5', 'Alex', 'State1', 10005, 501),
('Addr6', 'Alex', 'State1', 10006, 601),
('Addr7', 'Alex', 'State1', 10007, 701),
('Addr8', 'Alex', 'State1', 10008, 801),
('Addr9', 'Alex', 'State1', 10009, 901),
('Addr10', 'Alex', 'State1', 10010, 1001);

-- 6️⃣ OwnerProperty (Pid references propety, Owner_Id references Owner)
INSERT INTO OwnerProperty (Owner_Id, Pid, Percent_owned)
VALUES
(10, 5, 50.0), (20, 10, 50.0), (30, 15, 50.0), (40, 20, 50.0), (50, 25, 50.0),
(60, 30, 50.0), (70, 35, 50.0), (80, 40, 50.0), (90, 45, 50.0), (100, 50, 50.0);


INSERT INTO OwnerProperty (Owner_Id, Pid, Percent_owned)
VALUES
(10, 5, 1.0), (20, 10, 1.0)
INSERT INTO OwnerProperty (Owner_Id, Pid, Percent_owned)
VALUES
 (30, 15, 50.0), (40, 20, 50.0), (50, 25, 50.0),
(60, 30, 50.0), (70, 35, 50.0), (80, 40, 50.0), (90, 45, 50.0), (100, 50, 50.0);