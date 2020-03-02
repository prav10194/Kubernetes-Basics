kubectl create -f deploy-definition.yaml
kubectl expose deployment myapp-pod-2 --type=LoadBalancer --port=8080

kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.3/manifests/metallb.yaml

cat <<EOF | kubectl create -f -
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: metallb-system
  name: config
data:
  config: |
    address-pools:
    - name: default
      protocol: layer2
      addresses:
      - 192.168.64.100-192.168.64.200
EOF

minikube service myapp-pod-2 --url