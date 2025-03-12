#!/bin/bash

set -eu

# Set variables
PRIMARY_SQL_POD="summit-db-logical-replica-1"
CONSDB_REPO_DIR="../../consdb"
CONSDB_TAG="25.3.1"
CDB_BOOTSTRAP_SQL="../overlays/prod-logical-replication/sql/cdb/cdb_bootstrap.sql"
EXPOSURELOG_BOOTSTRAP_SQL="../overlays/prod-logical-replication/sql/exposurelog/exposurelog_bootstrap.sql"
EXPOSURELOG_DB="exposurelog"

apply_sql_kubectl() {
    cat $1 | kubectl exec -it $PRIMARY_SQL_POD -n summit-db-logical-replica -- psql -d $2
}

# Clear cdb schema and data
#apply_sql_kubectl $EXPOSURELOG_BOOTSTRAP_SQL $EXPOSURELOG_DB
#cat ../overlays/prod-logical-replication/sql/cdb/cdb_bootstrap.sql | kubectl exec -it $PRIMARY_SQL_POD -n summit-db-logical-replica -- psql -d exposurelog
#cat ../overlays/prod-logical-replication/sql/exposurelog/exposurelog_bootstrap.sql | kubectl exec -it $PRIMARY_SQL_POD -n summit-db-logical-replica -- psql -d exposurelog

# Setup cdb environment
#cd $CONSDB_REPO_DIR
cd $CONSDB_REPO_DIR
pwd
git checkout $CONSDB_TAG
git pull
#source /sdf/group/rubin/sw/w_latest/loadLSST.sh
#setup sdm_schemas
#setup felis
#CONSDB_URL=postgresql://oods@usdf-summitdb-replica.slac.stanford.edu/exposurelog

# Run Alembic
#alembic -n latiss upgrade head
#alembic -n lsstcomcam upgrade head
#alembic -n lsstcomcamsim upgrade head
#alembic -n startrackerfast upgrade head
#alembic -n startrackerwide upgrade head
#alembic -n startrackernarrow upgrade head