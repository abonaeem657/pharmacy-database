-- ============================================================
--        Pharmacy Database - Best SELECT Statements
-- ============================================================


-- ============================================================
-- SECTION 1: BASIC SELECT (CH1_4 + CH3)
-- ============================================================

-- 1. الراتب الأساسي + البونص + الراتب الكامل
-- (أحسن جملة بالمشروع - تجمع جدولين وحساب)
SET SERVEROUTPUT ON   ;
DECLARE
 v_name Employees.name%TYPE;
  v_salary  Employees.salary%TYPE;
  v_members Family.family_members%TYPE;
  v_bonus NUMBER;
 v_total NUMBER;
BEGIN
SELECT e.name, e.salary, f.family_members
INTO v_name, v_salary, v_members
FROM Employees e, Family f
WHERE e.emp_id = f.emp_id AND e.emp_id = &emp_id;

 v_bonus := 50 * v_members;
 v_total := v_salary + v_bonus;

    DBMS_OUTPUT.PUT_LINE('Name        : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Basic Salary: ' || v_salary);
    DBMS_OUTPUT.PUT_LINE('Bonus       : ' || v_bonus);
    DBMS_OUTPUT.PUT_LINE('Total Salary: ' || v_total);
END;
/


-- 2. عرض الموظف ومديره
-- (تظهر الـ Recursive Relationship)
SELECT e.name"employee_name",m.name"manager_name"

FROM Management mg, Employees e, Employees m

WHERE mg.emp_id= e.emp_id
  AND mg.manager_id = m.emp_id


-- 3. مبيعات كل مريض
-- (تجمع 3 جداول مع بعض)
SELECT p.name "patient_name",d.drug_name,s.quantity,s.sale_date

FROM Sales s, Patients p, Drugs d

WHERE s.patient_id = p.patient_id
  AND s.drug_id    = d.drug_id


-- ============================================================
-- SECTION 2: GROUP FUNCTIONS (CH5)
-- ============================================================

-- 4. أعلى وأقل وأوسط راتب
SELECT MAX(salary)"max_salary",
       MIN(salary)"min_salary",
       AVG(salary)"avg_salary"
FROM Employees


-- 5. مجموع الكميات المباعة لكل دواء
SELECT d.drug_name, SUM(s.quantity) AS total_sold
FROM Sales s, Drugs d
WHERE s.drug_id = d.drug_id
GROUP BY d.drug_name


-- ============================================================
-- SECTION 3: SUBQUERIES (CH6)
-- ============================================================

-- 6. الموظفين اللي راتبهم أعلى من المتوسط
SELECT name, salary
FROM Employees
WHERE salary > (SELECT AVG(salary) FROM Employees)


-- 7. الأدوية اللي ما بيعت ولا مرة
SELECT DRUG_ID,drug_name
FROM Drugs
WHERE drug_id NOT IN (SELECT drug_id FROM Sales)


-- ============================================================
-- SECTION 4: SUBSTITUTION VARIABLES (CH8)
-- ============================================================

-- 8. بحث عن موظف باسمه (تفاعلي)
SELECT * FROM Employees
WHERE name = '&employee_name'


-- 9. عرض مبيعات مريض معين (تفاعلي)
SELECT d.drug_name, s.quantity, s.sale_date
FROM Sales s, Drugs d
WHERE s.drug_id    = d.drug_id
  AND s.patient_id = &patient_id