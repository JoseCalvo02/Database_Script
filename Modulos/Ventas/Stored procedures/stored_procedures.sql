CREATE OR REPLACE PROCEDURE check_descuento_producto(producto_id  VARCHAR, descuento_id VARCHAR2)
IS
    product_descuento_exist VARCHAR2(10);
BEGIN
    SELECT  
        CASE
            WHEN COUNT(*) > 0 THEN 'true'
            ELSE 'false'
        END INTO product_descuento_exist
    FROM VEN_Descuentos_Productos WHERE  productoID = producto_id AND descuentoID = descuento_id;
    
    IF(producto_id IS NULL) OR (descuento_id IS NULL) OR (product_descuento_exist = 'true')THEN 
       DBMS_OUTPUT.PUT_LINE('El producto ya tiene un descuento asociado, o los parametros son invalidos');
    ELSE
        INSERT INTO VEN_Descuentos_Productos(descuentoID,productoID,fecha)
        VALUES (producto_id, descuento_id, SYSDATE);
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
