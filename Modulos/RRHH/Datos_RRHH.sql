-- Inserts para la tabla de Departamentos
INSERT INTO RRHH_Departamentos (departamentoID, nombreDepartamento) VALUES ('DPT01', 'Recursos Humanos');
INSERT INTO RRHH_Departamentos (departamentoID, nombreDepartamento) VALUES ('DPT02', 'Ventas');
INSERT INTO RRHH_Departamentos (departamentoID, nombreDepartamento) VALUES ('DPT03', 'Finanzas');

-- Inserts para la tabla de Puestos de Trabajo
INSERT INTO RRHH_Puestos (puestoID, nombrePuesto) VALUES ('PST01', 'Gerente de Recursos Humanos');
INSERT INTO RRHH_Puestos (puestoID, nombrePuesto) VALUES ('PST02', 'Ejecutivo de Ventas');
INSERT INTO RRHH_Puestos (puestoID, nombrePuesto) VALUES ('PST03', 'Contador');

-- Inserts para la tabla de Empleados
INSERT INTO RRHH_Empleados (empleadoID, nombreEmpleado, apellidoEmpleado, fechaNacimiento, direccion, telefono, email, departamentoID, puestoID, fechaIngreso)
VALUES ('EMP01', 'Juan', 'Perez', '15/05/1980', 'Calle 123', '123-456-7890', 'juan.perez@example.com', 'DPT01', 'PST01', '20/10/2005');
INSERT INTO RRHH_Empleados (empleadoID, nombreEmpleado, apellidoEmpleado, fechaNacimiento, direccion, telefono, email, departamentoID, puestoID, fechaIngreso)
VALUES ('EMP02', 'Maria', 'Gomez', '22/08/1985', 'Avenida 456', '234-567-8901', 'maria.gomez@example.com', 'DPT02', 'PST02', '12/03/2008');
INSERT INTO RRHH_Empleados (empleadoID, nombreEmpleado, apellidoEmpleado, fechaNacimiento, direccion, telefono, email, departamentoID, puestoID, fechaIngreso)
VALUES ('EMP03', 'Carlos', 'Lopez', '10/02/1990', 'Calle Principal', '345-678-9012', 'carlos.lopez@example.com', 'DPT03', 'PST03', '05/06/2010');

-- Inserts para la tabla de Contratos
INSERT INTO RRHH_Contratos (contratoID, empleadoID, tipoContrato, fechaInicioContrato, fechaFinContrato, descripcionContrato) VALUES ('CNT01', 'EMP01', 'Indefinido', '20/10/2005', NULL, 'Contrato indefinido a tiempo completo');
INSERT INTO RRHH_Contratos (contratoID, empleadoID, tipoContrato, fechaInicioContrato, fechaFinContrato, descripcionContrato) VALUES ('CNT02', 'EMP02', 'Temporal', '12/03/2008', '12/03/2010', 'Contrato temporal por 2 años');
INSERT INTO RRHH_Contratos (contratoID, empleadoID, tipoContrato, fechaInicioContrato, fechaFinContrato, descripcionContrato) VALUES ('CNT03', 'EMP03', 'Indefinido', '05/06/2010', NULL, 'Contrato indefinido a tiempo completo');

-- Inserts para la tabla de Salarios
INSERT INTO RRHH_Salarios (salarioID, empleadoID, montoSalario, fechaInicioSalario, fechaFinSalario, descripcionSalario) VALUES ('SAL01', 'EMP01', '50000', '20/10/2005', NULL, 'Salario base mensual');
INSERT INTO RRHH_Salarios (salarioID, empleadoID, montoSalario, fechaInicioSalario, fechaFinSalario, descripcionSalario) VALUES ('SAL02', 'EMP02', '45000', '12/03/2008', '12/03/2010', 'Salario temporal reducido');
INSERT INTO RRHH_Salarios (salarioID, empleadoID, montoSalario, fechaInicioSalario, fechaFinSalario, descripcionSalario) VALUES ('SAL03', 'EMP03', '55000', '05/06/2010', NULL, 'Salario base mensual');

-- Inserts para la tabla de Beneficios
INSERT INTO RRHH_Beneficios (beneficiosID, empleadoID, tipoBeneficio, descripcionBeneficio, fechaInicioBeneficio, fechaFinBeneficio) VALUES ('BEN01', 'EMP01', 'Seguro de salud', 'Cobertura médica completa', '15/01/2006', '14/01/2022');
INSERT INTO RRHH_Beneficios (beneficiosID, empleadoID, tipoBeneficio, descripcionBeneficio, fechaInicioBeneficio, fechaFinBeneficio) VALUES ('BEN02', 'EMP02', 'Bono anual', 'Bono adicional basado en el desempeño', '01/04/2009', '31/03/2011');
INSERT INTO RRHH_Beneficios (beneficiosID, empleadoID, tipoBeneficio, descripcionBeneficio, fechaInicioBeneficio, fechaFinBeneficio) VALUES ('BEN03', 'EMP03', 'Vacaciones pagadas', '30 dias de vacaciones pagadas', '01/07/2010', '30/06/2021');

