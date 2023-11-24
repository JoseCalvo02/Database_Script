
/*****************MODULO DE INVENTARIO*****************************/


-- Insertar registros en INV_Categorias
INSERT INTO INV_Categorias (categoriaID, nombre) VALUES ('CAT1', 'Electrónica');
INSERT INTO INV_Categorias (categoriaID, nombre) VALUES ('CAT2', 'Ropa');
INSERT INTO INV_Categorias (categoriaID, nombre) VALUES ('CAT3', 'Hogar');


-- Insertar registros en INV_Marcas
INSERT INTO INV_Marcas (marcaID, nombre) VALUES ('MAR1', 'Samsung');
INSERT INTO INV_Marcas (marcaID, nombre) VALUES ('MAR2', 'Nike');
INSERT INTO INV_Marcas (marcaID, nombre) VALUES ('MAR3', 'IKEA');


-- Insertar registros en INV_Garantias
INSERT INTO INV_Garantias (garantiaID, descripcion) VALUES ('GAR1', 'Garantía estándar de 1 año');
INSERT INTO INV_Garantias (garantiaID, descripcion) VALUES ('GAR2', 'Garantía extendida de 2 años');
INSERT INTO INV_Garantias (garantiaID, descripcion) VALUES ('GAR3', 'Garantía limitada de por vida');


-- Insertar registros en INV_Productos
INSERT INTO INV_Productos (productoID, nombre, descripcion, costo, categoriaID, marcaID, garantiaID) 
VALUES ('PROD1', 'Teléfono', 'Teléfono inteligente de última generación', 599.99, 'CAT1', 'MAR1', 'GAR1');

INSERT INTO INV_Productos (productoID, nombre, descripcion, costo, categoriaID, marcaID, garantiaID) 
VALUES ('PROD2', 'Zapatos deportivos', 'Zapatos para correr cómodos y duraderos', 79.99, 'CAT2', 'MAR2', 'GAR2');

INSERT INTO INV_Productos (productoID, nombre, descripcion, costo, categoriaID, marcaID, garantiaID) 
VALUES ('PROD3', 'Mesa de centro', 'Mesa elegante para la sala de estar', 149.50, 'CAT3', 'MAR3', 'GAR3');


