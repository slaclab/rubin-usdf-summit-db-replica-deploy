export PGPASSWORD=xxx; psql -h db-lhn.cp.lsst.org -U replicauser -d exposurelog -tAef table_rows.sql  >src.out
