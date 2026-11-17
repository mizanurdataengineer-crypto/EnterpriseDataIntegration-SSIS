# Enterprise Data Integration — SSIS ETL Pipeline

A SQL Server Integration Services (SSIS) ETL project demonstrating customer data integration between an enterprise source database and a staging database, with incremental insert/update processing, error handling, and execution logging.

## 1. Project Overview

This project implements an ETL pipeline using Microsoft SQL Server and SSIS. Customer records are extracted from the `EnterpriseERP` database, processed through SSIS transformations, and loaded into the `ETL_Staging` database.

The pipeline supports:

- Initial customer data loading
- Incremental insertion of new customers
- Detection and updating of changed customer records
- Row-count tracking for inserted and updated records
- ETL execution logging
- Error capture and failure logging
- Repeatable ETL execution

## 2. Technology Stack

| Technology | Purpose |
|---|---|
| SQL Server 2022 | Source and staging databases |
| SSIS | ETL development and execution |
| Visual Studio 2022 | SSIS package development |
| SQL Server Management Studio | Database management and validation |
| T-SQL | Database scripts and data manipulation |
| GitHub | Project documentation and version control |

## 3. ETL Architecture

```text
SQL Server: EnterpriseERP
         |
         v
    SRC_Customers
         |
         v
   DRV_Add_LoadDate
         |
         v
 LKP_Existing_Customers
         |
         +--------------------------+
         |                          |
     No Match                     Match
         |                          |
         v                          v
 RC_Count_Inserted        CSPL_Detect_Changes
         |                          |
         v                          v
 DST_Staging_Customers     RC_Count_Updated
                                    |
                                    v
                            CMD_Update_Customers
         |                          |
         +--------------------------+
                    |
                    v
          SQL Server: ETL_Staging
```

## 4. ETL Control Flow

The SSIS package includes the following execution steps:

1. `EXP_Reset_RowCounts` — Resets the inserted-row counter.
2. `EXP_Reset_UpdatedCount` — Resets the updated-row counter.
3. `SQL_Log_ETL_Start` — Creates an execution log entry.
4. `DFT_Load_Customers` — Executes the customer ETL data flow.
5. `SQL_Log_ETL_Success` — Records successful execution and row counts.
6. `SQL_Log_ETL_Failure` — Records failure information when the data flow fails.

An SSIS `OnError` Event Handler captures error descriptions for failure logging.

## 5. Incremental Loading

The pipeline uses an SSIS Lookup transformation to identify whether a source customer already exists in the staging database.

**New customer:** If the customer is not found, the record is inserted into `dbo.stg_Customers`.

**Existing customer:** If the customer is found, the Conditional Split evaluates changes in customer attributes and modification timestamps. Changed records are routed to an OLE DB Command for updating.

This design avoids reloading every existing customer on each execution.

## 6. Execution Logging

The `dbo.ETL_ExecutionLog` table stores:

- Package name
- Execution start time
- Execution end time
- Execution status
- Number of inserted rows
- Number of updated rows
- Error message, when applicable

The logging mechanism helps with troubleshooting and monitoring ETL executions.

## 7. Testing Scenarios

The project has been tested with the following scenarios:

| Scenario | Expected Result |
|---|---|
| New customer added to source | Customer inserted into staging |
| Existing customer modified | Customer updated in staging |
| No source changes | Zero inserted and updated rows |
| Invalid source table configured temporarily | ETL failure captured in execution log |
| Source configuration restored | ETL completes successfully |

Successful and failed executions were recorded in `dbo.ETL_ExecutionLog`.

## 8. Repository Structure

```text
EnterpriseDataIntegration_GitHub/
|
|-- SSIS_Package/
|   |-- Package.dtsx
|   |-- EnterpriseDataIntegration.dtproj
|   |-- EnterpriseDataIntegration.slnx
|   |-- Project.params
|   |-- EnterpriseDataIntegration.database
|
|-- SQL_Scripts/
|   |-- 00_Create_Databases.sql
|   |-- 01_EnterpriseERP_Customers.sql
|   |-- 02_ETL_Staging_Tables.sql
|   |-- 01_Insert_100_Demo_Customers.sql
|
|-- Screenshots/
|
|-- Documentation/
|
|-- README.md
```

## 9. Setup Instructions

### Prerequisites

- Microsoft SQL Server 2022 Developer Edition or a compatible SQL Server environment
- SQL Server Management Studio
- Visual Studio 2022 with SQL Server Integration Services Projects extension

### Database Setup

Execute the SQL scripts in the following order:

1. `00_Create_Databases.sql`
2. `01_EnterpriseERP_Customers.sql`
3. `02_ETL_Staging_Tables.sql`
4. `01_Insert_100_Demo_Customers.sql`

The demo dataset contains 100 synthetic customer records.

### SSIS Configuration

1. Open the SSIS project in Visual Studio.
2. Review the connection managers `CM_EnterpriseERP` and `CM_ETL_Staging`.
3. Update the SQL Server instance and authentication settings for your environment.
4. Confirm that the source and staging databases are accessible.
5. Execute `Package.dtsx`.
6. Verify the staging data and ETL execution log.

## 10. Validation Queries

**Check staging customer count:**

```sql
USE ETL_Staging;

SELECT COUNT(*) AS TotalCustomers
FROM dbo.stg_Customers;
```

**Review ETL execution history:**

```sql
USE ETL_Staging;

SELECT
    LogID,
    PackageName,
    StartTime,
    EndTime,
    ExecutionStatus,
    RowsInserted,
    RowsUpdated,
    ErrorMessage
FROM dbo.ETL_ExecutionLog
ORDER BY LogID DESC;
```

## 11. Project Screenshots

Screenshots of the SSIS Control Flow, Data Flow, transformations, execution results, and execution logs will be included in the `Screenshots` folder.

## 12. Skills Demonstrated

- SQL Server database development
- SSIS ETL package development
- Data extraction and transformation
- Lookup transformations
- Conditional Split transformations
- Incremental insert and update processing
- OLE DB Source, Destination, and Command
- SSIS variables and expressions
- Row Count transformations
- Event handlers and error handling
- ETL execution logging
- T-SQL troubleshooting and validation

## 13. Project Scope

This is a portfolio demonstration project developed using synthetic customer data. It illustrates core SSIS ETL engineering practices and is intended for learning, technical interviews, and professional portfolio presentation.

## 14. Author

**Md. Mizanur Rahman**

Database Development | SQL Server | SSIS | Data Engineering

Dhaka, Bangladesh
