/************Este select es para eliminar todas las tablas(opcional)**********************/
select 'drop table', table_name, 'cascade constraints;' from user_tables;


--***************** INICIO DEL MODULO INVENTARIO *****************---
-- Tabla de Categorías
CREATE TABLE INV_Categorias (
    categoriaID VARCHAR(4) PRIMARY KEY,
    nombre VARCHAR(255)
);

-- Tabla de Marcas
CREATE TABLE INV_Marcas (
    marcaID VARCHAR(4) PRIMARY KEY,
    nombre VARCHAR(255)
);

-- Tabla de Garantías
CREATE TABLE INV_Garantias (
    garantiaID VARCHAR(4) PRIMARY KEY,
    descripcion VARCHAR(255)
);

-- Tabla de Productos
CREATE TABLE INV_Productos (
    productoID VARCHAR(4) PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion VARCHAR(255),
    costo NUMBER(10,2),
    categoriaID VARCHAR(4),
    marcaID VARCHAR(4),
    garantiaID VARCHAR(4),
    FOREIGN KEY (categoriaID) REFERENCES INV_Categorias(categoriaID),
    FOREIGN KEY (marcaID) REFERENCES INV_Marcas(marcaID),
    FOREIGN KEY (garantiaID) REFERENCES INV_Garantias(garantiaID)
);

-- Tabla de Proveedores
CREATE TABLE INV_ProductosProveedores (
    productoID VARCHAR(4),
    proveedorID VARCHAR(4),
    precio NUMBER(10,2),
    fechaInicio DATE,
    FOREIGN KEY (productoID) REFERENCES INV_Productos(productoID),
    FOREIGN KEY (proveedorID) REFERENCES COM_Proveedor(proveedorID), --Crear tabla del modulo de COMPRAS antes de ejecutarlo
    PRIMARY KEY (productoID, proveedorID)
);

CREATE TABLE INV_Devoluciones (
    devolucionID VARCHAR(4) PRIMARY KEY,
    productoID VARCHAR(4),
    cantidad INT,
    motivo VARCHAR(255),
    fechaDevolucion DATE,
    FOREIGN KEY (productoID) REFERENCES INV_Productos(productoID)
);

-- Tabla de Almacenes
CREATE TABLE INV_Almacenes (
    almacenID VARCHAR(4) PRIMARY KEY,
    nombre VARCHAR(255),
    direccion VARCHAR(255)
);

-- Tabla de Ubicaciones
CREATE TABLE INV_Ubicaciones (
    ubicacionID VARCHAR(4) PRIMARY KEY,
    nombre VARCHAR(255),
    almacenID VARCHAR(4),
    FOREIGN KEY (almacenID) REFERENCES INV_Almacenes(almacenID)
);

-- Tabla de Stock
CREATE TABLE INV_Stock (
    productoID VARCHAR(4) PRIMARY KEY,
    almacenID VARCHAR(4),
    cantidad INT,
    FOREIGN KEY (productoID) REFERENCES INV_Productos(productoID),
    FOREIGN KEY (almacenID) REFERENCES INV_Almacenes(almacenID)
);

-- Tabla de Historial de Movimientos de Inventario
CREATE TABLE INV_HistorialMovimientos (
    movimientoID VARCHAR(4) PRIMARY KEY,
    productoID VARCHAR(4),
    tipoMovimiento VARCHAR(50) CHECK (tipoMovimiento IN ('Entrada', 'Salida')), -- Restricción CHECK
    cantidad INT,
    fechaMovimiento DATE,
    FOREIGN KEY (productoID) REFERENCES INV_Productos(productoID)
);

-- Tabla de Alertas de Stock
CREATE TABLE INV_AlertasStock (
    alertaID VARCHAR(4) PRIMARY KEY,
    productoID VARCHAR(4),
    cantidadMinima INT,
    FOREIGN KEY (productoID) REFERENCES INV_Productos(productoID)
);

-- Tabla de Transferencias entre almacenes
CREATE TABLE INV_TransferenciasAlmacenes (
    transferenciaID VARCHAR(4) PRIMARY KEY,
    productoID VARCHAR(4),
    cantidad INT,
    almacenOrigenID VARCHAR(4),
    almacenDestinoID VARCHAR(4),
    fechaTransferencia DATE,
    FOREIGN KEY (productoID) REFERENCES INV_Productos(productoID),
    FOREIGN KEY (almacenOrigenID) REFERENCES INV_Almacenes(almacenID),
    FOREIGN KEY (almacenDestinoID) REFERENCES INV_Almacenes(almacenID)
);

