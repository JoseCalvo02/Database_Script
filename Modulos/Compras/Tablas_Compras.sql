
-- TABLA CATEGORIAS
CREATE TABLE COM_Categoria(
    codigoCategoria VARCHAR2(25) NOT NULL,
    nombreCategoria VARCHAR2(200) NOT NULL,
    descripcionCategoria VARCHAR2(250) NOT NULL,
    constraint pk_COM_Categorias PRIMARY KEY(codigoCategoria)
 );

-- TABLA PROVEDOR
CREATE TABLE COM_Proveedor(
    codigoProveedor     VARCHAR2(25),  
    nombreProveedor     VARCHAR2(200) NOT NULL,
    direccionProveedor  VARCHAR2(250) NOT NULL,
    telefonoProveedor   VARCHAR2(200) NOT NULL,
    correoProveedor     VARCHAR2(25),
    paisProveedor       VARCHAR2(250) NOT NULL,
    fechaRegistro       DATE NOT NULL,
    CONSTRAINT Pk_COM_Proveedor PRIMARY KEY(codigoProveedor)
 );

-- TABLA Factura_Compra_Encabezado
CREATE TABLE COM_Factura_Compra_Encabezado(
    codigoFactura     VARCHAR2(25), 
    codigoCompra      VARCHAR2(25),
    codigoProveedor   VARCHAR2(25),
    fechaFacturaCompra  DATE NOT NULL, 
    CONSTRAINT Pk_COM_Factura_Compra_Encabezado PRIMARY KEY(codigoFactura)
 );

 ALTER TABLE COM_Factura_Compra_Encabezado ADD (
  CONSTRAINT Fk_COM_Factura_Compra_Encabezado_codigo_compra
  FOREIGN KEY (codigoCompra) 
  REFERENCES COM_Orden_Compra(codigoCompra));

 ALTER TABLE COM_Factura_Compra_Encabezado ADD (
  CONSTRAINT Fk_COM_Factura_Compra_Encabezado_codigo_proveedor
  FOREIGN KEY (codigoProveedor) 
  REFERENCES COM_Proveedor(codigoProveedor));


-- TABLA DETALLE DE FACTURA
  
 CREATE TABLE COM_Detalle_Factura (
    codigoFactura           VARCHAR2(25), 
    codigoProducto           VARCHAR2(25), --AGREGAR ESTE PARA REALCIONAR CON LA TABLA DE PRODUCTOS DEL MODULO DE INVENTARIO
    cantidadProducto        NUMBER(12,2)  NOT NULL,
    precioUnitario          DECIMAL(10, 2) NOT NULL,
    impuestoVentas          DECIMAL(10, 2) NOT NULL,
    CONSTRAINT Pk_COM_Detalle_Factura PRIMARY KEY(codigoFactura, codigoProducto) --LLAVE COMPUESTA DE CODIGOPRODUCTO
 );


-- TABLA ORDENES DE COMPRA
CREATE TABLE COM_Orden_Compra(
    codigoCompra      VARCHAR2(25),
    codigoMoneda      VARCHAR2(25),
    fechaCompra       DATE NOT NULL,
    estadoCompra       VARCHAR2(50),
    codigoProveedor     VARCHAR2(25),   --RELACIONAR CON EL TIPO DE MONEDA 
    CONSTRAINT Pk_COM_Orden_Compra PRIMARY KEY(codigoCompra, codigoMoneda )
 );

 ALTER TABLE COM_Orden_Compra ADD (
  CONSTRAINT Fk_COM_Orden_Compra
  FOREIGN KEY (codigoProveedor) 
  REFERENCES COM_Proveedor(codigoProveedor));

   ALTER TABLE COM_Orden_Compra ADD (
  CONSTRAINT Fk_COM_Orden_Compra_Tipo_Moneda
  FOREIGN KEY (codigoMoneda) 
  REFERENCES COM_Tipo_Moneda(codigoMoneda));

 -- TABLA VALIDAR QUE EN LA TABLA DE COM_Orden_Compra SOLO ACEPTE ESOS DATOS P: PENDIENTE, PR: PROCESADA, ENTREGADA: E
 ALTER TABLE COM_Orden_Compra ADD (
  CONSTRAINT Ck_COM_Orden_Compra_ind_docu 
  CHECK(estadoCompra IN ('P','PR','E'))
 );
----

-- TABLA DETALLE COMPRA
CREATE TABLE COM_Detalle_Compra(
    codigoCompra       VARCHAR2(25),  -- relacionar con descuento
    codigoDescuento    VARCHAR2(25),
    cantidadProducto   INT,
    precioUnitario     DECIMAL(10, 2),
    impuestoVentas     DECIMAL(10, 2),
    CONSTRAINT Pk_COM_Detalle_Compra PRIMARY KEY(codigoCompra, codigoDescuento)
 );

  ALTER TABLE COM_Detalle_Compra ADD (
  CONSTRAINT Fk_COM_Detalle_Compra_codigo_compra
  FOREIGN KEY (codigoCompra) 
  REFERENCES COM_Orden_Compra (codigoCompra));

  ALTER TABLE COM_Detalle_Compra ADD (
  CONSTRAINT Fk_COM_Detalle_Compra_codigo_producto
  FOREIGN KEY (codigoProducto) 
  REFERENCES COM_Orden_Compra (codigoProducto));

  ALTER TABLE COM_Detalle_Compra ADD (
  CONSTRAINT Fk_COM_Detalle_Compra_codigo_descuento
  FOREIGN KEY (codigoDescuento) 
  REFERENCES COM_Descuento (codigoDescuento));


