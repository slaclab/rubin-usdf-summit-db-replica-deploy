unset PGPASSWORD; psql -d exposurelog -tAef table_rows.sql >tgt.out
