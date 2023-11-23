-- Tabla de bitacora para el modulo de Departamentos
CREATE OR REPLACE TRIGGER trg_RRHH_Departamentos
AFTER INSERT OR UPDATE OR DELETE ON RRHH_Departamentos
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'INSERT', 'RRHH_Departamentos');
    ELSIF UPDATING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'UPDATE', 'RRHH_Departamentos');
    ELSIF DELETING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'DELETE', 'RRHH_Departamentos');
    END IF;
END;


-- Tabla de bitacora para el modulo de RRHH_Puestos
CREATE OR REPLACE TRIGGER trg_RRHH_Puestos
AFTER INSERT OR UPDATE OR DELETE ON RRHH_Puestos
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'INSERT', 'RRHH_Puestos');
    ELSIF UPDATING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'UPDATE', 'RRHH_Puestos');
    ELSIF DELETING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'DELETE', 'RRHH_Puestos');
    END IF;
END;

-- Tabla de bitacora para el modulo de RRHH_Empleados
CREATE OR REPLACE TRIGGER trg_RRHH_Empleados
AFTER INSERT OR UPDATE OR DELETE ON RRHH_Empleados
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'INSERT', 'RRHH_Empleados');
    ELSIF UPDATING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'UPDATE', 'RRHH_Empleados');
    ELSIF DELETING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'DELETE', 'RRHH_Empleados');
    END IF;
END;

-- Tabla de bitacora para el modulo de RRHH_Contratos
CREATE OR REPLACE TRIGGER trg_RRHH_Contratos
AFTER INSERT OR UPDATE OR DELETE ON RRHH_Contratos
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'INSERT', 'RRHH_Contratos');
    ELSIF UPDATING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'UPDATE', 'RRHH_Contratos');
    ELSIF DELETING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'DELETE', 'RRHH_Contratos');
    END IF;
END;

-- Tabla de bitacora para el modulo de RRHH_Salarios
CREATE OR REPLACE TRIGGER trg_RRHH_Salarios
AFTER INSERT OR UPDATE OR DELETE ON RRHH_Salarios
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'INSERT', 'RRHH_Salarios');
    ELSIF UPDATING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'UPDATE', 'RRHH_Salarios');
    ELSIF DELETING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'DELETE', 'RRHH_Salarios');
    END IF;
END;

-- Tabla de bitacora para el modulo de RRHH_Beneficios
CREATE OR REPLACE TRIGGER trg_RRHH_Beneficios
AFTER INSERT OR UPDATE OR DELETE ON RRHH_Beneficios
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'INSERT', 'RRHH_Beneficios');
    ELSIF UPDATING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'UPDATE', 'RRHH_Beneficios');
    ELSIF DELETING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'DELETE', 'RRHH_Beneficios');
    END IF;
END;

-- Tabla de bitacora para el modulo de RRHH_Evaluaciones
CREATE OR REPLACE TRIGGER trg_RRHH_Evaluaciones
AFTER INSERT OR UPDATE OR DELETE ON RRHH_Evaluaciones
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'INSERT', 'RRHH_Evaluaciones');
    ELSIF UPDATING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'UPDATE', 'RRHH_Evaluaciones');
    ELSIF DELETING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'DELETE', 'RRHH_Evaluaciones');
    END IF;
END;

-- Tabla de bitacora para el modulo de RRHH_Vacaciones
CREATE OR REPLACE TRIGGER trg_RRHH_Vacaciones
AFTER INSERT OR UPDATE OR DELETE ON RRHH_Vacaciones
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'INSERT', 'RRHH_Vacaciones');
    ELSIF UPDATING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'UPDATE', 'RRHH_Vacaciones');
    ELSIF DELETING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'DELETE', 'RRHH_Vacaciones');
    END IF;
END;

-- Tabla de bitacora para el modulo de RRHH_Ausencias
CREATE OR REPLACE TRIGGER trg_RRHH_Ausencias
AFTER INSERT OR UPDATE OR DELETE ON RRHH_Ausencias
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'INSERT', 'RRHH_Ausencias');
    ELSIF UPDATING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'UPDATE', 'RRHH_Ausencias');
    ELSIF DELETING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'DELETE', 'RRHH_Ausencias');
    END IF;
END;

-- Tabla de bitacora para el modulo de RRHH_Capacitaciones
CREATE OR REPLACE TRIGGER trg_RRHH_Capacitaciones
AFTER INSERT OR UPDATE OR DELETE ON RRHH_Capacitaciones
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'INSERT', 'RRHH_Capacitaciones');
    ELSIF UPDATING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'UPDATE', 'RRHH_Capacitaciones');
    ELSIF DELETING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'DELETE', 'RRHH_Capacitaciones');
    END IF;
END;

-- Tabla de bitacora para el modulo de RRHH_HistorialLaboral
CREATE OR REPLACE TRIGGER trg_RRHH_HistorialLaboral
AFTER INSERT OR UPDATE OR DELETE ON RRHH_HistorialLaboral
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'INSERT', 'RRHH_HistorialLaboral');
    ELSIF UPDATING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'UPDATE', 'RRHH_HistorialLaboral');
    ELSIF DELETING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'DELETE', 'RRHH_HistorialLaboral');
    END IF;
END;


-- Tabla de bitacora para el modulo de RRHH_Ingresos
CREATE OR REPLACE TRIGGER trg_RRHH_Ingresos
AFTER INSERT OR UPDATE OR DELETE ON RRHH_Ingresos
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'INSERT', 'RRHH_Ingresos');
    ELSIF UPDATING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'UPDATE', 'RRHH_Ingresos');
    ELSIF DELETING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'DELETE', 'RRHH_Ingresos');
    END IF;
END;

-- Tabla de bitacora para el modulo de RRHH_Deducciones
CREATE OR REPLACE TRIGGER trg_RRHH_Deducciones
AFTER INSERT OR UPDATE OR DELETE ON RRHH_Deducciones
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'INSERT', 'RRHH_Deducciones');
    ELSIF UPDATING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'UPDATE', 'RRHH_Deducciones');
    ELSIF DELETING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'DELETE', 'RRHH_Deducciones');
    END IF;
END;

-- Tabla de bitacora para el modulo de RRHH_Planilla
CREATE OR REPLACE TRIGGER trg_RRHH_Planilla
AFTER INSERT OR UPDATE OR DELETE ON RRHH_Planilla
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'INSERT', 'RRHH_Planilla');
    ELSIF UPDATING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'UPDATE', 'RRHH_Planilla');
    ELSIF DELETING THEN
        INSERT INTO RRHH_Bitacora (fechaHora, usuario, tipoMovimiento, entidadAfectada)
        VALUES (SYSTIMESTAMP, USER, 'DELETE', 'RRHH_Planilla');
    END IF;
END;