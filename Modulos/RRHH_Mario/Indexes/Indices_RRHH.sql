
-- Mejora el resultado de los nombres por departamento
Index for nombreDepartamento column
CREATE INDEX idx_nombreDepartamento ON RRHH_Departamentos(nombreDepartamento);

--Mostrar indice
SELECT INDEX_NAME, TABLE_NAME, UNIQUENESS, TABLE_OWNER, STATUS
FROM USER_INDEXES
WHERE TABLE_NAME = 'RRHH_Departamentos';

--Resulta beneficioso para consultas que filtran u ordenan datos en función de ambas columnas.
CREATE INDEX idx_fechaInicioContrato
ON RRHH_Contratos(empleadoID, fechaInicioContrato);
