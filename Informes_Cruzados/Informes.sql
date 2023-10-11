-- => Combinación 1: Inventario y Ventas
-- Informe: Obtener el nombre de los productos vendidos, la cantidad en stock y su precio de venta.
SELECT VEN_Productos_vendidos.pedidoID, INV_Productos.nombre, INV_Stock.cantidad, VEN_Productos_vendidos.precioVenta
FROM VEN_Productos_vendidos
JOIN INV_Productos ON VEN_Productos_vendidos.productoID = INV_Productos.productoID
JOIN INV_Stock ON INV_Productos.productoID = INV_Stock.productoID;

-- => Combinación 2: Ventas y RRHH
-- Informe: Obtener el nombre del cliente, el nombre del empleado que realizó la venta y el resultado de su última evaluación.
SELECT VEN_Clientes.nombreCliente, RRHH_Empleados.nombreEmpleado, RRHH_Evaluaciones.resultadoEvaluacion
FROM VEN_Clientes
JOIN VEN_Pedidos ON VEN_Clientes.clienteID = VEN_Pedidos.clienteID
JOIN RRHH_Empleados ON VEN_Pedidos.empleadoID = RRHH_Empleados.empleadoID
LEFT JOIN RRHH_Evaluaciones ON RRHH_Empleados.empleadoID = RRHH_Evaluaciones.empleadoID
ORDER BY VEN_Pedidos.fechaPedido DESC;

-- => Combinación 3: RRHH y Compras
-- Informe: Obtener los nombres de los empleados de RRHH, el nombre de la capacitación que han recibido y los productos comprados relacionados con esa capacitación.
SELECT RRHH_Empleados.nombreEmpleado, RRHH_Capacitaciones.nombreCapacitacion, COM_Producto.nombreProducto
FROM RRHH_Empleados
JOIN RRHH_Capacitaciones ON RRHH_Empleados.empleadoID = RRHH_Capacitaciones.empleadoID
JOIN COM_Producto ON RRHH_Capacitaciones.capacitacionID = COM_Producto.codigoProducto;

-- => Combinación 4: Compras e Inventario
-- Informe: Obtener los nombres de los productos comprados, sus cantidades y las ubicaciones de almacenamiento.
SELECT COM_Producto.nombreProducto, COM_Detalle_Compra.cantidadProducto, INV_Ubicaciones.nombre AS ubicacion
FROM COM_Detalle_Compra
JOIN COM_Producto ON COM_Detalle_Compra.codigoProducto = COM_Producto.codigoProducto
JOIN INV_Ubicaciones ON COM_Detalle_Compra.codigoProducto = INV_Ubicaciones.productoID;

-- => Combinación 5: Inventario y RRHH
-- Informe: Obtener el nombre de los productos en stock, las cantidades disponibles y los nombres de los empleados que están a cargo de su gestión.
SELECT INV_Productos.nombre AS NombreProducto,
       INV_Stock.cantidad AS CantidadDisponible,
       RRHH_Empleados.nombreEmpleado AS NombreEmpleadoResponsable
FROM INV_Productos
JOIN INV_Stock ON INV_Productos.productoID = INV_Stock.productoID
LEFT JOIN RRHH_Empleados ON INV_Stock.empleadoID = RRHH_Empleados.empleadoID;

-- => Combinación 6: Ventas, Compras e Inventario
-- Informe: Obtener el nombre del cliente, el producto comprado, la cantidad comprada y la cantidad disponible en stock.
SELECT VEN_Clientes.nombreCliente, COM_Producto.nombreProducto, COM_Detalle_Compra.cantidadProducto, INV_Stock.cantidad
FROM VEN_Pedidos
JOIN VEN_Clientes ON VEN_Pedidos.clienteID = VEN_Clientes.clienteID
JOIN COM_Detalle_Compra ON VEN_Pedidos.pedidoID = COM_Detalle_Compra.codigoCompra
JOIN COM_Producto ON COM_Detalle_Compra.codigoProducto = COM_Producto.codigoProducto
JOIN INV_Stock ON COM_Producto.codigoProducto = INV_Stock.productoID;

-- => Combinación 7: Inventario y Compras
-- Informe: Obtener el nombre del producto, la cantidad comprada en la última orden y la ubicación de almacenamiento.
SELECT COM_Producto.nombreProducto, COM_Detalle_Compra.cantidadProducto, INV_Ubicaciones.nombre AS ubicacion
FROM COM_Detalle_Compra
JOIN COM_Producto ON COM_Detalle_Compra.codigoProducto = COM_Producto.codigoProducto
JOIN INV_Ubicaciones ON COM_Producto.codigoProducto = INV_Ubicaciones.productoID
WHERE COM_Detalle_Compra.codigoCompra = (SELECT MAX(codigoCompra) FROM COM_Orden_Compra);

-- => Combinación 8: Ventas y RRHH
-- Informe: Obtener el nombre del cliente, el nombre del empleado que realizó la venta y la fecha de su última evaluación.
SELECT VEN_Clientes.nombreCliente, RRHH_Empleados.nombreEmpleado, MAX(RRHH_Evaluaciones.fechaEvaluacion) AS ultimaEvaluacion
FROM VEN_Pedidos
JOIN VEN_Clientes ON VEN_Pedidos.clienteID = VEN_Clientes.clienteID
JOIN RRHH_Empleados ON VEN_Pedidos.empleadoID = RRHH_Empleados.empleadoID
LEFT JOIN RRHH_Evaluaciones ON RRHH_Empleados.empleadoID = RRHH_Evaluaciones.empleadoID
GROUP BY VEN_Clientes.nombreCliente, RRHH_Empleados.nombreEmpleado;