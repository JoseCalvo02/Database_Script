-- Crea role para el módulo
CREATE ROLE ventas_role;

-- Otorgar grant con privilegios sobre las tablas ===> CORREGIR CON SUS DATOS
GRANT ALL PRIVILEGES ON VEN_Clientes TO ventas_role;
GRANT ALL PRIVILEGES ON VEN_Pedidos TO ventas_role;
GRANT ALL PRIVILEGES ON VEN_Pedidos_productos TO ventas_role;
GRANT ALL PRIVILEGES ON VEN_Vendedores TO ventas_role;
GRANT ALL PRIVILEGES ON VEN_Encabezado_factura TO ventas_role;
GRANT ALL PRIVILEGES ON VEN_Detalle_factura TO ventas_role;
GRANT ALL PRIVILEGES ON VEN_Descuentos TO ventas_role;
GRANT ALL PRIVILEGES ON VEN_Descuentos_Productos TO ventas_role;
GRANT ALL PRIVILEGES ON VEN_Historial_Ventas TO ventas_role;
GRANT ALL PRIVILEGES ON VEN_Metodo_pago TO ventas_role;
GRANT ALL PRIVILEGES ON VEN_Factura_metodo_pago TO ventas_role;
GRANT ALL PRIVILEGES ON VEN_Envios TO ventas_role;
GRANT ALL PRIVILEGES ON VEN_Envios_detalle TO ventas_role;
GRANT ALL PRIVILEGES ON VEN_Promociones TO ventas_role;
GRANT ALL PRIVILEGES ON VEN_Devoluciones TO ventas_role;
GRANT ALL PRIVILEGES ON VEN_Calificaciones_Clientes TO ventas_role;