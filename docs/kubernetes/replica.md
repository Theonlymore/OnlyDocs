# Les ReplicaSet 

```yml
apiVersion: apps/v1 # Version de l'API qui prend en charge le replicasSets
kind: ReplicaSet # Type de deploiement
metadata:
  name: alex-nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: web # Indique de mettre 3 replicas pour les container qui on le label "web"
  template:
    metadata:
      labels:
        app: web # mettre un label pour les containers (car le matchLabels demande "web")
    spec:
      containers:
        - name: nginx
          image: nginx
```


## Debug

- kubectl describe rs alex-nginx


### Sources

- [devopssec](https://devopssec.fr/article/gerer-manipuler-replicasets-kubernetes)
