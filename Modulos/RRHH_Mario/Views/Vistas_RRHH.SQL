--------------------------------------------
----> Vistas Materializadas para RRHH_Ausencias <----
--------------------------------------------
-- Vista materializada para la cantidad de ausencias por empleado
CREATE MATERIALIZED VIEW MV_AusenciasPorEmpleado
REFRESH COMPLETE ON COMMIT
AS
SELECT empleadoID, COUNT(*) AS cantidadAusencias
FROM RRHH_Ausencias
GROUP BY empleadoID;

-- Vista materializada para RRHH_Planilla
CREATE MATERIALIZED VIEW MV_RRHH_Planilla
REFRESH COMPLETE ON COMMIT
AS
SELECT
    P.planillaID,
    P.año,
    P.mes,
    P.empleadoID,
    E.nombreEmpleado AS nombre_empleado
FROM
    RRHH_Planilla P
JOIN
    RRHH_Empleados E ON P.empleadoID = E.empleadoID;

-- Mostrar contenido de la vista materializada de cantidad de ausencias
SELECT *
FROM MV_AusenciasPorEmpleado;

-- Mostrar contenido de la vista materializada de RRHH_planilla   
SELECT *
FROM RRHH_Planilla;

--------------------------------------------------------------------------------------------------------

-- Vista normal para obtener información de vacaciones
CREATE OR REPLACE VIEW Vista_Vacaciones AS
SELECT V.vacacionesID, V.empleadoID, V.fechaInicioVacaciones, V.fechaFinalVacaciones, V.estadoVacaciones
FROM RRHH_Vacaciones V;

-- Vista normal para obtener información de departamentos
CREATE OR REPLACE VIEW Vista_Departamentos AS
SELECT D.departamentoID, D.nombreDepartamento AS nombre_departamento
FROM RRHH_Departamentos D;


-- Mostrar contenido de la vista normal Vista_Vacaciones
SELECT *
FROM Vista_Vacaciones;

-- Mostrar contenido de la vista normal informacion de departamentos
SELECT *
FROM Vista_Departamentos;