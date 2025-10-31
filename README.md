# 🎾 Tennis Service - Spring Boot Project

A full-featured RESTful backend service built with **Spring Boot**, **JDBC**, and **MySQL**.  
Implements CRUD operations, role-based data visibility, dynamic age calculation, pagination, and sorting.

---

## 🚀 Features
- **CRUD** for Players and Teams  
- **Dynamic age calculation** from birth date  
- **Role-based visibility**
  - `isAdmin=true` → show full player info  
  - `isAdmin=false` → show only first name + age
- **Pagination and Sorting** (V2)
  - Example: `/v2/players?page=2&fieldName=careerWins&direction=desc`
- **Jasypt Encryption** for secure DB password
- Built using Spring MVC layered architecture: `Controller → Service → Repository`

---

## 🧱 Technologies
- Java 8  
- Spring Boot 2.7.14  
- MySQL 8  
- Jasypt Encryption  
- Postman for API testing  

---

## 🧪 API Examples

| Method | Endpoint | Description |
|--------|-----------|--------------|
| GET | `/v1/players?isAdmin=true` | List all players with full info |
| GET | `/v1/players?isAdmin=false` | List all players (first name + age only) |
| POST | `/v1/players` | Add new player |
| PUT | `/v1/players/{id}` | Update player |
| DELETE | `/v1/players/{id}` | Delete player |
| GET | `/v2/players?page=1&fieldName=height&direction=asc` | Paginated, sorted player list |

---

## 🗄️ Database Setup
```sql
CREATE DATABASE tennis_service_db;
USE tennis_service_db;
-- Run your Tennis Service SQL Script.sql here
