# 📘 Pahana Edu - Online Billing System

## 📌 Project Overview
The **Pahana Edu Online Billing System** is a web-based application developed to replace the manual billing and stock management operations of the **Pahana Edu Bookshop** in Colombo.  
It provides **Admins** and **Cashiers** with tools to manage customers, items, and billing operations efficiently.  

This project was developed as part of the **CIS6003 – Advanced Programming** module.  

---

## 🚀 Features
### 👨‍💼 Admin
- Login with predefined credentials
- Manage cashiers (create, update, delete)
- Manage customers (CRUD operations)
- Manage stock/items (CRUD operations)
- Create bills
- View and manage all bills (edit, delete, reprint)
- Generate sales reports (total sales, by cashier, by date range)
- Access help & logout

### 💳 Cashier
- Create account via signup (unique username validation)
- Manage customers (CRUD operations)
- View stock (read-only)
- Create bills
- View their own sales history
- Reprint their previously created bills
- Access help & logout

---

## 🛠️ Technology Stack
- **Frontend**: JSP, HTML, CSS, Bootstrap 5, JavaScript  
- **Backend**: Java EE (Servlets, MVC, DAO, Singleton)  
- **Database**: MySQL (phpMyAdmin)  
- **Server**: Apache Tomcat 10  
- **IDE**: IntelliJ IDEA Ultimate  
- **Version Control**: GitHub  

---

## 🗄️ Database Design
The project uses a **relational database** in MySQL with the following tables:
- `users` → stores admin and cashier credentials with roles  
- `customers` → stores customer information  
- `items` → stores stock details (name, price, quantity)  
- `bills` → stores bill headers (total, amount given, balance, created_by)  
- `bill_items` → stores line items of each bill  

---

## 🎯 Applied Design Patterns
- **MVC Pattern** → Separation of Model (Java classes), View (JSP), Controller (Servlets)  
- **DAO Pattern** → Encapsulation of all database operations in DAO classes  
- **Singleton Pattern** → Database connection managed by a Singleton `DBConnection` class  

---

## 🔑 User Roles
- **Admin**: Full access including cashier management, reporting, and all bills  
- **Cashier**: Limited access to billing, customer management, and sales history  

---

## 📊 Core Functionalities
- Secure authentication (login/signup with validation)  
- Dashboard for role-based navigation  
- Customer management with validation  
- Stock management (CRUD for admin, view-only for cashier)  
- Automated billing with grand total, balance, and reprintable receipts  
- Sales history (cashier) & reports (admin)  

---

## 🧪 Testing
- **Unit Testing**: DAO methods tested using JUnit  
- **Integration Testing**: Servlets + JSP interactions tested  
- **Validation Testing**: Duplicate usernames, invalid logins, stock limits tested  
- **User Acceptance Testing**: End-to-end workflows tested  

---
