
-- TABLA CATEGORIAS
CREATE TABLE COM_Categoria(
    categoriaID VARCHAR2(4) NOT NULL,
    nombreCategoria VARCHAR2(200) NOT NULL,
    descripcionCategoria VARCHAR2(250) NOT NULL,
    CONSTRAINT Pk_COM_Categoria PRIMARY KEY(categoriaID)
 );

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

-- TABLA Factura_Compra_Encabezado
CREATE TABLE COM_Factura_Compra_Encabezado(
    facturaCompraID     VARCHAR2(4),
    ordenCompraID     VARCHAR2(4),
    proveedorID   VARCHAR2(4),
    fechaFacturaCompra  DATE NOT NULL,
    CONSTRAINT Pk_COM_Factura_Compra_Encabezado PRIMARY KEY(facturaCompraID)
 );

ALTER TABLE COM_Factura_Compra_Encabezado ADD (
CONSTRAINT Fk_COM_Factura_Compra_Encabezado_compraID
FOREIGN KEY (ordenCompraID)
REFERENCES COM_Orden_Compra(ordenCompraID));

 ALTER TABLE COM_Factura_Compra_Encabezado ADD (
CONSTRAINT Fk_COM_Factura_Compra_Encabezado_proveedorID
FOREIGN KEY (proveedorID)
REFERENCES COM_Proveedor(proveedorID));

-- TABLA DETALLE DE FACTURA
 CREATE TABLE COM_Detalle_Factura (
    facturaID               VARCHAR2(4),
    productoID              VARCHAR2(4), --AGREGAR ESTE PARA RELACIONAR CON LA TABLA DE PRODUCTOS DEL MODULO DE INVENTARIO
    cantidadProducto        NUMBER(12,2)  NOT NULL,
    precioUnitario          DECIMAL(10, 2) NOT NULL,
    impuestoVentas          DECIMAL(10, 2) NOT NULL,
    CONSTRAINT Pk_COM_Detalle_Factura PRIMARY KEY(facturaID, productoID) --LLAVE COMPUESTA DE PRODUCTOID
 );

-- TABLA ORDENES DE COMPRA
CREATE TABLE COM_Orden_Compra(
    ordenCompraID      VARCHAR2(4),
    tipoMonedaID      VARCHAR2(25),
    fechaCompra       DATE NOT NULL,
    estadoCompra       VARCHAR2(50),
    proveedorID     VARCHAR2(4),   --RELACIONAR CON EL TIPO DE MONEDA
    CONSTRAINT Pk_COM_Orden_Compra PRIMARY KEY(ordenCompraID, tipoMonedaID )
 );

ALTER TABLE COM_Orden_Compra ADD ( -- CORREGIR (HACE REFERENCIA CON PROVEEDOR PERO NO HAY CAMPO PARA PROVEEDOR)
CONSTRAINT Fk_COM_Orden_Compra_proveedorID
FOREIGN KEY (proveedorID)
REFERENCES COM_Proveedor(proveedorID));

ALTER TABLE COM_Orden_Compra ADD (
CONSTRAINT Fk_COM_Orden_Compra_tipoMonedaID
FOREIGN KEY (tipoMonedaID)
REFERENCES COM_Tipo_Moneda(tipoMonedaID));

 -- TABLA VALIDAR QUE EN LA TABLA DE COM_Orden_Compra SOLO ACEPTE ESOS DATOS P: PENDIENTE, PR: PROCESADA, ENTREGADA: E
 ALTER TABLE COM_Orden_Compra ADD (
  CONSTRAINT Ck_COM_Orden_Compra_ind_docu
  CHECK(estadoCompra IN ('P','PR','E'))
 );
----

