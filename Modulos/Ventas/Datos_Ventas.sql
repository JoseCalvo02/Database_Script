-- Inserts para la tabla de Clientes
INSERT INTO VEN_Clientes (clienteID, nombreCliente, primerApellidoCliente, segundoApellidoCliente, numeroTelefono, emailCliente) VALUES ('CLI001', 'Ana', 'López', 'Martínez', '123-456-7890', 'ana.lopez@example.com');
INSERT INTO VEN_Clientes (clienteID, nombreCliente, primerApellidoCliente, segundoApellidoCliente, numeroTelefono, emailCliente) VALUES ('CLI002', 'Carlos', 'García', 'Fernández', '234-567-8901', 'carlos.garcia@example.com');
INSERT INTO VEN_Clientes (clienteID, nombreCliente, primerApellidoCliente, segundoApellidoCliente, numeroTelefono, emailCliente) VALUES ('CLI003', 'Laura', 'Rodríguez', 'Díaz', '345-678-9012', 'laura.rodriguez@example.com');

-- Inserts para la tabla de Pedidos
INSERT INTO VEN_Pedidos (pedidoID, fechaPedido, clienteID) VALUES ('PED001', '10/10/2023', 'CLI001');
INSERT INTO VEN_Pedidos (pedidoID, fechaPedido, clienteID) VALUES ('PED002', '11/10/2023', 'CLI002');
INSERT INTO VEN_Pedidos (pedidoID, fechaPedido, clienteID) VALUES ('PED003', '12/10/2023', 'CLI003');

-- Inserts para la tabla Intermedia de Pedidos y productos
INSERT INTO VEN_Pedidos_productos (pedidoID, productoID, descripcionPedido, cantidad) VALUES ('PED001', 1, 'Producto 1 para el pedido 1', 5);
INSERT INTO VEN_Pedidos_productos (pedidoID, productoID, descripcionPedido, cantidad) VALUES ('PED001', 2, 'Producto 2 para el pedido 1', 3);
INSERT INTO VEN_Pedidos_productos (pedidoID, productoID, descripcionPedido, cantidad) VALUES ('PED002', 3, 'Producto 3 para el pedido 2', 2);
INSERT INTO VEN_Pedidos_productos (pedidoID, productoID, descripcionPedido, cantidad) VALUES ('PED003', 2, 'Producto 4 para el pedido 3', 1);

-- Inserts para la tabla de Productos vendidos
INSERT INTO VEN_Productos_vendidos (pedidoID, productoID, ventaFecha, precioVenta) VALUES ('PED001', 1, '10/10/2023', 150.50);
INSERT INTO VEN_Productos_vendidos (pedidoID, productoID, ventaFecha, precioVenta) VALUES ('PED001', 2, '10/10/2023', 200.75);
INSERT INTO VEN_Productos_vendidos (pedidoID, productoID, ventaFecha, precioVenta) VALUES ('PED002', 3, '11/10/2023', 75.20);
INSERT INTO VEN_Productos_vendidos (pedidoID, productoID, ventaFecha, precioVenta) VALUES ('PED003', 2, '12/10/2023', 120.00);

-- Inserts para la tabla de Encabezado_Factura
INSERT INTO VEN_Encabezado_factura (numeroEncabezado, fechaEncabezado, empleadoID, ubicacionID, clienteID) VALUES ('FAC001', '10/10/2023', 'EMP01', 1, 'CLI001');
INSERT INTO VEN_Encabezado_factura (numeroEncabezado, fechaEncabezado, empleadoID, ubicacionID, clienteID) VALUES ('FAC002', '11/10/2023', 'EMP02', 2, 'CLI002');
INSERT INTO VEN_Encabezado_factura (numeroEncabezado, fechaEncabezado, empleadoID, ubicacionID, clienteID) VALUES ('FAC003', '12/10/2023', 'EMP03', 3, 'CLI003');

-- Inserts para la tabla de Detalle_factura
INSERT INTO VEN_Detalle_factura (numeroEncabezado, productoID, precio, cantidad, subTotal, descuento, IVADetalleFactura, totalMasIva, almacenID) VALUES ('FAC001', 1, 150.50, 5, 752.50, 0.00, 90.30, 842.80, 1);
INSERT INTO VEN_Detalle_factura (numeroEncabezado, productoID, precio, cantidad, subTotal, descuento, IVADetalleFactura, totalMasIva, almacenID) VALUES ('FAC001', 2, 200.75, 3, 602.25, 0.00, 72.27, 674.52, 1);
INSERT INTO VEN_Detalle_factura (numeroEncabezado, productoID, precio, cantidad, subTotal, descuento, IVADetalleFactura, totalMasIva, almacenID) VALUES ('FAC002', 3, 75.20, 2, 150.40, 0.00, 18.05, 168.45, 2);

-- Inserts para la tabla de Descuentos
INSERT INTO VEN_Descuentos (descuentoID, nombre, descripcion, valor, fechaInicio, fechaFin, activo) VALUES (1, 'Descuento de temporada', 'Descuento especial de fin de año', 10.00, '01/12/2023', '31/12/2023', 'si');
INSERT INTO VEN_Descuentos (descuentoID, nombre, descripcion, valor, fechaInicio, fechaFin, activo) VALUES (2, 'Descuento por cliente frecuente', 'Descuento especial para clientes habituales', 5.00, '01/10/2023', '31/12/2023', 'si');

