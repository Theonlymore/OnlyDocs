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
  
Modification de la règle par défaut (Rien ne passe à travers le routeur).
  
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


#### Filtrage multi-port sur la même ligne :

`iptables -A INPUT -p tcp -s 172.24.26.32  -m multiport --dport
110,666,42 -j REJECT`

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


### Source :

[tlpd.org](https://tldp.org/pub/Linux/docs/HOWTO/translations/fr/html-1page/Masquerading-Simple-HOWTO.html)
