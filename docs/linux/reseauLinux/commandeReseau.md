# Commande réseau sur debian

## Configuration ip 

- Fichier de configuration
    - `/etc/network/interfaces`
- Afficher configuration réseau
  - [x] `ip a`
  - [x] `ip addr`
  - [ ] `ifconfig` (paquet en plus)


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

Remettre la route :

- `iptables-restore < /etc/iptables.save`

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

Vérifier le filtrage NAT des paquets.

- `iptables -t nat -L` 


Affiche le contenu des tables de cache d'ARP

- `arp`

Rechercher tous les ports ouverts.

- `netstat -a`

Rechercher les ports à l’écoute.

- `netstat -l --inet`

## Activation du routage

Décommenter la ligne

- `nano/etc/sysctl.conf`

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

Contient le nom de la machine
  - `/etc/hostname`
  
Fichier hosts consulter avant le serveur DNS :
  - `/etc/hosts`
  
  Affiche ou définit le nom d'une machine
  - `hostname`

Définir le serveur DNS référent
    - `/etc/resolv.con`

## Tests réseau

Vérification de connexion.
- `ping`

Tracer un ping
- `traceroute`


### Source :
- [Commande réseau de CCC](commandeReseau.pdf)
