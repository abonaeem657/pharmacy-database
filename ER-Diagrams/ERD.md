# Entity relationship diagram

![Pharmacy ER diagram](ERD-new.png)

This editable diagram follows the foreign keys in [1_create_tables.sql](../SQL-Scripts/1_create_tables.sql). It complements the existing Chen and Crow's Foot PDFs.

```mermaid
erDiagram
    Employees |o--o{ Drugs : responsible_for
    Suppliers |o--o{ Drugs : supplies
    Drugs |o--o{ Inventory : stock_record
    Employees |o--o{ Family : family_record
    Employees |o--o{ Management : manages
    patients ||--o{ Sales : purchases
    Drugs ||--o{ Sales : appears_in

    Employees {
        number emp_id PK
        varchar name
        number age
        number salary
        date hire_date
    }
    Suppliers {
        number supplier_id PK
        varchar supplier_name
        varchar phone
    }
    Drugs {
        number drug_id PK
        number emp_id FK
        number supplier_id FK
        varchar drug_name
        date production_date
    }
    Inventory {
        number drug_id FK
        number quantity
        date expiry_date
    }
    patients {
        number patient_id PK
        varchar name
        varchar phone
    }
    Family {
        number emp_id FK
        number family_members
    }
    Management {
        number emp_id PK
        number manager_id FK
    }
    Sales {
        number sale_id PK
        number customer_id FK
        number drug_id FK
        number quantity
        date sale_date
    }
```

**Schema note:** `Inventory.drug_id` and `Family.emp_id` are foreign keys but have no primary key or unique constraint in the current SQL. Their relationships can therefore have multiple rows. `Management.emp_id` is a primary key but has no declared foreign key to `Employees.emp_id`; only `manager_id` references Employees. The diagram reflects those constraints instead of assuming one-to-one relationships.
