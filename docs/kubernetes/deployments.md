# Deployments

Le "Deployments" est un niveau d'abstraction superieur ( pods > replicaSets > deployments )

## Création d'un Deployments

```yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: alex-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
```

## Debug

- `kubectl get deploy`

### Sources

- [devopssec](https://devopssec.fr/article/gerer-manipuler-deployments-kubernetes)