-- Inserts para la tabla de Historial Ventas
INSERT INTO VEN_Historial_Ventas (historialVentasID, fecha, numeroEncabezado, productoID) VALUES (1, '10/10/2023', 'FAC001', 1);
INSERT INTO VEN_Historial_Ventas (historialVentasID, fecha, numeroEncabezado, productoID) VALUES (2, '10/10/2023', 'FAC001', 2);
INSERT INTO VEN_Historial_Ventas (historialVentasID, fecha, numeroEncabezado, productoID) VALUES (3, '11/10/2023', 'FAC002', 3);
INSERT INTO VEN_Historial_Ventas (historialVentasID, fecha, numeroEncabezado, productoID) VALUES (4, '12/10/2023', 'FAC001', 2);

-- Inserts para la tabla de Metodo de pagos
INSERT INTO VEN_Metodo_pago (metodoPagoID, nombre, activo) VALUES (1, 'Tarjeta de crédito', 'si');
INSERT INTO VEN_Metodo_pago (metodoPagoID, nombre, activo) VALUES (2, 'Transferencia bancaria', 'si');
INSERT INTO VEN_Metodo_pago (metodoPagoID, nombre, activo) VALUES (3, 'Efectivo', 'si');

-- Inserts para la tabla de Factura Metodo de pago
INSERT INTO VEN_Factura_metodo_pago (numeroEncabezado, metodoPagoID, monto) VALUES ('FAC001', 1, 842.80);
INSERT INTO VEN_Factura_metodo_pago (numeroEncabezado, metodoPagoID, monto) VALUES ('FAC002', 2, 168.45);
INSERT INTO VEN_Factura_metodo_pago (numeroEncabezado, metodoPagoID, monto) VALUES ('FAC003', 3, 134.40);

-- Inserts para la tabla de Envios
INSERT INTO VEN_Envios (IDEnvio, fechaEnvio, peso, costoEnvio, ubicacionID) VALUES (1, '11/10/2023', 5.20, 15.00, 1);
INSERT INTO VEN_Envios (IDEnvio, fechaEnvio, peso, costoEnvio, ubicacionID) VALUES (2, '12/10/2023', 8.70, 20.00, 2);
INSERT INTO VEN_Envios (IDEnvio, fechaEnvio, peso, costoEnvio, ubicacionID) VALUES (3, '12/10/2023', 3.50, 10.00, 3);

-- Inserts adicionales para la tabla de Promociones
INSERT INTO VEN_Promociones (IDPromocion, nombrePromocion, descripcion, fechaInicio, fechaFin, descuento, productoID) VALUES (1, 'Oferta especial de lanzamiento', 'Descuento especial para nuevos productos', '01/10/2023','31/10/2023', 15.00, 1);
INSERT INTO VEN_Promociones (IDPromocion, nombrePromocion, descripcion, fechaInicio, fechaFin, descuento, productoID) VALUES (2, 'Promoción de fin de semana', 'Descuento especial para el fin de semana', '15/10/2023', '17/10/2023', 10.00, 3);
INSERT INTO VEN_Promociones (IDPromocion, nombrePromocion, descripcion, fechaInicio, fechaFin, descuento, productoID) VALUES (3, 'Descuento por lealtad', 'Descuento especial para clientes leales', '01/11/2023', '30/11/2023', 8.00, 2);
INSERT INTO VEN_Promociones (IDPromocion, nombrePromocion, descripcion, fechaInicio, fechaFin, descuento, productoID) VALUES (4, 'Promoción de Navidad', 'Descuento especial para la temporada navideña', '15/12/2023', '25/12/2023', 12.00, 3);
INSERT INTO VEN_Promociones (IDPromocion, nombrePromocion, descripcion, fechaInicio, fechaFin, descuento, productoID) VALUES (5, 'Oferta relámpago', 'Descuento especial para las primeras 50 compras', '05/10/2023', '05/10/2023', 20.00, 1);

-- Inserts adicionales para la tabla de Devoluciones
INSERT INTO VEN_Devoluciones (devolucionID, productoID, clienteID, fechaDevolucion, cantidadDevuelta, descripcion) VALUES (1, 1, 'CLI001', '12/10/2023', 2.00, 'Producto defectuoso');
INSERT INTO VEN_Devoluciones (devolucionID, productoID, clienteID, fechaDevolucion, cantidadDevuelta, descripcion) VALUES (2, 3, 'CLI002', '13/10/2023', 1.00, 'Producto incorrecto');
INSERT INTO VEN_Devoluciones (devolucionID, productoID, clienteID, fechaDevolucion, cantidadDevuelta, descripcion) VALUES (3, 2, 'CLI003', '14/10/2023', 3.00, 'No cumple con las expectativas');
INSERT INTO VEN_Devoluciones (devolucionID, productoID, clienteID, fechaDevolucion, cantidadDevuelta, descripcion) VALUES (4, 1, 'CLI001', '15/10/2023', 1.00, 'Dañado durante el envío');
INSERT INTO VEN_Devoluciones (devolucionID, productoID, clienteID, fechaDevolucion, cantidadDevuelta, descripcion) VALUES (5, 3, 'CLI002', '16/10/2023', 2.00, 'No es lo que esperaba');

-- Inserts para la tabla de Calificaciones de Clientes
INSERT INTO VEN_Calificaciones_Clientes (calificacionClienteID, clienteID, descripcion, fechaCalificacion, calificacion) VALUES (1, 'CLI001', 'Excelente servicio, definitivamente compraré de nuevo', '10/10/2023', 4.5);
INSERT INTO VEN_Calificaciones_Clientes (calificacionClienteID, clienteID, descripcion, fechaCalificacion, calificacion) VALUES (2, 'CLI002', 'Entrega rápida y buen producto, gracias', '11/10/2023', 4.2);
INSERT INTO VEN_Calificaciones_Clientes (calificacionClienteID, clienteID, descripcion, fechaCalificacion, calificacion) VALUES (3, 'CLI003', 'Satisfecho con la compra, excelente calidad', '12/10/2023', 4.8);


