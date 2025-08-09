# SQL Server Installation Guide for Ubuntu

## Complete Guide to Install and Setup Microsoft SQL Server on Ubuntu Linux

### Table of Contents
1. [Prerequisites](#prerequisites)
2. [Installation Methods](#installation-methods)
3. [Docker Installation (Recommended)](#docker-installation-recommended)
4. [Native Installation (Alternative)](#native-installation-alternative)
5. [Post-Installation Setup](#post-installation-setup)
6. [Verification and Testing](#verification-and-testing)
7. [Database Creation](#database-creation)
8. [Management and Maintenance](#management-and-maintenance)
9. [Troubleshooting](#troubleshooting)
10. [Security Considerations](#security-considerations)

---

## Prerequisites

### System Requirements
- **Operating System**: Ubuntu 18.04, 20.04, 22.04, or 24.04 LTS
- **Memory**: Minimum 2GB RAM (4GB+ recommended)
- **Disk Space**: At least 6GB free space
- **CPU**: x64 compatible processor
- **Network**: Internet connection for package downloads

### User Requirements
- Sudo/root access
- Basic command line knowledge

### Check Your System
```bash
# Check Ubuntu version
lsb_release -a

# Check available memory
free -h

# Check disk space
df -h

# Check CPU architecture
uname -m
```

---

## Installation Methods

There are two primary methods to install SQL Server on Ubuntu:

1. **Docker (Recommended)** - Easier setup, isolated environment, consistent across systems
2. **Native Installation** - Direct installation on the host system

---

## Docker Installation (Recommended)

### Step 1: Install Docker

```bash
# Update package index
sudo apt-get update -y

# Install prerequisites
sudo apt-get install -y curl gnupg2 software-properties-common apt-transport-https

# Install Docker
sudo apt install -y docker.io

# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add current user to docker group (optional, for non-sudo docker commands)
sudo usermod -aG docker $USER
```

**Note**: After adding user to docker group, log out and back in, or run `newgrp docker`

### Step 2: Pull SQL Server Docker Image

```bash
# Pull the latest SQL Server 2022 image
sudo docker pull mcr.microsoft.com/mssql/server:2022-latest

# Alternative: Pull SQL Server 2019 if needed
# sudo docker pull mcr.microsoft.com/mssql/server:2019-latest
```

### Step 3: Run SQL Server Container

```bash
# Run SQL Server container with environment variables
sudo docker run -e "ACCEPT_EULA=Y" \
    -e "MSSQL_SA_PASSWORD=YourStrongPassword123!" \
    -p 1433:1433 \
    --name mssql \
    --hostname mssql \
    -d mcr.microsoft.com/mssql/server:2022-latest
```

**Important**: Replace `YourStrongPassword123!` with a strong password that meets SQL Server requirements:
- At least 8 characters
- Contains uppercase and lowercase letters
- Contains numbers
- Contains special characters

### Step 4: Verify Container Status

```bash
# Check if container is running
sudo docker ps

# Check container logs
sudo docker logs mssql

# Wait for "SQL Server is now ready for client connections" message
```

---

## Native Installation (Alternative)

### Step 1: Add Microsoft Repository

```bash
# Import Microsoft GPG key
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft.gpg

# Add SQL Server repository (adjust for your Ubuntu version)
# For Ubuntu 20.04:
echo "deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/ubuntu/20.04/mssql-server-2019 stable main" | sudo tee /etc/apt/sources.list.d/mssql-server.list

# For Ubuntu 22.04, use 20.04 packages (compatible):
echo "deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/ubuntu/20.04/mssql-server-2019 stable main" | sudo tee /etc/apt/sources.list.d/mssql-server.list

# Update package lists
sudo apt-get update
```

### Step 2: Install SQL Server

```bash
# Install SQL Server package
sudo apt-get install -y mssql-server

# Run SQL Server configuration
sudo /opt/mssql/bin/mssql-conf setup
```

During setup:
1. Choose edition (2 = Developer for full features, free)
2. Accept license terms
3. Set SA password (meet complexity requirements)
4. Confirm settings

### Step 3: Verify Installation

```bash
# Check SQL Server service status
systemctl status mssql-server --no-pager

# Enable auto-start on boot
sudo systemctl enable mssql-server
```

---

## Post-Installation Setup

### Install SQL Server Command Line Tools

```bash
# Add Microsoft tools repository
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg

echo "deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/microsoft-prod.gpg] https://packages.microsoft.com/ubuntu/20.04/prod focal main" | sudo tee /etc/apt/sources.list.d/microsoft-prod.list

# Update package lists
sudo apt-get update -y

# Install mssql-tools and unixODBC developer package
sudo apt-get install -y mssql-tools unixodbc-dev

# Add sqlcmd to PATH
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
source ~/.bashrc
```

### Optional: Install SQL Server Agent (Native Installation Only)

```bash
# Install SQL Server Agent
sudo apt-get install -y mssql-server-agent

# Enable SQL Server Agent
sudo /opt/mssql/bin/mssql-conf set sqlagent.enabled true

# Restart SQL Server
sudo systemctl restart mssql-server
```

---

## Verification and Testing

### Test Connection

```bash
# Test connection (Docker installation)
sqlcmd -S localhost -U SA -P 'YourStrongPassword123!' -C -Q "SELECT @@VERSION;"

# Test connection (Native installation)
sqlcmd -S localhost -U SA -P 'YourStrongPassword123!' -Q "SELECT @@VERSION;"
```

### Basic System Queries

```bash
# Check SQL Server version
sqlcmd -S localhost -U SA -P 'YourStrongPassword123!' -C -Q "SELECT @@VERSION, @@SERVERNAME;"

# List databases
sqlcmd -S localhost -U SA -P 'YourStrongPassword123!' -C -Q "SELECT name FROM sys.databases;"

# Check server configuration
sqlcmd -S localhost -U SA -P 'YourStrongPassword123!' -C -Q "SELECT name, value FROM sys.configurations WHERE name IN ('max server memory (MB)', 'min server memory (MB)');"
```

---

## Database Creation

### Method 1: Interactive Mode

```bash
# Connect to SQL Server
sqlcmd -S localhost -U SA -P 'YourStrongPassword123!' -C

# Create database (in sqlcmd prompt)
1> CREATE DATABASE TestDB;
2> GO
1> USE TestDB;
2> GO
1> EXIT
```

### Method 2: Execute Script File

```bash
# Execute SQL script from file
sqlcmd -S localhost -U SA -P 'YourStrongPassword123!' -C -i /path/to/your/script.sql

# Example: Create and populate database
sqlcmd -S localhost -U SA -P 'YourStrongPassword123!' -C -i /home/user/Create_DB_Pubs.sql
```

### Method 3: One-line Command

```bash
# Create database with single command
sqlcmd -S localhost -U SA -P 'YourStrongPassword123!' -C -Q "CREATE DATABASE MyDatabase;"
```

---

## Management and Maintenance

### Container Management (Docker Installation)

```bash
# Start SQL Server container
sudo docker start mssql

# Stop SQL Server container
sudo docker stop mssql

# Restart SQL Server container
sudo docker restart mssql

# View container logs
sudo docker logs mssql

# Access container shell
sudo docker exec -it mssql /bin/bash

# Remove container (data will be lost!)
sudo docker stop mssql
sudo docker rm mssql
```

### Service Management (Native Installation)

```bash
# Start SQL Server service
sudo systemctl start mssql-server

# Stop SQL Server service
sudo systemctl stop mssql-server

# Restart SQL Server service
sudo systemctl restart mssql-server

# Check service status
sudo systemctl status mssql-server

# View SQL Server error logs
sudo tail -f /var/opt/mssql/log/errorlog
```

### Database Backup and Restore

```bash
# Backup database
sqlcmd -S localhost -U SA -P 'YourStrongPassword123!' -C -Q "BACKUP DATABASE [YourDB] TO DISK = '/var/opt/mssql/data/YourDB.bak';"

# Restore database
sqlcmd -S localhost -U SA -P 'YourStrongPassword123!' -C -Q "RESTORE DATABASE [YourDB] FROM DISK = '/var/opt/mssql/data/YourDB.bak';"
```

---

## Troubleshooting

### Common Issues and Solutions

#### 1. Connection Failed
```bash
# Check if SQL Server is running
sudo docker ps  # For Docker
systemctl status mssql-server  # For native

# Check port availability
sudo netstat -tlnp | grep 1433
sudo ss -tlnp | grep 1433

# Test local connectivity
telnet localhost 1433
```

#### 2. Login Failed for User 'SA'
- Verify password meets complexity requirements
- Check if SA account is enabled
- Try resetting SA password:

```bash
# For Docker installation
sudo docker exec -it mssql /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -C
# At password prompt, use current password, then:
# ALTER LOGIN SA WITH PASSWORD = 'NewStrongPassword123!';
# GO

# For native installation
sudo /opt/mssql/bin/mssql-conf set-sa-password
```

#### 3. Container Won't Start
```bash
# Check container logs
sudo docker logs mssql

# Check available memory
free -h

# Remove and recreate container
sudo docker stop mssql
sudo docker rm mssql
# Re-run docker run command
```

#### 4. Port Already in Use
```bash
# Find process using port 1433
sudo lsof -i :1433

# Kill process or use different port
sudo docker run -p 1434:1433 ...  # Use port 1434 instead
```

#### 5. Permission Denied
```bash
# Check Docker permissions
sudo chmod 666 /var/run/docker.sock
# Or add user to docker group
sudo usermod -aG docker $USER
```

### Log Locations

**Docker Installation:**
```bash
# Container logs
sudo docker logs mssql

# SQL Server error log inside container
sudo docker exec mssql cat /var/opt/mssql/log/errorlog
```

**Native Installation:**
```bash
# SQL Server error log
sudo tail -f /var/opt/mssql/log/errorlog

# System service logs
journalctl -u mssql-server -f
```

---

## Security Considerations

### 1. Password Security
- Use strong SA passwords (min 8 chars, mixed case, numbers, symbols)
- Consider disabling SA account and using Windows Authentication
- Regularly rotate passwords

### 2. Network Security
```bash
# Firewall configuration (if remote access needed)
sudo ufw allow 1433/tcp

# Restrict to specific IPs
sudo ufw allow from 192.168.1.0/24 to any port 1433
```

### 3. Database Security
```bash
# Create application-specific users instead of using SA
sqlcmd -S localhost -U SA -P 'YourStrongPassword123!' -C -Q "
CREATE LOGIN [AppUser] WITH PASSWORD = 'AppPassword123!';
CREATE USER [AppUser] FOR LOGIN [AppUser];
ALTER ROLE db_datareader ADD MEMBER [AppUser];
ALTER ROLE db_datawriter ADD MEMBER [AppUser];
"
```

### 4. Container Security (Docker)
```bash
# Run container with non-root user
sudo docker run -e "ACCEPT_EULA=Y" \
    -e "MSSQL_SA_PASSWORD=YourStrongPassword123!" \
    -e "MSSQL_PID=Developer" \
    -p 1433:1433 \
    --name mssql \
    --user mssql \
    -d mcr.microsoft.com/mssql/server:2022-latest
```

---

## Quick Reference Commands

### Essential Commands
```bash
# Connect to SQL Server
sqlcmd -S localhost -U SA -P 'YourPassword' -C

# Execute query from command line
sqlcmd -S localhost -U SA -P 'YourPassword' -C -Q "SELECT @@VERSION;"

# Execute script file
sqlcmd -S localhost -U SA -P 'YourPassword' -C -i script.sql

# Connect to specific database
sqlcmd -S localhost -U SA -P 'YourPassword' -C -d DatabaseName

# Docker container management
sudo docker start mssql    # Start
sudo docker stop mssql     # Stop
sudo docker restart mssql  # Restart
sudo docker logs mssql     # View logs
```

### Useful SQL Queries
```sql
-- Check SQL Server version
SELECT @@VERSION;

-- List all databases
SELECT name FROM sys.databases;

-- List tables in current database
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE';

-- Check database size
SELECT 
    DB_NAME() AS DatabaseName,
    SUM(size) * 8 / 1024 AS SizeMB
FROM sys.database_files;

-- Show current connections
SELECT 
    session_id,
    login_name,
    host_name,
    program_name,
    login_time
FROM sys.dm_exec_sessions 
WHERE is_user_process = 1;
```

---

## Conclusion

This guide covers the complete installation and setup of Microsoft SQL Server on Ubuntu Linux. The Docker approach is recommended for most users due to its simplicity and isolation benefits. For production environments, consider the native installation with proper security hardening.

For additional help:
- [Microsoft SQL Server Documentation](https://docs.microsoft.com/en-us/sql/linux/)
- [SQL Server on Docker Hub](https://hub.docker.com/_/microsoft-mssql-server)
- Ubuntu community forums and Stack Overflow

---

**Last Updated**: August 2025  
**Tested On**: Ubuntu 24.04 LTS with SQL Server 2022
