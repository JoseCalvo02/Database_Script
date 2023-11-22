--  Trigger for INSERT: (NO FUNCIONAN LOS TRIGGERS)

CREATE OR REPLACE TRIGGER InsertAuditTrigger
AFTER INSERT ON YourTransactionalTable
FOR EACH ROW
DECLARE
    v_old_values CLOB;
    v_new_values CLOB;
BEGIN
    v_new_values := 'New values: ' || DBMS_METADATA.GET_DDL('TABLE', 'YourTransactionalTable', USER);
    
    INSERT INTO AuditTrail (
        event_type, 
        table_name, 
        record_id,
        old_values,
        new_values,
        change_date,
        changed_by
    )
    VALUES (
        'INSERT',
        'YourTransactionalTable',
        :NEW.id,
        v_old_values,
        v_new_values,
        SYSTIMESTAMP,
        USER
    );
END InsertAuditTrigger;

-- Trigger for UPDATE:

CREATE OR REPLACE TRIGGER UpdateAuditTrigger
AFTER UPDATE ON YourTransactionalTable
FOR EACH ROW
DECLARE
    v_old_values CLOB;
    v_new_values CLOB;
BEGIN
    v_old_values := 'Old values: ' || DBMS_METADATA.GET_DDL('TABLE', 'YourTransactionalTable', USER);
    v_new_values := 'New values: ' || DBMS_METADATA.GET_DDL('TABLE', 'YourTransactionalTable', USER);

    INSERT INTO AuditTrail (
        event_type, 
        table_name, 
        record_id,
        old_values,
        new_values,
        change_date,
        changed_by
    )
    VALUES (
        'UPDATE',
        'YourTransactionalTable',
        :NEW.id,
        v_old_values,
        v_new_values,
        SYSTIMESTAMP,
        USER
    );
END UpdateAuditTrigger;

-- Trigger for DELETE:

CREATE OR REPLACE TRIGGER DeleteAuditTrigger
AFTER DELETE ON YourTransactionalTable
FOR EACH ROW
DECLARE
    v_old_values CLOB;
BEGIN
    v_old_values := 'Old values: ' || DBMS_METADATA.GET_DDL('TABLE', 'YourTransactionalTable', USER);

    INSERT INTO AuditTrail (
        event_type, 
        table_name, 
        record_id,
        old_values,
        new_values,
        change_date,
        changed_by
    )
    VALUES (
        'DELETE',
        'YourTransactionalTable',
        :OLD.id, -- Change this to the appropriate primary key or unique identifier
        v_old_values,
        NULL,
        SYSTIMESTAMP,
        USER
    );
END DeleteAuditTrigger;