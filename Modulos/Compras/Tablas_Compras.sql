
-- TABLA CATEGORIAS
CREATE TABLE COM_Categoria(
    codigoCategoria VARCHAR2(25) NOT NULL,
    nombreCategoria VARCHAR2(200) NOT NULL,
    descripcionCategoria VARCHAR2(250) NOT NULL,
    CONSTRAINT Pk_COM_Categoria PRIMARY KEY(codigoCategoria)
 );

--TABLA UNIDAD DE MEDIDAS
 CREATE TABLE COM_UnidadDeMedida (
    codigoUnidad VARCHAR2(25) NOT NULL,
    nombreUnidad VARCHAR2(50) NOT NULL,
    abreviatura VARCHAR2(20),
    descripcion VARCHAR2(200),
    CONSTRAINT Pk_COM_UnidadDeMedida PRIMARY KEY(codigoUnidad)
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

-- TABLA PRODUCTOS
CREATE TABLE COM_Producto(
    codigoProducto      VARCHAR2(25),  
    nombreProducto      VARCHAR2(200) NOT NULL,
    descripcionProducto VARCHAR2(250) NOT NULL,
    precioProducto      NUMBER(12,2) NOT NULL, 
    codigoUnidad        VARCHAR2(25) NOT NULL, 
    codigoCategoria     VARCHAR2(25),
    CONSTRAINT Pk_COM_Producto PRIMARY KEY(codigoProducto)
 );
ALTER TABLE COM_Producto ADD (
  CONSTRAINT Fk_COM_Categoria
  FOREIGN KEY (codigoCategoria) 
  REFERENCES COM_Categoria(codigoCategoria));

ALTER TABLE COM_Producto ADD (
  CONSTRAINT Fk_COM_UnidadDeMedida
  FOREIGN KEY (codigoUnidad) 
  REFERENCES COM_UnidadDeMedida(codigoUnidad));
  
-- TABLA ORDENES DE COMPRA
CREATE TABLE COM_Orden_Compra(
    codigoCompra      VARCHAR2(25),  
    fechaCompra       DATE NOT NULL,
    estadoCompra       VARCHAR2(25),
    codigoProveedor     VARCHAR2(25),    
    CONSTRAINT Pk_COM_Orden_Compra PRIMARY KEY(codigoCompra)
 );

 ALTER TABLE COM_Orden_Compra ADD (
  CONSTRAINT Fk_COM_Orden_Compra
  FOREIGN KEY (codigoProveedor) 
  REFERENCES COM_Proveedor(codigoProveedor));

 -- TABLA VALIDAR QUE EN LA TABLA DE COM_Orden_Compra SOLO ACEPTE ESOS DATOS P: PENDIENTE, PR: PROCESADA, ENTREGADA: E
 ALTER TABLE COM_Orden_Compra ADD (
  CONSTRAINT Ck_COM_Orden_Compra_ind_docu 
  CHECK(estadoCompra IN ('P','PR','E'))
 );

-- TABLA DETALLE COMPRA
CREATE TABLE COM_Detalle_Compra(
    codigoArticulo      VARCHAR2(25),  
    codigoCompra       VARCHAR2(25),
    codigoProducto     VARCHAR2(25),
    cantidadProducto   NUMBER(10),
    precioUnitario     NUMBER(10, 2),
    impuestoVentas     NUMBER(17, 2), 
     CONSTRAINT Pk_COM_Detalle_Compra PRIMARY KEY(codigoArticulo, codigoCompra, codigoProducto)
 );

  ALTER TABLE COM_Detalle_Compra ADD (
  CONSTRAINT Fk_COM_Detalle_Compra_codigo_compra
  FOREIGN KEY (codigoCompra) 
  REFERENCES COM_Orden_Compra (codigoCompra));

  ALTER TABLE COM_Detalle_Compra ADD (
  CONSTRAINT Fk_COM_Detalle_Compra_codigo_producto
  FOREIGN KEY (codigoProducto) 
  REFERENCES COM_Producto (codigoProducto));


--TABLA HISTORIAL COMPRAS

CREATE TABLE COM_Historial_Compra (
    idCompra VARCHAR2(25),
    fechaCompra DATE NOT NULL,
    codigoProveedor VARCHAR2(200) NOT NULL,
    codigoProducto  VARCHAR2(25) NOT NULL,  
    cantidadCompra  DECIMAL(10, 2),
    PrecioTotal DECIMAL(10, 2),
    fechaCreacion DATE DEFAULT SYSDATE,
    usuario_crea VARCHAR2(60) DEFAULT USER,
    ANO NUMBER(4),
    MES NUMBER(2),
    CONSTRAINT Pk_HistorialCompra PRIMARY KEY(idCompra, codigoProveedor, codigoProducto)
);

  ALTER TABLE COM_Historial_Compra ADD (
  CONSTRAINT Fk_COM_HistorialCompra_codigo_proveedor
  FOREIGN KEY (codigoProveedor) 
  REFERENCES COM_Proveedor(codigoProveedor));

  ALTER TABLE COM_Historial_Compra ADD ( 
  CONSTRAINT Fk_COM_HistorialCompra_codigo_producto
  FOREIGN KEY (codigoProducto) 
  REFERENCES COM_Producto (codigoProducto));


--TABLA NOTIFICACIONES enviar notificaciones sobre cambios en las órdenes de compra, fechas de entrega estimadas, o cualquier evento relevante.

CREATE TABLE COM_Notificacion_Compra (
    codigoNotificacion VARCHAR2(25),
    codigoCompra      VARCHAR2(25), 
    fechaEnvio DATE NOT NULL,
    destinatarioCompra VARCHAR2(200) NOT NULL,  
    mensajeCompra VARCHAR2(300),
    CONSTRAINT Pk_COM_Notificacion_Compra  PRIMARY KEY(codigoNotificacion)
);
  ALTER TABLE CCOM_Notificacion_Compra ADD ( 
  CONSTRAINT Fk_COM_Notificacion_Compra_codigo_compra
  FOREIGN KEY (codigoCompra) 
  REFERENCES COM_Orden_Compra (codigoCompra));

--TABLA TIPO DE MONEDA
CREATE TABLE COM_Tipo_Moneda (
    codigoMoneda VARCHAR2(25),
    nombreMoneda VARCHAR2(200) NOT NULL,
    tasaCambio NUMBER(12,2) NOT NULL,   
    CONSTRAINT Pk_COM_Tipo_Moneda PRIMARY KEY(codigoMoneda)
);

-- TABLA 
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
  CHECK(tipoDescuento IN ('s','n'))
 );

-- TABLA COM_Seguimiento_Envio
CREATE TABLE COM_Seguimiento_Envio (
    codigoEnvio  VARCHAR2(25),
    codigoCompra VARCHAR2(25) NOT NULL,
    fechaEnvio DATE NOT NULL,
    fechaEntrega DATE NOT NULL,
    numeroSeguimiento VARCHAR2(50),
    CONSTRAINT Pk_COM_Seguimiento_Envio PRIMARY KEY(codigoEnvio)
);

 ALTER TABLE COM_Seguimiento_Envio ADD (
  CONSTRAINT Fk_COM_Seguimiento_Envio
  FOREIGN KEY (codigoCompra) 
  REFERENCES COM_Orden_Compra(codigoCompra));


