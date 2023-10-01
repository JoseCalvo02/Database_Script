create table Departamentos
(departamentoID varchar2(5),
nombreDepartamento varchar2(50)
);

alter table Departamentos
add constraint pk_departamentoID primary key(departamentoID);

create table Puestos
(puestoID varchar2(5),
nombrePuesto varchar2(50)
);

alter table Puestos
add constraint pk_puestoID primary key(puestoID);

create table Empleados
(empleadoID varchar2(5),
nombreEmpleado varchar2(50),
apellidoEmpleado varchar2(50),
fechaNacimiento date,
direccion varchar2(100),
telefono varchar2(20),
email varchar2(20),
departamentoID varchar2(5),
puestoID varchar2(5),
fechaIngreso date)
);

  alter table Empleados
  add constraint pk_empleadoID primary key(empleadoID)

  ALTER TABLE Empleados ADD (
  CONSTRAINT FK_empleadoID
  FOREIGN KEY (departamentoID) 
  REFERENCES Departamentos (departamentoID));

  ALTER TABLE Empleados ADD (
  CONSTRAINT FK_puestoID
  FOREIGN KEY (puestoID 
  REFERENCES Puestos (puestoID));

create table Contratos
(contratoID varchar2(5),
empleadoID varchar2(5),
tipoContrato varchar2(5),
fechaInicioContrato date,
fechaFinContrato date,
descripcionContrato varchar2(150)
);

alter table Contratos
add constraint pk_contratoID primary key(contratoID)

  ALTER TABLE Contratos ADD (
  CONSTRAINT FK_empleadoID2
  FOREIGN KEY (empleadoID) 
  REFERENCES Empleados (empleadoID));

create table Salarios
(salarioID varchar2(5),
empleadoID varchar2(5),
montoSalario varchar2(15),
fechaInicioSalario date,
fechaFinSalario date,
descripcionSalario varchar2(150)
);

alter table Salarios
add constraint pk_salarioID primary key(salarioID)

  ALTER TABLE Salarios ADD (
  CONSTRAINT FK_empleadoID3
  FOREIGN KEY (empleadoID) 
  REFERENCES Empleados (empleadoID));

create table Beneficios
(beneficiosID varchar2(5),
empleadoID varchar2(5),
tipoBeneficio varchar2(15),
descripcionBeneficio varchar2(100),
fechaInicioBeneficio date
fechaFinBeneficio date
);

alter table Beneficios
add constraint pk_beneficiosID primary key(beneficiosID);

  ALTER TABLE Beneficios ADD (
  CONSTRAINT FK_empleadoID4
  FOREIGN KEY (empleadoID) 
  REFERENCES Empleados (empleadoID));

create table Evaluaciones
(evaluacionID varchar2(5),
empleadoID varchar2(5)
fechaEvaluacion date,
resultadoEvaluacion varchar2(20),
comentarios varchar2(150)
);

alter table Evaluaciones
add constraint pk_evaluacionesID primary key(evaluacionID)

  ALTER TABLE Evaluaciones ADD (
  CONSTRAINT FK_empleadoID5
  FOREIGN KEY (empleadoID) 
  REFERENCES Empleados (empleadoID));

create table Vacaciones
(vacacionesID varchar2(5),
empleadoID varchar2(5),
fechaInicioVacaciones date,
fechaFinalVacaciones date,
estadoVacaciones varchar2(10)
);

alter table Vacaciones
add constraint pk_vacacionesID primary key(vacacionesID);

  ALTER TABLE Vacaciones ADD (
  CONSTRAINT FK_empleadoID6
  FOREIGN KEY (empleadoID) 
  REFERENCES Empleados (empleadoID));

create table Ausencias
(ausenciasID varchar2(5),
empleadoID varchar2(5),
fechaInicioAusencia date,
fechaFinalAusencia date,
tipoAusencia varchar2(10)
);

alter table Ausencias
add constraint pk_ausenciasID primary key(ausenciasID);

  ALTER TABLE Ausencias ADD (
  CONSTRAINT FK_empleadoID7
  FOREIGN KEY (empleadoID) 
  REFERENCES Empleados (empleadoID));

create table Capacitaciones
(capacitacionID varchar2(5),
empleadoID varchar2(5),
nombreCapacitacion varchar2(50),
fechaInicioCapacitacion date,
fechaFinalCapacitacion date,
descripcionCapacitacion varchar2(200)
);

alter table Capacitaciones
add constraint pk_capacitacionesID primary key(capacitacionID);

  ALTER TABLE Capacitaciones ADD (
  CONSTRAINT FK_empleadoID8
  FOREIGN KEY (empleadoID) 
  REFERENCES Empleados (empleadoID));

create table HistorialLaboral
(historialID varchar2(5),
empleadoID varchar2(5),
fechaInicioTrabajo date,
fechaFinalTrabajo date,
comentariosTrabajo varchar2(100)
);