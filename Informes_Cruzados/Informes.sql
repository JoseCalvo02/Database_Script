-- => REPORTE 1: Inventario
-- Informe: Esta consulta devuelve información detallada sobre productos, incluyendo sus categorías y marcas.
SELECT
    P.productoID,
    P.nombre AS nombre_producto,
    P.descripcion,
    P.costo,
    C.nombre AS nombre_categoria,
    M.nombre AS nombre_marca
FROM
    INV_Productos P
JOIN
    INV_Categorias C ON P.categoriaID = C.categoriaID
JOIN
    INV_Marcas M ON P.marcaID = M.marcaID;

-- => REPORTE 2: Inventario
-- Informe: Esta consulta muestra detalles sobre los movimientos de inventario, incluyendo información sobre los productos asociados a esos movimientos.
SELECT
    H.movimientoID,
    H.tipoMovimiento,
    H.cantidad,
    H.fechaMovimiento,
    P.productoID,
    P.nombre AS nombre_producto,
    P.descripcion,
    P.costo
FROM
    INV_HistorialMovimientos H
JOIN
    INV_Productos P ON H.productoID = P.productoID;

-- => REPORTE 3: Compras
-- Informe: Esta consulta devuelve detalles de facturas de compra, incluyendo información sobre proveedores y productos asociados a esas facturas.
SELECT
    FC.facturaCompraID,
    FC.fechaFacturaCompra,
    P.proveedorID,
    P.nombreProveedor,
    DF.productoID,
    DF.cantidadProducto,
    DF.precioUnitario
FROM
    COM_Factura_Compra_Encabezado FC
JOIN
    COM_Proveedor P ON FC.proveedorID = P.proveedorID
JOIN
    COM_Detalle_Factura DF ON FC.facturaCompraID = DF.facturaID;

-- => REPORTE 4: Compras
-- Informe: Esta consulta muestra detalles de compras, incluyendo información sobre descuentos, proveedores y productos asociados a esas compras.
SELECT
    DC.ordenCompraID,
    DC.descuentoID,
    DC.cantidadProducto,
    DC.precioUnitario,
    DC.impuestoVentas,
    D.nombreDescuento,
    OC.proveedorID,
    P.nombreProveedor
FROM
    COM_Detalle_Compra DC
JOIN
    COM_Descuento D ON DC.descuentoID = D.descuentoID
JOIN
    COM_Orden_Compra OC ON DC.ordenCompraID = OC.ordenCompraID
JOIN
    COM_Proveedor P ON OC.proveedorID = P.proveedorID;

-- => REPORTE 5: Ventas
-- Informe: Esta consulta devuelve detalles de facturas de venta, incluyendo información sobre clientes y productos asociados a esas facturas.
SELECT
    EF.numeroEncabezado,
    EF.fechaEncabezado,
    C.clienteID,
    C.nombreCliente,
    C.primerApellidoCliente,
    C.segundoApellidoCliente,
    DF.productoID,
    DF.cantidad,
    DF.precio,
    DF.subTotal,
    DF.descuento,
    DF.IVADetalleFactura,
    DF.totalMasIva
FROM
    VEN_Encabezado_factura EF
JOIN
    VEN_Clientes C ON EF.clienteID = C.clienteID
JOIN
    VEN_Detalle_factura DF ON EF.numeroEncabezado = DF.numeroEncabezado;

-- => REPORTE 6: Ventas
-- Informe: Esta consulta muestra detalles de pedidos, incluyendo información sobre clientes y productos asociados a esos pedidos.
SELECT
    P.pedidoID,
    P.fechaPedido,
    C.clienteID,
    C.nombreCliente,
    C.primerApellidoCliente,
    C.segundoApellidoCliente,
    PP.productoID,
    PP.cantidad
FROM
    VEN_Pedidos P
JOIN
    VEN_Clientes C ON P.clienteID = C.clienteID
JOIN
    VEN_Pedidos_productos PP ON P.pedidoID = PP.pedidoID;

-- => REPORTE 7: RRHH
-- Informe: Esta consulta proporcionará información completa sobre los empleados, incluyendo detalles sobre su departamento, puesto, contrato, salario y beneficios.
SELECT
    E.empleadoID,
    E.nombreEmpleado,
    E.apellidoEmpleado,
    E.fechaNacimiento,
    E.direccion,
    E.telefono,
    E.email,
    D.nombreDepartamento AS departamento,
    P.nombrePuesto AS puesto,
    C.tipoContrato AS tipoContrato,
    C.fechaInicioContrato,
    C.fechaFinContrato,
    S.montoSalario,
    B.tipoBeneficio,
    B.descripcionBeneficio
FROM
    RRHH_Empleados E
JOIN
    RRHH_Departamentos D ON E.departamentoID = D.departamentoID
JOIN
    RRHH_Puestos P ON E.puestoID = P.puestoID
LEFT JOIN
    RRHH_Contratos C ON E.empleadoID = C.empleadoID
LEFT JOIN
    RRHH_Salarios S ON E.empleadoID = S.empleadoID
LEFT JOIN
    RRHH_Beneficios B ON E.empleadoID = B.empleadoID;

-- => REPORTE 8: RRHH
-- Informe: Esta consulta proporcionará información sobre las evaluaciones y vacaciones de los empleados en el módulo de Recursos Humanos
SELECT
    E.empleadoID,
    E.nombreEmpleado,
    E.apellidoEmpleado,
    EV.fechaEvaluacion,
    EV.resultadoEvaluacion,
    EV.comentarios,
    V.fechaInicioVacaciones,
    V.fechaFinalVacaciones,
    V.estadoVacaciones
FROM
    RRHH_Empleados E
LEFT JOIN
    RRHH_Evaluaciones EV ON E.empleadoID = EV.empleadoID
LEFT JOIN
    RRHH_Vacaciones V ON E.empleadoID = V.empleadoID;