-- Inserts para la tabla de Evaluaciones
INSERT INTO RRHH_Evaluaciones (evaluacionID, empleadoID, fechaEvaluacion, resultadoEvaluacion, comentarios) VALUES ('EVL01', 'EMP01', '10/05/2007', 'Excelente', 'Desempeño sobresaliente durante el año pasado');
INSERT INTO RRHH_Evaluaciones (evaluacionID, empleadoID, fechaEvaluacion, resultadoEvaluacion, comentarios) VALUES ('EVL02', 'EMP02', '20/06/2010', 'Bueno', 'Cumplimiento satisfactorio de objetivos');
INSERT INTO RRHH_Evaluaciones (evaluacionID, empleadoID, fechaEvaluacion, resultadoEvaluacion, comentarios) VALUES ('EVL03', 'EMP03', '05/08/2013', 'Satisfactorio', 'Contribución positiva al equipo');

-- Inserts para la tabla de Vacaciones
INSERT INTO RRHH_Vacaciones (vacacionesID, empleadoID, fechaInicioVacaciones, fechaFinalVacaciones, estadoVacaciones) VALUES ('VAC01', 'EMP01', '15/07/2022', '30/07/2022', 'Aprobadas');
INSERT INTO RRHH_Vacaciones (vacacionesID, empleadoID, fechaInicioVacaciones, fechaFinalVacaciones, estadoVacaciones) VALUES ('VAC02', 'EMP02', '01/09/2022', '15/09/2022', 'Aprobadas');
INSERT INTO RRHH_Vacaciones (vacacionesID, empleadoID, fechaInicioVacaciones, fechaFinalVacaciones, estadoVacaciones) VALUES ('VAC03', 'EMP03', '10/11/2022', '20/11/2022', 'Aprobadas');

-- Inserts para la tabla de Ausencias
INSERT INTO RRHH_Ausencias (ausenciasID, empleadoID, fechaInicioAusencia, fechaFinalAusencia, tipoAusencia) VALUES ('AUS01', 'EMP01', '05/03/2021', '10/03/2021', 'Enfermedad');
INSERT INTO RRHH_Ausencias (ausenciasID, empleadoID, fechaInicioAusencia, fechaFinalAusencia, tipoAusencia) VALUES ('AUS02', 'EMP02', '20/08/2021', '25/08/2021', 'Asuntos personales');
INSERT INTO RRHH_Ausencias (ausenciasID, empleadoID, fechaInicioAusencia, fechaFinalAusencia, tipoAusencia) VALUES ('AUS03', 'EMP03', '12/12/2021', '14/12/2021', 'Vacaciones no programadas');

-- Inserts para la tabla de Capacitaciones
INSERT INTO RRHH_Capacitaciones (capacitacionID, empleadoID, nombreCapacitacion, fechaInicioCapacitacion, fechaFinalCapacitacion, descripcionCapacitacion) VALUES ('CAP01', 'EMP01', 'Gestión Efectiva del Tiempo', '05/03/2019', '07/03/2019', 'Taller para mejorar la productividad y la organización personal');
INSERT INTO RRHH_Capacitaciones (capacitacionID, empleadoID, nombreCapacitacion, fechaInicioCapacitacion, fechaFinalCapacitacion, descripcionCapacitacion) VALUES ('CAP02', 'EMP02', 'Técnicas de Ventas Avanzadas', '10/09/2020', '12/09/2020', 'Curso para mejorar las habilidades de ventas y negociación');
INSERT INTO RRHH_Capacitaciones (capacitacionID, empleadoID, nombreCapacitacion, fechaInicioCapacitacion, fechaFinalCapacitacion, descripcionCapacitacion) VALUES ('CAP03', 'EMP03', 'Liderazgo Transformacional', '20/05/2021', '22/05/2021', 'Seminario sobre técnicas de liderazgo efectivas');

-- Inserts para la tabla de Historial Laboral del empleado
INSERT INTO RRHH_HistorialLaboral (historialID, empleadoID, fechaInicioTrabajo, fechaFinalTrabajo, comentariosTrabajo) VALUES ('HST01', 'EMP01', '20/10/2005', NULL, 'Ingreso a la empresa como Gerente de Recursos Humanos');
INSERT INTO RRHH_HistorialLaboral (historialID, empleadoID, fechaInicioTrabajo, fechaFinalTrabajo, comentariosTrabajo) VALUES ('HST02', 'EMP02', '12/03/2008', '15/03/2011', 'Trabajo como Ejecutivo de Ventas con contrato temporal');
INSERT INTO RRHH_HistorialLaboral (historialID, empleadoID, fechaInicioTrabajo, fechaFinalTrabajo, comentariosTrabajo) VALUES ('HST03', 'EMP03', '05/06/2010', NULL, 'Contratado como Contador a tiempo completo');