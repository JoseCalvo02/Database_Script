# Database Script Project 📊  

This repository contains **Oracle SQL scripts** designed to create, manage, and optimize databases. The scripts are tailored for efficient database operations and demonstrate advanced SQL techniques for various use cases.  

---

## Features  

- **Schema Creation**: Scripts to define tables, relationships, and constraints.  
- **Data Manipulation**: Includes examples of `INSERT`, `UPDATE`, and `DELETE` operations.  
- **Data Querying**: Complex `SELECT` queries showcasing joins, subqueries, and aggregations.  
- **Performance Optimization**: Use of indexes, triggers, and views to enhance database performance.  
- **Transaction Management**: Examples of transactions with `COMMIT` and `ROLLBACK`.  

---

## Requirements  

To run these scripts, ensure the following are installed and configured:  

1. **Oracle Database**: Download and set up [Oracle Database](https://www.oracle.com/database/).  
2. **SQL Developer**: Use [Oracle SQL Developer](https://www.oracle.com/database/sqldeveloper/) for an intuitive SQL scripting environment.  
3. **Database Access**: Ensure you have a user with sufficient privileges to execute the scripts.  

---

## Installation and Setup  

Follow these steps to use the scripts:  

1. **Clone the Repository**  
   ```bash  
   git clone https://github.com/JoseCalvo02/Database_Script.git  
   cd Database_Script  
   ```  

2. **Set Up Oracle Database**  
   - Log in to your Oracle SQL environment.  
   - Create a new user (optional):  
     ```sql  
     CREATE USER database_user IDENTIFIED BY password;  
     GRANT ALL PRIVILEGES TO database_user;  
     ```  

3. **Run the Scripts**  
   - Open the SQL Developer tool.  
   - Navigate to the `scripts/` folder in this repository.  
   - Execute the scripts in the following order (if applicable):  
     1. `schema.sql` - Creates tables and relationships.  
     2. `data.sql` - Inserts initial data into the tables.  
     3. `queries.sql` - Contains complex queries and operations.  
     4. `triggers_and_views.sql` - Adds triggers, views, or stored procedures.  

---

## Example Usage  

### Create a Table  
```sql  
CREATE TABLE employees (  
    employee_id NUMBER PRIMARY KEY,  
    first_name VARCHAR2(50),  
    last_name VARCHAR2(50),  
    department_id NUMBER,  
    salary NUMBER  
);  
```  

### Insert Data  
```sql  
INSERT INTO employees (employee_id, first_name, last_name, department_id, salary)  
VALUES (1, 'John', 'Doe', 101, 50000);  
```  

### Query Data  
```sql  
SELECT e.first_name, e.last_name, d.department_name  
FROM employees e  
JOIN departments d ON e.department_id = d.department_id  
WHERE e.salary > 40000;  
```  

### Create a Trigger  
```sql  
CREATE OR REPLACE TRIGGER salary_check  
BEFORE INSERT OR UPDATE OF salary ON employees  
FOR EACH ROW  
BEGIN  
    IF :NEW.salary < 0 THEN  
        RAISE_APPLICATION_ERROR(-20001, 'Salary cannot be negative');  
    END IF;  
END;  
/  
```  

---

## Contribution Guidelines  

Contributions are welcome! Feel free to open issues or submit pull requests for improvements.  

---

## Resources  

- **Oracle Documentation**: [https://docs.oracle.com/en/](https://docs.oracle.com/en/)  
- **SQL Tutorials**: [W3Schools SQL](https://www.w3schools.com/sql/)  
- **Database Design Best Practices**: [Database Design Guide](https://www.databasedesign.com/)  

---

## License  

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.  
