# Connecting to SQL Server from Visual Studio Code

## Overview
This guide shows you how to connect to your SQL Server database from Visual Studio Code using the official Microsoft SQL Server extension.

## Prerequisites
✅ **SQL Server Extension**: ms-mssql.mssql (already installed)  
✅ **SQL Server Instance**: Running in Docker container  
✅ **Connection Details**: Available from our setup  

## Connection Information
Use these details to connect to your SQL Server instance:

```
Server: localhost
Port: 1433 (default)
Username: SA
Password: StrongP@ssw0rd123!
Database: pubs (or master)
Connection Type: SQL Login
```

---

## Step-by-Step Connection Guide

### Step 1: Open VS Code and Access SQL Server Extension

1. **Open Visual Studio Code**
2. **Open Command Palette**: Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
3. **Type**: `MS SQL: Connect` and select it from the dropdown
   - Alternatively, look for the SQL Server icon in the Activity Bar (left sidebar)

### Step 2: Create New Connection Profile

When prompted, you'll see the connection dialog. Enter the following information:

1. **Server name or ADO.NET connection string**:
   ```
   localhost
   ```
   Press `Enter`

2. **Database name (optional)**:
   ```
   pubs
   ```
   Press `Enter` (or leave empty for default)

3. **Authentication Type**:
   - Select `SQL Login`

4. **User name**:
   ```
   SA
   ```
   Press `Enter`

5. **Password**:
   ```
   StrongP@ssw0rd123!
   ```
   Press `Enter`

6. **Save password**:
   - Select `Yes` to save the password

7. **Profile name (optional)**:
   ```
   Local SQL Server
   ```
   Press `Enter`

### Step 3: Verify Connection

After entering the connection details:

1. **Wait for connection**: VS Code will attempt to connect to the database
2. **Check status**: Look for connection success message in the status bar
3. **View servers**: The SQL Server should appear in the **SQL Server** panel in the Explorer

### Step 4: Explore Your Database

Once connected, you can:

1. **Expand the server** in the SQL Server panel
2. **Browse databases** (you should see `master`, `pubs`, etc.)
3. **Expand `pubs` database** to see:
   - Tables (authors, titles, publishers, etc.)
   - Views
   - Stored Procedures

---

## Alternative Connection Methods

### Method 2: Using Connection String

1. Open Command Palette: `Ctrl+Shift+P`
2. Type: `MS SQL: Connect`
3. When prompted for server, enter the full connection string:
   ```
   Server=localhost;Database=pubs;User Id=SA;Password=StrongP@ssw0rd123!;TrustServerCertificate=true;
   ```

### Method 3: Manual Configuration

1. **Open Settings**: `Ctrl+,` (or `Cmd+,` on Mac)
2. **Search**: `mssql connections`
3. **Edit settings.json** and add:
   ```json
   {
     "mssql.connections": [
       {
         "server": "localhost",
         "database": "pubs",
         "authenticationType": "SqlLogin",
         "user": "SA",
         "password": "",
         "savePassword": true,
         "profileName": "Local SQL Server"
       }
     ]
   }
   ```

---

## Working with SQL Files

### Create New SQL File

1. **Create new file**: `Ctrl+N`
2. **Save as**: `Ctrl+S` and save with `.sql` extension (e.g., `queries.sql`)
3. **Change language mode**: Click language selector in status bar and choose `SQL`

### Sample SQL Query

Create a new `.sql` file and try this query:

```sql
-- Connect to pubs database
USE pubs;
GO

-- List all authors
SELECT au_fname, au_lname, city, state 
FROM authors
ORDER BY au_lname;
GO

-- Get books with their authors
SELECT 
    t.title,
    a.au_fname + ' ' + a.au_lname AS author_name,
    t.price,
    t.pubdate
FROM titles t
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
ORDER BY t.title;
GO
```

### Execute SQL Queries

1. **Select query text** or place cursor in the query
2. **Run query**: Press `Ctrl+Shift+E` or right-click and select "Execute Query"
3. **View results**: Results will appear in a new tab

---

## Useful Features

### IntelliSense and Auto-completion

- **Table names**: Start typing table names for auto-completion
- **Column names**: Get suggestions for column names
- **SQL keywords**: Auto-complete SQL syntax

### Query Results

- **Grid view**: View results in a table format
- **Export results**: Save results to CSV, JSON, or Excel
- **Copy data**: Select and copy specific cells or rows

### Database Object Explorer

- **Right-click tables**: Get context menu options:
  - Select Top 1000 Rows
  - Edit Data
  - Generate Scripts
  - View Definition

