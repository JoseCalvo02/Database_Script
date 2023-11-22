CREATE SEQUENCE bitacora_id_seq;

CREATE TABLE bitacora (
    id NUMBER PRIMARY KEY,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario VARCHAR2(50) NOT NULL,
    tipo_movimiento VARCHAR2(10) NOT NULL,
    entidad VARCHAR2(100) NOT NULL
);

/***********************TRIGGER DE VEN_Clientes**************************************/
CREATE OR REPLACE TRIGGER VEN_Clientes_trigger
AFTER INSERT OR UPDATE OR DELETE ON VEN_Clientes
FOR EACH ROW
DECLARE
    v_tipo_movimiento VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_tipo_movimiento := 'INSERT';
    ELSIF UPDATING THEN
        v_tipo_movimiento := 'UPDATE';
    ELSIF DELETING THEN
        v_tipo_movimiento := 'DELETE';
    END IF;
    
    INSERT INTO bitacora (id,fecha, usuario, tipo_movimiento, entidad)
    VALUES (bitacora_id_seq.NEXTVAL,SYSTIMESTAMP, USER, v_tipo_movimiento, 'VEN_Clientes');
END;



/***********************TRIGGER DE VEN_Pedidos**************************************/
CREATE OR REPLACE TRIGGER VEN_Pedidos_trigger
AFTER INSERT OR UPDATE OR DELETE ON VEN_Pedidos
FOR EACH ROW
DECLARE
    v_tipo_movimiento VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_tipo_movimiento := 'INSERT';
    ELSIF UPDATING THEN
        v_tipo_movimiento := 'UPDATE';
    ELSIF DELETING THEN
        v_tipo_movimiento := 'DELETE';
    END IF;
    
    INSERT INTO bitacora (id,fecha, usuario, tipo_movimiento, entidad)
    VALUES (bitacora_id_seq.NEXTVAL, SYSTIMESTAMP, USER, v_tipo_movimiento, 'VEN_Pedidos');
END;



/***********************TRIGGER DE VEN_Pedidos_productos**************************************/
CREATE OR REPLACE TRIGGER  VEN_Pedidos_productos_trigger
AFTER INSERT OR UPDATE OR DELETE ON VEN_Pedidos_productos 
FOR EACH ROW
DECLARE
    v_tipo_movimiento VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_tipo_movimiento := 'INSERT';
    ELSIF UPDATING THEN
        v_tipo_movimiento := 'UPDATE';
    ELSIF DELETING THEN
        v_tipo_movimiento := 'DELETE';
    END IF;
    
    INSERT INTO bitacora (id,fecha, usuario, tipo_movimiento, entidad)
    VALUES (bitacora_id_seq.NEXTVAL,SYSTIMESTAMP, USER, v_tipo_movimiento, 'VEN_Pedidos_productos');
END;





/***********************TRIGGER DE VEN_Pedidos_productos**************************************/
CREATE OR REPLACE TRIGGER  VEN_Vendedores_trigger
AFTER INSERT OR UPDATE OR DELETE ON VEN_Vendedores  
FOR EACH ROW
DECLARE
    v_tipo_movimiento VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_tipo_movimiento := 'INSERT';
    ELSIF UPDATING THEN
        v_tipo_movimiento := 'UPDATE';
    ELSIF DELETING THEN
        v_tipo_movimiento := 'DELETE';
    END IF;
    
    INSERT INTO bitacora (id,fecha, usuario, tipo_movimiento, entidad)
   VALUES (bitacora_id_seq.NEXTVAL,SYSTIMESTAMP, USER, v_tipo_movimiento, 'VEN_Vendedores ');
END;







/***********************TRIGGER DE VEN_Encabezado_factura**************************************/
CREATE OR REPLACE TRIGGER  VEN_Encabezado_factura_trigger
AFTER INSERT OR UPDATE OR DELETE ON VEN_Encabezado_factura  
FOR EACH ROW
DECLARE
    v_tipo_movimiento VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_tipo_movimiento := 'INSERT';
    ELSIF UPDATING THEN
        v_tipo_movimiento := 'UPDATE';
    ELSIF DELETING THEN
        v_tipo_movimiento := 'DELETE';
    END IF;
    
    INSERT INTO bitacora (id,fecha, usuario, tipo_movimiento, entidad)
    VALUES (bitacora_id_seq.NEXTVAL,SYSTIMESTAMP, USER, v_tipo_movimiento, 'VEN_Encabezado_factura');
