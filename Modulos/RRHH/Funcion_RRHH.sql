
-- función que calcula el salario total de un empleado en función de su identificación de empleado. 
-- La función tomará el ID del empleado como parámetro de entrada y devolverá el salario total.

CREATE OR REPLACE FUNCTION GetTotalSalary(p_employeeID IN RRHH_Empleados.empleadoID%TYPE)
RETURN VARCHAR2
AS
    v_totalSalary VARCHAR2(15);
BEGIN
    SELECT
        NVL(SUM(s.montoSalario), 0)
    INTO
        v_totalSalary
    FROM
        RRHH_Salarios s
    WHERE
        s.empleadoID = p_employeeID;

    RETURN v_totalSalary;
    
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN '0';
END GetTotalSalary;

DECLARE
    v_employeeID RRHH_Empleados.empleadoID%TYPE := 'EMP001';
    v_totalSalary VARCHAR2(15);
BEGIN
    v_totalSalary := GetTotalSalary(v_employeeID);
    DBMS_OUTPUT.PUT_LINE('Total Salary for Employee ' || v_employeeID || ': ' || v_totalSalary);
END;