-- Tabla de bitacora para el modulo de inventarios
CREATE TABLE INV_Bitacora (
    bitacoraID NUMBER GENERATED ALWAYS AS IDENTITY,
    fechaHora TIMESTAMP,
    usuario VARCHAR(255),
    tipoMovimiento VARCHAR(50),
    entidadAfectada VARCHAR(255),
    PRIMARY KEY(bitacoraID)
);
--***************** FIN DEL MODULO INVENTARIO *****************---

--***************** INICIO DEL MODULO COMPRAS *****************---

-- TABLA PROVEDOR
CREATE TABLE COM_Proveedor(
    proveedorID     VARCHAR2(4),
    nombreProveedor     VARCHAR2(200) NOT NULL,
    direccionProveedor  VARCHAR2(250) NOT NULL,
    telefonoProveedor   VARCHAR2(200) NOT NULL,
    correoProveedor     VARCHAR2(25),
    paisProveedor       VARCHAR2(250) NOT NULL,
    fechaRegistro       DATE NOT NULL,
    CONSTRAINT Pk_COM_Proveedor PRIMARY KEY(proveedorID)
);

--TABLA TIPO DE MONEDA
CREATE TABLE COM_Tipo_Moneda (
    tipoMonedaID VARCHAR2(4),
    nombreMoneda VARCHAR2(200) NOT NULL,
    tasaCambio VARCHAR2(25) NOT NULL,
    CONSTRAINT Pk_COM_Tipo_Moneda PRIMARY KEY(tipoMonedaID)
);

-- TABLA ORDENES DE COMPRA
CREATE TABLE COM_Orden_Compra(
    ordenCompraID      VARCHAR2(4),
    tipoMonedaID      VARCHAR2(25),
    fechaCompra       DATE NOT NULL,
    estadoCompra       VARCHAR2(50),
    proveedorID     VARCHAR2(4),
    CONSTRAINT Pk_COM_Orden_Compra PRIMARY KEY(ordenCompraID, tipoMonedaID )
);

ALTER TABLE COM_Orden_Compra ADD (
CONSTRAINT Fk_COM_Orden_Com_proveedorID
FOREIGN KEY (proveedorID)
REFERENCES COM_Proveedor(proveedorID));

ALTER TABLE COM_Orden_Compra ADD (
CONSTRAINT Fk_COM_Orden_Com_tipoMonedaID
FOREIGN KEY (tipoMonedaID)
REFERENCES COM_Tipo_Moneda(tipoMonedaID));

-- TABLA VALIDAR QUE EN LA TABLA DE COM_Orden_Compra SOLO ACEPTE ESOS DATOS P: PENDIENTE, PR: PROCESADA, ENTREGADA: E
ALTER TABLE COM_Orden_Compra ADD (
CONSTRAINT Ck_COM_Orden_Compra_ind_docu
CHECK(estadoCompra IN ('P','PR','E'))
);

-- TABLA Factura_Compra_Encabezado
CREATE TABLE COM_Factura_Compra_Encabezado(
    facturaCompraID     VARCHAR2(4),
    ordenCompraID     VARCHAR2(4),
    proveedorID   VARCHAR2(4),
    tipoMonedaID      VARCHAR2(25),
    fechaFacturaCompra  DATE NOT NULL,
    CONSTRAINT Pk_COM_Factura_Com_Encabezado PRIMARY KEY(facturaCompraID)
);


ALTER TABLE COM_Factura_Compra_Encabezado ADD (
CONSTRAINT Fk_COM_Factu_Encabe_ordenComID
FOREIGN KEY (ordenCompraID, tipoMonedaID)
REFERENCES COM_Orden_Compra(ordenCompraID, tipoMonedaID));

ALTER TABLE COM_Factura_Compra_Encabezado ADD (
CONSTRAINT Fk_COM_Factu_Enca_proveedorID
FOREIGN KEY (proveedorID)
REFERENCES COM_Proveedor(proveedorID));

-- TABLA DETALLE DE FACTURA
 CREATE TABLE COM_Detalle_Factura (
    facturaID               VARCHAR2(4),
    productoID              VARCHAR2(4),
    cantidadProducto        NUMBER(12,2)  NOT NULL,
    precioUnitario          DECIMAL(10, 2) NOT NULL,
    impuestoVentas          DECIMAL(10, 2) NOT NULL,
    CONSTRAINT FK_producto_id FOREIGN KEY (productoID) REFERENCES INV_productos(productoID) ON DELETE CASCADE,
    CONSTRAINT Pk_COM_Detalle_Factura PRIMARY KEY(facturaID, productoID) --LLAVE COMPUESTA DE PRODUCTOID
);

