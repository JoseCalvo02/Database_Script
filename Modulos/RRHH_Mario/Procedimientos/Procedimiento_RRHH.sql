
-- procedimiento para agregar un departamento

CREATE OR REPLACE PROCEDURE SP_AgregarDepartamento(
    p_departamentoID IN VARCHAR2,
    p_nombreDepartamento IN VARCHAR2,
    p_usuarioCrea IN VARCHAR2,
    p_fechaCrea IN date
)
AS
BEGIN
    INSERT INTO RRHH_Departamentos (
       departamentoID, nombreDepartamento, usuarioCrea, fechaCrea
    ) VALUES (
         p_departamentoID, p_nombreDepartamento,p_usuarioCrea,p_fechaCrea
    );
END;

