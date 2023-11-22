--> Trigger #12 para la Tabla de Historial de Transferencias entre almacenes
CREATE OR REPLACE TRIGGER trg_ven_bitacora
AFTER INSERT OR UPDATE OR DELETE ON VEN_Bitacora
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO VEN_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'INSERT', 'INV_TransferenciasAlmacenes');
    ELSIF UPDATING THEN
        INSERT INTO VEN_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'UPDATE', 'INV_TransferenciasAlmacenes');
    ELSIF DELETING THEN
        INSERT INTO VEN_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'DELETE', 'INV_TransferenciasAlmacenes');
    END IF;
END;
