-- !! CREATE !!

CREATE OR REPLACE PROCEDURE createEmployeeProcedure(
    IN emp_id INT,
    IN first_name VARCHAR(45),
    IN last_name VARCHAR(45),
    IN salary INT,
    IN job VARCHAR(45)
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Employee (e_empoyee_ID, e_firstname, e_lastname, e_salary, e_job)
    VALUES (emp_id, first_name, last_name, salary, job);
END;
$$;


-- Create 10 times

DO $$
BEGIN
    FOR i IN 1..10 LOOP
        CALL createEmployeeProcedure(i,
                             'First_Name_' || i,
                             'Last_Name_' || i,
                             floor(random() * 100000 + 30000)::int,
                             'Job_Title_' || i);
    END LOOP;
END $$;

-- Create 100 times
DO $$
BEGIN
    FOR i IN 1..100 LOOP
        CALL createEmployeeProcedure(i,
                             'First_Name_' || i,
                             'Last_Name_' || i,
                             floor(random() * 100000 + 30000)::int,
                             'Job_Title_' || i);
    END LOOP;
END $$;

-- Create 1000 times
DO $$
BEGIN
    FOR i IN 1..1000 LOOP
        CALL createEmployeeProcedure(i,
                             'First_Name_' || i,
                             'Last_Name_' || i,
                             floor(random() * 100000 + 30000)::int,
                             'Job_Title_' || i);
    END LOOP;
END $$;

-- !! GET ALL !!

CREATE OR REPLACE PROCEDURE getFirstTenEmployees()
LANGUAGE plpgsql
AS $$
DECLARE
    employee_record RECORD;
BEGIN
    -- Fetch the first 10 entries from the Employee table
    RAISE NOTICE 'Fetching the first 10 employees:';
    FOR employee_record IN (SELECT * FROM Employee LIMIT 10) LOOP
        RAISE NOTICE 'Employee ID: %, First Name: %, Last Name: %, Salary: %, Job: %',
            employee_record.e_empoyee_ID,
            employee_record.e_firstname,
            employee_record.e_lastname,
            employee_record.e_salary,
            employee_record.e_job;
    END LOOP;
END;
$$;

CALL getFirstTenEmployees();


CREATE OR REPLACE PROCEDURE getFirstHundredEmployees()
LANGUAGE plpgsql
AS $$
DECLARE
    employee_record RECORD;
BEGIN
    -- Fetch the first 10 entries from the Employee table
    RAISE NOTICE 'Fetching the first 100 employees:';
    FOR employee_record IN (SELECT * FROM Employee LIMIT 100) LOOP
        RAISE NOTICE 'Employee ID: %, First Name: %, Last Name: %, Salary: %, Job: %',
            employee_record.e_empoyee_ID,
            employee_record.e_firstname,
            employee_record.e_lastname,
            employee_record.e_salary,
            employee_record.e_job;
    END LOOP;
END;
$$;

CALL getFirstHundredEmployees();


CREATE OR REPLACE PROCEDURE getFirstThousandEmployees()
LANGUAGE plpgsql
AS $$
DECLARE
    employee_record RECORD;
BEGIN
    -- Fetch the first 10 entries from the Employee table
    RAISE NOTICE 'Fetching the first 1000 employees:';
    FOR employee_record IN (SELECT * FROM Employee LIMIT 1000) LOOP
        RAISE NOTICE 'Employee ID: %, First Name: %, Last Name: %, Salary: %, Job: %',
            employee_record.e_empoyee_ID,
            employee_record.e_firstname,
            employee_record.e_lastname,
            employee_record.e_salary,
            employee_record.e_job;
    END LOOP;
END;
$$;

CALL getFirstThousandEmployees();

-- !! UPDATE !!


-- UPDATE 10 times
CREATE OR REPLACE PROCEDURE updateFirstTenEmployees()
LANGUAGE plpgsql
AS $$
DECLARE
    emp_record Employee%ROWTYPE;
    counter INT := 0;
BEGIN
    -- Cursor to fetch the first 10 employees
    FOR emp_record IN (SELECT * FROM Employee LIMIT 10) LOOP
        -- Update the employee details
        UPDATE Employee
        SET e_firstname = 'UpdatedName', e_lastname = 'UpdatedLastName', e_salary = 60000
        WHERE e_empoyee_ID = emp_record.e_empoyee_ID;

        counter := counter + 1;
    END LOOP;

    RAISE NOTICE 'Updated % employees.', counter;
END;
$$;
CALL updateFirstTenEmployees();



-- UPDATE 100 times
CREATE OR REPLACE PROCEDURE updateFirstHundredEmployees()
LANGUAGE plpgsql
AS $$
DECLARE
    emp_record Employee%ROWTYPE;
    counter INT := 0;
BEGIN
    -- Cursor to fetch the first 10 employees
    FOR emp_record IN (SELECT * FROM Employee LIMIT 100) LOOP
        -- Update the employee details
        UPDATE Employee
        SET e_firstname = 'UpdatedName', e_lastname = 'UpdatedLastName', e_salary = 60000
        WHERE e_empoyee_ID = emp_record.e_empoyee_ID;

        counter := counter + 1;
    END LOOP;

    RAISE NOTICE 'Updated % employees.', counter;
END;
$$;

CALL updateFirstHundredEmployees();


-- UPDATE 1000 times
CREATE OR REPLACE PROCEDURE updateFirstThousandEmployees()
LANGUAGE plpgsql
AS $$
DECLARE
    emp_record Employee%ROWTYPE;
    counter INT := 0;
BEGIN
    -- Cursor to fetch the first 10 employees
    FOR emp_record IN (SELECT * FROM Employee LIMIT 1000) LOOP
        -- Update the employee details
        UPDATE Employee
        SET e_firstname = 'UpdatedName', e_lastname = 'UpdatedLastName', e_salary = 60000
        WHERE e_empoyee_ID = emp_record.e_empoyee_ID;

        counter := counter + 1;
    END LOOP;

    RAISE NOTICE 'Updated % employees.', counter;
END;
$$;

call updateFirstThousandEmployees();


-- !! DELETE !!

-- DELETE 10 times
CREATE OR REPLACE PROCEDURE deleteFirstTenEmployees()
LANGUAGE plpgsql
AS $$
BEGIN
    -- Delete the first 10 entries from the Employee table
    DELETE FROM Employee WHERE e_empoyee_ID IN (
        SELECT e_empoyee_ID FROM Employee LIMIT 10
    );

    RAISE NOTICE 'Deleted the first 10 employees.';
END;
$$;
CALL deleteFirstTenEmployees();

-- DELETE 100 times
CREATE OR REPLACE PROCEDURE deleteFirstHundredEmployees()
LANGUAGE plpgsql
AS $$
BEGIN
    -- Delete the first 10 entries from the Employee table
    DELETE FROM Employee WHERE e_empoyee_ID IN (
        SELECT e_empoyee_ID FROM Employee LIMIT 100
    );

    RAISE NOTICE 'Deleted the first 10 employees.';
END;
$$;

CALL deleteFirstHundredEmployees();

-- DELETE 1000 times
CREATE OR REPLACE PROCEDURE deleteFirstThousandEmployees()
LANGUAGE plpgsql
AS $$
BEGIN
    -- Delete the first 10 entries from the Employee table
    DELETE FROM Employee WHERE e_empoyee_ID IN (
        SELECT e_empoyee_ID FROM Employee LIMIT 1000
    );

    RAISE NOTICE 'Deleted the first 10 employees.';
END;
$$;

CALL deleteFirstThousandEmployees();