
--***************** INICIO DEL MODULO VENTAS *****************--

-- SE CAMBIO LOS CAMPOS DE ID A VARCHAR2(4)

-- Tabla de Clientes
CREATE TABLE VEN_Clientes (
    clienteID VARCHAR2(4) PRIMARY KEY, --NOMBRES DE ID DIFERTENTES EN OTRAS TABLAS
    nombreCliente VARCHAR2(55),
    primerApellidoCliente VARCHAR2(55),
    segundoApellidoCliente VARCHAR2(55),
    numeroTelefono VARCHAR2(20),
    emailCliente VARCHAR2(30)
);

-- Tabla de Pedidos
CREATE TABLE VEN_Pedidos (
    pedidoID VARCHAR2(4) PRIMARY KEY,
    fechaPedido DATE,
    clienteID VARCHAR2(4),
    CONSTRAINT FK_clienteID FOREIGN KEY (clienteID) REFERENCES VEN_Clientes(clienteID) ON DELETE CASCADE
);

-- Tabla Intermedia de Pedidos y productos

CREATE TABLE VEN_Pedidos_productos (
    pedidoID VARCHAR2(4),
    productoID VARCHAR2(4),
    --descripcionPedido VARCHAR2(100), ---este campo fue eliminado
    cantidad INT,
    PRIMARY KEY(pedidoID,productoID),
    CONSTRAINT FK_pedidoID FOREIGN KEY (pedidoID) REFERENCES VEN_Pedidos(pedidoID) ON DELETE CASCADE,
    CONSTRAINT FK_productoID FOREIGN KEY (productoID) REFERENCES INV_productos(productoID) ON DELETE CASCADE --CORREGIDO
);

ALTER TABLE VEN_Pedidos_productos
DROP COLUMN descripcionPedido; 


--ESTA TABLA FUE ELIMINADA
/*CREATE TABLE VEN_Productos_vendidos (
    pedidoID VARCHAR2(30),
    productoID INT,
    ventaFecha DATE,
    precioVenta DECIMAL(10, 2),
    CONSTRAINT PK_ProductosVendidos PRIMARY KEY (pedidoID, productoID),
    CONSTRAINT FK_pedidoProducto FOREIGN KEY (pedidoID, productoID) REFERENCES VEN_Pedidos_productos(pedidoID, productoID) ON DELETE CASCADE
);*/

DROP TABLE VEN_Productos_vendidos;

-- Tabla Vendedores
CREATE TABLE VEN_Vendedores (
  vendedor_id VARCHAR2(4) PRIMARY KEY, -- NOMBRES DE ID DIFERTENTES EN OTRAS TABLAS (DIFERENTE EN CLIENTES)
  nombre VARCHAR2(50),
  empleado_id VARCHAR2(4),
  FOREIGN KEY (empleado_id) REFERENCES RRHH_Empleados(empleadoID) ON DELETE CASCADE
);

-- Tabla Encabezado_Factura
CREATE TABLE VEN_Encabezado_factura (
    numeroEncabezado VARCHAR2(4) PRIMARY KEY,
    fechaEncabezado DATE,
    --empleadoID VARCHAR2(5),-- este campo fue reemplado por el id de la tabla de vendedores, se realiza con un ALTER TABLE, más abajo
    ubicacionID VARCHAR2(4),
    clienteID VARCHAR2(4),
    --CONSTRAINT FK_empleadoID_encabezado FOREIGN KEY (empleadoID) REFERENCES RRHH_Empleados(empleadoID) ON DELETE CASCADE, esta relacion fue eliminada
    CONSTRAINT FK_ubicacionID_encabezado FOREIGN KEY (ubicacionID) REFERENCES INV_Ubicaciones(ubicacionID) ON DELETE CASCADE, --CORREGIDO
    CONSTRAINT FK_clienteID_encabezado FOREIGN KEY (clienteID) REFERENCES VEN_Clientes(clienteID) ON DELETE CASCADE 
);

