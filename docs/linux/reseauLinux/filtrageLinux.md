# Filtrage :

## Definition  :

- `ACCEPT`
    - Cette cible permet d'accepter les paquets
- `DROP`
    - Cette cible permet de refuser les paquets sans avertir le demandeur que sa demande de connexion à été refusée.

- `-p TCP`
    - premier paramètre
- `--dport 22`
    - Sous paramètre

  
- **docs :** `iptables --help`

## Selection des chaînes :

- `INPUT` : Entrer dans la machine ( routeur )
- `OUTPUT` : En sortis de la machine ( routeur )
- `FORWARD` : Qui travers le routeur


### Schéma des chaînes :

```
PACKET IN
    |
PREROUTING--[routing]-->--FORWARD-->--POSTROUTING-->--OUT
 - nat (dst)   |           - filter      - nat (src)
               |                            |
               |                            |
              INPUT                       OUTPUT
              - filter                    - nat (dst)
               |                          - filter
               |                            |
               `----->-----[app]----->------'
```

## Diagnostique :

Lister toutes les règles :

- `iptables -L -n`

Lister les règles avec port numérique et utilisation en octets :

- `ìptables -nvL`
  
Lister les règles d'une chaîne :

- `iptables -P INPUT -n`

Vérifier le filtrage des paquets.

- `iptables -L -n` 

Connaître le numéro de ligne :

- `iptables -L --line-numbers`

  
## Modification de la policy
  
- Modification de la règle par défaut (Rien ne passe à travers le routeur).
    - `iptables -P FORWARD DROP`


## Créer règles de filtrage : 

### Exemple :

```bash
iptables -A INPUT -s 192.168.1.148/32 -d 192.168.31.250/32 -i ens192 -p TCP --dport 22 -j accept
```


### Explication  :

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
- `-j` : Accepte ou refuse le paquet : - - `DROP` : Refuse le paquet sans prévenir
    - `ACCEPT` : Accepte le paquet
    - `REJECT` : Refuse le paquet mais avertie le demandeur via un paquet RESET (RST)


#### Filtrage multi-port :

`iptables -A INPUT -p tcp -s 172.24.26.32  -m multiport --dport
110,666,42 -j REJECT`

### Le suivi de connexion :

Cela ce base sur trois états :

- `NEWS`
    - Signifie que le paquet a démarré une nouvelle connexion ou est associé d'une autre manière à une connexion qui n'a pas vu de paquets dans les deux sens
    - correspond à la demande de communicatoin TCP initiale, au premier datagramme UDP ou au premier messge ICMP.
  
- `ESTABLISHED`
    - Signifie que le paquet est associé à une connexion qui a vu des paquets dans les deux sens.
    - Si une entrée de la table de suivi des communications correspond, alors le paquet appartient à une communicatoin de type ESTABLISHED. Dans le cas du protocole TCP, on se réfère au `ACK` après qu'une communication ait été initiée. Dans le cas de datagrammes UDP, c'est l'échange entre deux hôtes et les correspondances de numéros de ports qui sont prises en compte. Enfin, les messages ICMP echo-replyu doivent correspondre au requêtes echo-request.
- `RELATED`
    - signifie que le paquet commence une nouvelle connexion, mais qu'il est associé à une connexion existante, telle qu'un transfert de données FTP ou une erreur ICMP.
    - Se réfère aux messages d'erreurs ICMP correspondant à une "communication" TCP ou UDP déjà présente dans la tables de suivi.

#### Analogie pour comprendre les états TCP

Considérons un NOUVEAU paquet comme un appel téléphonique avant que le destinataire ne décroche. Un paquet ESTABLISHED est leur "Bonjour". Et un paquet RELATED serait si vous appeliez pour leur parler d'un courrier électronique que vous alliez leur envoyer. (L'e-mail étant CONNEXE.)


#### Exemple :

- Autoriser le trafic entrant d'une connexion déjà établie
    - `iptables -A INPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT`
- Autoriser à surfer sur internet
    - `iptables -A INPUT -i eth0 -p tcp -m multiport --sport 80,443,43 -m state --ctstate ESTABLISHED,RELATED -j ACCEPT`

## Supprimer règles de filtrage : 

#### Supprimer règle précise : `-D` :

Supprimer règle 5 en OUTPUT

- `iptables -D OUTPUT 5`

#### Supprimer toutes les règles d'une chaîne : `-F`

- `iptables -F INPUT`

## Sauvegarde et restauration des règles :

Sauvegarde :

- `iptables-save > /etc/filtrages.save`

Restauration :

- `iptabes-restore < /etc/filtrages.save`


### Sources :

- [Sécurité iptables - Azlux](https://gist.github.com/azlux/6a70bd38bb7c525ab26efe7e3a7ea8ac)
- [Docs CCC iptable](filtragesIptables.pdf)
- [tlpd.org](https://tldp.org/pub/Linux/docs/HOWTO/translations/fr/html-1page/Masquerading-Simple-HOWTO.html)
- [doc.ubuntu](https://doc.ubuntu-fr.org/iptables)
- [Différence des états TCP / Analogie](https://serverfault.com/questions/371316/iptables-difference-between-new-established-and-related-packets/371319#371319)
- [Accès à internet via iptables avec état TCP](https://askubuntu.com/questions/634788/iptables-allow-just-internet-connection)
  
