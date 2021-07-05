# Testing INGRESS-NGINX with Cheese

First, run ingress-nginx from file:

> kubectl apply -f ic-nginx-hn.yaml 

Next, create deployments and expose them:

> kubectl create deployment cheddar --image=errm/cheese:cheddar
>
> kubectl create deployment stilton --image=errm/cheese:stilton
>
> kubectl create deployment wensleydale --image=errm/cheese:wensleydale

EXPOSE:

> kubectl expose deployment cheddar --port=80
>
> kubectl expose deployment stilton --port=80
>
> kubectl expose deployment wensleydale --port=80

Create Ingress resources (Change A.B.C.D for your ClusterIP)

> kubectl apply -f ingress.yaml

## Annotations

To create a redirect with wildcard, just apply redirect.yaml
THIS ONLY WORKS WITH NGINX