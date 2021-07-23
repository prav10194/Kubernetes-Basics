## Falco

Runtime security tool. 

#### Problems they solve - 

1. Keep a lookout for unwanted read/writes
2. Network activity
3. Spawing a shell in privileged container?
4. Are my hosts and containers doing something they shouldn't. 

#### Architecture

![image](https://user-images.githubusercontent.com/8276139/126784260-05b58552-cacf-4ec5-aa0f-844e63ce6933.png)

#### Setting up Falco on K8s cluster (on DigitalOcean)

```cd
export RELEASE=$(curl -s https://api.github.com/repos/kubeless/kubeless/releases/latest | grep tag_name | cut -d '"' -f 4)
kubectl create ns kubeless
kubectl create -f https://github.com/kubeless/kubeless/releases/download/$RELEASE/kubeless-$RELEASE.yaml
kubectl create ns falco
helm repo add falcosecurity https://falcosecurity.github.io/charts
helm install falco falcosecurity/falco --set falco.jsonOutput=true --set falco.httpOutput.enabled=true --set falco.httpOutput.url=http://falcosidekick:2801 -n falco
helm install falcosidekick falcosecurity/falcosidekick --set config.kubeless.namespace=kubeless --set config.kubeless.function=delete-pod --set webui.enabled=true -n falco
kubectl port-forward svc/falcosidekick 2801:2801 --namespace falco
```

Check your dashboard [here](http://localhost:2802/ui/#/events)

To test run the following command and you will see an event generated
```cd
kubectl run alpine -n default --image=alpine --restart='Never' -- sh -c "sleep 600"
```
