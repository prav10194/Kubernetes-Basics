* kubectl apply -f pv.yaml
* kubectl apply -f pvc.yaml
* kubectl apply -f pod1.yaml

save a file in data folder in pod

* minikube ssh 

check in /demo folder file exists

create another pod - pod2.yaml and check if file is there in /data. You can also delete and restart the pod to check file is still there or not.


Also if we don't want to define any pv, we can just apply pvc with storageClassName removed. In that case, ot will use the defaultStorageClass for the cluster. 

