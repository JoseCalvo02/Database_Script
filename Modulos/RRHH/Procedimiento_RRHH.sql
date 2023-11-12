
-- procedimiento que recupere información de los empleados según la identificación del empleado. --
--El procedimiento tomará la identificación del empleado como parámetro de entrada y devolverá detalles relevantes.--

CREATE OR REPLACE PROCEDURE GetEmployeeDetails (
    p_employeeID IN RRHH_Empleados.empleadoID%TYPE,
    p_employeeName OUT VARCHAR2,
    p_departmentName OUT VARCHAR2,
    p_positionName OUT VARCHAR2,
    p_salary OUT VARCHAR2
) AS
BEGIN
    SELECT
        e.nombreEmpleado,
        d.nombreDepartamento,
        p.nombrePuesto,
        s.montoSalario
    INTO
        p_employeeName,
        p_departmentName,
        p_positionName,
        p_salary
    FROM
        RRHH_Empleados e
        JOIN RRHH_Departamentos d ON e.departamentoID = d.departamentoID
        JOIN RRHH_Puestos p ON e.puestoID = p.puestoID
        LEFT JOIN RRHH_Salarios s ON e.empleadoID = s.empleadoID
    WHERE
        e.empleadoID = p_employeeID;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Employee not found');
END GetEmployeeDetails;


-- "GetEmployeeDetails", toma una identificación de empleado como entrada y devuelve el nombre del empleado, el nombre del departamento, --
-- el nombre del puesto y el salario como parámetros de salida. Utiliza una instrucción SELECT INTO para recuperar los datos de las tablas relevantes.--

DECLARE
    v_employeeName VARCHAR2(50);
    v_departmentName VARCHAR2(50);
    v_positionName VARCHAR2(50);
    v_salary VARCHAR2(15);
BEGIN
    GetEmployeeDetails('EMP001', v_employeeName, v_departmentName, v_positionName, v_salary);
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_employeeName);
    DBMS_OUTPUT.PUT_LINE('Department: ' || v_departmentName);
    DBMS_OUTPUT.PUT_LINE('Position: ' || v_positionName);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || v_salary);
END;

