# Base

## Architecture de Kube

- Kube master: responsable du maintien de l'état souhaité pour le cluster. Quand on communique avec kube, on communique avec le master.

- Noeuds kube: machines qui execute les applications


## Control Plane

Comprends un ensemble de processus en cours d'execution sur la cluster

- Les master
	- kube-apiserver
	- kube-controllermanager
	- kube-scheduler
- Les noeud
	- kubelet : communique avec le Master
	- kube-proxy : proxy réseau reflétant les services réseau sur chaque noeud

## Client `kubectl` 

Permet de contrôler le cluster depuis la cli (liste des ressources, créer et supprimer, droits d'accès, ...)
 
## Install avec kubeadm

Kubeadm permet de créer un cluster de type prod j

### Sources

- [hadrienpelissier](https://cours.hadrienpelissier.fr/03-kubernetes/cours_1_presentation_k8s/)
- [Off docs](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/)
