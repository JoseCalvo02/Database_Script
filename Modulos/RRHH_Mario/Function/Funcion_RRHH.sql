
CREATE OR REPLACE FUNCTION CalcularAntiguedad(empleadoID IN VARCHAR2) RETURN NUMBER IS
    v_fechaIngreso DATE;
    v_antiguedad NUMBER;
BEGIN
    -- Obtener la fecha de ingreso del empleado
    SELECT fechaIngreso INTO v_fechaIngreso FROM RRHH_Empleados WHERE empleadoID = CalcularAntiguedad.empleadoID;

    -- Calcular la antigüedad en años
    v_antiguedad := TRUNC(MONTHS_BETWEEN(SYSDATE, v_fechaIngreso) / 12);

    -- Devolver la antigüedad calculada
    RETURN v_antiguedad;
END CalcularAntiguedad;



-- Llamar a la función para obtener la antigüedad de un empleado específico

SET SERVEROUTPUT ON;

DECLARE
    v_empleadoID VARCHAR2(4) := '1234'; -- Reemplaza con el empleadoID deseado
    v_resultado NUMBER;
BEGIN
    -- Llamar a la función y almacenar el resultado en v_resultado
    v_resultado := CalcularAntiguedad(v_empleadoID);

    -- Mostrar el resultado
    DBMS_OUTPUT.PUT_LINE('La antigüedad del empleado ' || v_empleadoID || ' es: ' || v_resultado || ' años');
END;
/