---SE ELIMINA LA RELACION Y LA COLUMNA DEL EMPLEADO, Y SE SUSTITUYE POR EL VENDEDOR ID
ALTER TABLE VEN_Encabezado_factura
DROP COLUMN  empleadoID;

ALTER TABLE VEN_Encabezado_factura
ADD vendedorID VARCHAR2(4);

ALTER TABLE VEN_Encabezado_factura
ADD CONSTRAINT FK_vendorID_encabezado 
FOREIGN KEY (vendedorID)
REFERENCES VEN_Vendedores(vendedor_id)
ON DELETE CASCADE;

---AGREMOS LA COLUMNA pedidoID y su respectiva relación
ALTER TABLE VEN_Encabezado_factura
ADD pedidoID VARCHAR2(4);


ALTER TABLE VEN_Encabezado_factura
ADD CONSTRAINT FK_pedido_encabezado 
FOREIGN KEY (pedidoID)
REFERENCES VEN_Pedidos(pedidoID)
ON DELETE CASCADE;


-- Tabla Detalle_factura
CREATE TABLE VEN_Detalle_factura (
    numeroEncabezado VARCHAR2(4),
    productoID VARCHAR2(4),
    precio NUMBER(10,2),
    cantidad NUMBER(10),
    subTotal NUMBER(10,2),
    descuento NUMBER(10,2),
    IVADetalleFactura NUMBER(10,2),
    totalMasIva NUMBER(10,2),
    almacenID VARCHAR2(4),
    CONSTRAINT PK_DetalleFactura PRIMARY KEY (numeroEncabezado,  productoID),
    CONSTRAINT FK_numeroEncabezado_detalle FOREIGN KEY (numeroEncabezado) REFERENCES VEN_Encabezado_factura(numeroEncabezado) ON DELETE CASCADE,
    CONSTRAINT FK_ProductoID_detalle FOREIGN KEY (productoID) REFERENCES INV_Productos(productoID) ON DELETE CASCADE, --CORREGIDO
    CONSTRAINT FK_almacenID_detalle FOREIGN KEY (almacenID) REFERENCES INV_Almacenes(almacenID) ON DELETE CASCADE --CORREGIDO
);

-- Agregamos el campo descuentoID al detalle de la factura y su respectiva relacion para ligarlo con la tabla de descuentos

ALTER TABLE VEN_Detalle_factura
ADD descuentoID  VARCHAR2(4);


ALTER TABLE VEN_Detalle_factura
ADD CONSTRAINT FK_descuentoID_detalle 
FOREIGN KEY (descuentoID  )
REFERENCES VEN_Descuentos(descuentoID )
ON DELETE CASCADE;

-- Agregamos el campo promocionID al detalle de la factura y su respectiva relacion para ligarlo con la tabla de promociones
ALTER TABLE VEN_Detalle_factura
ADD promocionID  VARCHAR2(4);

ALTER TABLE VEN_Detalle_factura
ADD CONSTRAINT FK_promocionID_detalle 
FOREIGN KEY (promocionID)
REFERENCES VEN_Promociones(IDpromocion)
ON DELETE CASCADE;

-- Tabla Descuentos
CREATE TABLE VEN_Descuentos (
    descuentoID VARCHAR2(4) PRIMARY KEY,
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
    numeroEncabezado VARCHAR2(4),
    productoID INT,
    CONSTRAINT FK_numeroEncabezado_historial FOREIGN KEY (numeroEncabezado, productoID) REFERENCES VEN_Detalle_factura(numeroEncabezado, productoID) ON DELETE CASCADE
);

-- Tabla Metodo de pagos
CREATE TABLE VEN_Metodo_pago (
    metodoPagoID VARCHAR2(4) PRIMARY KEY,
    nombre VARCHAR2(30),
    activo VARCHAR2(2) CHECK (activo IN ('si', 'no'))
);

