----Inicio Modulo de RRHH----

----Tabla Departamentos----
create table RRHH_Departamentos
(
    departamentoID varchar2(5),
    nombreDepartamento varchar2(50)
);

alter table RRHH_Departamentos add constraint pk_departamentoID primary key(departamentoID);

----Tabla Puestos de Trabajo----
create table RRHH_Puestos
(
    puestoID varchar2(5),
    nombrePuesto varchar2(50)
);

alter table RRHH_Puestos add constraint pk_puestoID primary key(puestoID);

----Tabla de Empleados----
create table RRHH_Empleados
(
    empleadoID varchar2(5),
    nombreEmpleado varchar2(50),
    apellidoEmpleado varchar2(50),
    fechaNacimiento date,
    direccion varchar2(100), 
    estadoEmpleado VARCHAR2(2) CHECK (estadoEmpleado IN ('Activo', 'Inactivo')),
    telefono varchar2(20),
    email varchar2(20),
    departamentoID varchar2(5),
    puestoID varchar2(5),
    fechaIngreso date,
    fechaEgreso date
);

ALTER TABLE RRHH_Empleados ADD constraint pk_empleados_empleadoID primary key(empleadoID);
ALTER TABLE RRHH_Empleados ADD (CONSTRAINT FK_empleado_departamentoID FOREIGN KEY (departamentoID) REFERENCES RRHH_Departamentos (departamentoID));
ALTER TABLE RRHH_Empleados ADD (CONSTRAINT FK_empleado_puestoID FOREIGN KEY (puestoID) REFERENCES RRHH_Puestos (puestoID));

----Tabla de Contratos----
create table RRHH_Contratos
(
    contratoID varchar2(5),
    empleadoID varchar2(5),
    tipoContrato varchar2(50),
    fechaInicioContrato date,
    fechaFinContrato date,
    descripcionContrato varchar2(150)
);

ALTER TABLE RRHH_Contratos ADD constraint pk_contratoID primary key(contratoID);
ALTER TABLE RRHH_Contratos ADD (CONSTRAINT FK_empleadoID2 FOREIGN KEY (empleadoID) REFERENCES RRHH_Empleados (empleadoID));

----Tabla de Salarios----
create table RRHH_Salarios
(
    salarioID varchar2(5),
    empleadoID varchar2(5),
    montoSalario varchar2(15),
    fechaInicioSalario date,
    fechaFinSalario date,
    descripcionSalario varchar2(150)
);

ALTER TABLE RRHH_Salarios ADD constraint pk_salarioID primary key(salarioID);
ALTER TABLE RRHH_Salarios ADD (CONSTRAINT FK_empleadoID3 FOREIGN KEY (empleadoID) REFERENCES RRHH_Empleados (empleadoID));

----Tabla de Beneficios----
create table RRHH_Beneficios
(
    beneficiosID varchar2(5),
    empleadoID varchar2(5),
    tipoBeneficio varchar2(50),
    descripcionBeneficio varchar2(100),
    fechaInicioBeneficio date,
    fechaFinBeneficio date
);

alter table RRHH_Beneficios add constraint pk_beneficiosID primary key(beneficiosID);
ALTER TABLE RRHh_Beneficios ADD (CONSTRAINT FK_empleadoID4 FOREIGN KEY (empleadoID) REFERENCES RRHH_Empleados (empleadoID));

----Tabla de Evaluaciones----
create table RRHH_Evaluaciones
(
    evaluacionID varchar2(5),
    empleadoID varchar2(5),
    fechaEvaluacion date,
    resultadoEvaluacion varchar2(20),
    comentarios varchar2(150)
);

alter table RRHH_Evaluaciones add constraint pk_evaluacionesID primary key(evaluacionID);
ALTER TABLE RRHH_Evaluaciones ADD (CONSTRAINT FK_empleadoID5 FOREIGN KEY (empleadoID) REFERENCES RRHH_Empleados (empleadoID));

----Tabla de Vacaciones----
create table RRHH_Vacaciones
(
    vacacionesID varchar2(5),
    empleadoID varchar2(5),
    fechaInicioVacaciones date,
    fechaFinalVacaciones date,
    estadoVacaciones varchar2(10)
);

alter table RRHH_Vacaciones add constraint pk_vacacionesID primary key(vacacionesID);
ALTER TABLE RRHH_Vacaciones ADD (CONSTRAINT FK_empleadoID6 FOREIGN KEY (empleadoID) REFERENCES RRHH_Empleados (empleadoID));

----Tabla de Ausencias----
create table RRHH_Ausencias
(
    ausenciasID varchar2(5),
    empleadoID varchar2(5),
    fechaInicioAusencia date,
    fechaFinalAusencia date,
    tipoAusencia varchar2(50)
);

alter table RRHH_Ausencias add constraint pk_ausenciasID primary key(ausenciasID);
ALTER TABLE RRHH_Ausencias ADD (CONSTRAINT FK_empleadoID7 FOREIGN KEY (empleadoID) REFERENCES RRHH_Empleados (empleadoID));

----Tabla de Capacitaciones----
create table RRHH_Capacitaciones
(
    capacitacionID varchar2(5),
    empleadoID varchar2(5),
    nombreCapacitacion varchar2(50),
    fechaInicioCapacitacion date,
    fechaFinalCapacitacion date,
    descripcionCapacitacion varchar2(200)
);

alter table RRHH_Capacitaciones add constraint pk_capacitacionesID primary key(capacitacionID);
ALTER TABLE RRHH_Capacitaciones ADD (CONSTRAINT FK_empleadoID8 FOREIGN KEY (empleadoID) REFERENCES RRHH_Empleados (empleadoID));

----Tabla de Historial Laboral del empleado----
create table RRHH_HistorialLaboral
(
    historialID varchar2(5),
    empleadoID varchar2(5),
    fechaInicioTrabajo date,
    fechaFinalTrabajo date,
    comentariosTrabajo varchar2(100)
);

ALTER TABLE RRHH_HistorialLaboral ADD (CONSTRAINT FK_empleadoID9 FOREIGN KEY (empleadoID) REFERENCES RRHH_Empleados (empleadoID));
