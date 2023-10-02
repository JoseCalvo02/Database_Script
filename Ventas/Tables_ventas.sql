------------------INICIO DEL MODULO VENTAS------------------

-- Tabla de Clientes
CREATE TABLE Clientes (
    clienteID VARCHAR2(30)PRIMARY KEY,
    nombreCliente VARCHAR2(55),
    primerApellidoCliente VARCHAR2(55),
    segundoApellidoCliente VARCHAR2(55),
    numeroTelefono VARCHAR2(20),
    emailCliente VARCHAR2(30)
);

-- Tabla de Pedidos
CREATE TABLE Pedidos (
    pedidoID VARCHAR2(30) PRIMARY KEY,
    fechaPedido DATE,
    clienteID VARCHAR2(30),
    CONSTRAINT clienteID
    FOREIGN KEY (clienteID)
    REFERENCES Clientes(clienteID)
    ON DELETE CASCADE
);

-- Tabla Intermedia de Pedidos y productos
CREATE TABLE Pedidos_productos (
    pedidoID VARCHAR2(30),
    productoID INT,
    descripcionPedido VARCHAR2(100),
    cantidad INT,
    CONSTRAINT pedidoID
    FOREIGN KEY (pedidoID)
    REFERENCES Pedidos (pedidoID)
    ON DELETE CASCADE,
    CONSTRAINT productoID
    FOREIGN KEY (productoID)
    REFERENCES productos (productoID)
    ON DELETE CASCADE,
    PRIMARY KEY(pedidoID,productoID)
);

-- Tabla de productos vendidos(pienso que esta misma se podría llamar Pedidos_vendidos), 
--ya que un pedido gestiona varios productos, no solamente uno!, pero eso luego lo podemos hablar
CREATE TABLE Productos_vendidos (
    pedidoID VARCHAR2(30),
    productoID INT,
    ventaFecha DATE,
    precioVenta DECIMAL(10, 2),
    CONSTRAINT PK_ProductosVendidos PRIMARY KEY (pedidoID, productoID),
    CONSTRAINT FK_pedidoProducto
        FOREIGN KEY (pedidoID, productoID)
        REFERENCES Pedidos_productos(pedidoID, productoID)
        ON DELETE CASCADE
);


-- Tabla Encabezado_Factura
CREATE TABLE Encabezado_factura (
      numeroEncabezado VARCHAR2(30) PRIMARY KEY,
      fechaEncabezado DATE,
      empleadoID VARCHAR2(5),
      CONSTRAINT FK_EmpID
      FOREIGN KEY (empleadoID)
      REFERENCES empleados(empleadoID)
      ON DELETE CASCADE,
      ubicacionID INT,
      CONSTRAINT  FK_UbicacionID
      FOREIGN KEY (ubicacionID)
      REFERENCES Ubicaciones(ubicacionID)
      ON DELETE CASCADE,
      clienteID VARCHAR2(30),
      CONSTRAINT FK_ClienteID 
      FOREIGN KEY (clienteID)
      REFERENCES Clientes(clienteID)
      ON DELETE CASCADE
);

-- Tabla Detalle_factura
CREATE TABLE Detalle_factura (
     numeroEncabezado VARCHAR2(30),
     productoID INT,
     CONSTRAINT numeroEncabezado
     FOREIGN KEY (numeroEncabezado)
     REFERENCES Encabezado_factura(numeroEncabezado)
     ON DELETE CASCADE,
     CONSTRAINT FK_ProductoID
     FOREIGN KEY (productoID)
     REFERENCES Productos(productoID)
     ON DELETE CASCADE,
     precio NUMBER(10,2),
     cantidad NUMBER(10),
     subTotal NUMBER(10,2),
     descuento NUMBER(10,2),
     IVADetalleFactura NUMBER(10,2),
     totalMasIva NUMBER(10,2),
     almacenID INT,
     CONSTRAINT PK_DetalleFactura PRIMARY KEY (numeroEncabezado,  productoID),
     CONSTRAINT almacenID
     FOREIGN KEY (almacenID)
     REFERENCES Almacenes(almacenID)
     ON DELETE CASCADE
);

