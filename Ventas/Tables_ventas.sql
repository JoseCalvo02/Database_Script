------------------INICIO DEL MODULO VENTAS------------------

-- Tabla de Clientes
CREATE TABLE Clientes (
    ClienteID VARCHAR2(30)PRIMARY KEY,
    NombreCliente VARCHAR2(55),
    PrimerApellidoCliente VARCHAR2(55),
    SegundoApellidoCliente VARCHAR2(55),
    NumeroTelefono VARCHAR2(20),
    EmailCliente VARCHAR2(30)
);

-- Tabla de Pedidos
CREATE TABLE Pedidos (
    PedidoID VARCHAR2(30) PRIMARY KEY,
    FechaPedido DATE,
    ClienteID VARCHAR2(30),
    CONSTRAINT ClienteID
    FOREIGN KEY (ClienteID)
    REFERENCES Clientes(ClienteID)
    ON DELETE CASCADE
);

-- Tabla Intermedia de Pedidos y productos
CREATE TABLE Pedidos_productos (
    PedidoID VARCHAR2(30),
    ProductoID INT,
    DescripcionPedido VARCHAR2(100),
    Cantidad INT,
    CONSTRAINT PedidoID
    FOREIGN KEY (PedidoID)
    REFERENCES Pedidos (PedidoID)
    ON DELETE CASCADE,
    CONSTRAINT ProductoID
    FOREIGN KEY (ProductoID)
    REFERENCES Productos (ProductoID)
    ON DELETE CASCADE,
    PRIMARY KEY(PedidoID,ProductoID)
);

-- Tabla de productos vendidos(pienso que esta misma se podría llamar Pedidos_vendidos), 
--ya que un pedido gestiona varios productos, no solamente uno!, pero eso luego lo podemos hablar
CREATE TABLE Productos_vendidos (
    PedidoID VARCHAR2(30),
    ProductoID INT,
    VentaFecha DATE,
    PrecioVenta DECIMAL(10, 2),
    CONSTRAINT PK_ProductosVendidos PRIMARY KEY (PedidoID, ProductoID),
    CONSTRAINT FK_PedidoProducto
        FOREIGN KEY (PedidoID, ProductoID)
        REFERENCES Pedidos_productos(PedidoID, ProductoID)
        ON DELETE CASCADE
);


-- Tabla Encabezado_Factura
CREATE TABLE Encabezado_factura (
      NumeroEncabezado VARCHAR2(30) PRIMARY KEY,
      FechaEncabezado DATE,
      EmpleadoID VARCHAR2(5),
      CONSTRAINT FK_EmpID
      FOREIGN KEY (EmpleadoID)
      REFERENCES empleados(empleadoID)
      ON DELETE CASCADE,
      UbicacionID INT,
      CONSTRAINT  FK_UbicacionID
      FOREIGN KEY (UbicacionID)
      REFERENCES Ubicaciones(UbicacionID)
      ON DELETE CASCADE,
      ClienteID VARCHAR2(30),
      CONSTRAINT   FK_ClienteID 
      FOREIGN KEY (ClienteID)
      REFERENCES Clientes(ClienteID)
      ON DELETE CASCADE
);

-- Tabla Detalle_factura
CREATE TABLE Detalle_factura (
     NumeroEncabezado VARCHAR2(30),
     ProductoID INT,
     CONSTRAINT  NumeroEncabezado
     FOREIGN KEY (NumeroEncabezado)
     REFERENCES Encabezado_factura(NumeroEncabezado)
     ON DELETE CASCADE,
     CONSTRAINT FK_ProductoID
     FOREIGN KEY (ProductoID)
     REFERENCES Productos(ProductoID)
     ON DELETE CASCADE,
     Precio NUMBER(10,2),
     Cantidad NUMBER(10),
     SubTotal NUMBER(10,2),
     Descuento NUMBER(10,2),
     IVADetalleFactura NUMBER(10,2),
     TotalMasIva NUMBER(10,2),
     AlmacenID INT,
     CONSTRAINT PK_DetalleFactura PRIMARY KEY (NumeroEncabezado,  ProductoID),
     CONSTRAINT AlmacenID
     FOREIGN KEY (AlmacenID)
     REFERENCES Almacenes(AlmacenID)
     ON DELETE CASCADE
);

