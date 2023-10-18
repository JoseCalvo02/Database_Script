-- => Combinación 1: Inventario y Ventas
-- Informe: Obtener el nombre de los productos vendidos, la cantidad en stock y su precio de venta.
SELECT VEN_Productos_vendidos.pedidoID, INV_Productos.nombre, INV_Stock.cantidad AS CantidadEnStock, VEN_Productos_vendidos.precioVenta
FROM VEN_Productos_vendidos
JOIN INV_Productos ON VEN_Productos_vendidos.productoID = INV_Productos.productoID
JOIN INV_Stock ON INV_Productos.productoID = INV_Stock.productoID;

-- => Combinación 2: Ventas y RRHH
-- Informe: Obtener el nombre del cliente, el nombre del empleado que realizó la venta y el resultado de su última evaluación.
SELECT
    C.nombreCliente AS NombreCliente,
    E.nombreEmpleado AS NombreEmpleado,
    EV.resultadoEvaluacion AS UltimaEvaluacionResultado
FROM VEN_Encabezado_factura VF
JOIN RRHH_Empleados E ON VF.empleadoID = E.empleadoID
JOIN VEN_Clientes C ON VF.clienteID = C.clienteID
LEFT JOIN
    (
        SELECT
            empleadoID,
            resultadoEvaluacion,
            MAX(fechaEvaluacion) AS UltimaEvaluacionFecha
        FROM RRHH_Evaluaciones
        GROUP BY empleadoID, resultadoEvaluacion
    ) EV ON E.empleadoID = EV.empleadoID
LEFT JOIN RRHH_Evaluaciones EVA ON EV.empleadoID = EVA.empleadoID AND EV.UltimaEvaluacionFecha = EVA.fechaEvaluacion
ORDER BY VF.numeroEncabezado DESC;

-- => Combinación 3: RRHH y Compras
<<<<<<< HEAD
-- Informe: Obtener el nombre del empleado de RRHH, el nombre del empleado que generó la orden de compra y la fecha de compra.
=======
-- Informe: Obtener los nombres de los empleados de RRHH, que empleado genero la orden de compra y en que fecha.
>>>>>>> c729da833f77dc7fe729900bbdfebde75ddb8f6b
SELECT
    E.nombreEmpleado AS NombreEmpleadoRRHH,
    EC.nombreEmpleado AS EmpleadoGeneradorOrden,
    OC.fechaCompra AS FechaCompra
<<<<<<< HEAD
FROM RRHH_Empleados E
JOIN COM_Orden_Compra OC ON E.empleadoID = OC.empleadoID
JOIN RRHH_Empleados EC ON OC.empleadoID = EC.empleadoID;
=======
FROM
    RRHH_Empleados E
JOIN
    COM_Orden_Compra OC ON E.empleadoID = OC.empleadoID
JOIN
    RRHH_Empleados EC ON OC.empleadoID = EC.empleadoID;
>>>>>>> c729da833f77dc7fe729900bbdfebde75ddb8f6b

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
SELECT
    CP.nombreProducto AS NombreProducto,
    DC.cantidadProducto AS CantidadComprada,
    U.nombre AS UbicacionAlmacenamiento
FROM COM_Producto CP
JOIN COM_Detalle_Compra DC ON CP.codigoProducto = DC.codigoProducto
JOIN COM_Orden_Compra OC ON DC.codigoCompra = OC.codigoCompra
JOIN INV_Productos IP ON CP.nombreProducto = IP.nombre
JOIN INV_Stock S ON IP.productoID = S.productoID
JOIN INV_Ubicaciones U ON S.almacenID = U.almacenID
WHERE
    OC.fechaCompra = (SELECT MAX(fechaCompra) FROM COM_Orden_Compra)
ORDER BY CP.nombreProducto;

-- => Combinación 8: Ventas y RRHH
-- Informe: Obtener el nombre del cliente, el nombre del empleado que realizó la venta y la fecha de su última evaluación.