END;


/***********************TRIGGER DE VEN_Encabezado_factura**************************************/
CREATE OR REPLACE TRIGGER  VEN_Detalle_factura_trigger
AFTER INSERT OR UPDATE OR DELETE ON VEN_Detalle_factura
FOR EACH ROW
DECLARE
    v_tipo_movimiento VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_tipo_movimiento := 'INSERT';
    ELSIF UPDATING THEN
        v_tipo_movimiento := 'UPDATE';
    ELSIF DELETING THEN
        v_tipo_movimiento := 'DELETE';
    END IF;
    
    INSERT INTO bitacora (id,fecha, usuario, tipo_movimiento, entidad)
    VALUES (bitacora_id_seq.NEXTVAL,SYSTIMESTAMP, USER, v_tipo_movimiento, 'VEN_Detalle_factura');
END;


/***********************TRIGGER DE VEN_Descuentos**************************************/
CREATE OR REPLACE TRIGGER VEN_Descuentos_trigger
AFTER INSERT OR UPDATE OR DELETE ON VEN_Descuentos
FOR EACH ROW
DECLARE
    v_tipo_movimiento VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_tipo_movimiento := 'INSERT';
    ELSIF UPDATING THEN
        v_tipo_movimiento := 'UPDATE';
    ELSIF DELETING THEN
        v_tipo_movimiento := 'DELETE';
    END IF;
    
    INSERT INTO bitacora (id,fecha, usuario, tipo_movimiento, entidad)
    VALUES (bitacora_id_seq.NEXTVAL,SYSTIMESTAMP, USER, v_tipo_movimiento, 'VEN_Descuentos');
END;



/***********************TRIGGER DE VEN_Descuentos**************************************/
CREATE OR REPLACE TRIGGER VEN_Historial_Ventas_trigger
AFTER INSERT OR UPDATE OR DELETE ON VEN_Historial_Ventas
FOR EACH ROW
DECLARE
    v_tipo_movimiento VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_tipo_movimiento := 'INSERT';
    ELSIF UPDATING THEN
        v_tipo_movimiento := 'UPDATE';
    ELSIF DELETING THEN
        v_tipo_movimiento := 'DELETE';
    END IF;
    
    INSERT INTO bitacora (id,fecha, usuario, tipo_movimiento, entidad)
    VALUES (bitacora_id_seq.NEXTVAL,SYSTIMESTAMP, USER, v_tipo_movimiento, 'VEN_Historial_Ventas');
END;



/***********************TRIGGER DE  VEN_Metodo_pago**************************************/
CREATE OR REPLACE TRIGGER  VEN_Metodo_pago_trigger
AFTER INSERT OR UPDATE OR DELETE ON VEN_Metodo_pago 
FOR EACH ROW
DECLARE
    v_tipo_movimiento VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_tipo_movimiento := 'INSERT';
    ELSIF UPDATING THEN
        v_tipo_movimiento := 'UPDATE';
    ELSIF DELETING THEN
        v_tipo_movimiento := 'DELETE';
    END IF;
    
    INSERT INTO bitacora (id,fecha, usuario, tipo_movimiento, entidad)
   VALUES (bitacora_id_seq.NEXTVAL,SYSTIMESTAMP, USER, v_tipo_movimiento, 'VEN_Metodo_pago');
END;

/***********************TRIGGER DE VEN_Factura_metodo_pago**************************************/
CREATE OR REPLACE TRIGGER  VENFactura_met_pago_trigger
AFTER INSERT OR UPDATE OR DELETE ON VEN_Factura_metodo_pago
FOR EACH ROW
DECLARE
    v_tipo_movimiento VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_tipo_movimiento := 'INSERT';
    ELSIF UPDATING THEN
        v_tipo_movimiento := 'UPDATE';
    ELSIF DELETING THEN
        v_tipo_movimiento := 'DELETE';
    END IF;
    
    INSERT INTO bitacora (id,fecha, usuario, tipo_movimiento, entidad)
    VALUES (bitacora_id_seq.NEXTVAL,SYSTIMESTAMP, USER, v_tipo_movimiento, 'VEN_Factura_metodo_pago');