--TABLA HISTORIAL COMPRAS

CREATE TABLE COM_Historial_Compra (
    idCompra VARCHAR2(25),
    fechaCompra DATE NOT NULL,
    codigoProveedor VARCHAR2(200) NOT NULL,
    codigoProducto  VARCHAR2(25) NOT NULL,  
    cantidadCompra  DECIMAL(10, 2),
    PrecioTotal DECIMAL(10, 2),
    CONSTRAINT Pk_HistorialCompras PRIMARY KEY(codigoProveedor, codigoProducto)
);

  ALTER TABLE COM_Historial_Compra ADD (
  CONSTRAINT Fk_COM_HistorialCompra_codigo_proveedor
  FOREIGN KEY (codigoProveedor) 
  REFERENCES COM_Proveedor(codigoProveedor));

  ALTER TABLE COM_Historial_Compra ADD (
  CONSTRAINT Fk_COM_HistorialCompra_codigo_producto
  FOREIGN KEY (codigoProducto) 
  REFERENCES COM_Productos(codigoProducto));


--TABLA HISTORIAL PAGOS

CREATE TABLE COM_Historial_Pago (
    codigoPago VARCHAR2(25),
    fechaPago DATE NOT NULL,
    codigoProveedor VARCHAR2(200) NOT NULL,  
    montoPago  DECIMAL(10, 2),
    metodoPago VARCHAR2(50),
    CONSTRAINT Pk_COM_Historial_Pago PRIMARY KEY(codigoPago, codigoProveedor)
);

 -- TABLA VALIDAR QUE EN LA TABLA DE COM_Historial_Pago SOLO ACEPTE ESOS DATOS T: TARJETA, EF: EFECTIVO
 ALTER TABLE COM_Historial_Pago ADD (
  CONSTRAINT Ck_COM_Historial_Pago_ind_docu 
  CHECK(metodoPago IN ('T','EF'))
 );

--TABLA NOTIFICACIONES enviar notificaciones sobre cambios en las órdenes de compra, fechas de entrega estimadas, o cualquier evento relevante.

CREATE TABLE COM_Notificacion_Compra (
    codigoNotificaion VARCHAR2(25),
    fechaEnvio DATE NOT NULL,
    destinatarioCompra VARCHAR2(200) NOT NULL,  
    mensajeCompra VARCHAR2(300),
    CONSTRAINT Pk_COM_Notificacion_Compra  PRIMARY KEY(codigoNotificaion)
);

--TABLA TIPO DE MONEDA

CREATE TABLE COM_Tipo_Moneda (
    codigoMoneda VARCHAR2(25),
    nombreMoneda VARCHAR2(200) NOT NULL,
    tasaCambio VARCHAR2(25) NOT NULL,  
    CONSTRAINT Pk_COM_Tipo_Moneda PRIMARY KEY(codigoNotificaion) 
);

-- TABLA COM_Descuento
CREATE TABLE COM_Descuento (
    codigoDescuento VARCHAR2(25),
    nombreDescuento VARCHAR2(60) NOT NULL,
    descripcionDescuento VARCHAR2(255),
    precioDescuento DECIMAL(10, 2),
    fechaDescuento DATE NOT NULL,
    tipoDescuento VARCHAR2(10),
    CONSTRAINT Pk_COM_Descuento PRIMARY KEY(codigoDescuento)
);
 -- TABLA VALIDAR QUE EN LA TABLA DE COM_Descuento ESTE ACTIVO O DESCATIVADO 
 ALTER TABLE COM_Descuento ADD (
  CONSTRAINT Ck_COM_COM_Descuento_tipoDescuento 
  CHECK(tipoDescuento IN ('Si','No'))
 );

-- TABLA COM_Seguimiento_Envio
CREATE TABLE COM_Seguimiento_Envio (
    codigoEnvio  VARCHAR2(25),
    codigoCompra VARCHAR2(25) NOT NULL,
    fechaEnvio DATE NOT NULL,
    fechaEntrega DATE NOT NULL,
    numeroSeguimiento VARCHAR2(50),
    CONSTRAINT Pk_COM_Descuento PRIMARY KEY(codigoEnvio)
);

 ALTER TABLE COM_Seguimiento_Envio ADD (
  CONSTRAINT Fk_COM_Seguimiento_Envio
  FOREIGN KEY (codigoCompra) 
  REFERENCES COM_Orden_Compra(codigoCompra));
