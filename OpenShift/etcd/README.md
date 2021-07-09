1. Enforce SELinux to be Permissive
```cmd
setenforce 0
getenforce

sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config
```
