CREATE TABLE Workers
(Worker_Id INT ,
First_Name CHAR(25),
Last_Name CHAR(25),
Salary INT(15),
Joining_Date DATETIME,
Department CHAR(25));

-- Create a stored procedure that takes in IN parameters for all the columns in the Worker table and adds a new record to the table and then invokes the procedure call.
DELIMITER //
CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT,
    IN p_First_Name CHAR(25),
    IN p_Last_Name CHAR(25),
    IN p_Salary INT(15),
    IN p_Joining_Date DATETIME,
    IN p_Department CHAR(25))
BEGIN
    INSERT INTO Workers (Worker_Id, First_Name, Last_Name, Salary, Joining_Date, Department)
    VALUES (p_Worker_Id, p_First_Name, p_Last_Name, p_Salary, p_Joining_Date, p_Department);
END //
DELIMITER ;
CALL AddWorker(1, 'John', 'Doe', 50000, '2023-01-01 10:00:00', 'Engineering');
SELECT * FROM Workers;

/* Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. 
It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. 
Then make the procedure call. */

DELIMITER //
CREATE PROCEDURE GetWorkerSalary(
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary
    FROM Workers
    WHERE Worker_Id = p_Worker_Id;
END //
DELIMITER ;
SET @salary=0;
CALL GetWorkerSalary (1,@salary);
SELECT @salary AS SALARY;

/*Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. 
It should update the department of the worker with the given ID. 
Then make a procedure call.*/

DELIMITER //
CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Workers
    SET Department = p_Department
    WHERE Worker_Id = p_Worker_Id;
END //
DELIMITER ;
CALL UpdateWorkerDepartment(1, 'HR');
SELECT * FROM Workers;
SET Sql_safe_updates=0;

/* Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. 
It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter.
 Make procedure call. */
 
 DELIMITER //
 CREATE PROCEDURE Count_worker_in_department(
 IN p_Department CHAR(25),
 OUT p_Workercount INT
 )
 BEGIN 
 SELECT COUNT(*) INTO p_Workercount
 FROM Workers
 WHERE Department=p_Department;
 END //
 DELIMITER ;
 SET @department = 0;
 CALL Count_worker_in_department("HR",@department);
 SELECT @department AS Count;
 
 /* Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary.
 It should retrieve the average salary of all workers 
 in the given department and returns 
 it in the p_avgSalary parameter and call the procedure.*/
 
 DELIMITER //
CREATE PROCEDURE AverageSalaryInDepartment(
    IN p_Department CHAR(25),
    OUT p_AvgSalary DECIMAL(10, 2)
)
BEGIN
    SELECT AVG(Salary) INTO p_AvgSalary
    FROM Workers
    WHERE Department = p_Department;
END //
DELIMITER ;
SET @avgSalary = 0;
CALL AverageSalaryInDepartment('HR', @avgSalary);
SELECT @avgSalary AS AvgSalary;








