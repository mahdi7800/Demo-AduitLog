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

## 🇮🇷 توضیحات فارسی

این مخزن شامل یک **پیاده‌سازی عملی و واقعی از Audit Logging در SQL Server** است.  
هدف اصلی این پروژه، **ثبت و نگهداری تمام عملیات تغییر داده** در یک دیتابیس مجزا به‌منظور افزایش امنیت، عیب‌یابی و رعایت الزامات کنترلی و نظارتی است.

این مجموعه اسکریپت‌ها در **سال ۲۰۱۹** و پس از شرکت در کلاس‌های  
**مهندس پرویز آقاصادقی**  
جمع‌آوری، بررسی و تکمیل شده‌اند.

---

## 🎯 هدف این مخزن

Audit Logging زمانی ضروری می‌شود که نیاز دارید:

- بدانید چه کسی داده‌ای را تغییر داده است
- زمان دقیق تغییرات را ثبت کنید
- تغییرات غیرمجاز یا ناخواسته را شناسایی کنید
- سوابق تاریخی تغییرات داده را نگه‌داری کنید
- پس از بروز خطا یا حادثه، تغییرات دیتابیس را تحلیل کنید

این پروژه نشان می‌دهد چگونه می‌توان با استفاده از **Triggerها در SQL Server** یک مکانیزم Audit Logging **مستقل، قابل اعتماد و کاربردی** پیاده‌سازی کرد.

---

## 🧠 استراتژی Audit Logging

- داده‌های Audit در یک **دیتابیس جداگانه** ذخیره می‌شوند
- تمام عملیات `INSERT`، `UPDATE` و `DELETE` ثبت می‌شوند
- در عملیات UPDATE، **مقادیر قبل و بعد از تغییر** ذخیره می‌گردند
- اطلاعات سیستمی به‌صورت خودکار ثبت می‌شوند

---

## 📁 معماری دیتابیس

### 1️⃣ دیتابیس اصلی
- مثال: `Northwind`
- شامل جداول عملیاتی (مانند `Products`)

### 2️⃣ دیتابیس Audit
- مثال: `Northwind_AuditLog`
- ذخیره مستقل اطلاعات Audit
- محافظت از داده‌های Audit در برابر حذف یا خرابی ناخواسته

---

## 📊 اطلاعات ثبت‌شده در Audit

برای هر عملیات، اطلاعات زیر ذخیره می‌شود:

- نوع عملیات  
  - `I` → درج (Insert)  
  - `D` → حذف (Delete)  
  - `O` → مقادیر قبل از Update  
  - `N` → مقادیر بعد از Update
- تاریخ و زمان عملیات
- نام کاربری SQL Server (`SUSER_SNAME`)
- نام برنامه (`APP_NAME`)
- نام سیستم کاربر (`HOST_NAME`)
- آدرس IP کلاینت
- داده‌های جدول تحت تأثیر

---

## 📌 Audit Logging مبتنی بر Trigger

Audit Logging با استفاده از **AFTER Trigger** پیاده‌سازی شده است:

- `AFTER INSERT`
- `AFTER UPDATE`
- `AFTER DELETE`

عملکرد Trigger به این صورت است:
1. تشخیص نوع عملیات
2. خواندن داده‌ها از `inserted` و `deleted`
3. جمع‌آوری اطلاعات سیستمی
4. ذخیره اطلاعات در دیتابیس Audit

---

## 🛠 موارد استفاده

- مانیتورینگ جداول حساس (محصولات، کاربران، سفارشات، اطلاعات مالی)
- بررسی تغییرات انجام‌شده توسط کاربران یا اپلیکیشن‌ها
- عیب‌یابی تغییرات غیرمنتظره داده
- پیاده‌سازی الزامات امنیتی و کنترلی

---

## ⚠️ نکات مهم

- Triggerها سربار دارند؛ فقط روی جداول مهم استفاده شوند
- قبل از استفاده در محیط عملیاتی، حتماً تست انجام شود
- روی جداول با حجم تراکنش بالا بدون فیلتر استفاده نشود
- دسترسی به دیتابیس Audit محدود و ایمن شود

---

## 🎯 مخاطبان هدف

- مدیران دیتابیس SQL Server (DBA)
- توسعه‌دهندگان بک‌اند
- مهندسان دیتابیس
- تیم‌های امنیتی
- علاقه‌مندان و یادگیرندگان SQL Server

---

## 📢 نحوه استفاده

این پروژه برای **استفاده آموزشی و عملی** تهیه شده است و می‌توانید آن را در پروژه‌های شخصی یا سازمانی استفاده، توسعه و سفارشی‌سازی کنید.

---

**نویسنده:** مهدی داوودی  
**موضوع:** Audit Logging و ردیابی تغییرات داده در SQL Server