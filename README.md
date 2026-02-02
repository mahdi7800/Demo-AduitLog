# SQL Server Audit Logging

This repository contains a **practical and real-world Audit Logging implementation for SQL Server**.  
The goal of this project is to **track and store all data modification operations** in a separate audit database for security, troubleshooting, and compliance purposes.

This implementation was collected and refined in **2019** after attending SQL Server classes by  
**Eng. Parviz Aghasadeghi**.

---

## 🎯 Purpose of This Repository

Audit logging is essential when you need to:

- Track who changed data
- Identify when data was modified
- Detect unauthorized or unexpected changes
- Keep historical records for security or compliance
- Analyze data changes after incidents or bugs

This project demonstrates how to build an **independent and reliable audit logging mechanism** using SQL Server triggers.

---

## 🧠 Audit Strategy Overview

- Audit data is stored in a **separate database**
- Every `INSERT`, `UPDATE`, and `DELETE` operation is logged
- Both **old and new values** are captured for UPDATE operations
- System metadata is recorded automatically

---

## 📁 Database Architecture

### 1️⃣ Main Database
- Example: `Northwind`
- Contains operational tables (e.g. `Products`)

### 2️⃣ Audit Database
- Example: `Northwind_AuditLog`
- Stores audit records independently
- Protects audit data from accidental deletion or corruption

---

## 📊 Logged Information

Each audit record includes:

- Operation Type  
  - `I` → Insert  
  - `D` → Delete  
  - `O` → Old values (before update)  
  - `N` → New values (after update)
- Operation Date & Time
- SQL Login (`SUSER_SNAME`)
- Application Name (`APP_NAME`)
- Host Name (`HOST_NAME`)
- Client IP Address
- Affected Table Data

---

## 📌 Trigger-Based Audit Logging

Audit logging is implemented using **AFTER triggers**:

- `AFTER INSERT`
- `AFTER UPDATE`
- `AFTER DELETE`

The trigger:
1. Detects the operation type
2. Reads data from `inserted` and `deleted`
3. Captures system metadata
4. Inserts audit records into the audit database

---

## 🛠 Example Use Cases

- Monitoring sensitive tables (Products, Users, Orders, Financial data)
- Tracking changes made by applications or users
- Debugging unexpected data changes
- Meeting auditing or compliance requirements

---

## ⚠️ Important Notes

- Triggers add overhead; use only on critical tables
- Always test in non-production environments first
- Avoid auditing high-volume tables without filtering
- Secure the audit database with restricted access

---

## 🎯 Target Audience

- SQL Server DBAs
- Backend Developers
- Database Engineers
- Security-conscious teams
- SQL Server learners

---

## 📢 Usage & License

This project is intended for **educational and practical use**.  
You are free to use, modify, and extend it in personal or professional projects.

---

**Author:** Mahdi Davoudi  
**Topic:** SQL Server Audit Logging & Data Change Tracking