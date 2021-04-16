## Creating a cluster on azure cli

( Make sure you are connected to the correct azure account - to check run <b><i>az account</i></b> )

```cmd
az group create --name kubernetes-test-rg --location eastus

az aks create --resource-group kubernetes-test-rg --name test-cluster --node-count 1 --enable-addons monitoring --generate-ssh-keys

az aks get-credentials --resource-group kubernetes-test-rg --name test-cluster
```
