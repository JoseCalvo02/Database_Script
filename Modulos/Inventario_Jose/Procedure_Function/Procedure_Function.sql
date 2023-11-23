--------------------------------------------
----> PUNTO #1 - Procedimiento         <----
--------------------------------------------
-- Procedimiento para agregar un nuevo producto
CREATE OR REPLACE PROCEDURE SP_AgregarProducto(
    p_productoID IN VARCHAR2,
    p_nombre IN VARCHAR2,
    p_descripcion IN VARCHAR2,
    p_costo IN NUMBER,
    p_categoriaID IN VARCHAR2,
    p_marcaID IN VARCHAR2,
    p_garantiaID IN VARCHAR2
)
AS
BEGIN
    INSERT INTO INV_Productos (
        productoID, nombre, descripcion, costo, categoriaID, marcaID, garantiaID
    ) VALUES (
        p_productoID, p_nombre, p_descripcion, p_costo, p_categoriaID, p_marcaID, p_garantiaID
    );
END;

-- Ejemplo para ejecutarlo
EXEC SP_AgregarProducto('P001', 'Nuevo Producto', 'Descripción del producto', 100.00, 'CA01', 'MA01', 'GA01');

--------------------------------------------
----> PUNTO #1 - Función               <----
--------------------------------------------
-- Función para obtener el costo promedio de productos por categoría
CREATE OR REPLACE FUNCTION FN_CostoPromedioPorCategoria(
    p_categoriaID IN VARCHAR2
) RETURN NUMBER
AS
    v_costoPromedio NUMBER;
BEGIN
    SELECT AVG(costo)
    INTO v_costoPromedio
    FROM INV_Productos
    WHERE categoriaID = p_categoriaID;

    RETURN NVL(v_costoPromedio, 0); -- Retorna 0 si no se encuentran productos en la categoría
END;

-- Ejecutar función
DECLARE
    categoriaID_param VARCHAR2(4) := 'CA01';
    costoPromedio NUMBER;
BEGIN
    costoPromedio := FN_CostoPromedioPorCategoria(categoriaID_param);
    DBMS_OUTPUT.PUT_LINE('Costo Promedio: ' || costoPromedio);
END;