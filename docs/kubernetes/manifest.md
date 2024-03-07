# Manifest

Format : yml

Les fichiers manifest permet de definir : 
- Pod
- Service
- Demonset
- Deployement
- ReplicaSet
- ReplicationControler

## Kubectl vers yml

```sh
kubectl run service/deploy  alex-pod      --image=nginx --port=80
	      -kind-         -object-name
```

- Type d'objet
- Nom de l'objet
- Status / config de l'objet
- Version utiliser pour créer l'objet : dans la docs


```yml
apiVersion: v1
kind: Pod
metadata:
  name: pod-nginx
spec:
  containers:
  - name: nginx
    image: nginx
    ports:
    - containerPort: 80
```

- [docs pour le pods](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.28/#pod-v1-core)

## Transformer un object actullement utiliser en manifest 

- `sudo kubectl get deployment nginx-deployment -o yaml`


## Plusieurs objet dans le même fichier 

```yml
apiVersion: v1
kind: Namespace
metadata:
  name: alex-ns

---
apiVersion: v1
kind: Pod
metadata:
  name: pod-nginx
  namespace: alex-ns
spec:
  containers:
  - name: nginx
    image: nginx
    ports:
    - containerPort: 80
```

### Sources

- [yt-valaxy](https://www.youtube.com/watch?v=lt3ZvspGkIo)
- [stephane-robert](https://blog.stephane-robert.info/docs/conteneurs/orchestrateurs/kubernetes/ecrire-manifests/)