-- TABLA DETALLE COMPRA
CREATE TABLE COM_Detalle_Compra(
    ordenCompraID       VARCHAR2(4),  -- relacionar con descuento
    descuentoID    VARCHAR2(4),
    cantidadProducto   INT,
    precioUnitario     DECIMAL(10, 2),
    impuestoVentas     DECIMAL(10, 2),
    CONSTRAINT Pk_COM_Detalle_Compra PRIMARY KEY(ordenCompraID, descuentoID)
 );

ALTER TABLE COM_Detalle_Compra ADD (
CONSTRAINT Fk_COM_Detalle_Compra_compraID
FOREIGN KEY (ordenCompraID)
REFERENCES COM_Orden_Compra (ordenCompraID));

ALTER TABLE COM_Detalle_Compra ADD (
CONSTRAINT Fk_COM_Detalle_Compra_productoID
FOREIGN KEY (productoID)
REFERENCES COM_Orden_Compra (productoID));

ALTER TABLE COM_Detalle_Compra ADD (
CONSTRAINT Fk_COM_Detalle_Compra_descuentoID
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
CONSTRAINT Fk_COM_HistorialCompra_proveedorID
FOREIGN KEY (proveedorID)
REFERENCES COM_Proveedor(proveedorID));

ALTER TABLE COM_Historial_Compra ADD (
CONSTRAINT Fk_COM_HistorialCompra_productoID
FOREIGN KEY (productoID)
REFERENCES COM_Productos(productoID));

--TABLA HISTORIAL PAGOS
CREATE TABLE COM_Historial_Pago (
    historialPagoID VARCHAR2(4),
    fechaPago DATE NOT NULL,
    proveedorID VARCHAR2(4) NOT NULL,
    montoPago  DECIMAL(10, 2),
    metodoPago VARCHAR2(50),
    CONSTRAINT Pk_COM_Historial_Pago PRIMARY KEY(historialPagoID, proveedorID)
);

 -- TABLA VALIDAR QUE EN LA TABLA DE COM_Historial_Pago SOLO ACEPTE ESOS DATOS T: TARJETA, EF: EFECTIVO
 ALTER TABLE COM_Historial_Pago ADD (
  CONSTRAINT Ck_COM_Historial_Pago_ind_docu
  CHECK(metodoPago IN ('T','EF'))
 );

--TABLA NOTIFICACIONES enviar notificaciones sobre cambios en las órdenes de compra, fechas de entrega estimadas, o cualquier evento relevante.
CREATE TABLE COM_Notificacion_Compra (
    notificacionID VARCHAR2(4),
    fechaEnvio DATE NOT NULL,
    destinatarioCompra VARCHAR2(200) NOT NULL,
    mensajeCompra VARCHAR2(300),
    CONSTRAINT Pk_COM_Notificacion_Compra  PRIMARY KEY(notificacionID)
);

--TABLA TIPO DE MONEDA
CREATE TABLE COM_Tipo_Moneda (
    tipoMonedaID VARCHAR2(4),
    nombreMoneda VARCHAR2(200) NOT NULL,
    tasaCambio VARCHAR2(25) NOT NULL,
    CONSTRAINT Pk_COM_Tipo_Moneda PRIMARY KEY(tipoMonedaID)
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
  CONSTRAINT Ck_COM_COM_Descuento_tipoDescuento
  CHECK(tipoDescuento IN ('Si','No'))
);

-- TABLA COM_Seguimiento_Envio
CREATE TABLE COM_Seguimiento_Envio (
    seguimientoID  VARCHAR2(4),
    ordenCompraID VARCHAR2(4) NOT NULL,
    fechaEnvio DATE NOT NULL,
    fechaEntrega DATE NOT NULL,
    numeroSeguimiento VARCHAR2(50),
    CONSTRAINT Pk_COM_Seguimiento_Envio PRIMARY KEY(seguimientoID)
);

ALTER TABLE COM_Seguimiento_Envio ADD (
CONSTRAINT Fk_COM_Seguimiento_Envio_ordenCompraID
FOREIGN KEY (ordenCompraID)
REFERENCES COM_Orden_Compra(ordenCompraID));
