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
CREATE TABLE Productos_pedidos(
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

commit;
