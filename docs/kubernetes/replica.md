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

## Auto-scalling

- `sudo kubectl create deployment web --image nginx`
- `sudo kubectl set resources deploy web --limits=memory=10Mi,cpu=6m`
- `sudo kubectl autoscale deployment web --min 1 --max 4`
- `sudo kubectl create service nodeport web --node-port 30009 --tcp 80:80`


## Debug

- `kubectl describe rs alex-nginx`
- `kubectl scale --replicas 4 deployment web`


### Sources

- [devopssec](https://devopssec.fr/article/gerer-manipuler-replicasets-kubernetes)
