export PGPASSWORD='xxx'
psql -aef disable.sql
psql -h usdf-summitdb-logical-replica-svc.sdf.slac.stanford.edu -d nightreport -U replicauser -aef drop_slot.sql
psql -aef add_replica.sql
