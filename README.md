# Primeiro-Projeto-Lógico-de-Banco-de-Dados-DIO

🛒 E-Commerce Database Modeling Project










📌 Overview

This project consists of the logical replication and implementation of an E-commerce database model, focusing on:

Entity-Relationship modeling (EER)

Logical schema mapping

Primary and Foreign Keys definition

Referential integrity constraints

SQL DDL and DML scripting

Advanced SQL querying

The objective is to demonstrate solid knowledge in database modeling, relational integrity, and complex data retrieval strategies.

🧠 Conceptual to Logical Mapping

The project follows the full modeling pipeline:

Conceptual Model (EER Diagram)

Entities

Attributes

Identifying and Non-Identifying Relationships

Cardinalities (1:1, 1:N, N:N)

Logical Model

Table creation

Primary Keys (PK)

Foreign Keys (FK)

Associative tables (for N:N relationships)

Physical Model

SQL DDL implementation

Constraints enforcement

Data persistence for validation

🏗️ Database Architecture
🔹 Core Entities
Entity	Description
Clients	Customer registration data
Orders	Purchase transactions
Products	Product catalog
Suppliers	Product providers
Storage	Inventory locations
ProductOrder	Associative entity (Order ↔ Product)
🔗 Relationship Design
1️⃣ Client → Order

Type: Non-Identifying Relationship

Cardinality: 1:N

Business Rule: One client may place multiple orders.

2️⃣ Order ↔ Product

Type: N:N (Resolved via Associative Table)

Table: productOrder

Contains quantity and status attributes.

3️⃣ Product ↔ Supplier

Many-to-many relationship

Ensures flexible sourcing strategy

🗃️ Schema Definition (DDL)
CREATE TABLE clients (
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(15) NOT NULL,
    Minit CHAR(3),
    Lname VARCHAR(20) NOT NULL,
    CPF CHAR(11) NOT NULL UNIQUE,
    Address VARCHAR(50)
);

CREATE TABLE orders (
    idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idOrderClient INT NOT NULL,
    OrderStatus ENUM('Cancelado','Confirmado','Em processamento') 
        DEFAULT 'Em processamento',
    OrderDescription VARCHAR(255),
    SendValue DECIMAL(10,2) DEFAULT 10.00,
    PaymentCash BOOLEAN DEFAULT FALSE,
    CONSTRAINT fk_order_client 
        FOREIGN KEY (idOrderClient)
        REFERENCES clients(idClient)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

💾 Data Persistence (DML)
INSERT INTO clients (Fname, Minit, Lname, CPF, Address)
VALUES ('Maria','M','Silva','12345678901','Rio de Janeiro');

INSERT INTO orders (idOrderClient, OrderStatus, SendValue, PaymentCash)
VALUES (1,'Confirmado',20.00,TRUE);
📊 Query Layer – Data Retrieval Strategies
🔎 1. Simple SELECT
SELECT * FROM clients;
🎯 2. Filtering with WHERE
SELECT * FROM orders
WHERE OrderStatus = 'Confirmado';
🧮 3. Derived Attributes
SELECT idOrder,
       SendValue,
       SendValue * 0.05 AS ShippingTax
FROM orders;
📈 4. Sorting with ORDER BY
SELECT * FROM clients
ORDER BY Lname ASC;
📊 5. Aggregation with HAVING
SELECT idOrderClient,
       COUNT(*) AS TotalOrders
FROM orders
GROUP BY idOrderClient
HAVING COUNT(*) > 1;
🔗 6. Complex JOIN Operations
SELECT c.Fname,
       o.idOrder,
       p.Pname,
       po.Quantity
FROM clients c
INNER JOIN orders o 
    ON c.idClient = o.idOrderClient
INNER JOIN productOrder po 
    ON o.idOrder = po.idPOorder
INNER JOIN product p 
    ON p.idProduct = po.idPOproduct;
🧩 Constraints & Integrity Rules

PRIMARY KEY enforcement

FOREIGN KEY constraints with referential actions

UNIQUE constraints (CPF, CNPJ)

ENUM domain restriction

Default values

NOT NULL enforcement

📐 Modeling Best Practices Applied

✔ Normalization principles (3NF)
✔ Associative tables for N:N relationships
✔ Clear naming conventions
✔ Referential integrity rules
✔ Explicit constraint definitions
✔ Derived attributes in queries

🚀 Technical Stack

Database: MySQL

Modeling Tool: MySQL Workbench

Language: SQL (DDL & DML)

📁 Suggested Repository Structure
ecommerce-database/
│
├── docs/
│   └── EER_Diagram.png
│
├── sql/
│   ├── schema.sql
│   ├── inserts.sql
│   └── queries.sql
│
├── README.md
└── LICENSE
🎯 Learning Outcomes

Advanced relational modeling

Logical schema refinement

Referential integrity enforcement

Aggregation and analytical queries

Join optimization strategies

📌 Future Improvements

Index optimization

Stored Procedures

Views for reporting

Transaction control (ACID compliance)

Role-based access control

Performance tuning (EXPLAIN plan analysis)

👨‍💻 Author

Iacer Duarte
Data Science & Database Modeling