-- TABLA COM_Descuento
CREATE TABLE COM_Descuento (
    descuentoID VARCHAR2(4),
    nombreDescuento VARCHAR2(60) NOT NULL,
    descripcionDescuento VARCHAR2(255),
    precioDescuento DECIMAL(10, 2),
    fechaDescuento DATE NOT NULL,
    tipoDescuento VARCHAR2(10),
    CONSTRAINT Pk_COM_Descuento PRIMARY KEY(descuentoID)
);

-- TABLA VALIDAR QUE EN LA TABLA DE COM_Descuento ESTE ACTIVO O DESCATIVADO
ALTER TABLE COM_Descuento ADD (
CONSTRAINT Ck_COM_Descuento_tipoDescuento
CHECK(tipoDescuento IN ('Si','No'))
);

-- TABLA DETALLE COMPRA
CREATE TABLE COM_Detalle_Compra(
    ordenCompraID      VARCHAR2(4),
    descuentoID        VARCHAR2(4),
    cantidadProducto   INT,
    tipoMonedaID      VARCHAR2(25),
    precioUnitario     DECIMAL(10, 2),
    impuestoVentas     DECIMAL(10, 2),
    CONSTRAINT Pk_COM_Detalle_Compra PRIMARY KEY(ordenCompraID, descuentoID)
);

ALTER TABLE COM_Detalle_Compra ADD (
CONSTRAINT Fk_COM_Detalle_Compra_compraID
FOREIGN KEY (ordenCompraID,tipoMonedaID)
REFERENCES COM_Orden_Compra (ordenCompraID, tipoMonedaID));

ALTER TABLE COM_Detalle_Compra ADD (
CONSTRAINT Fk_COM_Detalle_Com_descuentoID
FOREIGN KEY (descuentoID)
REFERENCES COM_Descuento (descuentoID));

--TABLA HISTORIAL COMPRAS
CREATE TABLE COM_Historial_Compra (
    idCompra VARCHAR2(4),
    fechaCompra DATE NOT NULL,
    proveedorID VARCHAR2(4) NOT NULL,
    productoID  VARCHAR2(4) NOT NULL,
    cantidadCompra  DECIMAL(10, 2),
    precioTotal DECIMAL(10, 2),
    CONSTRAINT Pk_Historial_Compra PRIMARY KEY(proveedorID, productoID)
);

ALTER TABLE COM_Historial_Compra ADD (
CONSTRAINT Fk_COM_Histor_Com_proveedorID
FOREIGN KEY (proveedorID)
REFERENCES COM_Proveedor(proveedorID));

ALTER TABLE COM_Historial_Compra ADD (
CONSTRAINT Fk_COM_Histo_com_productoID
FOREIGN KEY (productoID)
REFERENCES INV_Productos(productoID));

--TABLA HISTORIAL PAGOS
CREATE TABLE COM_Historial_Pago (
    historialPagoID VARCHAR2(4),
    fechaPago DATE NOT NULL,
    proveedorID VARCHAR2(4) NOT NULL,
    montoPago  DECIMAL(10, 2),
    metodoPago VARCHAR2(50),
    CONSTRAINT Pk_COM_Historial_Pago PRIMARY KEY(historialPagoID, proveedorID)
);

ALTER TABLE COM_Historial_Pago ADD (
CONSTRAINT Fk_COM_Histor_pago_proveedorID
FOREIGN KEY (proveedorID)
REFERENCES COM_Proveedor(proveedorID));

-- TABLA VALIDAR QUE EN LA TABLA DE COM_Historial_Pago SOLO ACEPTE ESOS DATOS T: TARJETA, EF: EFECTIVO
ALTER TABLE COM_Historial_Pago ADD (
CONSTRAINT Ck_COM_Historial_Pago_ind_docu
CHECK(metodoPago IN ('T','EF'))
);

-- TABLA COM_Seguimiento_Envio
CREATE TABLE COM_Seguimiento_Envio (
    seguimientoID  VARCHAR2(4),
    ordenCompraID VARCHAR2(4) NOT NULL,
    fechaEnvio DATE NOT NULL,
    tipoMonedaID  VARCHAR2(25),
    fechaEntrega DATE NOT NULL,
    numeroSeguimiento VARCHAR2(50),
    CONSTRAINT Pk_COM_Seguimiento_Envio PRIMARY KEY(seguimientoID)
);

