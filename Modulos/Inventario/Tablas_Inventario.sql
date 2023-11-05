-- Tabla de Categorías
CREATE TABLE INV_Categorias (
    categoriaID VARCHAR(4) PRIMARY KEY,
    nombre VARCHAR(255)
);

-- Tabla de Marcas
CREATE TABLE INV_Marcas (
    marcaID VARCHAR(4) PRIMARY KEY,
    nombre VARCHAR(255)
);

-- Tabla de Garantías
CREATE TABLE INV_Garantias (
    garantiaID VARCHAR(4) PRIMARY KEY,
    descripcion VARCHAR(255)
);

-- Tabla de Productos
CREATE TABLE INV_Productos (
    productoID VARCHAR(4) PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion VARCHAR(255),
    costo NUMBER(10,2),
    categoriaID VARCHAR(4),
    marcaID VARCHAR(4),
    garantiaID VARCHAR(4),
    FOREIGN KEY (categoriaID) REFERENCES INV_Categorias(categoriaID),
    FOREIGN KEY (marcaID) REFERENCES INV_Marcas(marcaID),
    FOREIGN KEY (garantiaID) REFERENCES INV_Garantias(garantiaID)
);

-- Tabla de Proveedores
CREATE TABLE INV_ProductosProveedores (
    productoID VARCHAR(4),
    proveedorID VARCHAR(4),
    precio NUMBER(10,2),
    fechaInicio DATE,
    FOREIGN KEY (productoID) REFERENCES INV_Productos(productoID),
    FOREIGN KEY (proveedorID) REFERENCES COM_Proveedor(proveedorID), --Crear tabla del modulo de COMPRAS antes de ejecutarlo
    PRIMARY KEY (productoID, proveedorID)
);

CREATE TABLE INV_Devoluciones (
    devolucionID VARCHAR(4) PRIMARY KEY,
    productoID VARCHAR(4),
    cantidad INT,
    motivo VARCHAR(255),
    fechaDevolucion DATE,
    FOREIGN KEY (productoID) REFERENCES INV_Productos(productoID)
);

-- Tabla de Almacenes
CREATE TABLE INV_Almacenes (
    almacenID VARCHAR(4) PRIMARY KEY,
    nombre VARCHAR(255),
    direccion VARCHAR(255)
);

-- Tabla de Ubicaciones
CREATE TABLE INV_Ubicaciones (
    ubicacionID VARCHAR(4) PRIMARY KEY,
    nombre VARCHAR(255),
    almacenID INT,
    FOREIGN KEY (almacenID) REFERENCES INV_Almacenes(almacenID)
);

-- Tabla de Stock
CREATE TABLE INV_Stock (
    productoID VARCHAR(4) PRIMARY KEY,
    almacenID VARCHAR(4),
    cantidad INT,
    FOREIGN KEY (productoID) REFERENCES INV_Productos(productoID),
    FOREIGN KEY (almacenID) REFERENCES INV_Almacenes(almacenID)
);

-- Tabla de Historial de Movimientos de Inventario
CREATE TABLE INV_HistorialMovimientos (
    movimientoID VARCHAR(4) PRIMARY KEY,
    productoID VARCHAR(4),
    tipoMovimiento VARCHAR(50) CHECK (tipoMovimiento IN ('Entrada', 'Salida')), -- Restricción CHECK
    cantidad INT,
    fechaMovimiento DATE,
    FOREIGN KEY (productoID) REFERENCES INV_Productos(productoID)
);

-- Tabla de Alertas de Stock
CREATE TABLE INV_AlertasStock (
    alertaID VARCHAR(4) PRIMARY KEY,
    productoID VARCHAR(4),
    cantidadMinima INT,
    FOREIGN KEY (productoID) REFERENCES INV_Productos(productoID)
);

CREATE TABLE INV_TransferenciasAlmacenes (
    transferenciaID VARCHAR(4) PRIMARY KEY,
    productoID VARCHAR(4),
    cantidad INT,
    almacenOrigenID VARCHAR(4),
    almacenDestinoID VARCHAR(4),
    fechaTransferencia DATE,
    FOREIGN KEY (productoID) REFERENCES INV_Productos(productoID),
    FOREIGN KEY (almacenOrigenID) REFERENCES INV_Almacenes(almacenID),
    FOREIGN KEY (almacenDestinoID) REFERENCES INV_Almacenes(almacenID)
);
