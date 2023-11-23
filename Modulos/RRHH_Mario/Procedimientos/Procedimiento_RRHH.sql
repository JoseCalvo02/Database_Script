
-- procedimiento para agregar un departamento

CREATE OR REPLACE PROCEDURE SP_AgregarDepartamento(
    p_departamentoID IN VARCHAR2,
    p_nombreDepartamento IN VARCHAR2,
    p_usuarioCrea IN VARCHAR2,
    p_fechaCrea IN date
)
AS
BEGIN
    INSERT INTO RRHH_Departamentos (
       departamentoID, nombreDepartamento, usuarioCrea, fechaCrea
    ) VALUES (
         p_departamentoID, p_nombreDepartamento,p_usuarioCrea,p_fechaCrea
    );
END;

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

