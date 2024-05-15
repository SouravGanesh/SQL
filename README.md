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

