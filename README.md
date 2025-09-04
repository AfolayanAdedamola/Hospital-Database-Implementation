# Hospital Database Management System
-------
This repository contains the database design and implementation for a new hospital management system. The project was developed as a database developer consultant, with a focus on creating a robust and efficient system for managing patient, doctor, and medical record information.

## Project Overview
------
The goal of this project was to design and implement a relational database to support the core operations of a hospital. The database is designed to store and manage key information, including:

Patients: Personal details, contact information, and login credentials for a patient portal.

Doctors: Information about hospital staff.

Departments: The various departments within the hospital.

Appointments: Scheduling details, status (pending, completed, etc.), and links to specific patients and doctors.

Medical Records: A comprehensive record of a patient's medical history, including past diagnoses, prescribed medicines, and allergies.

Reviews: Contains information about patients' satisfaction with the services they were rendered during their appointments

## Database Design
------
The database schema is fully normalized to the 3rd Normal Form (3NF) to ensure data integrity and minimize redundancy. The design includes the following tables with clearly defined relationships:

Patients

Doctors

Departments

Appointments

MedicalRecords

DoctorReviews

Each table has a designated Primary Key and uses Foreign Keys to enforce relationships between tables, ensuring referential integrity. Constraints such as NOT NULL, DEFAULT, and CHECK are used to maintain data validity.

## T-SQL Implementation
------
All database objects were created and managed using T-SQL statements in Microsoft SQL Server Management Studio (SSMS). The repository contains a single script with the following sections:

Schema Creation: T-SQL statements for creating all tables, including primary keys, foreign keys, and other constraints.

Data Population: INSERT statements to populate the tables with a minimum of 20 records per table, allowing for comprehensive query testing.

Example Queries: A selection of T-SQL queries that can be used to test and demonstrate the functionality of the database, such as:

Retrieving patient and medical record information.

## Getting Started
------
To use this database, you will need to:

Set up an instance of Microsoft SQL Server.

Open the T-SQL script in SQL Server Management Studio (SSMS).

Execute the script to create the database schema and populate it with data.

## Deliverables
------
This project includes the following deliverables:

A detailed Database Design document (or section within the project) explaining the normalization process and design choices.

A comprehensive file containing all T-SQL Statements for table creation and data insertion.

Screenshots from SSMS showing the successful execution of the T-SQL scripts and queries.

A Project Report that ties everything together, explaining the process and justifying the decisions made.

