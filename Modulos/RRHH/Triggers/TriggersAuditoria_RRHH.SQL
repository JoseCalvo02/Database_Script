<<<<<<< HEAD
CREATE OR REPLACE TRIGGER RRHH_Empleados_AuditTrigger
AFTER INSERT OR UPDATE OR DELETE ON RRHH_Empleados
=======
--  Trigger for INSERT: (NO FUNCIONAN LOS TRIGGERS)

CREATE OR REPLACE TRIGGER InsertAuditTrigger
AFTER INSERT ON YourTransactionalTable
>>>>>>> beebcb603ce3baf86f76bc906d47d099c820c92f
FOR EACH ROW
DECLARE
    v_event_type VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_event_type := 'INSERT';
    ELSIF UPDATING THEN
        v_event_type := 'UPDATE';
    ELSIF DELETING THEN
        v_event_type := 'DELETE';
    END IF;

    INSERT INTO RRHH_AuditTrail (
        event_type,
        table_name,
        record_id,
        old_values,
        new_values,
        change_date,
        changed_by
    ) VALUES (
        v_event_type,
        'RRHH_Empleados',
        :OLD.empleadoID, -- Assuming empleadoID is the primary key
        CASE
            WHEN UPDATING THEN DBMS_LOB.SUBSTR(DBMS_METADATA.GET_DDL('TABLE', 'RRHH_Empleados'))
            ELSE NULL
        END,
        CASE
            WHEN INSERTING OR UPDATING THEN DBMS_LOB.SUBSTR(DBMS_METADATA.GET_DDL('TABLE', 'RRHH_Empleados'))
            ELSE NULL
        END,
        SYSTIMESTAMP,
        USER
    );
END;