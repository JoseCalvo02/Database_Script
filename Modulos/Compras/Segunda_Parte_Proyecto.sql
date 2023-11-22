-- 1 Procedimiento 

CREATE OR REPLACE PROCEDURE insertar_proveedor (
    p_proveedorID VARCHAR2,
    p_nombreProveedor VARCHAR2,
    p_direccionProveedor VARCHAR2,
    p_telefonoProveedor VARCHAR2,
    p_correoProveedor VARCHAR2,
    p_paisProveedor VARCHAR2,
    p_fechaRegistro DATE
) AS
BEGIN
    INSERT INTO COM_Proveedor (
        proveedorID,
        nombreProveedor,
        direccionProveedor,
        telefonoProveedor,
        correoProveedor,
        paisProveedor,
        fechaRegistro
    ) VALUES (
        p_proveedorID,
        p_nombreProveedor,
        p_direccionProveedor,
        p_telefonoProveedor,
        p_correoProveedor,
        p_paisProveedor,
        p_fechaRegistro
    );
    COMMIT;
END insertar_proveedor;


-- Funcion 

CREATE OR REPLACE FUNCTION obtener_nombre_proveedor(
    p_proveedorID IN VARCHAR2
) RETURN VARCHAR2
IS
    v_nombreProveedor VARCHAR2(200);
BEGIN
    SELECT nombreProveedor INTO v_nombreProveedor
    FROM COM_Proveedor
    WHERE proveedorID = p_proveedorID;

    RETURN v_nombreProveedor;
END obtener_nombre_proveedor;

-- Llamado de funcion 

DECLARE
    nombre_prov VARCHAR2(200);
BEGIN
    nombre_prov := obtener_nombre_proveedor('ID_DEL_PROVEEDOR');
    DBMS_OUTPUT.PUT_LINE('Nombre del proveedor: ' || nombre_prov);
END;

-- 2

-- Primera Vista Normal

CREATE OR REPLACE VIEW vista_facturas_compra AS
SELECT 
    fc.facturaCompraID,
    fc.ordenCompraID,
    fc.proveedorID,
    fc.tipoMonedaID,
    fc.fechaFacturaCompra,
    df.productoID,
    df.cantidadProducto,
    df.precioUnitario,
    df.impuestoVentas
FROM COM_Factura_Compra_Encabezado fc
JOIN COM_Detalle_Factura df ON fc.facturaCompraID = df.facturaID;


-- Segunda Vista Normal 

CREATE OR REPLACE VIEW vista_ordenes_compra AS
SELECT 
    oc.ordenCompraID,
    oc.tipoMonedaID,
    oc.fechaCompra,
    oc.estadoCompra,
    dc.descuentoID,
    dc.cantidadProducto,
    dc.precioUnitario,
    dc.impuestoVentas
FROM COM_Orden_Compra oc
JOIN COM_Detalle_Compra dc ON oc.ordenCompraID = dc.ordenCompraID;


-- 3 Tabla Bitacora

CREATE TABLE COM_Bitacora (
    bitacoraId NUMBER GENERATED ALWAYS AS IDENTITY,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario VARCHAR2(50) NOT NULL,
    tipoMovimiento VARCHAR2(10) NOT NULL,
    entidadAfectada VARCHAR2(100) NOT NULL,
    detalleOperacion VARCHAR2(4000),
    CONSTRAINT PK_COM_Bitacora PRIMARY KEY (bitacoraId)
);

-- Trigger (NO ESTA FUNCIONANDO)

CREATE OR REPLACE TRIGGER Trigger_COM_Bitacora
AFTER INSERT OR UPDATE OR DELETE ON COM_Bitacora
FOR EACH ROW
DECLARE
    v_tipo_movimiento VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_tipo_movimiento := 'INSERT';
    ELSIF UPDATING THEN
        v_tipo_movimiento := 'UPDATE';
    ELSIF DELETING THEN
        v_tipo_movimiento := 'DELETE';
    END IF;

    INSERT INTO COM_Bitacora (usuario, tipoMovimiento, entidadAfectada, detalleOperacion)
    VALUES (USER, v_tipo_movimiento, 'COM_Bitacora', :NEW.columna1 || ' ' || :NEW.columna2 || ' ' || ...);
END;

-- 4 Indices 

CREATE INDEX idx_nombre_proveedor ON COM_Proveedor(nombreProveedor);

-- Segundo Indice (NO ESTA FUNCIONANDO)

CREATE INDEX idx_producto_id_detalle_factura ON COM_Detalle_Factura(productoID);

-- Roles 

-- Crea role para el módulo
CREATE ROLE compras_role;

-- Otorgar grant con privilegios sobre las tablas 
GRANT ALL PRIVILEGES ON COM_Categoria TO compras_role;
GRANT ALL PRIVILEGES ON COM_Proveedor TO compras_role;
GRANT ALL PRIVILEGES ON COM_Factura_Compra_Encabezado TO compras_role;
GRANT ALL PRIVILEGES ON COM_Detalle_Factura TO compras_role;
GRANT ALL PRIVILEGES ON COM_Orden_Compra TO compras_role;
GRANT ALL PRIVILEGES ON COM_Detalle_Compra TO compras_role;
GRANT ALL PRIVILEGES ON COM_Historial_Compra TO compras_role;
GRANT ALL PRIVILEGES ON COM_Historial_Pago TO compras_role;
GRANT ALL PRIVILEGES ON COM_Notificacion_Compra  TO compras_role;
GRANT ALL PRIVILEGES ON COM_Tipo_Moneda TO compras_role;
GRANT ALL PRIVILEGES ON COM_Descuento TO comprass_role;
GRANT ALL PRIVILEGES ON COM_Seguimiento_Envio TO compras_role;








