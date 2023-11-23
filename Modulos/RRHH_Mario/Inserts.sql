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

-- Insert into RRHH_Evaluaciones
INSERT INTO RRHH_Evaluaciones (
    evaluacionID,
    empleadoID,
    fechaEvaluacion,
    resultadoEvaluacion,
    comentarios
)
VALUES (
    'E001',
    'E001',
    TO_DATE('2023-01-15', 'YYYY-MM-DD'),
    'Satisfactorio',
    'Buen desempeño durante el último trimestre.'
);

-- Insert into RRHH_Vacaciones
INSERT INTO RRHH_Vacaciones (
    vacacionesID,
    empleadoID,
    fechaInicioVacaciones,
    fechaFinalVacaciones,
    estadoVacaciones
)
VALUES (
    'V001',
    'E001',
    TO_DATE('2023-07-01', 'YYYY-MM-DD'),
    TO_DATE('2023-07-15', 'YYYY-MM-DD'),
    'Aprobadas'
);

INSERT INTO RRHH_Ausencias (
    ausenciasID,
    empleadoID,
    fechaInicioAusencia,
    fechaFinalAusencia,
    tipoAusencia
)
VALUES (
    'A002',
    'E001',
    TO_DATE('2023-10-10', 'YYYY-MM-DD'),
    TO_DATE('2023-10-12', 'YYYY-MM-DD'),
    'Enfermedad'
);

-- Insert into RRHH_Capacitaciones
INSERT INTO RRHH_Capacitaciones (
    capacitacionID,
    empleadoID,
    nombreCapacitacion,
    fechaInicioCapacitacion,
    fechaFinalCapacitacion,
    descripcionCapacitacion
)
VALUES (
    'C002',
    'E001',
    'Técnicas de Comunicación Efectiva',
    TO_DATE('2023-11-01', 'YYYY-MM-DD'),
    TO_DATE('2023-11-03', 'YYYY-MM-DD'),
    'Capacitación para mejorar las habilidades de comunicación en el entorno laboral.'
);

INSERT INTO RRHH_HistorialLaboral (
    historialID,
    empleadoID,
    fechaInicioTrabajo,
    fechaFinalTrabajo,
    comentariosTrabajo
)
VALUES (
    'H002',
    'E001',
    TO_DATE('2021-03-15', 'YYYY-MM-DD'),
    TO_DATE('2023-06-30', 'YYYY-MM-DD'),
    'Ingreso a la empresa como Analista Financiero.'
);

-- Insert into RRHH_Ingresos
INSERT INTO RRHH_Ingresos (codIngreso, descripcionIngreso)
VALUES ('I002', 'Bonificación');

-- Insert into RRHH_Deducciones
INSERT INTO RRHH_Deducciones (codDeduccion, descripcionDeduccion)
VALUES ('D002', 'Contribución al Plan de Pensiones');

INSERT INTO RRHH_Planilla (
    planillaID,
    año,
    mes,
    empleadoID
)
VALUES (
    'P002',
    TO_DATE('2023', 'YYYY'),
    TO_DATE('12', 'MM'),
    'E001'
);

-- Insert into RRHH_PlanillaIngresos
INSERT INTO RRHH_PlanillaIngresos (
    planillaIngresosID,
    empleadoID,
    codIngreso,
    monto
)
VALUES (
    'P002',
    'E001',
    'I002',
    '60000'
);

-- Insert into RRHH_PlanillaDeducciones
INSERT INTO RRHH_PlanillaDeducciones (
    planillaDeduccionesID,
    empleadoID,
    codDeduccion,
    monto
)
VALUES (
    'P002',
    'E001',
    'D002',
    '2500'
);