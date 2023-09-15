-- Tabla de Categorías
CREATE TABLE Categorias (
    CategoriaID INT PRIMARY KEY,
    Nombre VARCHAR(255)
);

-- Tabla de Proveedores
CREATE TABLE Proveedores (
    ProveedorID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Direccion VARCHAR(255),
    Telefono VARCHAR(15)
);

-- Tabla de Marcas
CREATE TABLE Marcas (
    MarcaID INT PRIMARY KEY,
    Nombre VARCHAR(255)
);

-- Tabla de Garantías
CREATE TABLE Garantias (
    GarantiaID INT PRIMARY KEY,
    Descripcion TEXT
);

-- Tabla de Productos
CREATE TABLE Productos (
    ProductoID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Descripcion TEXT,
    CategoriaID INT,
    ProveedorID INT,
    MarcaID INT,
    GarantiaID INT,
    FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID),
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID),
    FOREIGN KEY (MarcaID) REFERENCES Marcas(MarcaID),
    FOREIGN KEY (GarantiaID) REFERENCES Garantias(GarantiaID)
);

-- Tabla de Almacenes
CREATE TABLE Almacenes (
    AlmacenID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Direccion VARCHAR(255),
    Capacidad INT
);

-- Tabla de Ubicaciones
CREATE TABLE Ubicaciones (
    UbicacionID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    AlmacenID INT,
    FOREIGN KEY (AlmacenID) REFERENCES Almacenes(AlmacenID)
);

-- Tabla de Stock
CREATE TABLE Stock (
    ProductoID INT PRIMARY KEY,
    Cantidad INT,
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- Tabla de Precios
CREATE TABLE Precios (
    PrecioID INT PRIMARY KEY,
    ProductoID INT,
    Precio DECIMAL(10, 2),
    FechaInicio DATE,
    FechaFin DATE,
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- Tabla de Historial de Movimientos de Inventario
CREATE TABLE HistorialMovimientos (
    MovimientoID INT PRIMARY KEY,
    ProductoID INT,
    TipoMovimiento VARCHAR(50), -- Puede ser "Entrada" o "Salida"
    Cantidad INT,
    FechaMovimiento DATE,
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- Tabla de Alertas de Stock
CREATE TABLE AlertasStock (
    AlertaID INT PRIMARY KEY,
    ProductoID INT,
    CantidadMinima INT,
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);