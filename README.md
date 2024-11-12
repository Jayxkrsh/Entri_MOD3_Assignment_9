This README provides an overview of several stored procedures designed to interact with the `Worker` table in a MySQL database. These procedures perform basic operations like adding records, retrieving information, updating fields, and calculating metrics.

### 1. **AddWorker**: 
   - **Purpose**: Adds a new worker record to the `Worker` table.
   - **Parameters**: Accepts all column values (`Worker_Id`, `FirstName`, `LastName`, `Salary`, `JoiningDate`, `Department`) as `IN` parameters.
   - **Usage**: Invoke with the appropriate values to insert a new worker into the database.

### 2. **GetWorkerSalary**:
   - **Purpose**: Retrieves the salary of a worker based on their `Worker_Id`.
   - **Parameters**: Takes `Worker_Id` as an `IN` parameter and outputs `Salary` via an `OUT` parameter.
   - **Usage**: Call the procedure with a specific worker’s ID to get their salary.

### 3. **UpdateWorkerDepartment**:
   - **Purpose**: Updates the department of a specified worker.
   - **Parameters**: Accepts `Worker_Id` and `Department` as `IN` parameters.
   - **Usage**: Use this procedure to change a worker’s department by specifying their ID and the new department.

### 4. **Count_Worker_In_Department**:
   - **Purpose**: Counts the number of workers in a specified department.
   - **Parameters**: Takes `Department` as an `IN` parameter and returns `WorkerCount` via an `OUT` parameter.
   - **Usage**: Call this procedure with a department name to get the total number of workers in that department.

### 5. **AverageSalaryInDepartment**:
   - **Purpose**: Calculates the average salary of workers in a given department.
   - **Parameters**: Accepts `Department` as an `IN` parameter and outputs the `AvgSalary` in an `OUT` parameter.
   - **Usage**: Invoke this procedure to retrieve the average salary of workers in a specific department.

