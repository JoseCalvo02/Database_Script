
-- View for Employee Information:

CREATE OR REPLACE VIEW EmployeeInfoView AS
SELECT
    e.empleadoID,
    e.nombreEmpleado,
    e.apellidoEmpleado,
    d.nombreDepartamento,
    p.nombrePuesto,
    s.montoSalario
FROM
    RRHH_Empleados e
    JOIN RRHH_Departamentos d ON e.departamentoID = d.departamentoID
    JOIN RRHH_Puestos p ON e.puestoID = p.puestoID
    LEFT JOIN RRHH_Salarios s ON e.empleadoID = s.empleadoID;


-- View for Contract Information:

CREATE OR REPLACE VIEW ContractInfoView AS
SELECT
    c.contratoID,
    e.empleadoID,
    e.nombreEmpleado,
    c.tipoContrato,
    c.fechaInicioContrato,
    c.fechaFinContrato,
    c.descripcionContrato
FROM
    RRHH_Contratos c
    JOIN RRHH_Empleados e ON c.empleadoID = e.empleadoID;