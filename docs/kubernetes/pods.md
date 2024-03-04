# Pods

Les pods sont la plus petite unité dans kub.

Ces un groupe d'un ou plusieurs conteneurs avec stockage et réseau.


## Création du Pod

- `kubectl create` : permet de crée des objet Kubernetes

### Pod avec 1 conteneur

nginx-pod.yml
```yml
apiVersion: v1
kind: Pod
metadata:
  labels:
    type: web 
  name: nginx
spec:
  containers:
  - image: nginx
    name: nginx
``` 

Debuggage : kubectl get pods -o wide

### Pod à plusieurs conteneur

```yml
apiVersion: v1
kind: Pod
metadata:
  name: multic
spec:
  containers:
  - name: nginx
    image: nginx
    volumeMounts:
    - name: html
      mountPath: /usr/share/nginx/html
  - name: alpine
    image: alpine
    volumeMounts:
    - name: html
      mountPath: /html
    command: ["/bin/sh", "-c"]
    args:
      - date >> /html/index.html;
        while true; do
          sleep 1;
        done

  volumes:
  - name: html
    hostPath: 
      path: /data
      type: DirectoryOrCreate
``` 

### Sources

- https://devopssec.fr/article/gerer-manipuler-pods-kubernetes