-- Tabla Descuentos
CREATE TABLE Descuentos (
    DescuentoID NUMBER PRIMARY KEY,
    Nombre VARCHAR2(50) NOT NULL,
    Descripcion VARCHAR2(255),
    Valor NUMBER(10, 2),
    FechaInicio DATE,
    FechaFin DATE,
    Activo VARCHAR2(2) CHECK (Activo IN ('si', 'no'))
);

-- Tabla Historial Ventas
CREATE TABLE Historial_Ventas (
    HistorialVentasID NUMBER PRIMARY KEY,
    Fecha DATE,
    NumeroEncabezado VARCHAR2(30),
    ProductoID INT,
    CONSTRAINT FK_DetalleFactura
        FOREIGN KEY (NumeroEncabezado, ProductoID)
        REFERENCES Detalle_factura(NumeroEncabezado, ProductoID)
);

-- Tabla Metodo de pagos
CREATE TABLE Metodo_pago (
    MetodoPagoID NUMBER PRIMARY KEY,
    Nombre VARCHAR2(30),
    Activo VARCHAR2(2) CHECK (Activo IN ('si', 'no'))
);

-- Tabla Factura Metodo de pago
CREATE TABLE Factura_metodo_pago(
     NumeroEncabezado VARCHAR2(30),
     MetodoPagoID NUMBER,
     CONSTRAINT  FK_NumEncabezadoID
     FOREIGN KEY (NumeroEncabezado)
     REFERENCES Encabezado_factura(NumeroEncabezado)
     ON DELETE CASCADE,
     CONSTRAINT FK_MetodoPagoID
     FOREIGN KEY (MetodoPagoID)
     REFERENCES Metodo_pago(MetodoPagoID)
     ON DELETE CASCADE,
     Monto NUMBER(10,2),
     CONSTRAINT PK_FactuFormPago PRIMARY KEY (NumeroEncabezado, MetodoPagoID)
);

-- Tabla Envios
CREATE TABLE Envios (
    IDEnvio INT PRIMARY KEY,
    FechaEnvio DATE,
    Peso DECIMAL(10, 2),
    CostoEnvio DECIMAL(10, 2),
    UbicacionID INT, 
    CONSTRAINT  UbicacionID 
    FOREIGN KEY (UbicacionID)
    REFERENCES Ubicaciones(UbicacionID)
    ON DELETE CASCADE
);

-- Tabla Promociones
CREATE TABLE Promociones (
    IDPromocion INT PRIMARY KEY,
    NombrePromocion VARCHAR(255),
    Descripcion VARCHAR(500),
    FechaInicio DATE,
    FechaFin DATE,
    Descuento DECIMAL(5, 2),
    ProductoID INT,
    CONSTRAINT FK_Producto
    FOREIGN KEY (ProductoID)
    REFERENCES Productos (ProductoID)
    ON DELETE CASCADE
);

-- Tabla Devoluciones
CREATE TABLE Devoluciones (
    DevolucionID INT PRIMARY KEY,
    ProductoID INT,
    ClienteID VARCHAR2(30),
    CONSTRAINT FK_IDproducto
    FOREIGN KEY (ProductoID)
    REFERENCES Productos (ProductoID)
    ON DELETE CASCADE,
    CONSTRAINT FK_IDcliente
    FOREIGN KEY (ClienteID)
    REFERENCES Clientes(ClienteID)
    ON DELETE CASCADE,
    FechaDevolucion DATE,
    CantidadDevuelta NUMBER(10,2),
    Descripcion VARCHAR2(250)
);

-- Tabla Calificaciones Clientes
CREATE TABLE Calificaciones_Clientes(
    CalificacionClienteID INT PRIMARY KEY,
    ClienteID VARCHAR2(30),
    CONSTRAINT  ClienteID_FK
    FOREIGN KEY (ClienteID)
    REFERENCES Clientes(ClienteID)
    ON DELETE CASCADE,
    Descripcion VARCHAR(250),
    FechaCalificacion DATE,
    Calificacion DECIMAL(5, 2)
);


commit;

------------------FINAL DEL MODULO VENTAS------------------
