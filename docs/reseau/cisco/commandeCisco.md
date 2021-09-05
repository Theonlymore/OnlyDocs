# Commande de base Cisco

## Cli

- Noms d'hôte du switch :
    - `hostname Sw1`
- Désactivez la recherche DNS :
    -  `no ip domain-lookup`
- Mettre un mots de passe :
    - enable / exécution
        - `config)#enable secret azerty` (`secret` pour que le mot de passe sois chiffré)
    - Connexions en console
        - `config)#line console 0`
        - `config-line)#password azerty`
    - Connexions telnet [source](https://formip.com/securisation-ios-cisco/)
        - `line vty 0 15` (15 pour switch et 5 routeurs)
        - `password azerty`
    - Enregistrer la configuration actuelle pour chaque restart : `copy running-config startup-config`
    - Mettre une bannière au démarrage : 
        - `config)#banner motd &`
        - `------------------------------------------`
        - `-           ZONE INTERDITE               -`
        - `- UTILISATEURS AUTHENTIFIES UNIQUEMENT   -`
        - `------------------------------------------`  
            - "&" après le avoir coller
    - Mémoire :
        - Suppression du fichiers de configuration initiale : `erase startup-config`
        - Suppression de la base de données Vlan : `delete flash:vlan.dat` [ Retourne a la configuration par défaut des vlan]
        - Afficher les fichie : `show flash:`
        
        

## Switch :

### Vlan :

- Voir les vlan et port affecter :` show vlan`
- Ajout de vlan :
 `vlan 1` ou `vlan 1,2,3,4`
-  Nom du vlan : `config-vlan)#name prod`
- Supprimer vlan : `config)#no vlan 1`
- Vlan à un port :
    - Un seul port :`config)#interface fastEthernet 0/1`
    - Plusieurs ports :`config)#interface range fastEthernet 0/1-10`
        - `config-if)#switchport mode access`
        - `config-if)#switchport access vlan 3`
- Mettre une ip sur l'interface Vlan du switch :
    - `config)#interface vlan 99`
    - `config-if)#ip address 192.168.56.11 255.255.255.0`
    - `no shutdown`

### Sécurité du port :

- Interface utilisable par une seul adresse mac :
    - `config)#interface fa0/1`
    - `config-if)#switchport mode access`
    - `config-if)#switchport port-security`  
    - `config-if)#switchport port-security maximum 2` 
    - `config-if)#switchport port-security mac-address sticky` 
    - `config-if)#switchport port-security violation shutdown`
- effacé la mémoire de `port-security`  
    - `#clear port-security {all | configured | dynamic | sticky}`





source : 
https://www.cisco.com/c/en/us/support/docs/smb/switches/cisco-350-series-managed-switches/smb5722-configure-vlan-interface-ipv4-address-on-an-sx350-or-sg350x.html

