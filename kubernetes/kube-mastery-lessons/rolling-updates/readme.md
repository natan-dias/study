### Testing rollout updates

To test rollout updates with this example app, do the following steps:

> kubectl apply -f dockercoins.yml
>
> kubectl set image deploy worker worker=dockercoins/worker:v0.2
>
> kubectl set image deploy worker worker=dockercoins/worker:v0.3

V.02 and 03 images are broken and you will see degradation on your app.

To check status:

> kubectl rollout status deploy worker

To undo changes:

> kubectl rollout undo deploy worker

To check history:

> kubectl rollout history deploy worker

To check annotations:

> kubectl describe replicasets -l app=worker | grep -A3 Annotations

To undo for a specific revision with UNDO command:

> kubectl rollout undo deploy worker --to-revision=1

To check current update startegy:

> kubectl get deploy -o json | jq ".items[] | {name:.metadata.name} + .spec.strategy.rollingUpdate"

