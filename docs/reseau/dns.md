# DNS

Le serveur DNS (Domain Name System, ou Système de noms de domaine en français) est un service dont la principale fonction est de traduire un nom de domaine en adresse IP.

## Plusieurs mécanismes peuvent être utilisés pour résoudre les noms

1. Fichier hosts
2. Cache DNS
3. Service DNS

## Les noms d'hôtes

Le DNS permet la résolution de noms d'hôtes pleinement qualifiés (**FQDN** pour **Full Qualified Domain Name**)

Exemple : `www.perdu.com.` 

### Mécanismes d'interrogation

Récursives(client) et itératives(serveur de dns) [image](https://www.omnisecu.com/images/tcpip/recursive-iterative-dns-query.jpg?ezimgfmt=ngcb3/notWebP)

Le servuer répondant doit fournir une réponse coomplète


## Enregistrements 

Plusieurs types d'enregistrements peuvent êtres céées dans le serveur DNS. Ils permettent la résolution d'un nom de poste ou d'une adresse IP.

Enregistrement `A` et `AAAA` ( Address Record)
     
  - `A` : Faire correspondre un nom de poste en adresse IPv4. `AAAA` : Correspondre un adresse IPv6.
  
CNAME (Canonical Name)
     
  - Crée un alise vers le nom d'un autre poste.
  
MX (Mail Exchange) 
     
  - Définit les serveurs de courrier pour le domaine. (possible d'en mettre plusieurs avec priorité)

PTR (Pointer server)

  - Associe une adressse IP à un enregistrement de noms de domaine. ( ip to nom de domaine)

NS (Name Serveur)
- 
  - Définit les serveurs de noms de domaine.
  
  SOA (Start Of Authority)
  
  - Donne les informations générales de la zone.
  
  SRV
  
  - Définir un serveur spécifique pour une application , notamment pour la répartition de charge.
