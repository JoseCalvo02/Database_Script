--***************** INICIO DEL MODULO VENTAS *****************--

-- Tabla de Clientes
CREATE TABLE VEN_Clientes (
    clienteID VARCHAR2(30) PRIMARY KEY,
    nombreCliente VARCHAR2(55),
    primerApellidoCliente VARCHAR2(55),
    segundoApellidoCliente VARCHAR2(55),
    numeroTelefono VARCHAR2(20),
    emailCliente VARCHAR2(30)
);

-- Tabla de Pedidos
CREATE TABLE VEN_Pedidos (
    pedidoID VARCHAR2(30) PRIMARY KEY,
    fechaPedido DATE,
    clienteID VARCHAR2(30),
    CONSTRAINT FK_clienteID FOREIGN KEY (clienteID) REFERENCES VEN_Clientes(clienteID) ON DELETE CASCADE
);

-- Tabla Intermedia de Pedidos y productos
CREATE TABLE VEN_Pedidos_productos (
    pedidoID VARCHAR2(30),
    productoID INT,
    descripcionPedido VARCHAR2(100),
    cantidad INT,
    PRIMARY KEY(pedidoID,productoID),
    CONSTRAINT FK_pedidoID FOREIGN KEY (pedidoID) REFERENCES VEN_Pedidos(pedidoID) ON DELETE CASCADE,
    CONSTRAINT FK_productoID FOREIGN KEY (productoID) REFERENCES INV_productos(productoID) ON DELETE CASCADE --CORREGIDO
);

-- Tabla de productos vendidos(pienso que esta misma se podría llamar Pedidos_vendidos),
--ya que un pedido gestiona varios productos, no solamente uno!, pero eso luego lo podemos hablar
CREATE TABLE VEN_Productos_vendidos (
    pedidoID VARCHAR2(30),
    productoID INT,
    ventaFecha DATE,
    precioVenta DECIMAL(10, 2),
    CONSTRAINT PK_ProductosVendidos PRIMARY KEY (pedidoID, productoID),
    CONSTRAINT FK_pedidoProducto FOREIGN KEY (pedidoID, productoID) REFERENCES VEN_Pedidos_productos(pedidoID, productoID) ON DELETE CASCADE
);

-- Tabla Encabezado_Factura
CREATE TABLE VEN_Encabezado_factura (
    numeroEncabezado VARCHAR2(30) PRIMARY KEY,
    fechaEncabezado DATE,
    empleadoID VARCHAR2(5),
    ubicacionID INT,
    clienteID VARCHAR2(30),
    CONSTRAINT FK_empleadoID_encabezado FOREIGN KEY (empleadoID) REFERENCES RRHH_Empleados(empleadoID) ON DELETE CASCADE, --CORREGIDO
    CONSTRAINT FK_ubicacionID_encabezado FOREIGN KEY (ubicacionID) REFERENCES INV_Ubicaciones(ubicacionID) ON DELETE CASCADE, --CORREGIDO
    CONSTRAINT FK_clienteID_encabezado FOREIGN KEY (clienteID) REFERENCES VEN_Clientes(clienteID) ON DELETE CASCADE 
);

-- Tabla Detalle_factura
CREATE TABLE VEN_Detalle_factura (
    numeroEncabezado VARCHAR2(30),
    productoID INT,
    precio NUMBER(10,2),
    cantidad NUMBER(10),
    subTotal NUMBER(10,2),
    descuento NUMBER(10,2),
    IVADetalleFactura NUMBER(10,2),
    totalMasIva NUMBER(10,2),
    almacenID INT,
    CONSTRAINT PK_DetalleFactura PRIMARY KEY (numeroEncabezado,  productoID),
    CONSTRAINT FK_numeroEncabezado_detalle FOREIGN KEY (numeroEncabezado) REFERENCES VEN_Encabezado_factura(numeroEncabezado) ON DELETE CASCADE,
    CONSTRAINT FK_ProductoID_detalle FOREIGN KEY (productoID) REFERENCES INV_Productos(productoID) ON DELETE CASCADE, --CORREGIDO
    CONSTRAINT FK_almacenID_detalle FOREIGN KEY (almacenID) REFERENCES INV_Almacenes(almacenID) ON DELETE CASCADE --CORREGIDO
);

