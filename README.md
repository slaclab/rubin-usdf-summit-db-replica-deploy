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