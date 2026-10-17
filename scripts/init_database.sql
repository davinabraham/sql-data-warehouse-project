
/*
=============================================================
Data Warehouse Initialization
=============================================================
Database: DataWarehouse
Schemas:  bronze, silver, gold
Platform: PostgreSQL 18

Purpose:
    Create the DataWarehouse database and organize it
    into Bronze, Silver, and Gold schemas.

Note:
    PostgreSQL requires the database to be created separately.
    Connect to DataWarehouse before creating the schemas.
=============================================================
*/

-- Step 1: Create the database
CREATE DATABASE "DataWarehouse";

-- Step 2: Connect to DataWarehouse in pgAdmin 4,
-- then execute the following statements.

CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;
