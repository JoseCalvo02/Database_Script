 -- Crea role para el módulo
CREATE ROLE rrhh_role;

-- Otorgar grant con privilegios sobre las tablas ===> LISTO
GRANT ALL PRIVILEGES ON RRHH_Departamentos TO rrhh_role;
GRANT ALL PRIVILEGES ON RRHH_Puestos TO rrhh_role;
GRANT ALL PRIVILEGES ON RRHH_Empleados TO rrhh_role;
GRANT ALL PRIVILEGES ON RRHH_Contratos TO rrhh_role;
GRANT ALL PRIVILEGES ON RRHH_Salarios TO rrhh_role;
GRANT ALL PRIVILEGES ON RRHH_Beneficios TO rrhh_role;
GRANT ALL PRIVILEGES ON RRHH_Evaluaciones TO rrhh_role;
GRANT ALL PRIVILEGES ON RRHH_Vacaciones TO rrhh_role;
GRANT ALL PRIVILEGES ON RRHH_Ausencias TO rrhh_role;
GRANT ALL PRIVILEGES ON RRHH_Capacitaciones TO rrhh_role;
GRANT ALL PRIVILEGES ON RRHH_HistorialLaboral TO rrhh_role;
GRANT ALL PRIVILEGES ON RRHH_Ingresos TO rrhh_role;
GRANT ALL PRIVILEGES ON RRHH_Deducciones TO rrhh_role;
GRANT ALL PRIVILEGES ON RRHH_Planilla TO rrhh_role;
GRANT ALL PRIVILEGES ON RRHH_PlanillaIngresos TO rrhh_role;
GRANT ALL PRIVILEGES ON RRHH_PlanillaDeducciones TO rrhh_role;
