The following is a simplified explanation of the SQL execution order:

- 𝐅𝐑𝐎𝐌/𝐉𝐎𝐈𝐍: The FROM clause specifies the tables from which the data will be retrieved. The JOIN clause can be used to combine data from multiple tables.
- 𝐖𝐇𝐄𝐑𝐄: The WHERE clause is used to filter the data based on specific conditions.
- 𝐆𝐑𝐎𝐔𝐏 𝐁𝐘: The GROUP BY clause is used to group the data based on one or more columns.
- 𝐇𝐀𝐕𝐈𝐍𝐆: The HAVING clause is used to filter the grouped data based on specific conditions.
- 𝐒𝐄𝐋𝐄𝐂𝐓: The SELECT clause specifies the columns that will be returned in the result set.
- 𝐃𝐈𝐒𝐓𝐈𝐍𝐂𝐓: The DISTINCT keyword can be used to ensure that only distinct rows are returned in the result set.
- 𝐎𝐑𝐃𝐄𝐑 𝐁𝐘: The ORDER BY clause is used to sort the result set in ascending or descending order.
- 𝐋𝐈𝐌𝐈𝐓: The LIMIT clause can be used to restrict the number of rows returned.

![img](https://github.com/SouravGanesh/Data-Digest/blob/dd42d0edc87c70f0c0e2e66e6860c5b7fbd999dd/images/sql1.gif)

![img](https://github.com/SouravGanesh/Data-Digest/blob/e23ea2617f2fdd2718a01395a324f35f52bcada4/images/sql2.jpg)

![img](https://github.com/SouravGanesh/Data-Digest/blob/0d651e6db035cb9e9b252c1db615a7114f6f2998/images/sql3.gif)

# Data Definition Language (DDL) commands:

1.  **TRUNCATE TABLE**: 
   - Explanation: This command is used to remove all rows from a table, while keeping the table structure intact.
   - Example: 
     ```sql
     TRUNCATE TABLE employee;
     ```

2.  **ALTER TABLE (RENAME)**:
   - Explanation: This variant of the ALTER TABLE command is used to rename an existing table.
   - Example:
     ```sql
     ALTER TABLE old_table_name
     RENAME TO new_table_name;



3. **CREATE INDEX**:
   - Explanation: This command is used to create an index on one or more columns of a table, which can improve the performance of queries that use those columns in the WHERE clause.
   - Example:
     ```sql
     CREATE INDEX idx_employee_department
     ON employees (department);
     ```

4. **DROP INDEX**:
   - Explanation: This command is used to remove an index from the database.
   - Example:
     ```sql
     DROP INDEX idx_employee_department;
     ```

# TCL (Transaction Control Language)
TCL (Transaction Control Language) commands in SQL are used to manage transactions within a database. Transactions are sets of SQL statements that are executed as a single unit, either all successfully or none at all. TCL commands help ensure data integrity and consistency in the database. Here are some TCL commands along with examples:

1. **COMMIT**: This command is used to permanently save the changes made during the current transaction.

   ```sql
   BEGIN TRANSACTION;
   UPDATE employees SET salary = 50000 WHERE department = 'Sales';
   COMMIT;
   ```

   In this example, the `UPDATE` statement modifies the salary of employees in the Sales department, and `COMMIT` saves this change permanently.

2. **ROLLBACK**: This command is used to undo changes made during the current transaction and restore the database to its previous state.

   ```sql
   BEGIN TRANSACTION;
   DELETE FROM orders WHERE order_date < '2024-01-01';
   ROLLBACK;
   ```

   Here, the `DELETE` statement removes orders placed before January 1, 2024. However, if an issue arises, the `ROLLBACK` command undoes this deletion.

3. **SAVEPOINT**: This command is used to set a savepoint within a transaction, allowing partial rollback to that point if needed.

   ```sql
   BEGIN TRANSACTION;
   UPDATE accounts SET balance = balance - 100 WHERE account_id = 123;
   SAVEPOINT update1;
   UPDATE accounts SET balance = balance + 100 WHERE account_id = 456;
   ROLLBACK TO update1;
   COMMIT;
   ```

   This example illustrates using `SAVEPOINT` to mark a point in the transaction. If the second update fails or needs to be rolled back, `ROLLBACK TO update1` undoes only the changes made after `SAVEPOINT update1`.

These are some common TCL commands used in SQL, helping to maintain the integrity of the database by managing transactions effectively.

# Data Control Language (DCL)
Data Control Language (DCL) commands in SQL are used to control access to the database and its objects. These commands primarily deal with permissions, granting or revoking privileges to users or roles. Here are some common DCL commands with examples:

1. **GRANT**: This command is used to provide specific privileges to users or roles.

    Example:
    ```
    GRANT SELECT, INSERT ON employees TO user1;
    ```
    This grants the user `user1` the privileges to select and insert data into the `employees` table.

2. **REVOKE**: This command is used to take back privileges granted to users or roles.

    Example:
    ```
    REVOKE DELETE ON customers FROM user2;
    ```
    This revokes the privilege to delete data from the `customers` table from `user2`.

3. **DENY**: In some database management systems, like SQL Server, there's also a `DENY` command which explicitly denies a permission to a user or role, even if it has been granted through other means. 

    Example:
    ```
    DENY UPDATE ON orders TO user3;
    ```
    This denies the privilege to update data in the `orders` table to `user3`.

These commands are crucial for managing the security and integrity of the database by ensuring that only authorized users have access to specific data and operations within the database.

# SQL Window functions
SQL Window functions are powerful tools for performing calculations across a set of rows related to the current row within a query result. Let's break down each part and provide examples:

1. **OVER Clause**:
   The `OVER` clause defines a window of rows over which a window function operates. It specifies the partitioning and ordering of the rows.

2. **PARTITION BY**:
   The `PARTITION BY` clause divides the result set into partitions to which the window function is applied separately. It essentially creates separate groups within the result set.

3. **ORDER BY**:
   The `ORDER BY` clause specifies the order of rows within each partition created by the `PARTITION BY` clause.

Now, let's look at some examples using common SQL window functions:

**Count, Sum, Min, Max, Avg:**

```sql
SELECT
    department,
    employee_name,
    salary,
    COUNT(*) OVER(PARTITION BY department) AS department_count,
    SUM(salary) OVER(PARTITION BY department) AS department_salary_sum,
    MIN(salary) OVER(PARTITION BY department) AS department_min_salary,
    MAX(salary) OVER(PARTITION BY department) AS department_max_salary,
    AVG(salary) OVER(PARTITION BY department) AS department_avg_salary
FROM
    employees;
```

In this example, we're calculating various aggregates (`COUNT`, `SUM`, `MIN`, `MAX`, `AVG`) over each department's salaries.

**Row_number, Rank, Dense_rank:**

```sql
SELECT
    department,
    employee_name,
    salary,
    ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS row_num,
    RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rank,
    DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dense_rank
FROM
    employees;
```

Here, we're assigning row numbers, ranks, and dense ranks to employees within each department based on their salary, ordered from highest to lowest.

**Lead, Lag:**

```sql
SELECT
    department,
    employee_name,
    salary,
    LEAD(salary) OVER(PARTITION BY department ORDER BY salary DESC) AS next_salary,
    LAG(salary) OVER(PARTITION BY department ORDER BY salary DESC) AS prev_salary
FROM
    employees;
```

These functions allow you to access data from subsequent or preceding rows within the same partition. Here, we're retrieving the next and previous salary for each employee within their department, ordered by salary in descending order.

**Nth_Value:**

```sql
SELECT
    department,
    employee_name,
    salary,
    NTH_VALUE(salary, 2) OVER(PARTITION BY department ORDER BY salary DESC) AS second_highest_salary
FROM
    employees;
```

This function returns the value of the expression from the row specified by the integer parameter. Here, we're retrieving the second highest salary for each department.

**Frame Clause: Range Between, Rows Between:**

```sql
SELECT
    department,
    employee_name,
    salary,
    SUM(salary) OVER(PARTITION BY department ORDER BY salary DESC
                     ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM
    employees;
```

In this example, we're calculating a running total of salaries for each department. The `ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW` part specifies the window frame for the running total calculation. It includes all rows from the beginning of the partition up to the current row.

# Stored Procedure

1. **Creating a stored procedure using CREATE PROCEDURE command:**
   
   ```
   CREATE PROCEDURE GetEmployeeDetails
   AS
   BEGIN
       SELECT * FROM Employees;
   END;
   ```
   This creates a stored procedure named `GetEmployeeDetails` that selects all records from the `Employees` table.

2. **Executing a stored procedure using EXECUTE command:**

   ```
   EXECUTE GetEmployeeDetails;
   ```
   This executes the stored procedure `GetEmployeeDetails`, returning all employee details.

3. **Passing parameters to a stored procedure:**

   ```
   CREATE PROCEDURE GetEmployeeByID
       @EmployeeID INT
   AS
   BEGIN
       SELECT * FROM Employees WHERE EmployeeID = @EmployeeID;
   END;
   ```
   Here, `@EmployeeID` is a parameter passed to the stored procedure `GetEmployeeByID` which filters the records based on the provided ID.

   To execute this stored procedure with a specific ID:
   
   ```
   EXECUTE GetEmployeeByID @EmployeeID = 12345;
   ```

4. **Returning values from a stored procedure:**

   ```
   CREATE PROCEDURE GetEmployeeCount
       @EmployeeCount INT OUTPUT
   AS
   BEGIN
       SELECT @EmployeeCount = COUNT(*) FROM Employees;
   END;
   ```
   This stored procedure `GetEmployeeCount` calculates the total number of employees and assigns it to the output parameter `@EmployeeCount`.

   To execute this stored procedure and get the count:
   
   ```
   DECLARE @Count INT;
   EXECUTE GetEmployeeCount @EmployeeCount = @Count OUTPUT;
   PRINT 'Total number of employees: ' + CAST(@Count AS VARCHAR);
   ```
   This will print the total number of employees retrieved by the stored procedure.
