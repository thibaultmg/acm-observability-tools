kubectl annotate mch multiclusterhub -n open-cluster-management mch-imageOverridesCM= --overwrite
kubectl delete configmap image-override -n open-cluster-management