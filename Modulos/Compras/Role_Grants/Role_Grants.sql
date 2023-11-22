-- Crea role para el módulo
CREATE ROLE compras_role;

-- Otorgar grant con privilegios sobre las tablas ===> CORREGIR CON SUS DATOS
GRANT ALL PRIVILEGES ON COM_Proveedor TO compras_role;
GRANT ALL PRIVILEGES ON COM_Factura_Compra_Encabezado TO compras_role;
GRANT ALL PRIVILEGES ON COM_Detalle_Factura TO compras_role;
GRANT ALL PRIVILEGES ON COM_Orden_Compra TO compras_role;
GRANT ALL PRIVILEGES ON COM_Detalle_Compra TO compras_role;
GRANT ALL PRIVILEGES ON COM_Historial_Compra TO compras_role;
GRANT ALL PRIVILEGES ON COM_Historial_Pago TO compras_role;
GRANT ALL PRIVILEGES ON COM_Tipo_Moneda TO compras_role;
GRANT ALL PRIVILEGES ON COM_Descuento TO compras_role;
GRANT ALL PRIVILEGES ON COM_Seguimiento_Envio TO compras_role;