-- Tabla Descuentos
CREATE TABLE VEN_Descuentos (
    descuentoID NUMBER PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    descripcion VARCHAR2(255),
    valor NUMBER(10, 2),
    fechaInicio DATE,
    fechaFin DATE,
    activo VARCHAR2(2) CHECK (activo IN ('si', 'no'))
);

-- Tabla Historial Ventas
CREATE TABLE VEN_Historial_Ventas (
    historialVentasID NUMBER PRIMARY KEY,
    fecha DATE,
    numeroEncabezado VARCHAR2(30),
    productoID INT,
    CONSTRAINT FK_numeroEncabezado_historial FOREIGN KEY (numeroEncabezado, productoID) REFERENCES VEN_Detalle_factura(numeroEncabezado, productoID) ON DELETE CASCADE
);

-- Tabla Metodo de pagos
CREATE TABLE VEN_Metodo_pago (
    metodoPagoID NUMBER PRIMARY KEY,
    nombre VARCHAR2(30),
    activo VARCHAR2(2) CHECK (activo IN ('si', 'no'))
);

-- Tabla Factura Metodo de pago
CREATE TABLE VEN_Factura_metodo_pago(
    numeroEncabezado VARCHAR2(30),
    metodoPagoID NUMBER,
    monto NUMBER(10,2),
    CONSTRAINT PK_FactuFormPago PRIMARY KEY (numeroEncabezado, metodoPagoID),
    CONSTRAINT FK_NumEncabezadoID_factura FOREIGN KEY (numeroEncabezado) REFERENCES VEN_Encabezado_factura(numeroEncabezado) ON DELETE CASCADE,
    CONSTRAINT FK_MetodoPagoID_factura FOREIGN KEY (metodoPagoID) REFERENCES VEN_Metodo_pago(metodoPagoID) ON DELETE CASCADE
);

-- Tabla Envios
CREATE TABLE VEN_Envios (
    IDEnvio INT PRIMARY KEY,
    fechaEnvio DATE,
    peso DECIMAL(10, 2),
    costoEnvio DECIMAL(10, 2),
    ubicacionID INT,
    CONSTRAINT FK_ubicacionID_envios FOREIGN KEY (ubicacionID) REFERENCES INV_Ubicaciones(ubicacionID) ON DELETE CASCADE --CORREGIDO
);

-- Tabla Promociones
CREATE TABLE VEN_Promociones (
    IDPromocion INT PRIMARY KEY,
    nombrePromocion VARCHAR(255),
    descripcion VARCHAR(500),
    fechaInicio DATE,
    fechaFin DATE,
    descuento DECIMAL(5, 2),
    productoID INT,
    CONSTRAINT FK_Producto_promociones FOREIGN KEY (productoID) REFERENCES INV_Productos (productoID) ON DELETE CASCADE --CORREGIDO
);

-- Tabla Devoluciones
CREATE TABLE VEN_Devoluciones (
    devolucionID INT PRIMARY KEY,
    productoID INT,
    clienteID VARCHAR2(30),
    fechaDevolucion DATE,
    cantidadDevuelta NUMBER(10,2),
    descripcion VARCHAR2(250),
    CONSTRAINT FK_IDproducto_devoluciones FOREIGN KEY (productoID) REFERENCES INV_Productos (productoID) ON DELETE CASCADE, --CORREGIDO
    CONSTRAINT FK_IDcliente_devoluciones FOREIGN KEY (clienteID) REFERENCES VEN_Clientes(clienteID) ON DELETE CASCADE
);

-- Table Calificaciones Clientes
CREATE TABLE VEN_Calificaciones_Clientes(
    calificacionClienteID INT PRIMARY KEY,
    clienteID VARCHAR2(30),
    descripcion VARCHAR(250),
    fechaCalificacion DATE,
    calificacion DECIMAL(5, 2),
    CONSTRAINT FK_ClienteID_calificaciones FOREIGN KEY (clienteID) REFERENCES VEN_Clientes(clienteID) ON DELETE CASCADE
);

commit;

--***************** FIN DEL MODULO VENTAS *****************--

