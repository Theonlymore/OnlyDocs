# MPLS - Multiprotol Label Switching

Le MPLS est un protocole conçu pour **optimiser et accélérer le trafic** réseau. Il a été développé afin d'éviter aux routeurs de perdre du temps à chercher dans les tables de routage. Le protocole permet à la plupart des paquets de données d'être **acheminés par commutation plutôt que par routage**.

## Comment cela marche ?

Le MPLS utilise divers protocoles pour acheminer des paquets. Le fournisseur de services **ajoute une "étiquette/label"** (LPS : Label Switched Paths).

Cette "étiquette/label" permet aux fournisseurs de service de décider quel chemin est le mieux adapté. En fonction du label, le paquet est **acheminer jusqu'a destination sans prendre en compte l'en-tête IP**, quand le paquet est arriver au dernier routeur, le label LPS est enlevé puis le paquet est acheminé vers l'IP destination.

## Les avantages des réseaux MPLS

- Une garanti de QoS excellente

Inconvénient est sont **coût**.





### Sources
- [pyxya.fr](https://www.pyxya.fr/en-savoir-plus/reseau-mpls-comment-fonctionne-cette-solution/)
- [auranext](https://www.auranext.com/sd-wan-mpls-avantages-inconvenients/#:~:text=Le%20MPLS%20est%20un%20r%C3%A9seau,supervise%20et%20maintient%20l'ensemble.)