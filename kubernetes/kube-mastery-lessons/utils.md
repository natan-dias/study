# Kubernetes Utils

+ Commands

```
microk8s enable dashboard
```

Enable Dashboard for Kubernetes

``` 
token=$(microk8s kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)
microk8s kubectl -n kube-system describe secret $token 
```

Get token for Dashboard logon

```
kubectl attach --namespace=shpod -ti shpod
```
Access SHPOD for tools (POD from Brett Fischer)

+ Create SHPOD in kubernetes

```
kubectl apply -f https://k8smastery.com/shpod.yaml
kubectl attach --namespace=shpod -ti shpod
kubectl delete -f https://k8smastery.com/shpod.yaml
```
or
> kubectl apply -f https://bret.run/shpod.yml
>
> kubectl attach --namespace-shpod -it shpod


