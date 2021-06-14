# Kubernetes Notes

### Some audit commands

> Kubectl get pods -w 
>
> kubectl get deploy -w

### Put some IP of one pod to a system variable.

> HASHER=$(kubectl get svc hasher -o go-template={{.spec.clusterIP}})

This command get clusterIP address of "hasher" pod.

### Docker.io login with PODMAN

> podman login docker.io/USERNAME -u=USERNAME

* To push some image

> podman commit -ID- -NAME-
>
> podman tag docker.io/USERNAME/IMAGENAME
>
> podman push docker.io/USERNAME/IMAGENAME