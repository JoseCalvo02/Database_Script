-- => Combinación 1: Inventario y Ventas
-- Informe: Obtener el nombre de los productos vendidos, la cantidad en stock y su precio de venta.
SELECT VEN_Productos_vendidos.pedidoID, INV_Productos.nombre, INV_Stock.cantidad AS CantidadEnStock, VEN_Productos_vendidos.precioVenta
FROM VEN_Productos_vendidos
JOIN INV_Productos ON VEN_Productos_vendidos.productoID = INV_Productos.productoID
JOIN INV_Stock ON INV_Productos.productoID = INV_Stock.productoID;

-- => Combinación 2: Ventas y RRHH
-- Informe: Obtener el nombre del cliente, el nombre del empleado que realizó la venta y el resultado de su última evaluación.


-- => Combinación 3: RRHH y Compras
-- Informe: Obtener los nombres de los empleados de RRHH, el nombre de la capacitación que han recibido y los productos comprados relacionados con esa capacitación.


-- => Combinación 4: Compras e Inventario
-- Informe: Obtener los nombres de los productos comprados, sus cantidades y las ubicaciones de almacenamiento.


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


-- => Combinación 7: Inventario y Compras
-- Informe: Obtener el nombre del producto, la cantidad comprada en la última orden y la ubicación de almacenamiento.


-- => Combinación 8: Ventas y RRHH
-- Informe: Obtener el nombre del cliente, el nombre del empleado que realizó la venta y la fecha de su última evaluación.