ALTER TABLE COM_Seguimiento_Envio ADD (
CONSTRAINT Fk_COM_Segui_Envio_ordenComID
FOREIGN KEY (ordenCompraID,tipoMonedaID )
REFERENCES COM_Orden_Compra(ordenCompraID,tipoMonedaID ));

CREATE TABLE COM_Bitacora (
    bitacoraId NUMBER GENERATED ALWAYS AS IDENTITY,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario VARCHAR2(50) NOT NULL,
    tipoMovimiento VARCHAR2(10) NOT NULL,
    entidadAfectada VARCHAR2(100) NOT NULL,
    detalleOperacion VARCHAR2(4000),
    CONSTRAINT PK_COM_Bitacora PRIMARY KEY (bitacoraId)
);
--***************** FIN Modulo de Compras*****************---

--***************** Inicio Modulo de RRHH*****************---
----Tabla Departamentos----
create table RRHH_Departamentos
(
    departamentoID VARCHAR2(4),
    nombreDepartamento varchar2(50),
    usuarioCrea VARCHAR2(4) default user,
    fechaCrea date default sysdate
);

alter table RRHH_Departamentos add constraint pk_departamentoID primary key(departamentoID);

----Tabla Puestos de Trabajo----
create table RRHH_Puestos
(
    puestoID VARCHAR2(4),
    nombrePuesto varchar2(50),
    usuarioCrea VARCHAR2(4) default user,
    fechaCrea date default sysdate
);

alter table RRHH_Puestos add constraint pk_puestoID primary key(puestoID);

----Tabla de Empleados----
create table RRHH_Empleados
(
    empleadoID VARCHAR2(4),
    nombreEmpleado varchar2(50),
    apellidoEmpleado varchar2(50),
    fechaNacimiento date,
    direccion varchar2(100), 
    telefono varchar2(20),
    email varchar2(20),
    departamentoID varchar2(5),
    puestoID VARCHAR2(4),
    fechaIngreso date,
    fechaEgreso date,
    usuarioCrea VARCHAR2(4) default user,
    fechaCrea date default sysdate
);

ALTER TABLE RRHH_Empleados ADD constraint pk_empleados_empleadoID primary key(empleadoID);
ALTER TABLE RRHH_Empleados ADD (CONSTRAINT FK_empleado_departamentoID FOREIGN KEY (departamentoID) REFERENCES RRHH_Departamentos (departamentoID));
ALTER TABLE RRHH_Empleados ADD (CONSTRAINT FK_empleado_puestoID FOREIGN KEY (puestoID) REFERENCES RRHH_Puestos (puestoID));

----Tabla de Contratos----
create table RRHH_Contratos
(
    contratoID VARCHAR2(4),
    empleadoID VARCHAR2(4),
    tipoContrato varchar2(50),
    fechaInicioContrato date,
    fechaFinContrato date,
    descripcionContrato varchar2(150),
    usuarioCrea VARCHAR2(4) default user,
    fechaCrea date default sysdate
);

ALTER TABLE RRHH_Contratos ADD constraint pk_contratoID primary key(contratoID);
ALTER TABLE RRHH_Contratos ADD (CONSTRAINT FK_empleadoID2 FOREIGN KEY (empleadoID) REFERENCES RRHH_Empleados (empleadoID));

----Tabla de Salarios----
create table RRHH_Salarios
(
    salarioID VARCHAR2(4),
    empleadoID VARCHAR2(4),
    montoSalario varchar2(15),
    fechaInicioSalario date,
    fechaFinSalario date,
    descripcionSalario varchar2(150),
    usuarioCrea VARCHAR2(4) default user,
    fechaCrea date default sysdate
);

ALTER TABLE RRHH_Salarios ADD constraint pk_salarioID primary key(salarioID);
ALTER TABLE RRHH_Salarios ADD (CONSTRAINT FK_empleadoID3 FOREIGN KEY (empleadoID) REFERENCES RRHH_Empleados (empleadoID));

----Tabla de Beneficios----
create table RRHH_Beneficios
(
    beneficiosID VARCHAR2(4),
    empleadoID VARCHAR2(4),
    tipoBeneficio varchar2(50),
    descripcionBeneficio varchar2(100),
    fechaInicioBeneficio date,
    fechaFinBeneficio date,
    usuarioCrea VARCHAR2(4) default user,
    fechaCrea date default sysdate
);

