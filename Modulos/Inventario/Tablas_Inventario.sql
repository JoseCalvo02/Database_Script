-- Tabla de Categorías
CREATE TABLE INV_Categorias (
    categoriaID INT PRIMARY KEY,
    nombre VARCHAR(255)
);

-- Tabla de Proveedores
CREATE TABLE INV_Proveedores (
    proveedorID INT PRIMARY KEY,
    nombre VARCHAR(255),
    direccion VARCHAR(255),
    telefono VARCHAR(15)
);

-- Tabla de Marcas
CREATE TABLE INV_Marcas (
    marcaID INT PRIMARY KEY,
    nombre VARCHAR(255)
);

-- Tabla de Garantías
CREATE TABLE INV_Garantias (
    garantiaID INT PRIMARY KEY,
    descripcion VARCHAR(255)
);

-- Tabla de Productos
CREATE TABLE INV_Productos (
    productoID INT PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion VARCHAR(255),
    categoriaID INT,
    proveedorID INT,
    marcaID INT,
    garantiaID INT,
    FOREIGN KEY (categoriaID) REFERENCES INV_Categorias(categoriaID),
    FOREIGN KEY (proveedorID) REFERENCES INV_Proveedores(proveedorID),
    FOREIGN KEY (marcaID) REFERENCES INV_Marcas(marcaID),
    FOREIGN KEY (garantiaID) REFERENCES INV_Garantias(garantiaID)
);

-- Tabla de Almacenes
CREATE TABLE INV_Almacenes (
    almacenID INT PRIMARY KEY,
    nombre VARCHAR(255),
    direccion VARCHAR(255)
);

-- Tabla de Ubicaciones
CREATE TABLE INV_Ubicaciones (
    ubicacionID INT PRIMARY KEY,
    nombre VARCHAR(255),
    almacenID INT,
    FOREIGN KEY (almacenID) REFERENCES INV_Almacenes(almacenID)
);

-- Tabla de Stock
CREATE TABLE INV_Stock (
    productoID INT PRIMARY KEY,
    almacenID INT,
    empleadoID VARCHAR2(5),
    cantidad INT,
    FOREIGN KEY (productoID) REFERENCES INV_Productos(productoID),
    FOREIGN KEY (almacenID) REFERENCES INV_Almacenes(almacenID)
);

-- Ejecutar luego de haber creado la tabla de empleados de RRHH
ALTER TABLE INV_Stock ADD CONSTRAINT FK_Stock_empleadoID FOREIGN KEY (empleadoID) REFERENCES RRHH_Empleados(empleadoID);

-- Tabla de Precios
CREATE TABLE INV_Precios (
    precioID INT PRIMARY KEY,
    productoID INT,
    precio DECIMAL(10, 2),
    fechaInicio DATE,
    fechaFin DATE,
    FOREIGN KEY (productoID) REFERENCES INV_Productos(productoID)
);

-- Tabla de Historial de Movimientos de Inventario
CREATE TABLE INV_HistorialMovimientos (
    movimientoID INT PRIMARY KEY,
    productoID INT,
    tipoMovimiento VARCHAR(50) CHECK (tipoMovimiento IN ('Entrada', 'Salida')), -- Restricción CHECK
    cantidad INT,
    fechaMovimiento DATE,
    FOREIGN KEY (productoID) REFERENCES INV_Productos(productoID)
);

-- Tabla de Alertas de Stock
CREATE TABLE INV_AlertasStock (
    alertaID INT PRIMARY KEY,
    productoID INT,
    cantidadMinima INT,
    FOREIGN KEY (productoID) REFERENCES INV_Productos(productoID)
);

