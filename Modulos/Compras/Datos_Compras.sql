-- Inserts para la tabla COM_Categoria
INSERT INTO COM_Categoria (codigoCategoria, nombreCategoria, descripcionCategoria) VALUES ('CAT001', 'Electr�nicos', 'Categor�a de productos electr�nicos');
INSERT INTO COM_Categoria (codigoCategoria, nombreCategoria, descripcionCategoria) VALUES ('CAT002', 'Ropa', 'Categor�a de productos de vestir');
INSERT INTO COM_Categoria (codigoCategoria, nombreCategoria, descripcionCategoria) VALUES ('CAT003', 'Hogar', 'Categor�a de productos para el hogar');

-- Inserts para la tabla COM_UnidadDeMedida
INSERT INTO COM_UnidadDeMedida (codigoUnidad, nombreUnidad, abreviatura, descripcion) VALUES ('UND001', 'Unidad', 'Und', 'Unidad est�ndar');
INSERT INTO COM_UnidadDeMedida (codigoUnidad, nombreUnidad, abreviatura, descripcion) VALUES ('UND002', 'Kilogramo', 'Kg', 'Medido en kilogramos');
INSERT INTO COM_UnidadDeMedida (codigoUnidad, nombreUnidad, abreviatura, descripcion) VALUES ('UND003', 'Metro', 'm', 'Medido en metros');

-- Inserts para la tabla COM_Proveedor
INSERT INTO COM_Proveedor (codigoProveedor, nombreProveedor, direccionProveedor, telefonoProveedor, correoProveedor, paisProveedor, fechaRegistro) VALUES ('PROV001', 'Proveedor1', 'Direcci�n Proveedor 1', '123456789', 'proveedor1@example.com', 'Pa�s1', '01/10/2023');
INSERT INTO COM_Proveedor (codigoProveedor, nombreProveedor, direccionProveedor, telefonoProveedor, correoProveedor, paisProveedor, fechaRegistro) VALUES ('PROV002', 'Proveedor2', 'Direcci�n Proveedor 2', '987654321', 'proveedor2@example.com', 'Pa�s2', '02/10/2023');
INSERT INTO COM_Proveedor (codigoProveedor, nombreProveedor, direccionProveedor, telefonoProveedor, correoProveedor, paisProveedor, fechaRegistro) VALUES ('PROV003', 'Proveedor3', 'Direcci�n Proveedor 3', '555555555', 'proveedor3@example.com', 'Pa�s3', '03/10/2023');

-- Inserts para la tabla COM_Producto
INSERT INTO COM_Producto (codigoProducto, nombreProducto, descripcionProducto, precioProducto, codigoUnidad, codigoCategoria) VALUES ('PROD001', 'Producto1', 'Descripci�n del Producto 1', 100.50, 'UND001', 'CAT001');
INSERT INTO COM_Producto (codigoProducto, nombreProducto, descripcionProducto, precioProducto, codigoUnidad, codigoCategoria) VALUES ('PROD002', 'Producto2', 'Descripci�n del Producto 2', 200.75, 'UND002', 'CAT002');
INSERT INTO COM_Producto (codigoProducto, nombreProducto, descripcionProducto, precioProducto, codigoUnidad, codigoCategoria) VALUES ('PROD003', 'Producto3', 'Descripci�n del Producto 3', 150.25, 'UND003', 'CAT003');

-- Inserts para la tabla COM_Orden_Compra
INSERT INTO COM_Orden_Compra (codigoCompra, fechaCompra, estadoCompra, codigoProveedor, empleadoID) VALUES ('COMP001', '03/10/2023', 'P', 'PROV001', 'EMP01');
INSERT INTO COM_Orden_Compra (codigoCompra, fechaCompra, estadoCompra, codigoProveedor, empleadoID) VALUES ('COMP002', '04/10/2023', 'PR', 'PROV002', 'EMP02');
INSERT INTO COM_Orden_Compra (codigoCompra, fechaCompra, estadoCompra, codigoProveedor, empleadoID) VALUES ('COMP003', '05/10/2023', 'P', 'PROV003', 'EMP03');

-- Inserts para la tabla COM_Detalle_Compra
INSERT INTO COM_Detalle_Compra (codigoArticulo, codigoCompra, codigoProducto, cantidadProducto, precioUnitario, impuestoVentas) VALUES ('ART001', 'COMP001', 'PROD001', 10, 100.50, 18.00);
INSERT INTO COM_Detalle_Compra (codigoArticulo, codigoCompra, codigoProducto, cantidadProducto, precioUnitario, impuestoVentas) VALUES ('ART002', 'COMP002', 'PROD002', 5, 200.75, 25.00);
INSERT INTO COM_Detalle_Compra (codigoArticulo, codigoCompra, codigoProducto, cantidadProducto, precioUnitario, impuestoVentas) VALUES ('ART003', 'COMP003', 'PROD003', 8, 150.25, 20.00);

