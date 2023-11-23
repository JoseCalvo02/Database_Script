
-- procedimiento para agregar un departamento

CREATE OR REPLACE PROCEDURE SP_AgregarDepartamento(
    p_departamentoID IN VARCHAR2,
    p_nombreDepartamento IN VARCHAR2
)
AS
BEGIN
    INSERT INTO RRHH_Departamentos (
       departamentoID, nombreDepartamento
    ) VALUES (
         p_departamentoID, p_nombreDepartamento
    );
END;

--Mostrar Procedimiento solo se cambia el texto
BEGIN
    SP_AgregarDepartamento('002', 'Administracion');
END;