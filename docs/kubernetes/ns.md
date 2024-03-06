# Namespaces

Les ns permet de faire de l'isolation entre : projet, team, famille.

Toutes les "Ressources names" sont dans un namespace (il peuve être idendique d'un ns à l'autre)

```sh
svc/my-svc1  | svc/my-svc1  
pod/my-pod1  | pod/my-pod1
__________________________
my-ns1       | my-ns2


Chaque ressource est dans un seul namespaces

## Debug

liste des namespaces : `kubectl get namespaces`

liste les pods de toutes les namespaces : `kubectl get pods -A`


liste des ressource qui peuve être dans un namespace :

```sh
kubectl api-resources --namespaced=false
```