### Snippets

Type these shortcuts in a `.sql` file:
- `sql` - Basic SELECT statement
- `insert` - INSERT statement template
- `update` - UPDATE statement template
- `delete` - DELETE statement template

---

## Troubleshooting

### Connection Issues

**Problem**: Cannot connect to server  
**Solutions**:
1. Verify SQL Server is running:
   ```bash
   sudo docker ps
   ```
2. Check if port 1433 is accessible:
   ```bash
   telnet localhost 1433
   ```
3. Verify credentials are correct

**Problem**: Authentication failed  
**Solutions**:
1. Double-check username: `SA`
2. Verify password: `StrongP@ssw0rd123!`
3. Ensure SQL Server is accepting SQL logins

**Problem**: Trust server certificate error  
**Solution**: Add `TrustServerCertificate=true` to connection string

### Performance Issues

**Problem**: Slow query execution  
**Solutions**:
1. Check query execution plan
2. Add appropriate indexes
3. Limit result sets with `TOP` clause

**Problem**: Connection timeout  
**Solutions**:
1. Increase connection timeout in settings
2. Check network connectivity
3. Verify server resources

---

## Advanced Configuration

### Settings.json Configuration

Add these settings to your VS Code `settings.json`:

```json
{
  "mssql.connections": [
    {
      "server": "localhost",
      "database": "pubs",
      "authenticationType": "SqlLogin", 
      "user": "SA",
      "savePassword": true,
      "profileName": "Local SQL Server - Pubs"
    }
  ],
  "mssql.intelliSense.enableIntelliSense": true,
  "mssql.intelliSense.lowerCaseSuggestions": false,
  "mssql.format.alignColumnDefinitionsInColumns": true,
  "mssql.format.datatypeCasing": "uppercase",
  "mssql.format.keywordCasing": "uppercase",
  "mssql.resultView.defaultResultsView": "grid"
}
```

### Keyboard Shortcuts

Add custom shortcuts in `keybindings.json`:

```json
[
  {
    "key": "ctrl+e",
    "command": "mssql.runQuery",
    "when": "editorTextFocus && editorLangId == sql"
  },
  {
    "key": "ctrl+shift+e", 
    "command": "mssql.runCurrentStatement",
    "when": "editorTextFocus && editorLangId == sql"
  }
]
```

---

## Sample Queries for Pubs Database

Here are some useful queries to get you started:

### Basic Data Exploration

```sql
-- Check all tables in the database
SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;

-- Count records in each table
SELECT 
    'authors' as table_name, COUNT(*) as record_count FROM authors
UNION ALL
SELECT 'titles', COUNT(*) FROM titles
UNION ALL  
SELECT 'publishers', COUNT(*) FROM publishers
UNION ALL
SELECT 'sales', COUNT(*) FROM sales;
```

### Business Queries

```sql
-- Top selling books
SELECT 
    t.title,
    SUM(s.qty) as total_sold,
    t.price,
    SUM(s.qty * t.price) as total_revenue
FROM titles t
JOIN sales s ON t.title_id = s.title_id
GROUP BY t.title, t.price
ORDER BY total_sold DESC;

-- Authors by location
SELECT 
    state,
    city,
    COUNT(*) as author_count
FROM authors
WHERE state IS NOT NULL
GROUP BY state, city
ORDER BY state, city;

-- Publisher sales summary
SELECT 
    p.pub_name,
    COUNT(DISTINCT t.title_id) as titles_published,
    COUNT(DISTINCT s.ord_num) as total_orders,
    SUM(s.qty) as books_sold
FROM publishers p
LEFT JOIN titles t ON p.pub_id = t.pub_id
LEFT JOIN sales s ON t.title_id = s.title_id
GROUP BY p.pub_name
ORDER BY books_sold DESC;
```

---

## Next Steps

1. **Explore the pubs database** using the queries above
2. **Create your own SQL files** for different types of queries
3. **Try the IntelliSense features** while writing SQL
4. **Export query results** to analyze data further
5. **Set up additional database connections** if needed

## Useful Resources

- [VS Code SQL Server Extension Documentation](https://docs.microsoft.com/en-us/sql/tools/visual-studio-code/sql-server-develop-use-vscode)
- [T-SQL Reference](https://docs.microsoft.com/en-us/sql/t-sql/)
- [Pubs Database Schema Reference](https://docs.microsoft.com/en-us/sql/samples/sql-samples-where-are)

---

**Connection Status**: ✅ Ready to connect  
**Database**: pubs (11 tables with sample data)  
**Last Updated**: August 9, 2025