alter table RRHH_Beneficios add constraint pk_beneficiosID primary key(beneficiosID);
ALTER TABLE RRHh_Beneficios ADD (CONSTRAINT FK_empleadoID4 FOREIGN KEY (empleadoID) REFERENCES RRHH_Empleados (empleadoID));

----Tabla de Evaluaciones----
create table RRHH_Evaluaciones
(
    evaluacionID VARCHAR2(4),
    empleadoID VARCHAR2(4),
    fechaEvaluacion date,
    resultadoEvaluacion varchar2(20),
    comentarios varchar2(150),
    usuarioCrea VARCHAR2(4) default user,
    fechaCrea date default sysdate
);

alter table RRHH_Evaluaciones add constraint pk_evaluacionesID primary key(evaluacionID);
ALTER TABLE RRHH_Evaluaciones ADD (CONSTRAINT FK_empleadoID5 FOREIGN KEY (empleadoID) REFERENCES RRHH_Empleados (empleadoID));

----Tabla de Vacaciones----
create table RRHH_Vacaciones
(
    vacacionesID VARCHAR2(4),
    empleadoID VARCHAR2(4),
    fechaInicioVacaciones date,
    fechaFinalVacaciones date,
    estadoVacaciones varchar2(10),
    usuarioCrea VARCHAR2(4) default user,
    fechaCrea date default sysdate
);

alter table RRHH_Vacaciones add constraint pk_vacacionesID primary key(vacacionesID);
ALTER TABLE RRHH_Vacaciones ADD (CONSTRAINT FK_empleadoID6 FOREIGN KEY (empleadoID) REFERENCES RRHH_Empleados (empleadoID));

----Tabla de Ausencias----
create table RRHH_Ausencias
(
    ausenciasID VARCHAR2(4),
    empleadoID VARCHAR2(4),
    fechaInicioAusencia date,
    fechaFinalAusencia date,
    tipoAusencia varchar2(50),
    usuarioCrea VARCHAR2(4) default user,
    fechaCrea date default sysdate
);

alter table RRHH_Ausencias add constraint pk_ausenciasID primary key(ausenciasID);
ALTER TABLE RRHH_Ausencias ADD (CONSTRAINT FK_empleadoID7 FOREIGN KEY (empleadoID) REFERENCES RRHH_Empleados (empleadoID));

----Tabla de Capacitaciones----
create table RRHH_Capacitaciones
(
    capacitacionID VARCHAR2(4),
    empleadoID VARCHAR2(4),
    nombreCapacitacion varchar2(50),
    fechaInicioCapacitacion date,
    fechaFinalCapacitacion date,
    descripcionCapacitacion varchar2(200),
    usuarioCrea VARCHAR2(4) default user,
    fechaCrea date default sysdate
);

alter table RRHH_Capacitaciones add constraint pk_capacitacionesID primary key(capacitacionID);
ALTER TABLE RRHH_Capacitaciones ADD (CONSTRAINT FK_empleadoID8 FOREIGN KEY (empleadoID) REFERENCES RRHH_Empleados (empleadoID));

----Tabla de Historial Laboral del empleado----
create table RRHH_HistorialLaboral
(
    historialID VARCHAR2(4),
    empleadoID VARCHAR2(4),
    fechaInicioTrabajo date,
    fechaFinalTrabajo date,
    comentariosTrabajo varchar2(100),
    usuarioCrea VARCHAR2(4) default user,
    fechaCrea date default sysdate
);

ALTER TABLE RRHH_HistorialLaboral ADD (CONSTRAINT FK_empleadoID9 FOREIGN KEY (empleadoID) REFERENCES RRHH_Empleados (empleadoID));

----Tabla de Ingresos----
create table RRHH_Ingresos
(
    codIngreso VARCHAR2(4),
    descripcionIngreso varchar2(100),
    usuarioCrea VARCHAR2(4) default user,
    fechaCrea date default sysdate
);
alter table RRHH_Ingresos add constraint pk_codIngreso primary key(codIngreso);

----Tabla de deducciones----
create table RRHH_Deducciones
(
    codDeduccion VARCHAR2(4),
    descripcionDeduccion varchar2(100),
    usuarioCrea VARCHAR2(4) default user,
    fechaCrea date default sysdate
);
alter table RRHH_Deducciones add constraint pk_codDeduccion primary key(codDeduccion);

