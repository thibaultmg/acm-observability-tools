oc create configmap image-override -n open-cluster-management --from-file=image-override.json 

oc annotate mch multiclusterhub -n open-cluster-management --overwrite mch-imageOverridesCM=image-override