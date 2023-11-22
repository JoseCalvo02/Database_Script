
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

-- Tabla Envios_detalle
CREATE TABLE VEN_Envios_detalle (
     IDEnvio VARCHAR2(4),
     IDEncabezadoFactura VARCHAR2(30),
     CONSTRAINT FK_enviosID FOREIGN KEY (IDEnvio) REFERENCES VEN_Envios(IDEnvio) ON DELETE CASCADE,
     CONSTRAINT FK_EncabezadoFactura_envios FOREIGN KEY (IDEncabezadoFactura) REFERENCES VEN_Encabezado_factura(numeroEncabezado) ON DELETE CASCADE,
     PRIMARY KEY (IDEnvio, IDEncabezadoFactura)
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

commit;

--***************** FIN DEL MODULO VENTAS *****************--
