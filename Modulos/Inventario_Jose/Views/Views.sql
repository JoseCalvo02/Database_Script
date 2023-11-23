--------------------------------------------
----> PUNTO #2 - Vistas normales       <----
--------------------------------------------
-- Vista normal para obtener información de productos y sus categorías
CREATE OR REPLACE VIEW Vista_ProductosConCategorias AS
SELECT P.productoID, P.nombre, P.costo, C.nombre AS categoria
FROM INV_Productos P
JOIN INV_Categorias C ON P.categoriaID = C.categoriaID;

-- Vista normal para obtener información de productos y sus proveedores
CREATE OR REPLACE VIEW Vista_ProductosConProveedores AS
SELECT PP.productoID, P.nombre, PP.proveedorID, PP.precio
FROM INV_ProductosProveedores PP
JOIN INV_Productos P ON PP.productoID = P.productoID;

--------------------------------------------
----> PUNTO #2 - Vistas materializadas <----
--------------------------------------------
-- Vista materializada para el stock actual por almacén
CREATE MATERIALIZED VIEW MV_StockActualPorAlmacen
REFRESH COMPLETE ON COMMIT
AS
SELECT S.almacenID, COUNT(S.productoID) AS cantidadProductos
FROM INV_Stock S
GROUP BY S.almacenID;

-- Vista materializada para el historial de movimientos por producto
CREATE MATERIALIZED VIEW MV_HistorialMovimientosPorProducto
REFRESH COMPLETE ON COMMIT
AS
SELECT H.productoID, H.tipoMovimiento, COUNT(H.movimientoID) AS cantidadMovimientos
FROM INV_HistorialMovimientos H
GROUP BY H.productoID, H.tipoMovimiento;