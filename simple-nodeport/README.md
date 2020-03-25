In deployment.yaml, 

spec.selector.matchLabels = spec.template.metadata.labels = spec.selector

Metadata labels (in Pod) = Spec selector (in Service)

* kubectl create -f service-definiation.yaml 
* kubectl create -f pod-definition.yaml
* kubectl create -f pod-definition-2.yaml
* kubectl delete svc myapp-service
* kubectl delete pod --all
