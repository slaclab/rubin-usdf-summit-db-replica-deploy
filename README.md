# rubin-usdf-summitdb-replica

This is the repository for the deployment of a CNPG replica Postgres cluster in the USDF.   It stores the kubernetes manifests and kubernetes operator configurations.  Deployments are done currently through make files.  The CNPG replica feature is used that is described [here](https://cloudnative-pg.io/documentation/1.18/architecture/#deployments-across-kubernetes-clusters).

Below is the configuration to point at the cluster on the summit as a replication source.  The `replicauser` is configured on the summit db.

```
  bootstrap:
    pg_basebackup:
      database: ""
      owner: ""
      source: cnpg-cluster
  enableSuperuserAccess: true
  externalClusters:
  - connectionParameters:
      host: db-lhn.cp.lsst.org
      user: replicauser
    name: cnpg-cluster
    password:
      key: password
      name: source-db-replicauser
```

Users log at the usdf with a user called `usdf` that has SELECT only permissions to the exposurelog and narrativelog databases.

## Rebuild cluster

When the cluster falls out of sync with the summit database instance it needs to be rebuilt.  Below are instructions to rebuild.

* Delete cluster with `kubectl delete cluster summit-db-replica -n summit-db-replica`
* Rebuild the cluster by navigating to overlays/prod and apply the manifest with `kubectl apply -f cnpg-summitdb.yaml` or `make apply`
*  The rebuild will use pgbasebackup to restore data from the summit databse instance and takes a couple minutes to finish.  After replication is complete the pgbasebackup pod terminates and normal database pods are started.

## Logical Replication

To drop the subscription enter the below commands.

```
ALTER SUBSCRIPTION usdfsub DISABLE;
DROP SUBSCRIPTION usdfsub;
```

Apply the config with
```
cat exposurelog_all_tables_schemas.sql | kubectl exec -it summit-db-logical-replica-1 -n summit-db-logical-replica -- psql -d exposurelog
cat narrativelog_all_tables_schemas.sql | kubectl exec -it summit-db-logical-replica-1 -n summit-db-logical-replica -- psql -d narrativelog
cat nightreport_all_tables_schemas.sql | kubectl exec -it summit-db-logical-replica-1 -n summit-db-logical-replica -- psql -d nightreport
```


From the publisher check replication status with `select * from pg_stat_replication;`