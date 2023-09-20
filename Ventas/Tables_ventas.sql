-- Tabla de Clientes
CREATE TABLE Clientes (
    ClienteID VARCHAR2(30)PRIMARY KEY,
    NombreCliente VARCHAR2(55),
    PrimerApellidoCliente VARCHAR2(55),
    SegundoApellidoCliente VARCHAR2(55),
    NumeroTelefono VARCHAR2(20),
    EmailCliente VARCHAR2(30)
);

commit
