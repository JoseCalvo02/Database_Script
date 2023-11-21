--------------------------------------------
----> PUNTO #3 - Triggers              <----
--------------------------------------------

--> Trigger #1 para la tabla de categorias
CREATE OR REPLACE TRIGGER trg_inv_categorias
AFTER INSERT OR UPDATE OR DELETE ON INV_Categorias
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'INSERT', 'INV_Categorias');
    ELSIF UPDATING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'UPDATE', 'INV_Categorias');
    ELSIF DELETING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'DELETE', 'INV_Categorias');
    END IF;
END;

--> Trigger #2 para la tabla de Marcas
CREATE OR REPLACE TRIGGER trg_inv_marcas
AFTER INSERT OR UPDATE OR DELETE ON INV_Marcas
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'INSERT', 'INV_Marcas');
    ELSIF UPDATING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'UPDATE', 'INV_Marcas');
    ELSIF DELETING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'DELETE', 'INV_Marcas');
    END IF;
END;

--> Trigger #3 para la tabla de Garantías
CREATE OR REPLACE TRIGGER trg_inv_garantias
AFTER INSERT OR UPDATE OR DELETE ON INV_Garantias
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'INSERT', 'INV_Garantias');
    ELSIF UPDATING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'UPDATE', 'INV_Garantias');
    ELSIF DELETING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'DELETE', 'INV_Garantias');
    END IF;
END;

--> Trigger #4 para la Tabla de Productos
CREATE OR REPLACE TRIGGER trg_inv_productos
AFTER INSERT OR UPDATE OR DELETE ON INV_Productos
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'INSERT', 'INV_Productos');
    ELSIF UPDATING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'UPDATE', 'INV_Productos');
    ELSIF DELETING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'DELETE', 'INV_Productos');
    END IF;
END;

--> Trigger #5 para la Tabla de Proveedores
CREATE OR REPLACE TRIGGER trg_inv_productos_proveedores
AFTER INSERT OR UPDATE OR DELETE ON INV_ProductosProveedores
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'INSERT', 'INV_ProductosProveedores');
    ELSIF UPDATING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'UPDATE', 'INV_ProductosProveedores');
    ELSIF DELETING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'DELETE', 'INV_ProductosProveedores');
    END IF;
END;

--> Trigger #6 para la Tabla de Devoluciones
CREATE OR REPLACE TRIGGER trg_inv_devoluciones
AFTER INSERT OR UPDATE OR DELETE ON INV_Devoluciones
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'INSERT', 'INV_Devoluciones');
    ELSIF UPDATING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'UPDATE', 'INV_Devoluciones');
    ELSIF DELETING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'DELETE', 'INV_Devoluciones');
    END IF;
END;

--> Trigger #7 para la Tabla de Almacenes
CREATE OR REPLACE TRIGGER trg_inv_almacenes
AFTER INSERT OR UPDATE OR DELETE ON INV_Almacenes
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'INSERT', 'INV_Almacenes');
    ELSIF UPDATING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'UPDATE', 'INV_Almacenes');
    ELSIF DELETING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'DELETE', 'INV_Almacenes');
    END IF;
END;

--> Trigger #8 para la Tabla de Ubicaciones
CREATE OR REPLACE TRIGGER trg_inv_ubicaciones
AFTER INSERT OR UPDATE OR DELETE ON INV_Ubicaciones
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'INSERT', 'INV_Ubicaciones');
    ELSIF UPDATING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'UPDATE', 'INV_Ubicaciones');
    ELSIF DELETING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'DELETE', 'INV_Ubicaciones');
    END IF;
END;

--> Trigger #9 para la Tabla de Stock
CREATE OR REPLACE TRIGGER trg_inv_stock
AFTER INSERT OR UPDATE OR DELETE ON INV_Stock
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'INSERT', 'INV_Stock');
    ELSIF UPDATING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'UPDATE', 'INV_Stock');
    ELSIF DELETING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'DELETE', 'INV_Stock');
    END IF;
END;

--> Trigger #10 para la Tabla de Historial de Movimientos de Inventario
CREATE OR REPLACE TRIGGER trg_inv_historial_movimiento
AFTER INSERT OR UPDATE OR DELETE ON INV_HistorialMovimientos
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'INSERT', 'INV_HistorialMovimientos');
    ELSIF UPDATING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'UPDATE', 'INV_HistorialMovimientos');
    ELSIF DELETING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'DELETE', 'INV_HistorialMovimientos');
    END IF;
END;

--> Trigger #11 para la Tabla de Historial de Alertas de Stock
CREATE OR REPLACE TRIGGER trg_inv_alertas_stock
AFTER INSERT OR UPDATE OR DELETE ON INV_AlertasStock
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'INSERT', 'INV_AlertasStock');
    ELSIF UPDATING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'UPDATE', 'INV_AlertasStock');
    ELSIF DELETING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'DELETE', 'INV_AlertasStock');
    END IF;
END;

--> Trigger #12 para la Tabla de Historial de Transferencias entre almacenes
CREATE OR REPLACE TRIGGER trg_inv_transferencias_almacenes
AFTER INSERT OR UPDATE OR DELETE ON INV_TransferenciasAlmacenes
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'INSERT', 'INV_TransferenciasAlmacenes');
    ELSIF UPDATING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'UPDATE', 'INV_TransferenciasAlmacenes');
    ELSIF DELETING THEN
        INSERT INTO INV_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'DELETE', 'INV_TransferenciasAlmacenes');
    END IF;
END;