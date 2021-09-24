# Commande réseau sur debian

## Configuration ip

Fichier de configuration

- `/etc/network/interfaces`

Afficher configuration réseau

- `ip a` / `ip addr`


## Changement de réseau

`/etc/network/interfaces`
  
```bash
# Démarrer l'interface <nom_interface> lors du démarrage du système
auto lo etho0
#Démarrer l'interface <nom_interface > à chaud.
allow-hotplug eth0
#Définir la configuration
iface etho0 inet static
    address 192.168.1.10
    netmask 255.255.255.0
    gateway 192.168.1.254
    dns-domain exemple.com
    dns-nameservers 192.168.1.5
```

## Mettre en place un NAT


```bash
iptables -t nat -A POSTROUTING -o ens224 -j MASQUERADE

iptables-save > /etc/iptables.save
```

- `post-up iptables-restore < /etc/iptables.save`

Info complémentaire sur ip tables

```bash
# Voir les iptables
iptables -L
# Supprimer tables
iptables -d chain rulenum
# docs
man iptables
```

### Diagnostique 

Vérifie le filtrage NAT des paquets.

- `iptables -t nat -L` 



## Filtrage

Affiche le contenu des tables de cache d'ARP

- `arp`

Rechercher tous les ports ouverts.

- `netstat -a`

Rechercher les ports à l’écoute.

- `netstat -l --inet`

## Filtrage :

### Definition  :

- ACCEPT
  - Cette cible permet d'accepter les paquets
- DROP
  - Cette cible permet de refuser les paquets sans avertir le demandeur que sa demande de connexion à été refusée.

- -p TCP 
  - premier paramètre
- --dport 22
  - Sous paramètre

- **docs :** `iptables --help`

### Selection des chaînes :

- `INPUT` : Destiné à la machine ( routeur )
- `OUTPUT` : En sortis de la machine ( routeur )
- `FORWARD` : Qui travers le routeur

### Diagnostique :

Lister toutes les règles :

- `iptables -L -n`

Lister les règles avec port numérique et paquets qui ont utiliser la règle :

- `ìptables -nvL`
  
Lister les règles d'une chaîne :

- `iptables -P INPUT -n`

Vérifie le filtrage des paquets.

- `iptables -L -n` 
  
### Modification de la policy
  
Modification de la règle par défaut (Rien ne passe à travers le routeur).
  
  - `iptables -P FORWARD DROP`


### Ajout d'une règles

`-I` : insersion à la ligne de la table choisie
`-A` : la fin de la table

### Règles de filtrage : 

#### Exemple :

`iptables -A INPUT -s 192.168.1.148/32 -d 192.168.31.250/32 -i ens192 -p TCP --dport 22 -j accept`


Explication  :

- `ìptables` : Commande pour configurer le filtre
- `-A` : append / ajouter ( mes la règles à la fin de la table)
  - `I` : insersion de la règles au numéro de règles choisis
  - `C` : Check : Vérifier
  - `-R` : Remove : Supprimer
- `INPUT` : estiné à la machine ( routeur )
  - `OUTPUT` : En sortis de la machine ( routeur )
  - `FORWARD` : Qui travers le routeur
- `-s` : Source
  - `-d` : destination
  - `-p` : protocole couche 4 (TCP ou UDP)
    - `--dport` : protocole couche 7 (22,80,443,...)
- `-j` : Accepte ou refuse le paquet : `DROP` ou `ACCEPT` 
  






[Source](https://tldp.org/pub/Linux/docs/HOWTO/translations/fr/html-1page/Masquerading-Simple-HOWTO.html)


## Activation du routage

Décomenter la ligne

nano/etc/sysctl.conf
```bash
net.ipv4.ip_forward=1
```


## Ip [route](https://www.cyberciti.biz/faq/ip-route-add-network-command-for-linux-explained/) 

### Connaître les routes

```bash
ip route
```

### Crée une route

```bash
ip route add {NETWORK/MASK} via {GATEWAYIP}
```


## DNS

### Fichier de configuration

Contient le nom du PC :

- `/etc/hostname`

Fichier hosts consulté avant le serveur DNS :

- `/etc/hosts`

Affiche ou définit le nom d'un machine

- `hostname`

Définire des serveur DNS
- `/etc/resolv.con`

## Tests réseau

Vérification de connexion.

- `ping`

Tracer un ping

- `traceroute`


[Commande réseau](commande linux.pdf)
