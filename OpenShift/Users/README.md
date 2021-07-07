## User management

#### Create a user

(Assuming you have admin privileges)

1. Create a service account - 'robot'

```cmd
oc create sa robot
oc describe secret
```

2. Get the secret

```cmd
oc get secret | grep robot
oc describe secret  <secret-name>
```

Each service account automatically contains two secrets:

- An API token
- Credentials for the OpenShift Container Registry

3. Give permission to the sa (local binding and not cluster binding)

```cmd
oc policy add-role-to-user view system:serviceaccount:<project-name>:<service-account>
oc policy add-role-to-user view system:serviceaccount:default:robot
```

Confirm if the role is added by running the following command - 

```cmd
oc describe rolebinding.rbac -n default | grep robot
```
For more information run the above command without the grep. You will see the following output - 

```yaml
...
Name:         view-0
Labels:       <none>
Annotations:  <none>
Role:
  Kind:  ClusterRole
  Name:  view
Subjects:
  Kind            Name   Namespace
  ----            ----   ---------
  ServiceAccount  robot  default
 ```
 
4. Login using the token (secret from step 2)

```cmd
oc login --token=<API_TOKEN>
```

5. Try creating the pod in pod.yaml and you will get an error 

```cmd
oc create -f pod.yaml
```
**Error from server (Forbidden): error when creating "test-pod.yaml": pods is forbidden: User "system:serviceaccount:default:robot2" cannot create resource "pods" in API group "" in the namespace "default"**

6. Login back to your admin account and add edit permission to the sa

```cmd
oc policy add-role-to-user edit system:serviceaccount:default:robot
```

7. Login back using 'robot' credentials and run the create command again. This time it should create the resource. 

See all cluster roles [here](https://docs.openshift.com/container-platform/4.1/authentication/using-rbac.html#default-roles_using-rbac)
