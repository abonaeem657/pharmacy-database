-- 1. Employees
CREATE TABLE Employees (
    emp_id NUMBER(5),
    name VARCHAR2(100) NOT NULL,
    age NUMBER(3),
    salary NUMBER(10,2),
    hire_date DATE,
    CONSTRAINT emp_empID_pk PRIMARY KEY (emp_id),
    CONSTRAINT emp_age_chk CHECK (age > 18),
    CONSTRAINT emp_sal_chk CHECK (salary >=250)
);

-- 2. Suppliers
CREATE TABLE Suppliers (
    supplier_id NUMBER(5),
    supplier_name VARCHAR2(100) NOT NULL,
    phone VARCHAR2(20),
    CONSTRAINT sup_supID_pk PRIMARY KEY (supplier_id),
    CONSTRAINT sup_phone_uq UNIQUE (phone)
);

-- 3. Drugs
CREATE TABLE Drugs (
    drug_id NUMBER(5),
    drug_name VARCHAR2(100) NOT NULL,
    production_date DATE,
    emp_id NUMBER(5),
    supplier_id NUMBER(5),
    CONSTRAINT drug_drugid_pk PRIMARY KEY (drug_id),
    CONSTRAINT drug_empid_fk FOREIGN KEY (emp_id)REFERENCES Employees(emp_id),
    CONSTRAINT drug_sup_fk FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

-- 4. Inventory
CREATE TABLE Inventory (
    drug_id NUMBER(5),
    quantity NUMBER(6),
    expiry_date DATE NOT NULL,
    CONSTRAINT inv_qua_chk CHECK (quantity >= 0),
    CONSTRAINT inv_drug_fk FOREIGN KEY (drug_id) REFERENCES Drugs(drug_id)
);

-- 5. patients
CREATE TABLE patients (
    patient_id NUMBER(5),
    name VARCHAR2(100) NOT NULL,
    phone VARCHAR2(20),
    CONSTRAINT pati_patID_pk PRIMARY KEY (patient_id),
    CONSTRAINT pati_phone_uq UNIQUE (phone)
);

-- 6. Family
CREATE TABLE Family (
    emp_id NUMBER(5),
    family_members NUMBER(3),
    CONSTRAINT fam_fm_chk CHECK (family_members >= 0),
    CONSTRAINT fam_emp_fk FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);
Recursive Relationship //5
CREATE TABLE Management (
    emp_id     NUMBER(5),
    manager_id NUMBER(5),
    CONSTRAINT mang_empID_pk PRIMARY KEY (emp_id),
    CONSTRAINT mgmt_mgr_fk   FOREIGN KEY (manager_id) REFERENCES Employees(emp_id)
);

-- 8. Sales
CREATE TABLE Sales (
    sale_id NUMBER(6),
    customer_id NUMBER(5) NOT NULL,
    drug_id NUMBER(5) NOT NULL,
    quantity NUMBER(4),
    sale_date DATE,
    CONSTRAINT sales_saleid_pk PRIMARY KEY (sale_id),
    CONSTRAINT sales_qty_chk  CHECK (quantity > 0),
    CONSTRAINT sales_cust_fk  FOREIGN KEY (customer_id) REFERENCES patients(patient_id),
    CONSTRAINT sales_drug_fk  FOREIGN KEY (drug_id) REFERENCES Drugs(drug_id)
);
--------------------------------------------------
create role emp;
grant select  on scott.Inventory to emp;
create user Ahmed_ali;
identified by  aa1234567;
grant emp to Ahmed_ali;
conn Ahmed_ali/aa1234567;
select * from scott.Inventory;
----------------------------------------------
create role maneger5;
grant update on scott.Inventory to maneger5;
create user yousef_majed
identified by ym1234567;
grant maneger5 to yousef_majed;
conn yousef_majed/ym1234567;
--------------------------------------------
UPDATE scott.Inventory
SET quantity = quantity - 10
WHERE drug_id = 1;
--------------------------------------------
revoke select on scott.Inventory to Ahmed_ali;
revoke update on scott.Inventory to yousef_majed;