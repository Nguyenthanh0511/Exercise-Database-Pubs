# SQL Server on Ubuntu - Quick Reference Card

## Connection Information (Based on Our Installation)
```
Server: localhost
Port: 1433
Username: SA
Password: StrongP@ssw0rd123!
Database: pubs (sample database created)
```

## Essential Commands

### Start/Stop SQL Server (Docker)
```bash
sudo docker start mssql      # Start SQL Server
sudo docker stop mssql       # Stop SQL Server
sudo docker restart mssql    # Restart SQL Server
sudo docker ps               # Check status
sudo docker logs mssql       # View logs
```

### Connect to SQL Server
```bash
# Basic connection
sqlcmd -S localhost -U SA -P 'StrongP@ssw0rd123!' -C

# Connect to specific database
sqlcmd -S localhost -U SA -P 'StrongP@ssw0rd123!' -C -d pubs

# Execute single query
sqlcmd -S localhost -U SA -P 'StrongP@ssw0rd123!' -C -Q "SELECT @@VERSION;"

# Execute script file
sqlcmd -S localhost -U SA -P 'StrongP@ssw0rd123!' -C -i script.sql
```

## Useful SQL Queries

### System Information
```sql
-- Check SQL Server version
SELECT @@VERSION;

-- Show server name
SELECT @@SERVERNAME;

-- List all databases
SELECT name FROM sys.databases;

-- Show current database
SELECT DB_NAME();
```

### Database and Table Operations
```sql
-- List tables in current database
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE';

-- Show table structure
SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'authors';

-- Count rows in a table
SELECT COUNT(*) FROM authors;

-- Show table sizes
SELECT 
    t.name AS TableName,
    p.rows AS RowCounts,
    SUM(a.total_pages) * 8 AS TotalSpaceKB
FROM sys.tables t
INNER JOIN sys.indexes i ON t.object_id = i.object_id
INNER JOIN sys.partitions p ON i.object_id = p.object_id AND i.index_id = p.index_id
INNER JOIN sys.allocation_units a ON p.partition_id = a.container_id
GROUP BY t.name, p.rows
ORDER BY TotalSpaceKB DESC;
```

### Pubs Database Sample Queries
```sql
-- List all authors
SELECT au_fname, au_lname, au_id FROM authors;

-- List all books with authors
SELECT t.title, a.au_fname, a.au_lname, t.price
FROM titles t
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
ORDER BY t.title;

-- Show sales by store
SELECT s.stor_name, COUNT(sa.ord_num) as total_orders
FROM stores s
LEFT JOIN sales sa ON s.stor_id = sa.stor_id
GROUP BY s.stor_name;

-- Publisher information
SELECT pub_name, city, state, country 
FROM publishers;
```

### User and Security Management
```sql
-- List all logins
SELECT name, type_desc, is_disabled 
FROM sys.server_principals 
WHERE type IN ('S', 'U');

-- List database users
SELECT name, type_desc, default_schema_name 
FROM sys.database_principals 
WHERE type IN ('S', 'U');

-- Create new login and user
CREATE LOGIN [AppUser] WITH PASSWORD = 'AppPassword123!';
USE [pubs];
CREATE USER [AppUser] FOR LOGIN [AppUser];
ALTER ROLE db_datareader ADD MEMBER [AppUser];
ALTER ROLE db_datawriter ADD MEMBER [AppUser];
```

## Backup and Restore

### Backup Database
```sql
-- Full backup
BACKUP DATABASE [pubs] 
TO DISK = '/var/opt/mssql/data/pubs_backup.bak'
WITH FORMAT, INIT;

-- Backup with compression
BACKUP DATABASE [pubs] 
TO DISK = '/var/opt/mssql/data/pubs_backup.bak'
WITH COMPRESSION, FORMAT, INIT;
```

### Restore Database
```sql
-- Restore database
RESTORE DATABASE [pubs_restored] 
FROM DISK = '/var/opt/mssql/data/pubs_backup.bak'
WITH MOVE 'pubs' TO '/var/opt/mssql/data/pubs_restored.mdf',
     MOVE 'pubs_log' TO '/var/opt/mssql/data/pubs_restored.ldf';
```

## Troubleshooting Commands

### Check Server Status
```bash
# Docker container status
sudo docker ps -a

# Check if port is listening
sudo ss -tlnp | grep 1433
sudo netstat -tlnp | grep 1433

# Test connection
telnet localhost 1433
```

### View Logs
```bash
# Container logs
sudo docker logs mssql

# SQL Server error log (inside container)
sudo docker exec mssql cat /var/opt/mssql/log/errorlog

# Follow logs in real-time
sudo docker logs -f mssql
```

### Performance Monitoring
```sql
-- Show current connections
SELECT 
    session_id,
    login_name,
    host_name,
    program_name,
    login_time,
    status
FROM sys.dm_exec_sessions 
WHERE is_user_process = 1;

-- Check database sizes
SELECT 
    DB_NAME(database_id) AS DatabaseName,
    Name AS Logical_Name,
    Physical_Name,
    (size*8)/1024 AS SizeMB
FROM sys.master_files
ORDER BY DatabaseName;

-- Monitor active queries
SELECT 
    session_id,
    start_time,
    status,
    command,
    database_id,
    user_id,
    blocking_session_id
FROM sys.dm_exec_requests
WHERE session_id > 50;
```

## Configuration

### Memory Settings
```sql
-- Check current memory configuration
SELECT name, value, value_in_use 
FROM sys.configurations 
WHERE name LIKE '%memory%';

-- Set maximum memory (restart required)
EXEC sp_configure 'max server memory (MB)', 2048;
RECONFIGURE;
```

### Change SA Password
```bash
# Using Docker
sudo docker exec -it mssql /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -C

# Then in SQL prompt:
# ALTER LOGIN SA WITH PASSWORD = 'NewStrongPassword123!';
# GO
```

## File Locations (Docker)

### Inside Container
- **Data files**: `/var/opt/mssql/data/`
- **Log files**: `/var/opt/mssql/log/`
- **Backup location**: `/var/opt/mssql/data/` (recommended)
- **Config files**: `/var/opt/mssql/`

### Host System
- **Container data**: Docker volumes (use `docker volume ls`)
- **Tools**: `/opt/mssql-tools/bin/` (sqlcmd location)

## Emergency Recovery

### Reset SA Password
```bash
# Stop container
sudo docker stop mssql

# Start in single-user mode
sudo docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=NewPassword123!" \
  -e "MSSQL_PID=Developer" -p 1433:1433 --rm \
  mcr.microsoft.com/mssql/server:2022-latest

# Or reset password in existing container
sudo docker exec -e MSSQL_SA_PASSWORD=NewPassword123! mssql \
  /opt/mssql/bin/mssql-conf set-sa-password
```

### Recreate Container (Data Loss!)
```bash
sudo docker stop mssql
sudo docker rm mssql
sudo docker run -e "ACCEPT_EULA=Y" \
  -e "MSSQL_SA_PASSWORD=StrongP@ssw0rd123!" \
  -p 1433:1433 --name mssql -d \
  mcr.microsoft.com/mssql/server:2022-latest
```

---

**Installation Date**: August 9, 2025  
**SQL Server Version**: Microsoft SQL Server 2022 (RTM-CU20)  
**Container**: mssql  
**Sample Database**: pubs (11 tables with sample data)
