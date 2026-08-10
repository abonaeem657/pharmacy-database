commit;
-- 1. زيادة راتب الموظفين اللي راتبهم أقل من 5000 بنسبة 10%
UPDATE Employees
SET salary = salary * 1.10
WHERE salary < 5000;

-- 2. زيادة راتب الموظفين القدامى (قبل 2018) بمبلغ ثابت 500
UPDATE Employees
SET salary = salary + 500
WHERE hire_date < TO_DATE('2018-01-01', 'YYYY-MM-DD');

-- 3. تحديث كمية الدواء في المخزون بعد عملية بيع
UPDATE Inventory
SET quantity = quantity - 10
WHERE drug_id = 1;

-- 4. تحديث رقم هاتف عميل
UPDATE patients
SET phone = '0799999999'
WHERE patient_id = 1;

-- 5. تحديث المدير لموظف معين
UPDATE Management
SET manager_id = 3
WHERE emp_id = 2;
rollback;
