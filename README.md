# Pharmacy Database Management System

An Oracle SQL database project modeling the operations of a pharmacy: employees, suppliers, drugs, inventory, patients, sales, and management hierarchy.

## Project Overview

This project designs and implements a relational database for a pharmacy, covering:

- **ER Modeling** — entity-relationship diagrams in both Chen and Crow's Foot notation
- **Schema Design** — table creation with primary keys, foreign keys, and check constraints
- **Sample Data** — realistic seed data for all entities
- **Query Examples** — SELECT statements covering joins, aggregate functions, subqueries, and substitution variables
- **Data Manipulation** — UPDATE statements with transaction control (commit/rollback)
- **Access Control** — role-based permissions (GRANT/REVOKE) for different user types

## Entity Relationship Diagram

See [`ER-Diagrams/`](./ER-Diagrams) for the full diagrams. Key entities and relationships:

| Relationship | Cardinality | Description |
|---|---|---|
| Employees → Drugs | 1:N | An employee is responsible for multiple drugs |
| Suppliers → Drugs | 1:N | A supplier supplies multiple drugs |
| Drugs → Inventory | 1:1 | Each drug has one inventory record |
| Employees → Family | 1:1 | Each employee has one family record |
| Employees → Management | 1:N | Recursive relationship — a manager oversees multiple employees |
| Patients → Sales | 1:N | A patient can make multiple purchases |
| Drugs → Sales | 1:N | A drug can appear in multiple sales |

## Database Schema

| Table | Description |
|---|---|
| `Employees` | Staff records (name, age, salary, hire date) |
| `Suppliers` | Drug suppliers (name, phone) |
| `Drugs` | Drug catalog linked to responsible employee and supplier |
| `Inventory` | Stock quantity and expiry date per drug |
| `Patients` | Patient/customer records |
| `Family` | Employee family member counts (used for bonus calculation) |
| `Management` | Recursive employee-manager hierarchy |
| `Sales` | Sales transactions linking patients and drugs |

## Repository Structure

```
pharmacy-database/
├── ER-Diagrams/
│   ├── ER_PROJECT.vsdx                  # Editable Visio source file
│   ├── ER_Diagram_Chen_Notation.pdf     # Chen notation ER diagram
│   └── ERD_CrowsFoot_Notation.pdf       # Crow's Foot notation ERD
├── SQL-Scripts/
│   ├── 1_create_tables.sql              # DDL: table + constraint definitions
│   ├── 2_insert_data.sql                # Sample data (DML)
│   ├── 3_select_queries.sql             # Query examples (joins, subqueries, PL/SQL)
│   └── 4_update_queries.sql             # UPDATE statements with transaction control
└── Documentation/
    └── relations.txt                    # Relationship reference table
```

## Highlights

- **Recursive relationship**: the `Management` table models a manager-employee hierarchy within the same `Employees` table.
- **PL/SQL block**: `3_select_queries.sql` includes a PL/SQL procedure that calculates an employee's total salary (base + family bonus).
- **Role-based access control**: separate roles (`emp`, `maneger5`) are created with scoped `SELECT`/`UPDATE` privileges on the `Inventory` table, then revoked.

## Tech Stack

- Oracle Database (SQL / PL/SQL)
- ER diagrams designed in Microsoft Visio

## How to Run

1. Execute `SQL-Scripts/1_create_tables.sql` to create the schema.
2. Execute `SQL-Scripts/2_insert_data.sql` to load sample data.
3. Run any query from `SQL-Scripts/3_select_queries.sql` to explore the data.
4. Run `SQL-Scripts/4_update_queries.sql` to see data manipulation examples (wrapped in commit/rollback for safety).