----Tabla de Planilla----
create table RRHH_Planilla
(
    planillaID VARCHAR2(4),
    año date,
    mes date,
    empleadoID VARCHAR2(4),
    usuarioCrea VARCHAR2(4) default user,
    fechaCrea date default sysdate
);
alter table RRHH_Planilla add constraint pk_planillaID  primary key(planillaID );
ALTER TABLE RRHH_Planilla ADD (CONSTRAINT FK_empleadoID12 FOREIGN KEY (empleadoID) REFERENCES RRHH_Empleados (empleadoID));

----Tabla de PlanillaIngresos----
create table RRHH_PlanillaIngresos
(
    planillaIngresosID VARCHAR2(4),
    empleadoID VARCHAR2(4),
    codIngreso VARCHAR2(4),
    monto varchar2(30),
    usuarioCrea VARCHAR2(4) default user,
    fechaCrea date default sysdate
);
alter table RRHH_PlanillaIngresos add constraint pk_planillaIngresosID primary key( planillaIngresosID);
ALTER TABLE RRHH_PlanillaIngresos ADD (CONSTRAINT FK_empleadoID15 FOREIGN KEY (empleadoID) REFERENCES RRHH_Empleados (empleadoID));
ALTER TABLE RRHH_PlanillaIngresos ADD (CONSTRAINT FK_codIngreso FOREIGN KEY (codIngreso) REFERENCES RRHH_Ingresos (codIngreso));

----Tabla de PlanillaDeducciones----
create table RRHH_PlanillaDeducciones
(
    planillaDeduccionesID VARCHAR2(4),
    empleadoID VARCHAR2(4),
    codDeduccion VARCHAR2(4),
    monto varchar2(30),
    usuarioCrea VARCHAR2(4) default user,
    fechaCrea date default sysdate
);
alter table RRHH_PlanillaDeducciones ADD constraint pk_planillaDeduccionesID primary key( planillaDeduccionesID);
ALTER TABLE RRHH_PlanillaDeducciones ADD (CONSTRAINT FK_empleadoID11 FOREIGN KEY (empleadoID) REFERENCES RRHH_Empleados (empleadoID));
ALTER TABLE RRHH_PlanillaDeducciones ADD (CONSTRAINT FK_codDeduccion FOREIGN KEY (codDeduccion) REFERENCES RRHH_Deducciones (codDeduccion));

----Tabla de AUDITORIA----
CREATE TABLE RRHH_AuditTrail(
    auditID NUMBER GENERATED BY DEFAULT AS IDENTITY,
    event_type VARCHAR2(10),
    table_name VARCHAR2(50),
    record_id VARCHAR2(20),
    old_values CLOB, -- Se corrige esta columna que estaba mal
    new_values CLOB,
    change_date TIMESTAMP,
    changed_by VARCHAR2(50)
);
--***************** FIN DEL MODULO RRHH *****************---

--***************** INICIO DEL MODULO VENTAS *****************--
-- Tabla de Clientes
CREATE TABLE VEN_Clientes (
    clienteID VARCHAR2(4) PRIMARY KEY,
    nombreCliente VARCHAR2(55),
    primerApellidoCliente VARCHAR2(55),
    segundoApellidoCliente VARCHAR2(55),
    numeroTelefono VARCHAR2(20),
    emailCliente VARCHAR2(30)
);

-- Tabla de Pedidos
CREATE TABLE VEN_Pedidos (
    pedidoID VARCHAR2(4) PRIMARY KEY,
    fechaPedido DATE,
    clienteID VARCHAR2(4),
    CONSTRAINT FK_clienteID FOREIGN KEY (clienteID) REFERENCES VEN_Clientes(clienteID) ON DELETE CASCADE
);

-- Tabla Intermedia de Pedidos y productos
CREATE TABLE VEN_Pedidos_productos (
    pedidoID VARCHAR2(4),
    productoID VARCHAR2(4),
    cantidad INT,
    PRIMARY KEY(pedidoID,productoID),
    CONSTRAINT FK_pedidoID FOREIGN KEY (pedidoID) REFERENCES VEN_Pedidos(pedidoID) ON DELETE CASCADE,
    CONSTRAINT FK_productoID FOREIGN KEY (productoID) REFERENCES INV_productos(productoID) ON DELETE CASCADE --CORREGIDO
);

-- Tabla Vendedores
CREATE TABLE VEN_Vendedores (
  vendedor_id VARCHAR2(4) PRIMARY KEY, 
  nombre VARCHAR2(50),
  empleado_id VARCHAR2(4),
  FOREIGN KEY (empleado_id) REFERENCES RRHH_Empleados(empleadoID) ON DELETE CASCADE
);

