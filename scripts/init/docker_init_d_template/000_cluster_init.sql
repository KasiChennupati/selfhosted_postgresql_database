/* ============================================================
  FILE:         000_cluster_init.sql
  SCOPE:        CLUSTER
  APPLIES_TO:   PostgreSQL cluster (not individual DBs)
  PURPOSE:      Initialize cluster-level settings and configuration.
  AUTHOR:       <<Enterprise Data Architecture Team>>
  VERSION:      1.0.0
  ENVIRONMENT:  prd (production)
  EXECUTION:    Should run inside /docker-entrypoint-initdb.d/
  DEPENDS_ON:   None
  LAST_UPDATED: 2024-12-04
  NOTES:
      - This script is idempotent where possible.
      - It sets timezone, behaviour, logs, and locks down privileges.
      - Provides a base line cluster configuration
      - Edit postgresql.conf file for server and container hosted postgres instance.
============================================================ */

-- -----------------------------
-- Cluster system settings
-- -----------------------------

-- Cluster timezone (DBs can override)
ALTER SYSTEM SET timezone = 'UTC';

-- Ensure SCRAM is used for hashing
ALTER SYSTEM SET password_encryption = 'scram-sha-256';

-- Improve logging
ALTER SYSTEM SET log_min_error_statement = 'error';
ALTER SYSTEM SET log_min_duration_statement = 100;  -- log slow queries > 100ms
