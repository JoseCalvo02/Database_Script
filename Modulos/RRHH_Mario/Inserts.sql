-- Insert into RRHH_Departamentos
INSERT INTO RRHH_Departamentos (departamentoID, nombreDepartamento)
VALUES ('D001', 'Recursos Humanos');

INSERT INTO RRHH_Departamentos (departamentoID, nombreDepartamento)
VALUES ('D002', 'Finanzas');

-- Insert into RRHH_Puestos
INSERT INTO RRHH_Puestos (puestoID, nombrePuesto)
VALUES ('P001', 'Gerente de Recursos Humanos');

INSERT INTO RRHH_Puestos (puestoID, nombrePuesto)
VALUES ('P002', 'Analista Financiero');



-- Insert into RRHH_Empleados
INSERT INTO RRHH_Empleados (
    empleadoID,
    nombreEmpleado,
    apellidoEmpleado,
    fechaNacimiento,
    direccion,
    telefono,
    email,
    departamentoID,
    puestoID,
    fechaIngreso,
    fechaEgreso
)
VALUES (
    'E001',
    'Juan',
    'Perez',
    TO_DATE('1990-01-15', 'YYYY-MM-DD'),
    '123 Main St',
    '555-1234',
    'juan.perez@email.com',
    'D001',
    'P001',
    TO_DATE('2020-05-01', 'YYYY-MM-DD'),
    NULL
);

-- Insert into RRHH_Contratos
INSERT INTO RRHH_Contratos (
    contratoID,
    empleadoID,
    tipoContrato,
    fechaInicioContrato,
    fechaFinContrato,
    descripcionContrato
)
VALUES (
    'C001',
    'E001',
    'Tiempo Completo',
    TO_DATE('2020-05-01', 'YYYY-MM-DD'),
    TO_DATE('2022-04-30', 'YYYY-MM-DD'),
    'Contrato a tiempo completo para el puesto de Gerente de Recursos Humanos.'
);

-- Insert into RRHH_Salarios
INSERT INTO RRHH_Salarios (
    salarioID,
    empleadoID,
    montoSalario,
    fechaInicioSalario,
    fechaFinSalario,
    descripcionSalario
)
VALUES (
    'S001',
    'E001',
    '50000',
    TO_DATE('2020-05-01', 'YYYY-MM-DD'),
    TO_DATE('2022-04-30', 'YYYY-MM-DD'),
    'Salario base para el puesto de Gerente de Recursos Humanos.'
);

-- Insert into RRHH_Beneficios
INSERT INTO RRHH_Beneficios (
    beneficiosID,
    empleadoID,
    tipoBeneficio,
    descripcionBeneficio,
    fechaInicioBeneficio,
    fechaFinBeneficio
)
VALUES (
    'B001',
    'E001',
    'Seguro de Salud',
    'Cobertura médica para el empleado y su familia.',
    TO_DATE('2020-05-01', 'YYYY-MM-DD'),
    TO_DATE('2022-04-30', 'YYYY-MM-DD')
);