# Services

Un services est une abstractin par-dessus les Pods qui gère leurs accès.

Les type de services :

- `ClusterIP` : expose le Service sur une IP interne du Cluster.
- `NodePort` : Expose le service à l'exterieur à l'aide du NAT (Port est entre 30000 et 32767).
- `LoadBalancer` : Utilise le fournisseurs de cloud
- `ExternalName` : via url

## Création d'un service 

- `sudo kubectl create deployment onlyweb --image nginx` (création d'un deployement qui sera ensuite exposer)
- ` sudo kubectl create service nodeport onlyweb --tcp=80:80 --node-port=30009`

### Sources

- [wiki.sfeir](https://wiki.sfeir.com/kubernetes/architecture/composants/services/)
- xavki