-- Insertar registros en INV_ProductosProveedores
INSERT INTO INV_ProductosProveedores (productoID, proveedorID, precio, fechaInicio) 
VALUES ('PROD1', 'PROV1', 549.99, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO INV_ProductosProveedores (productoID, proveedorID, precio, fechaInicio) 
VALUES ('PROD2', 'PROV2', 69.99, TO_DATE('2023-02-20', 'YYYY-MM-DD'));

INSERT INTO INV_ProductosProveedores (productoID, proveedorID, precio, fechaInicio) 
VALUES ('PROD3', 'PROV3', 129.50, TO_DATE('2023-03-10', 'YYYY-MM-DD'));


-- Insertar registros en INV_Devoluciones
INSERT INTO INV_Devoluciones (devolucionID, productoID, cantidad, motivo, fechaDevolucion) 
VALUES ('DEV1', 'PROD1', 2, 'Defecto en la pantalla', TO_DATE('2023-04-05', 'YYYY-MM-DD'));

INSERT INTO INV_Devoluciones (devolucionID, productoID, cantidad, motivo, fechaDevolucion) 
VALUES ('DEV2', 'PROD2', 1, 'Talla incorrecta', TO_DATE('2023-05-10', 'YYYY-MM-DD'));

INSERT INTO INV_Devoluciones (devolucionID, productoID, cantidad, motivo, fechaDevolucion) 
VALUES ('DEV3', 'PROD3', 3, 'Daño durante el transporte', TO_DATE('2023-06-15', 'YYYY-MM-DD'));


-- Insertar registros en INV_Almacenes
INSERT INTO INV_Almacenes (almacenID, nombre, direccion) 
VALUES ('ALM1', 'Almacén Principal', 'Calle Principal, 123');

INSERT INTO INV_Almacenes (almacenID, nombre, direccion) 
VALUES ('ALM2', 'Almacén Secundario', 'Avenida Secundaria, 456');

INSERT INTO INV_Almacenes (almacenID, nombre, direccion) 
VALUES ('ALM3', 'Almacén de Reserva', 'Calle Reserva, 789');


-- Insertar registros en INV_Ubicaciones
INSERT INTO INV_Ubicaciones (ubicacionID, nombre, almacenID) 
VALUES ('UBIC1', 'Sección A', 'ALM1');

INSERT INTO INV_Ubicaciones (ubicacionID, nombre, almacenID) 
VALUES ('UBIC2', 'Pasillo B', 'ALM2');

INSERT INTO INV_Ubicaciones (ubicacionID, nombre, almacenID) 
VALUES ('UBIC3', 'Estante C', 'ALM3');


-- Insertar registros en INV_Stock
INSERT INTO INV_Stock (productoID, almacenID, cantidad) 
VALUES ('PROD1', 'ALM1', 100);

INSERT INTO INV_Stock (productoID, almacenID, cantidad) 
VALUES ('PROD2', 'ALM2', 75);

INSERT INTO INV_Stock (productoID, almacenID, cantidad) 
VALUES ('PROD3', 'ALM3', 50);


-- Insertar registros en INV_HistorialMovimientos
INSERT INTO INV_HistorialMovimientos (movimientoID, productoID, tipoMovimiento, cantidad, fechaMovimiento) 
VALUES ('MOV1', 'PROD1', 'Entrada', 50, TO_DATE('2023-07-10', 'YYYY-MM-DD'));

INSERT INTO INV_HistorialMovimientos (movimientoID, productoID, tipoMovimiento, cantidad, fechaMovimiento) 
VALUES ('MOV2', 'PROD2', 'Salida', 25, TO_DATE('2023-08-15', 'YYYY-MM-DD'));

INSERT INTO INV_HistorialMovimientos (movimientoID, productoID, tipoMovimiento, cantidad, fechaMovimiento) 
VALUES ('MOV3', 'PROD3', 'Entrada', 40, TO_DATE('2023-09-20', 'YYYY-MM-DD'));


-- Insertar registros en INV_AlertasStock
INSERT INTO INV_AlertasStock (alertaID, productoID, cantidadMinima) 
VALUES ('ALERT1', 'PROD1', 20);

INSERT INTO INV_AlertasStock (alertaID, productoID, cantidadMinima) 
VALUES ('ALERT2', 'PROD2', 15);

INSERT INTO INV_AlertasStock (alertaID, productoID, cantidadMinima) 
VALUES ('ALERT3', 'PROD3', 30);


-- Insertar registros en INV_TransferenciasAlmacenes
INSERT INTO INV_TransferenciasAlmacenes (transferenciaID, productoID, cantidad, almacenOrigenID, almacenDestinoID, fechaTransferencia) 
VALUES ('TRANSF1', 'PROD1', 10, 'ALM1', 'ALM2', TO_DATE('2023-10-05', 'YYYY-MM-DD'));

INSERT INTO INV_TransferenciasAlmacenes (transferenciaID, productoID, cantidad, almacenOrigenID, almacenDestinoID, fechaTransferencia) 
VALUES ('TRANSF2', 'PROD2', 20, 'ALM2', 'ALM3', TO_DATE('2023-11-10', 'YYYY-MM-DD'));

INSERT INTO INV_TransferenciasAlmacenes (transferenciaID, productoID, cantidad, almacenOrigenID, almacenDestinoID, fechaTransferencia) 
VALUES ('TRANSF3', 'PROD3', 15, 'ALM3', 'ALM1', TO_DATE('2023-12-15', 'YYYY-MM-DD'));


--***************** FIN DEL MODULO INVENTARIO *****************---

--***************** INICIO DEL MODULO COMPRAS *****************---

-- Insertar registros en COM_Proveedor
INSERT INTO COM_Proveedor (proveedorID, nombreProveedor, direccionProveedor, telefonoProveedor, correoProveedor, paisProveedor, fechaRegistro) 
VALUES ('PROV1', 'Proveedor A', 'Calle Principal 123', '123-456-7890', 'proveedora@example.com', 'País A', TO_DATE('2023-01-10', 'YYYY-MM-DD'));

INSERT INTO COM_Proveedor (proveedorID, nombreProveedor, direccionProveedor, telefonoProveedor, correoProveedor, paisProveedor, fechaRegistro) 
VALUES ('PROV2', 'Proveedor B', 'Avenida Secundaria 456', '987-654-3210', 'proveedorb@example.com', 'País B', TO_DATE('2023-02-15', 'YYYY-MM-DD'));

INSERT INTO COM_Proveedor (proveedorID, nombreProveedor, direccionProveedor, telefonoProveedor, correoProveedor, paisProveedor, fechaRegistro) 
VALUES ('PROV3', 'Proveedor C', 'Calle Reserva 789', '111-222-3333', 'proveedorc@example.com', 'País C', TO_DATE('2023-03-20', 'YYYY-MM-DD'));



-- Insertar registros en COM_Tipo_Moneda
INSERT INTO COM_Tipo_Moneda (tipoMonedaID, nombreMoneda, tasaCambio) 
VALUES ('TM1', 'Dólar estadounidense', '1.00');

INSERT INTO COM_Tipo_Moneda (tipoMonedaID, nombreMoneda, tasaCambio) 
VALUES ('TM2', 'Euro', '0.85');

INSERT INTO COM_Tipo_Moneda (tipoMonedaID, nombreMoneda, tasaCambio) 
VALUES ('TM3', 'Yen japonés', '110.28');


-- Insertar registros que cumplen con la restricción CHECK
INSERT INTO COM_Orden_Compra (ordenCompraID, tipoMonedaID, fechaCompra, estadoCompra, proveedorID) 
VALUES ('OC4', 'TM1', TO_DATE('2023-07-20', 'YYYY-MM-DD'), 'P', 'PROV2');

INSERT INTO COM_Orden_Compra (ordenCompraID, tipoMonedaID, fechaCompra, estadoCompra, proveedorID) 
VALUES ('OC5', 'TM2', TO_DATE('2023-08-25', 'YYYY-MM-DD'), 'PR', 'PROV3');

INSERT INTO COM_Orden_Compra (ordenCompraID, tipoMonedaID, fechaCompra, estadoCompra, proveedorID) 
VALUES ('OC6', 'TM3', TO_DATE('2023-09-30', 'YYYY-MM-DD'), 'E', 'PROV1');


-- Insertar registros en COM_Factura_Compra_Encabezado
INSERT INTO COM_Factura_Compra_Encabezado (facturaCompraID, ordenCompraID, proveedorID, tipoMonedaID, fechaFacturaCompra) 
VALUES ('FC1', 'OC4', 'PROV2', 'TM1', TO_DATE('2023-10-10', 'YYYY-MM-DD'));

INSERT INTO COM_Factura_Compra_Encabezado (facturaCompraID, ordenCompraID, proveedorID, tipoMonedaID, fechaFacturaCompra) 
VALUES ('FC2', 'OC5', 'PROV3', 'TM2', TO_DATE('2023-11-15', 'YYYY-MM-DD'));

INSERT INTO COM_Factura_Compra_Encabezado (facturaCompraID, ordenCompraID, proveedorID, tipoMonedaID, fechaFacturaCompra) 
VALUES ('FC3', 'OC6', 'PROV1', 'TM3', TO_DATE('2023-12-20', 'YYYY-MM-DD'));


-- Insertar registros en COM_Detalle_Factura
INSERT INTO COM_Detalle_Factura (facturaID, productoID, cantidadProducto, precioUnitario, impuestoVentas) 
VALUES ('FC1', 'PROD1', 5, 25.00, 5.00);

INSERT INTO COM_Detalle_Factura (facturaID, productoID, cantidadProducto, precioUnitario, impuestoVentas) 
VALUES ('FC2', 'PROD2', 10, 15.50, 3.00);

INSERT INTO COM_Detalle_Factura (facturaID, productoID, cantidadProducto, precioUnitario, impuestoVentas) 
VALUES ('FC3', 'PROD3', 3, 50.00, 7.50);


-- Insertar registros en COM_Descuento
INSERT INTO COM_Descuento (descuentoID, nombreDescuento, descripcionDescuento, precioDescuento, fechaDescuento, tipoDescuento) 
VALUES ('DESC1', 'Descuento Producto A', 'Descuento por volumen', 10.00, TO_DATE('2023-10-01', 'YYYY-MM-DD'), 'Si');

INSERT INTO COM_Descuento (descuentoID, nombreDescuento, descripcionDescuento, precioDescuento, fechaDescuento, tipoDescuento) 
VALUES ('DESC2', 'Descuento Producto B', 'Descuento especial', 5.00, TO_DATE('2023-11-05', 'YYYY-MM-DD'), 'Si');

INSERT INTO COM_Descuento (descuentoID, nombreDescuento, descripcionDescuento, precioDescuento, fechaDescuento, tipoDescuento) 
VALUES ('DESC3', 'Descuento Producto C', 'Descuento por temporada', 0.00, TO_DATE('2023-12-10', 'YYYY-MM-DD'), 'No');


-- Insertar registros en COM_Detalle_Compra
INSERT INTO COM_Detalle_Compra (ordenCompraID, descuentoID, cantidadProducto, tipoMonedaID, precioUnitario, impuestoVentas) 
VALUES ('OC4', 'DESC1', 8, 'TM1', 20.00, 4.00);

INSERT INTO COM_Detalle_Compra (ordenCompraID, descuentoID, cantidadProducto, tipoMonedaID, precioUnitario, impuestoVentas) 
VALUES ('OC5', 'DESC2', 15, 'TM2', 18.75, 3.50);

INSERT INTO COM_Detalle_Compra (ordenCompraID, descuentoID, cantidadProducto, tipoMonedaID, precioUnitario, impuestoVentas) 
VALUES ('OC6', 'DESC3', 5, 'TM3', 45.00, 6.75);


-- Insertar registros en COM_Historial_Compra
INSERT INTO COM_Historial_Compra (idCompra, fechaCompra, proveedorID, productoID, cantidadCompra, precioTotal) 
VALUES ('HC1', TO_DATE('2023-10-01', 'YYYY-MM-DD'), 'PROV1', 'PROD1', 10, 250.00);

INSERT INTO COM_Historial_Compra (idCompra, fechaCompra, proveedorID, productoID, cantidadCompra, precioTotal) 
VALUES ('HC2', TO_DATE('2023-11-05', 'YYYY-MM-DD'), 'PROV2', 'PROD2', 15, 300.00);

INSERT INTO COM_Historial_Compra (idCompra, fechaCompra, proveedorID, productoID, cantidadCompra, precioTotal) 
VALUES ('HC3', TO_DATE('2023-12-10', 'YYYY-MM-DD'), 'PROV3', 'PROD3', 5, 200.00);


-- Insertar registros en COM_Historial_Pago
INSERT INTO COM_Historial_Pago (historialPagoID, fechaPago, proveedorID, montoPago, metodoPago) 
VALUES ('HP1', TO_DATE('2023-10-15', 'YYYY-MM-DD'), 'PROV1', 500.00, 'T');

INSERT INTO COM_Historial_Pago (historialPagoID, fechaPago, proveedorID, montoPago, metodoPago) 
VALUES ('HP2', TO_DATE('2023-11-20', 'YYYY-MM-DD'), 'PROV2', 750.00, 'EF');

INSERT INTO COM_Historial_Pago (historialPagoID, fechaPago, proveedorID, montoPago, metodoPago) 
VALUES ('HP3', TO_DATE('2023-12-25', 'YYYY-MM-DD'), 'PROV3', 300.00, 'T');


-- Insertar registros en COM_Seguimiento_Envio
INSERT INTO COM_Seguimiento_Envio (seguimientoID, ordenCompraID, fechaEnvio, tipoMonedaID, fechaEntrega, numeroSeguimiento) 
VALUES ('SE1', 'OC4', TO_DATE('2023-10-01', 'YYYY-MM-DD'), 'TM1', TO_DATE('2023-10-15', 'YYYY-MM-DD'), 'ABC123456');

INSERT INTO COM_Seguimiento_Envio (seguimientoID, ordenCompraID, fechaEnvio, tipoMonedaID, fechaEntrega, numeroSeguimiento) 
VALUES ('SE2', 'OC5', TO_DATE('2023-11-05', 'YYYY-MM-DD'), 'TM2', TO_DATE('2023-11-20', 'YYYY-MM-DD'), 'DEF789012');

INSERT INTO COM_Seguimiento_Envio (seguimientoID, ordenCompraID, fechaEnvio, tipoMonedaID, fechaEntrega, numeroSeguimiento) 
VALUES ('SE3', 'OC6', TO_DATE('2023-12-10', 'YYYY-MM-DD'), 'TM3', TO_DATE('2023-12-25', 'YYYY-MM-DD'), 'GHI345678');


--***************** FIN DEL MODULO COMPRAS *****************---
