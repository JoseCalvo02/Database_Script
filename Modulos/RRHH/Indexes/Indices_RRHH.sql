
-- Mejora el rendimiento de consultas que implican buscar o unirse según la columna `empleadoID` en la tabla `RRHH_Empleados`.
CREATE INDEX idx_empleadoID -- (NO ESTA FUNCIONANDO)
ON RRHH_Empleados(empleadoID);

--Resulta beneficioso para consultas que filtran u ordenan datos en función de ambas columnas.
CREATE INDEX idx_fechaInicioContrato
ON RRHH_Contratos(empleadoID, fechaInicioContrato);
