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
    CONSTRAINT FK_INV_Productos_categoriaID FOREIGN KEY (categoriaID) REFERENCES INV_Categorias(categoriaID),
    CONSTRAINT FK_INV_Productos_marcaID FOREIGN KEY (marcaID) REFERENCES INV_Marcas(marcaID),
    CONSTRAINT FK_INV_Productos_garantiaID FOREIGN KEY (garantiaID) REFERENCES INV_Garantias(garantiaID)
);

-- Tabla de Proveedores
CREATE TABLE INV_ProductosProveedores (
    productoID VARCHAR(4),
    proveedorID VARCHAR(4),
    precio NUMBER(10,2),
    fechaInicio DATE,
    CONSTRAINT FK_INV_ProductosProveedores_productoID FOREIGN KEY (productoID) REFERENCES INV_Productos(productoID),
    CONSTRAINT FK_INV_ProductosProveedores_proveedorID FOREIGN KEY (proveedorID) REFERENCES COM_Proveedor(proveedorID), --Crear tabla del modulo de COMPRAS antes de ejecutarlo
    PRIMARY KEY (productoID, proveedorID)
);

CREATE TABLE INV_Devoluciones (
    devolucionID VARCHAR(4) PRIMARY KEY,
    productoID VARCHAR(4),
    cantidad INT,
    motivo VARCHAR(255),
    fechaDevolucion DATE,
    CONSTRAINT FK_INV_Devoluciones_productoID FOREIGN KEY (productoID) REFERENCES INV_Productos(productoID)
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
    almacenID VARCHAR(4),
    CONSTRAINT FK_INV_Ubicaciones_almacenID FOREIGN KEY (almacenID) REFERENCES INV_Almacenes(almacenID)
);

-- Tabla de Stock
CREATE TABLE INV_Stock (
    productoID VARCHAR(4) PRIMARY KEY,
    almacenID VARCHAR(4),
    cantidad INT,
    CONSTRAINT FK_INV_Stock_productoID FOREIGN KEY (productoID) REFERENCES INV_Productos(productoID),
    CONSTRAINT FK_INV_Stock_almacenID FOREIGN KEY (almacenID) REFERENCES INV_Almacenes(almacenID)
);

-- Tabla de Historial de Movimientos de Inventario
CREATE TABLE INV_HistorialMovimientos (
    movimientoID VARCHAR(4) PRIMARY KEY,
    productoID VARCHAR(4),
    tipoMovimiento VARCHAR(50) CHECK (tipoMovimiento IN ('Entrada', 'Salida')), -- Restricción CHECK
    cantidad INT,
    fechaMovimiento DATE,
    CONSTRAINT FK_INV_HistorialMovimientos_productoID FOREIGN KEY (productoID) REFERENCES INV_Productos(productoID)
);

-- Tabla de Alertas de Stock
CREATE TABLE INV_AlertasStock (
    alertaID VARCHAR(4) PRIMARY KEY,
    productoID VARCHAR(4),
    cantidadMinima INT,
    CONSTRAINT FK_INV_AlertasStock_productoID FOREIGN KEY (productoID) REFERENCES INV_Productos(productoID)
);

-- Tabla de Transferencias entre almacenes
CREATE TABLE INV_TransferenciasAlmacenes (
    transferenciaID VARCHAR(4) PRIMARY KEY,
    productoID VARCHAR(4),
    cantidad INT,
    almacenOrigenID VARCHAR(4),
    almacenDestinoID VARCHAR(4),
    fechaTransferencia DATE,
    CONSTRAINT FK_INV_TransferenciasAlmacenes_productoID FOREIGN KEY (productoID) REFERENCES INV_Productos(productoID),
    CONSTRAINT FK_INV_TransferenciasAlmacenes_almacenOrigenID FOREIGN KEY (almacenOrigenID) REFERENCES INV_Almacenes(almacenID),
    CONSTRAINT FK_INV_TransferenciasAlmacenes_almacenDestinoID FOREIGN KEY (almacenDestinoID) REFERENCES INV_Almacenes(almacenID)
);

-- Tabla de bitacora para el modulo de inventarios
CREATE TABLE INV_Bitacora (
    bitacoraID NUMBER GENERATED ALWAYS AS IDENTITY,
    fechaHora TIMESTAMP,
    usuario VARCHAR(255),
    tipoMovimiento VARCHAR(50),
    entidadAfectada VARCHAR(255),
    PRIMARY KEY(bitacoraID)
);