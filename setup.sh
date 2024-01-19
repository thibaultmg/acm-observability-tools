# Start OCP cluster using clusterBot
# Login to the console with oc client

# Instal ACM operator.

## Clone repo if derectory doesn't exist
# [ -d "deploy" ] || git clone https://github.com/stolostron/deploy.git
# echo "2.9.2-SNAPSHOT-2024-01-16-20-56-29" > deploy/snapshot.ver
# cd deploy && ./start.sh --watch

# Install observability addon: https://access.redhat.com/documentation/en-us/red_hat_advanced_cluster_management_for_kubernetes/2.9/html/observability/enabling-observability-service

## Extract the pull secret from the cluster
export QUAY_TOKEN=$(oc get secret/pull-secret -n openshift-config -o=jsonpath='{.data.\.dockerconfigjson}')

## Update the pull secret in the manifest
sed -i 's/^  .dockerconfigjson: .*/  .dockerconfigjson: '"$QUAY_TOKEN"'/' manifests/pull-secret.yaml

## Create the resources
oc apply -f 'manifests/*'