END;


/***********************TRIGGER DE VEN_Factura_metodo_pago**************************************/
CREATE OR REPLACE TRIGGER  VEN_Envios_trigger
AFTER INSERT OR UPDATE OR DELETE ON VEN_Envios
FOR EACH ROW
DECLARE
    v_tipo_movimiento VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_tipo_movimiento := 'INSERT';
    ELSIF UPDATING THEN
        v_tipo_movimiento := 'UPDATE';
    ELSIF DELETING THEN
        v_tipo_movimiento := 'DELETE';
    END IF;
    
    INSERT INTO bitacora (id,fecha, usuario, tipo_movimiento, entidad)
   VALUES (bitacora_id_seq.NEXTVAL,SYSTIMESTAMP, USER, v_tipo_movimiento,  'VEN_Envios');
END;





/***********************TRIGGER DE VEN_Envios_detalle**************************************/
CREATE OR REPLACE TRIGGER  VEN_Envios_detalle_trigger
AFTER INSERT OR UPDATE OR DELETE ON VEN_Envios_detalle
FOR EACH ROW
DECLARE
    v_tipo_movimiento VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_tipo_movimiento := 'INSERT';
    ELSIF UPDATING THEN
        v_tipo_movimiento := 'UPDATE';
    ELSIF DELETING THEN
        v_tipo_movimiento := 'DELETE';
    END IF;
    
    INSERT INTO bitacora (id,fecha, usuario, tipo_movimiento, entidad)
    VALUES (bitacora_id_seq.NEXTVAL,SYSTIMESTAMP, USER, v_tipo_movimiento,  'VEN_Envios_detalle');
END;

/***********************TRIGGER DE  VEN_Promociones**************************************/
CREATE OR REPLACE TRIGGER   VEN_Promociones_trigger
AFTER INSERT OR UPDATE OR DELETE ON  VEN_Promociones
FOR EACH ROW
DECLARE
    v_tipo_movimiento VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_tipo_movimiento := 'INSERT';
    ELSIF UPDATING THEN
        v_tipo_movimiento := 'UPDATE';
    ELSIF DELETING THEN
        v_tipo_movimiento := 'DELETE';
    END IF;
    
    INSERT INTO bitacora (id,fecha, usuario, tipo_movimiento, entidad)
  VALUES (bitacora_id_seq.NEXTVAL,SYSTIMESTAMP, USER, v_tipo_movimiento,  ' VEN_Promociones');
END;


/***********************TRIGGER DE VEN_Devoluciones**************************************/
CREATE OR REPLACE TRIGGER   VEN_Devoluciones_trigger
AFTER INSERT OR UPDATE OR DELETE ON VEN_Devoluciones
FOR EACH ROW
DECLARE
    v_tipo_movimiento VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_tipo_movimiento := 'INSERT';
    ELSIF UPDATING THEN
        v_tipo_movimiento := 'UPDATE';
    ELSIF DELETING THEN
        v_tipo_movimiento := 'DELETE';
    END IF;
    
    INSERT INTO bitacora (id,fecha, usuario, tipo_movimiento, entidad)
   VALUES (bitacora_id_seq.NEXTVAL,SYSTIMESTAMP, USER, v_tipo_movimiento,  'VEN_Devoluciones');
END;

/***********************TRIGGER DE VEN_Calificaciones_Cliente**************************************/
CREATE OR REPLACE TRIGGER  VEN_Califi_Clientes_trigger
AFTER INSERT OR UPDATE OR DELETE ON VEN_Calificaciones_Clientes
FOR EACH ROW
DECLARE
    v_tipo_movimiento VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_tipo_movimiento := 'INSERT';
    ELSIF UPDATING THEN
        v_tipo_movimiento := 'UPDATE';
    ELSIF DELETING THEN
        v_tipo_movimiento := 'DELETE';
    END IF;
    
    INSERT INTO bitacora (id,fecha, usuario, tipo_movimiento, entidad)
  VALUES (bitacora_id_seq.NEXTVAL,SYSTIMESTAMP, USER, v_tipo_movimiento,  'VEN_Calificaciones_Clientes');
END;

commit;


SELECT  * FROM bitacora;
