# Postgres Client Connection

## PgAdmin 4

This section provides guidance on how to properly use pgadmin4 to connect to your postgres database efficiently.



A common hassle with the postgres database connection is postgres enables access to pg_database in default database public schema so when pgadmin4 connects the user can see all the databases in the cluster even if the user does not have access to connect to a specific database.

There is a simple hack for this you simply

Enter Below code in the Server
> Configuration >> Advanced Tab >> DB Restriction Type [SQL] >> DB Restriction

```sql
SELECT datname FROM pg_database
WHERE has_database_privilege(current_user, datname, 'CONNECT')
```

The above code alter the view such that users don't see the databases with they don't have connect privilleges to.
