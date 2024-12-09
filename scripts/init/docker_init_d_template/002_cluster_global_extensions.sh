#!/usr/bin/env bash
# ==============================================================
#  FILE:         002_cluster_global_extensions.sh
#  SCOPE:        CLUSTER
#  APPLIES_TO:   PostgreSQL cluster (not individual DBs)
#  PURPOSE:      Install cluster level extensions
#  AUTHOR:       <<Enterprise Data Architecture Team>>
#  VERSION:      1.0.0
#  ENVIRONMENT:  prd (production)
#  EXECUTION:    Should run in a virual machine at an  os level
#  DEPENDS_ON:   None
#  LAST_UPDATED: 2024-12-04
#  NOTES:
#      - This script is to be run when run on vm like environment
#      - It installs necessary cluster level extensions.
#      - This Script is not applicable for container environment
# ==============================================================

# set -euo pipefail

# # ---------------------------------
# # -- Cluster OS Level Extensions
# # ---------------------------------

# # PG_VERSION must be provided e.g. 14.11, 15.2, 16, etc.
# PG_VERSION="${PG_VERSION:?PG_VERSION environment variable required}"

# # Extract major version (14, 15, 16, etc.)
# POSTGRES_MAJOR_VERSION="$(echo "$PG_VERSION" | sed -E 's/^([0-9]+).*/\1/')"

# echo "Using PostgreSQL major version: $POSTGRES_MAJOR_VERSION"

# echo "Installing OS-level extensions..."

# apt-get install -y \
#   "postgresql-${POSTGRES_MAJOR_VERSION}-pgaudit" \
#   || true

# echo "Done installing OS-level components."
