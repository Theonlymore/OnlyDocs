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

Requêtes récursives (côté client) et itératives (côté serveur DNS) [image](https://www.omnisecu.com/images/tcpip/recursive-iterative-dns-query.jpg?ezimgfmt=ngcb3/notWebP)


## Enregistrements 

Plusieurs types d'enregistrements peuvent être créés dans le serveur DNS. Ils permettent la résolution d'un nom de poste ou d'une adresse IP.

Enregistrement `A` et `AAAA` ( Address Record)
     
  - `A` : fait correspondre un nom de poste à une adresse IPv4. `AAAA` : correspond à une adresse IPv6.
  
CNAME (Canonical Name)
     
  - Crée un alias vers le nom d'un autre poste.
  
MX (Mail Exchange) 
     
  - Définit les serveurs de courrier pour le domaine (il est possible d'en mettre plusieurs avec une notion de priorité).

PTR (Pointer server)

  - Associe une adresse IP à un enregistrement de noms de domaine (IP vers nom de domaine).

NS (Name Server)
- 
  - Définit les serveurs de noms de domaine.
  
  SOA (Start Of Authority)
  
  - Donne les informations générales de la zone.
  
  SRV
  
  - Définir un serveur spécifique pour une application , notamment pour la répartition de charge.