-- Tabla Encabezado_Factura
CREATE TABLE VEN_Encabezado_factura (
    numeroEncabezado VARCHAR2(4) PRIMARY KEY,
    fechaEncabezado DATE,
    ubicacionID VARCHAR2(4),
    clienteID VARCHAR2(4),
    vendedorID VARCHAR2(4),
    pedidoID VARCHAR2(4),
    CONSTRAINT FK_vendorID_encabezado FOREIGN KEY (vendedorID) REFERENCES VEN_Vendedores(vendedor_id)ON DELETE CASCADE,
    CONSTRAINT FK_pedido_encabezado FOREIGN KEY (pedidoID) REFERENCES VEN_Pedidos(pedidoID)ON DELETE CASCADE,
    CONSTRAINT FK_ubicacionID_encabezado FOREIGN KEY (ubicacionID) REFERENCES INV_Ubicaciones(ubicacionID) ON DELETE CASCADE,
    CONSTRAINT FK_clienteID_encabezado FOREIGN KEY (clienteID) REFERENCES VEN_Clientes(clienteID) ON DELETE CASCADE 
);

-- Tabla Descuentos
CREATE TABLE VEN_Descuentos (
    descuentoID VARCHAR2(4) PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    descripcion VARCHAR2(255),
    valor NUMBER(10, 2),
    fechaInicio DATE,
    fechaFin DATE,
    activo VARCHAR2(2) CHECK (activo IN ('si', 'no'))
);

-- Tabla Promociones
CREATE TABLE VEN_Promociones (
    IDPromocion VARCHAR2(4) PRIMARY KEY,
    nombrePromocion VARCHAR(255),
    descripcion VARCHAR(500),
    fechaInicio DATE,
    fechaFin DATE,
    descuento DECIMAL(5, 2),
    productoID VARCHAR2(4),
    CONSTRAINT FK_Producto_promociones FOREIGN KEY (productoID) REFERENCES INV_Productos (productoID) ON DELETE CASCADE 
);

-- Tabla Detalle_factura
CREATE TABLE VEN_Detalle_factura (
    numeroEncabezado VARCHAR2(4),
    productoID VARCHAR2(4),
    precio NUMBER(10,2),
    cantidad NUMBER(10),
    subTotal NUMBER(10,2),
    descuento NUMBER(10,2),
    IVADetalleFactura NUMBER(10,2),
    totalMasIva NUMBER(10,2),
    almacenID VARCHAR2(4),
    descuentoID  VARCHAR2(4),
    promocionID  VARCHAR2(4),
    CONSTRAINT PK_DetalleFactura PRIMARY KEY (numeroEncabezado,  productoID),
    CONSTRAINT FK_promocionID_detalle FOREIGN KEY (promocionID)REFERENCES VEN_Promociones(IDpromocion)ON DELETE CASCADE,
    CONSTRAINT FK_descuentoID_detalle FOREIGN KEY (descuentoID)REFERENCES VEN_Descuentos(descuentoID)ON DELETE CASCADE,
    CONSTRAINT FK_numeroEncabezado_detalle FOREIGN KEY (numeroEncabezado) REFERENCES VEN_Encabezado_factura(numeroEncabezado) ON DELETE CASCADE,
    CONSTRAINT FK_ProductoID_detalle FOREIGN KEY (productoID) REFERENCES INV_Productos(productoID) ON DELETE CASCADE,
    CONSTRAINT FK_almacenID_detalle FOREIGN KEY (almacenID) REFERENCES INV_Almacenes(almacenID) ON DELETE CASCADE 
);

-- Tabla Descuentos_Productos
CREATE TABLE VEN_Descuentos_Productos (
    descuentoID VARCHAR2(4),
    productoID VARCHAR2(4),
    fecha DATE,
    CONSTRAINT FK_ProductoID_des_producto FOREIGN KEY (productoID) REFERENCES INV_Productos(productoID) ON DELETE CASCADE,
    CONSTRAINT FK_descuentoID_des_producto FOREIGN KEY (descuentoID)REFERENCES VEN_Descuentos(descuentoID)ON DELETE CASCADE,
    PRIMARY KEY(descuentoID, productoID)
);