-- Inserts para la tabla COM_Historial_Compra
INSERT INTO COM_Historial_Compra (idCompra, fechaCompra, codigoProveedor, codigoProducto, cantidadCompra, PrecioTotal, ANO, MES) VALUES ('COMP001', '03/10/2023', 'PROV001', 'PROD001', 10, 1085.50, 2023, 10);
INSERT INTO COM_Historial_Compra (idCompra, fechaCompra, codigoProveedor, codigoProducto, cantidadCompra, PrecioTotal, ANO, MES) VALUES ('COMP002', '04/10/2023', 'PROV002', 'PROD002', 5, 1170.00, 2023, 10);
INSERT INTO COM_Historial_Compra (idCompra, fechaCompra, codigoProveedor, codigoProducto, cantidadCompra, PrecioTotal, ANO, MES) VALUES ('COMP003', '05/10/2023', 'PROV003', 'PROD003', 8, 1306.00, 2023, 10);

-- Inserts para la tabla COM_Notificacion_Compra
INSERT INTO COM_Notificacion_Compra (codigoNotificacion, codigoCompra, fechaEnvio, destinatarioCompra, mensajeCompra) VALUES ('NOTIF001', 'COMP001', '05/10/2023', 'Destinatario1', 'Mensaje de notificaci�n 1');
INSERT INTO COM_Notificacion_Compra (codigoNotificacion, codigoCompra, fechaEnvio, destinatarioCompra, mensajeCompra) VALUES ('NOTIF002', 'COMP002', '06/10/2023', 'Destinatario2', 'Mensaje de notificaci�n 2');
INSERT INTO COM_Notificacion_Compra (codigoNotificacion, codigoCompra, fechaEnvio, destinatarioCompra, mensajeCompra) VALUES ('NOTIF003', 'COMP003', '07/10/2023', 'Destinatario3', 'Mensaje de notificaci�n 3');

-- Inserts para la tabla COM_Tipo_Moneda
INSERT INTO COM_Tipo_Moneda (codigoMoneda, nombreMoneda, tasaCambio) VALUES ('USD', 'D�lar estadounidense', 1.00);
INSERT INTO COM_Tipo_Moneda (codigoMoneda, nombreMoneda, tasaCambio) VALUES ('EUR', 'Euro', 0.85);
INSERT INTO COM_Tipo_Moneda (codigoMoneda, nombreMoneda, tasaCambio) VALUES ('GBP', 'Libra esterlina', 1.20);

-- Inserts para la tabla COM_Descuento
INSERT INTO COM_Descuento (codigoDescuento, nombreDescuento, descripcionDescuento, precioDescuento, fechaDescuento, tipoDescuento) VALUES ('DESC001', 'Descuento1', 'Descripci�n del Descuento 1', 50.00, '10/10/2023', 's');
INSERT INTO COM_Descuento (codigoDescuento, nombreDescuento, descripcionDescuento, precioDescuento, fechaDescuento, tipoDescuento) VALUES ('DESC002', 'Descuento2', 'Descripci�n del Descuento 2', 30.00, '11/10/2023', 'n');
INSERT INTO COM_Descuento (codigoDescuento, nombreDescuento, descripcionDescuento, precioDescuento, fechaDescuento, tipoDescuento) VALUES ('DESC003', 'Descuento3', 'Descripci�n del Descuento 3', 20.00, '12/10/2023', 's');

-- Inserts para la tabla COM_Seguimiento_Envio
INSERT INTO COM_Seguimiento_Envio (codigoEnvio, codigoCompra, fechaEnvio, fechaEntrega, numeroSeguimiento) VALUES ('ENV001', 'COMP001', '05/10/2023', '10/10/2023', '123456789');
INSERT INTO COM_Seguimiento_Envio (codigoEnvio, codigoCompra, fechaEnvio, fechaEntrega, numeroSeguimiento) VALUES ('ENV002', 'COMP002', '06/10/2023', '11/10/2023', '987654321');
INSERT INTO COM_Seguimiento_Envio (codigoEnvio, codigoCompra, fechaEnvio, fechaEntrega, numeroSeguimiento) VALUES ('ENV003', 'COMP003', '07/10/2023', '12/10/2023', '111222333');