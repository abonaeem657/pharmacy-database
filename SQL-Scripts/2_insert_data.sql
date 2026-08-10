
-- Employees
INSERT INTO Employees VALUES (1, 'Ahmed Ali',     35, 5000, TO_DATE('2018-03-15','YYYY-MM-DD'));
INSERT INTO Employees VALUES (2, 'Sara Hassan',   28, 4200, TO_DATE('2020-06-01','YYYY-MM-DD'));
INSERT INTO Employees VALUES (3, 'Omar Khalid',   45, 7500, TO_DATE('2015-01-10','YYYY-MM-DD'));
INSERT INTO Employees VALUES (4, 'Lina Nasser',   32, 4800, TO_DATE('2019-09-20','YYYY-MM-DD'));
INSERT INTO Employees VALUES (5, 'Yousef Majed',  50, 9000, TO_DATE('2010-07-05','YYYY-MM-DD'));
 
-- Suppliers
INSERT INTO Suppliers VALUES (1, 'PharmaCo',      '0799000001');
INSERT INTO Suppliers VALUES (2, 'MediSupply',    '0799000002');
INSERT INTO Suppliers VALUES (3, 'HealthDist',    '0799000003');
 
-- Drugs
INSERT INTO Drugs VALUES (1, 'Paracetamol', TO_DATE('2024-01-01','YYYY-MM-DD'), 1, 1);
INSERT INTO Drugs VALUES (2, 'Amoxicillin', TO_DATE('2024-03-10','YYYY-MM-DD'), 2, 2);
INSERT INTO Drugs VALUES (3, 'Ibuprofen',   TO_DATE('2023-11-15','YYYY-MM-DD'), 3, 1);
INSERT INTO Drugs VALUES (4, 'Metformin',   TO_DATE('2024-05-20','YYYY-MM-DD'), 4, 3);
INSERT INTO Drugs VALUES (5, 'Omeprazole',  TO_DATE('2024-02-28','YYYY-MM-DD'), 2, 2);
 
-- Inventory
INSERT INTO Inventory VALUES (1, 500, TO_DATE('2026-01-01','YYYY-MM-DD'));
INSERT INTO Inventory VALUES (2, 300, TO_DATE('2025-06-30','YYYY-MM-DD'));
INSERT INTO Inventory VALUES (3, 150, TO_DATE('2024-12-31','YYYY-MM-DD'));
INSERT INTO Inventory VALUES (4, 400, TO_DATE('2026-09-15','YYYY-MM-DD'));
INSERT INTO Inventory VALUES (5, 200, TO_DATE('2025-03-20','YYYY-MM-DD'));
 
-- patients
INSERT INTO patients VALUES (1, 'Khalid Mansour', '0780000001');
INSERT INTO patients VALUES (2, 'Maha Samir',     '0780000002');
INSERT INTO patients VALUES (3, 'Tariq Fawzi',    '0780000003');
 
-- Family
INSERT INTO Family VALUES (1, 3);
INSERT INTO Family VALUES (2, 1);
INSERT INTO Family VALUES (3, 5);
INSERT INTO Family VALUES (4, 2);
INSERT INTO Family VALUES (5, 4);
 
-- Management
INSERT INTO Management VALUES (1, 5);
INSERT INTO Management VALUES (2, 3);
INSERT INTO Management VALUES (4, 3);
INSERT INTO Management VALUES (3, 5);
INSERT INTO Management (emp_id) VALUES (5); --------->> top manager, المدير ال رئيسي
 
-- Sales
INSERT INTO Sales VALUES (1, 1, 1, 2, SYSDATE);
INSERT INTO Sales VALUES (2, 2, 3, 1, SYSDATE);
INSERT INTO Sales VALUES (3, 3, 2, 5, SYSDATE);
INSERT INTO Sales VALUES (4, 1, 4, 3, SYSDATE);
 