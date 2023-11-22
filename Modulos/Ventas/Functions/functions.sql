CREATE OR REPLACE FUNCTION obtener_ubicacion_envio(ubicacion_id VARCHAR2)

RETURN DATE

AS
    fecha_envio DATE;
BEGIN
    SELECT fechaEnvio INTO fecha_envio FROM VEN_Envios WHERE ubicacionID = ubicacion_id;
    RETURN NVL(fecha_envio,'NOT FOUND');
    
END;

