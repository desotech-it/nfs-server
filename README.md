# Kubernetes NFS Server

Create a deployment:

```
kubectl apply -f deploy/deploy-nfs-server.yaml
```

## environment variables
You will need to provide at the following 3 environment variables to configure the nfs exports:
* NFS_EXPORT_DIR_1
* NFS_EXPORT_DOMAIN_1
* NFS_EXPORT_OPTIONS_1

When the container is started, the environment variables are parsed and the following output is created in **/etc/exports** file:

`NFS_EXPORT_DIR_1` `NFS_EXPORT_DOMAIN_1`(`NFS_EXPORT_OPTIONS_1`)
for the example given the following line in **/etc/exports** would be created:

```
/nfs *(rw,insecure,no_subtree_check, no_root_squash, fsid=1)
```

To define multiple exports, just increment the index on the environment variables

## build command

```
docker build -t r.deso.tech/dsk/nfsserver:1.0 .
```

## mounting the nfs share from another host

```
mount -v -t nfs -o ro,nfsvers=3,nolock,proto=udp,port=2049 <ip_address_kubernetes_host>:/nfs /mnt/scratch
```

## Based on an idea

https://github.com/f-u-z-z-l-e/docker-nfs-server
