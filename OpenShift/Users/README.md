## User management

#### Create a user

(Assuming you have admin privileges)

1. Create a service account - 'robot'

```cmd
oc create sa robot
```

2. Get the secret

```cmd
oc get robot | grep robot
```

Each service account automatically contains two secrets:

- An API token
- Credentials for the OpenShift Container Registry

3. Give permission to the sa (local binding and not cluster binding)

```cmd
oc policy add-role-to-user view system:serviceaccount:<project-name>:<service-account>
oc policy add-role-to-user view system:serviceaccount:default:robot
```

4. Login using the token

```cmd
oc login --token=<API_TOKEN>
```


See all cluster roles [here](https://docs.openshift.com/container-platform/4.1/authentication/using-rbac.html#default-roles_using-rbac)
