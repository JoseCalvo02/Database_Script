-- Tabla de Categorías
CREATE TABLE Categorias (
    categoriaID INT PRIMARY KEY,
    nombre VARCHAR(255)
);

-- Tabla de Proveedores
CREATE TABLE Proveedores (
    proveedorID INT PRIMARY KEY,
    nombre VARCHAR(255),
    direccion VARCHAR(255),
    telefono VARCHAR(15)
);

-- Tabla de Marcas
CREATE TABLE Marcas (
    marcaID INT PRIMARY KEY,
    nombre VARCHAR(255)
);

-- Tabla de Garantías
CREATE TABLE Garantias (
    garantiaID INT PRIMARY KEY,
    descripcion VARCHAR(255)
);

-- Tabla de Productos
CREATE TABLE Productos (
    productoID INT PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion VARCHAR(255),
    categoriaID INT,
    proveedorID INT,
    marcaID INT,
    garantiaID INT,
    FOREIGN KEY (categoriaID) REFERENCES Categorias(categoriaID),
    FOREIGN KEY (proveedorID) REFERENCES Proveedores(proveedorID),
    FOREIGN KEY (marcaID) REFERENCES Marcas(marcaID),
    FOREIGN KEY (garantiaID) REFERENCES Garantias(garantiaID)
);

-- Tabla de Almacenes
CREATE TABLE Almacenes (
    almacenID INT PRIMARY KEY,
    nombre VARCHAR(255),
    direccion VARCHAR(255),
    capacidad INT
);

-- Tabla de Ubicaciones
CREATE TABLE Ubicaciones (
    ubicacionID INT PRIMARY KEY,
    nombre VARCHAR(255),
    almacenID INT,
    FOREIGN KEY (almacenID) REFERENCES Almacenes(almacenID)
);

-- Tabla de Stock
CREATE TABLE Stock (
    productoID INT PRIMARY KEY,
    cantidad INT,
    FOREIGN KEY (productoID) REFERENCES Productos(productoID)
);

-- Tabla de Precios
CREATE TABLE Precios (
    precioID INT PRIMARY KEY,
    productoID INT,
    precio DECIMAL(10, 2),
    fechaInicio DATE,
    fechaFin DATE,
    FOREIGN KEY (productoID) REFERENCES Productos(productoID)
);

-- Tabla de Historial de Movimientos de Inventario
CREATE TABLE HistorialMovimientos (
    movimientoID INT PRIMARY KEY,
    productoID INT,
    tipoMovimiento VARCHAR(50), -- Puede ser "Entrada" o "Salida"
    cantidad INT,
    fechaMovimiento DATE,
    FOREIGN KEY (productoID) REFERENCES Productos(productoID)
);

-- Tabla de Alertas de Stock
CREATE TABLE AlertasStock (
    alertaID INT PRIMARY KEY,
    productoID INT,
    cantidadMinima INT,
    FOREIGN KEY (productoID) REFERENCES Productos(productoID)
);