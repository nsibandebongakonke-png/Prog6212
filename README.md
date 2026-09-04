# Prog6212
Assignment  

#  RaceDay - Event Management System (Part 1)

> **Portfolio of Evidence (PoE) – Individual Project**  
> *Built for the South African road running, walking, and cycling community.*

South Africa boasts a vibrant road events culture—from the Comrades Marathon and Cape Town Cycle Tour to community park runs across every province. Despite the massive participation, many events still rely on paper registrations and disconnected spreadsheets. 

**RaceDay** is a full-stack web platform designed to solve this. It empowers **Organisers** to manage events and capture results, while **Participants** can browse, enter, and track their race-day history.

---

##  Part 1 Overview
*This repository currently contains **Part 1** of a 3-part progressive project.*

In this phase, **no API or frontend code is written**. Instead, this submission focuses on the foundational blueprints:

-  **Entity Relationship Diagram (ERD)** – Visual database design.
-  **SQL Database Script** – Ready-to-run schema for Microsoft SQL Server.
-  **API Endpoint Plan** – Full documentation of all RESTful routes for future implementation.
-  **CI/CD Pipeline** – Automated syntax checking on GitHub Actions (green build).

> *Parts 2 and 3 (API implementation, frontend, containerisation, and cloud deployment) will be added to this repository in future submissions.*

---

## User Roles

The system supports two distinct roles, which will be enforced throughout all parts:

| Role       | Responsibilities |
|------------|------------------|
| **Organiser**  | Create, edit, and delete events; manage event categories; capture participant results; view all event enrolments. |
| **Participant**| Create an account; browse upcoming events; enter events by selecting a category; view personal enrolment history and results. |

---

##  Technology Stack (Part 1)

- **Database**: Microsoft SQL Server (2022)
- **Diagramming**: Draw.io / Lucidchart (ERD exported as PNG/PDF)
- **CI/CD**: GitHub Actions (SQL syntax linting via `sqlfluff`)
- **Version Control**: Git & GitHub

---

## CI/CD Status (Green Build)

This repository uses **GitHub Actions** to automatically check the validity of all SQL scripts on every push. 

| Branch | Status |
|--------|--------|
| `main` | ![CI Status](https://img.shields.io/badge/CI-Passing-brightgreen) |

![Green CI Build](./screenshots/ci-green.png)

>  You can also view the live workflow runs in the **"Actions"** tab of this GitHub repository.

---

##  Database Setup Instructions

Follow these steps to run the SQL script and build the database locally:

### Prerequisites
- [Microsoft SQL Server](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) (Developer or Express edition)
- [SQL Server Management Studio (SSMS)](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms) or **Azure Data Studio**

### Steps
1. **Clone the repository**:
   ```bash
   git clone https://github.com/nsibandebongakonke-png/raceday-poe.git
   cd raceday-poe

    Video Presentation
A video walkthrough is required for this submission. It demonstrates the ERD, explains the database schema logic, and walks through the API endpoint plan.

Link: https://youtu.be/hHugc2lrGRI(Youtube unlisted video)

- Future Development (Parts 2 & 3)
Part 2: Implementation of the RESTful API using Node.js/Python/C# (backend logic, JWT authentication, role-based access control).

Part 3: Full-stack integration with a modern frontend framework (React/Vue), containerisation with Docker, and deployment to a cloud platform (Azure/AWS).

 Author
Student Name: [Bongakonke Nsibande]

Student Number: [[ST10493442]]

Course: [PROG6212]

Institution: [Rosebank]

 License
This project is submitted for academic assessment purposes as part of the Portfolio of Evidence.