-- Tabla Factura Metodo de pago
CREATE TABLE VEN_Factura_metodo_pago(
    numeroEncabezado VARCHAR2(4),
    metodoPagoID VARCHAR2(4),
    monto NUMBER(10,2),
    CONSTRAINT PK_FactuFormPago PRIMARY KEY (numeroEncabezado, metodoPagoID),
    CONSTRAINT FK_NumEncabezadoID_factura FOREIGN KEY (numeroEncabezado) REFERENCES VEN_Encabezado_factura(numeroEncabezado) ON DELETE CASCADE,
    CONSTRAINT FK_MetodoPagoID_factura FOREIGN KEY (metodoPagoID) REFERENCES VEN_Metodo_pago(metodoPagoID) ON DELETE CASCADE
);

-- Tabla Envios
CREATE TABLE VEN_Envios (
    IDEnvio VARCHAR2(4) PRIMARY KEY,
    fechaEnvio DATE,
    peso DECIMAL(10, 2),
    costoEnvio DECIMAL(10, 2),
    ubicacionID VARCHAR2(4),
    CONSTRAINT FK_ubicacionID_envios FOREIGN KEY (ubicacionID) REFERENCES INV_Ubicaciones(ubicacionID) ON DELETE CASCADE --CORREGIDO
);

CREATE TABLE VEN_Envios_detalle (
     IDEnvio VARCHAR2(4),
     IDEncabezadoFactura VARCHAR2(30),
     CONSTRAINT FK_enviosID FOREIGN KEY (IDEnvio) REFERENCES VEN_Envios(IDEnvio) ON DELETE CASCADE,
     CONSTRAINT FK_EncabezadoFactura_envios FOREIGN KEY (IDEncabezadoFactura) REFERENCES VEN_Encabezado_factura(numeroEncabezado) ON DELETE CASCADE,
     PRIMARY KEY (IDEnvio, IDEncabezadoFactura)
);


-- Tabla Promociones
CREATE TABLE VEN_Promociones (
    IDPromocion VARCHAR2(4) PRIMARY KEY,
    nombrePromocion VARCHAR(255),
    descripcion VARCHAR(500),
    fechaInicio DATE,
    fechaFin DATE,
    descuento DECIMAL(5, 2),
    productoID VARCHAR2(4),
    CONSTRAINT FK_Producto_promociones FOREIGN KEY (productoID) REFERENCES INV_Productos (productoID) ON DELETE CASCADE --CORREGIDO
);

-- Tabla Devoluciones
CREATE TABLE VEN_Devoluciones (
    devolucionID VARCHAR2(4) PRIMARY KEY,
    productoID VARCHAR2(4),
    clienteID VARCHAR2(4),
    fechaDevolucion DATE,
    cantidadDevuelta NUMBER(10,2),
    descripcion VARCHAR2(250),
    CONSTRAINT FK_IDproducto_devoluciones FOREIGN KEY (productoID) REFERENCES INV_Productos (productoID) ON DELETE CASCADE, --CORREGIDO
    CONSTRAINT FK_IDcliente_devoluciones FOREIGN KEY (clienteID) REFERENCES VEN_Clientes(clienteID) ON DELETE CASCADE
);


-- Agregamos el campo encabezadoID al tabla devoluciones y su respectiva relacion para ligarlo con la tabla de encabezado factura
ALTER TABLE VEN_Devoluciones
ADD encabezadoID VARCHAR2(4);

ALTER TABLE VEN_Devoluciones
ADD CONSTRAINT FK_encabezadoID_dev 
FOREIGN KEY (encabezadoID)
REFERENCES VEN_Encabezado_Factura(numeroencabezado)
ON DELETE CASCADE;

-- Table Calificaciones Clientes
CREATE TABLE VEN_Calificaciones_Clientes(
    calificacionClienteID VARCHAR2(4) PRIMARY KEY,
    clienteID VARCHAR2(4),
    descripcion VARCHAR(250),
    fechaCalificacion DATE,
    calificacion DECIMAL(5, 2),
    CONSTRAINT FK_ClienteID_calificaciones FOREIGN KEY (clienteID) REFERENCES VEN_Clientes(clienteID) ON DELETE CASCADE
);

commit;

--***************** FIN DEL MODULO VENTAS *****************--

