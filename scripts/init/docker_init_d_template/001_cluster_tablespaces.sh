#!/usr/bin/env bash
# ==============================================================
# FILE:         001_cluster_tablespaces.sh
# SCOPE:        CLUSTER
# APPLIES_TO:   PostgreSQL cluster (not individual DBs)
# PURPOSE:      Create multiple tablespaces for optimum storage
# AUTHOR:       <<Enterprise Data Architecture Team>>
# VERSION:      1.0.0
# ENVIRONMENT:  prd (production)
# EXECUTION:    Should run inside /docker-entrypoint-initdb.d/
# DEPENDS_ON:   None
# LAST_UPDATED: 2024-12-05
# NOTES:
#     - This script is only applicable for self maintained postgres
#     - This entire script should be commented for any cloud managed postgres
#     - It creates the table spaces based on requirements
# ==============================================================

set -euo pipefail

# === CONFIGURE YOUR TABLESPACE DIRECTORIES HERE ===
PG_TBL_SPACE_BASE="/var/lib/postgresql/tablespaces"

declare -A TABLESPACES=(
  # Generic directory for storing the persistent data
  ["tbl_space_data"]="$PG_TBL_SPACE_BASE/data"
  # place indexes on a seperate drive or ssd to improve I/O
  ["tbl_space_index"]="$PG_TBL_SPACE_BASE/index"
  # very large tables on a bigger drive to save ie blobs, millions of rows
  ["tbl_space_large"]="$PG_TBL_SPACE_BASE/large"
  # Temp files of the database will be on a faster drive for peak performance
  ["tbl_space_temp"]="$PG_TBL_SPACE_BASE/temp"
)

# === CREATE DIRECTORIES ===
echo "Creating tablespace directories..."

for tbl_space_name in "${!TABLESPACES[@]}"; do
  dir="${TABLESPACES[$tbl_space_name]}"
  
  echo " - $tbl_space_name → $dir"

  # Create directory if missing
  mkdir -p "$dir"

  # Ensure proper owner & permissions
  chown postgres:postgres "$dir"
  chmod 700 "$dir"
done

echo "Tablespace directory setup complete."
