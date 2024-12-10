# Postgres Table DDL Audit Columns

For OLTP and OLAP systems or for any systems there should be a default list of column sthat should be added for every table to enable a certain level of auditability and traceability.

## Audit Columns

### Standard Audit Columns

| Column Name   | Data Type                           | Description                                                      |
| ------------- | ----------------------------------- | ---------------------------------------------------------------- |
| db_created_by | varchar or uuid                     | postgres or the system or the session id that created the record |
| db_created_at | (default) timestamp , UTC preferred | Timestamp when the record was created at                         |
| db_updated_by | varchar or uuid                     | postgres or the system or the session id that updated the record |
| db_updated_at | (default) timestamp , UTC preferred | Timestamp when the record was updated at                         |
| db_deleted_by | varchar or uuid                     | postgres or the system or the session id that deleted the record |
| db_deleted_at | timestamp , UTC preferred           | Timestamp when the record was deleted at                         |

#### Drop in Postgres DDL

```sql

    -- Standard Audit columns DDL
    db_created_by varchar, --UUID
    db_created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    db_updated_by varchar, --UUID
    db_updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    db_deleted_by varchar, --UUID
    db_deleted_at TIMESTAMP WITH TIME ZONE,

```

### Extended Audit Columns

| Column Name       | Data Type      | Description |
| ----------------- | -------------- | ----------- |
| source_ip         | VARCHAR        | em thate rd |
| user_agent        |                |             |
| change_reason     | TEXT           |             |
| version_number    | INTEGER        |             |
| change_type       |                |             |
| audit_id          | UUID or BIGINT |             |
| extra_audit_attrs | JSON           |             |

```sql
-- Extended Audit columns DDL
source_ip          inet,                               -- IP address of source
user_agent         text,                               -- User-Agent string
change_reason      text,                               -- Optional description
version_number     integer DEFAULT 1,                   -- Revision/version
change_type        varchar(50),                         -- INSERT/UPDATE/DELETE etc.
audit_id           uuid DEFAULT gen_random_uuid(),      -- Unique audit event ID
event_ts           timestamptz DEFAULT now(),           -- Timestamp of action
extra_audit_attrs  jsonb DEFAULT '{}'::jsonb            -- Additional metadata

```