-- Tabla Descuentos
CREATE TABLE Descuentos (
    descuentoID NUMBER PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    descripcion VARCHAR2(255),
    valor NUMBER(10, 2),
    fechaInicio DATE,
    fechaFin DATE,
    activo VARCHAR2(2) CHECK (activo IN ('si', 'no'))
);

-- Tabla Historial Ventas
CREATE TABLE Historial_Ventas (
    historialVentasID NUMBER PRIMARY KEY,
    fecha DATE,
    numeroEncabezado VARCHAR2(30),
    productoID INT,
    CONSTRAINT FK_DetalleFactura
        FOREIGN KEY (numeroEncabezado, productoID)
        REFERENCES Detalle_factura(numeroEncabezado, productoID)
);

-- Tabla Metodo de pagos
CREATE TABLE Metodo_pago (
    metodoPagoID NUMBER PRIMARY KEY,
    nombre VARCHAR2(30),
    activo VARCHAR2(2) CHECK (activo IN ('si', 'no'))
);

-- Tabla Factura Metodo de pago
CREATE TABLE Factura_metodo_pago(
     numeroEncabezado VARCHAR2(30),
     metodoPagoID NUMBER,
     CONSTRAINT  FK_NumEncabezadoID
     FOREIGN KEY (NumeroEncabezado)
     REFERENCES Encabezado_factura(numeroEncabezado)
     ON DELETE CASCADE,
     CONSTRAINT FK_MetodoPagoID
     FOREIGN KEY (metodoPagoID)
     REFERENCES Metodo_pago(metodoPagoID)
     ON DELETE CASCADE,
     monto NUMBER(10,2),
     CONSTRAINT PK_FactuFormPago PRIMARY KEY (numeroEncabezado, metodoPagoID)
);

-- Tabla Envios
CREATE TABLE Envios (
    IDEnvio INT PRIMARY KEY,
    fechaEnvio DATE,
    peso DECIMAL(10, 2),
    costoEnvio DECIMAL(10, 2),
    ubicacionID INT, 
    CONSTRAINT  ubicacionID 
    FOREIGN KEY (ubicacionID)
    REFERENCES Ubicaciones(ubicacionID)
    ON DELETE CASCADE
);

-- Tabla Promociones
CREATE TABLE Promociones (
    IDPromocion INT PRIMARY KEY,
    nombrePromocion VARCHAR(255),
    descripcion VARCHAR(500),
    fechaInicio DATE,
    fechaFin DATE,
    descuento DECIMAL(5, 2),
    productoID INT,
    CONSTRAINT FK_Producto
    FOREIGN KEY (productoID)
    REFERENCES Productos (productoID)
    ON DELETE CASCADE
);

-- Tabla Devoluciones
CREATE TABLE Devoluciones (
    devolucionID INT PRIMARY KEY,
    productoID INT,
    clienteID VARCHAR2(30),
    CONSTRAINT FK_IDproducto
    FOREIGN KEY (productoID)
    REFERENCES Productos (productoID)
    ON DELETE CASCADE,
    CONSTRAINT FK_IDcliente
    FOREIGN KEY (clienteID)
    REFERENCES Clientes(clienteID)
    ON DELETE CASCADE,
    fechaDevolucion DATE,
    cantidadDevuelta NUMBER(10,2),
    descripcion VARCHAR2(250)
);

-- Tabla Calificaciones Clientes
CREATE TABLE Calificaciones_Clientes(
    calificacionClienteID INT PRIMARY KEY,
    clienteID VARCHAR2(30),
    CONSTRAINT  ClienteID_FK
    FOREIGN KEY (clienteID)
    REFERENCES Clientes(clienteID)
    ON DELETE CASCADE,
    descripcion VARCHAR(250),
    fechaCalificacion DATE,
    calificacion DECIMAL(5, 2)
);


commit;

------------------FINAL DEL MODULO VENTAS------------------