-- Tabla Historial Ventas
CREATE TABLE VEN_Historial_Ventas (
    historialVentasID NUMBER PRIMARY KEY,
    fecha DATE,
    numeroEncabezado VARCHAR2(4),
    productoID VARCHAR2(4),
    CONSTRAINT FK_numeroEncabezado_historial FOREIGN KEY (numeroEncabezado, productoID) REFERENCES VEN_Detalle_factura(numeroEncabezado, productoID) ON DELETE CASCADE
);

-- Tabla Metodo de pagos
CREATE TABLE VEN_Metodo_pago (
    metodoPagoID VARCHAR2(4) PRIMARY KEY,
    nombre VARCHAR2(30),
    activo VARCHAR2(2) CHECK (activo IN ('si', 'no'))
);

-- Tabla Factura Metodo de pago
CREATE TABLE VEN_Factura_metodo_pago(
    numeroEncabezado VARCHAR2(4),
    metodoPagoID VARCHAR2(4),
    monto NUMBER(10,2),
    CONSTRAINT PK_FactuFormPago PRIMARY KEY (numeroEncabezado, metodoPagoID),
    CONSTRAINT FK_NumEncabezadoID_factura FOREIGN KEY (numeroEncabezado) REFERENCES VEN_Encabezado_factura(numeroEncabezado) ON DELETE CASCADE,
    CONSTRAINT FK_MetodoPagoID_factura FOREIGN KEY (metodoPagoID) REFERENCES VEN_Metodo_pago(metodoPagoID) ON DELETE CASCADE
);

-- Tabla Envios
CREATE TABLE VEN_Envios (
    IDEnvio VARCHAR2(4) PRIMARY KEY,
    fechaEnvio DATE,
    peso DECIMAL(10, 2),
    costoEnvio DECIMAL(10, 2),
    ubicacionID VARCHAR2(4),
    CONSTRAINT FK_ubicacionID_envios FOREIGN KEY (ubicacionID) REFERENCES INV_Ubicaciones(ubicacionID) ON DELETE CASCADE 
);

CREATE TABLE VEN_Envios_detalle (
     IDEnvio VARCHAR2(4),
     IDEncabezadoFactura VARCHAR2(30),
     CONSTRAINT FK_enviosID FOREIGN KEY (IDEnvio) REFERENCES VEN_Envios(IDEnvio) ON DELETE CASCADE,
     CONSTRAINT FK_EncabezadoFactura_envios FOREIGN KEY (IDEncabezadoFactura) REFERENCES VEN_Encabezado_factura(numeroEncabezado) ON DELETE CASCADE,
     PRIMARY KEY (IDEnvio, IDEncabezadoFactura)
);

-- Tabla Devoluciones
CREATE TABLE VEN_Devoluciones (
    devolucionID VARCHAR2(4) PRIMARY KEY,
    productoID VARCHAR2(4),
    clienteID VARCHAR2(4),
    fechaDevolucion DATE,
    cantidadDevuelta NUMBER(10,2),
    encabezadoID VARCHAR2(4),
    descripcion VARCHAR2(250),
    CONSTRAINT FK_encabezadoID_dev FOREIGN KEY (encabezadoID)REFERENCES VEN_Encabezado_Factura(numeroencabezado)ON DELETE CASCADE,
    CONSTRAINT FK_IDproducto_devoluciones FOREIGN KEY (productoID) REFERENCES INV_Productos (productoID) ON DELETE CASCADE, 
    CONSTRAINT FK_IDcliente_devoluciones FOREIGN KEY (clienteID) REFERENCES VEN_Clientes(clienteID) ON DELETE CASCADE
);

-- Table Calificaciones Clientes
CREATE TABLE VEN_Calificaciones_Clientes(
    calificacionClienteID VARCHAR2(4) PRIMARY KEY,
    clienteID VARCHAR2(4),
    descripcion VARCHAR(250),
    fechaCalificacion DATE,
    calificacion DECIMAL(5, 2),
    CONSTRAINT FK_ClienteID_calificaciones FOREIGN KEY (clienteID) REFERENCES VEN_Clientes(clienteID) ON DELETE CASCADE
);

-- Tabla de bitacora para el modulo de inventarios
CREATE SEQUENCE VEN_BITACORA_id_seq;

CREATE TABLE VEN_BITACORA (
    id NUMBER PRIMARY KEY,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario VARCHAR2(50) NOT NULL,
    tipo_movimiento VARCHAR2(10) NOT NULL,
    entidad VARCHAR2(100) NOT NULL
);

commit;
--***************** FIN DEL MODULO VENTAS *****************--

