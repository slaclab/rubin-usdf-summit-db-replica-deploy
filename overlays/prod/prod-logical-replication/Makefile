SECRET_PATH ?= secret/rubin/usdf-summitdb/logical-replica
S3_SECRET_PATH ?= secret/rubin/usdf-summitdb/logical-replica/s3
REPLICA_USER_SECRET_PATH ?= secret/rubin/usdf-summitdb/logical-replica/replica-user

get-secrets-from-vault:
	mkdir -p etc/.secrets/
	set -e; for i in username password; do vault kv get --field=$$i $(SECRET_PATH) > etc/.secrets/$$i ; done
	set -e; for i in access_key secret_key; do vault kv get --field=$$i $(S3_SECRET_PATH) > etc/.secrets/$$i ; done
	set -e; for i in replica_user replica_password; do vault kv get --field=$$i $(REPLICA_USER_SECRET_PATH) > etc/.secrets/$$i ; done

clean-secrets:
	rm -rf etc/.secrets/

run-apply:
	kubectl apply -k .

run-kustomize:
	kubectl kustomize .

dump: get-secrets-from-vault run-kustomize clean-secrets

apply: get-secrets-from-vault run-apply clean-secrets
