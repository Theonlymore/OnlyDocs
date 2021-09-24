# Commande de base Cisco

## Cli

- Noms d'hôte du switch :
    - `#hostname Sw1`
- Désactivez la recherche DNS :
    -  `#no ip domain-lookup`
- Mettre un mots de passe :
    - enable / exécution
        - `config)#enable secret azerty` (`secret` pour que le mot de passe sois chiffré)
    - Connexions en console
        - `config)#line console 0`
        - `config-line)#password azerty`
        - `config-line)#login`
    - Connexions telnet [source](https://formip.com/securisation-ios-cisco/)
        - `config)#line vty 0 15` (15 pour switch et 5 routeurs)
        - `config-line)#password azerty`
    - Enregistrer la configuration actuelle pour chaque restart : `#copy running-config startup-config`
    - Mettre une bannière au démarrage : 

```bash
config)#banner motd &
------------------------------------------
-           ZONE INTERDITE               -
- UTILISATEURS AUTHENTIFIES UNIQUEMENT   -
------------------------------------------
```
- "&" après le avoir coller
- Mémoire :
    - Suppression du fichiers de configuration initiale : `#erase startup-config`
    - Suppression de la base de données Vlan : `#delete flash:vlan.dat` [ Retourne a la configuration par défaut des vlan]
    - Afficher les fichiers racines : `#show flash:`
        
        

## Switch :

### Vlan :

- Voir les vlan et port affecter :`#show vlan`
- Ajout de vlan :
 `config)#vlan 1` ou `config)#vlan 1,2,3,4`
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

### Mettre en place un trunk :

- Mettre le mode trunk : `config)#interface fa0/1`
  - `config-if)#switchport mode trunk`



### [Sécurité du port : ](https://cisco.goffinet.org/ccna/ethernet/switchport-port-security-cisco-ios/)

- Interface utilisable par une seul adresse mac :
    - `config)#interface fa0/1`
    - `config-if)#switchport mode access`
    - `config-if)#switchport port-security`  
    - `config-if)#switchport port-security maximum 2` 
    - `config-if)#switchport port-security mac-address sticky` 
    - `config-if)#switchport port-security violation shutdown`
- effacé la mémoire de `port-security`  
    - `#clear port-security {all | configured | dynamic | sticky}`
  - Information
    - show port-security
    - #show port-security address
    - #show port-security interface G0/1
  - Désactivation du port-security
    - `config)#interface fa0/1`
      - `config-if)#no switchport port-security maximum`
      - `config-if)#no  switchport port-security mac-address sticky`
      - `config-if)#no switchport port-security`


## Packet tracer

Tips : Il est possible de faire avancer le temps plus vite :

![Speeeeeeeeeeeeeeeeeeeeeeeeeeeeed](../image/packetTracer.png)

[PDF des commandes Cisco pour la CCNA](commandesCisco.pdf)


#### Source : 

[Cisco](https://www.cisco.com/c/en/us/support/docs/smb/switches/cisco-350-series-managed-switches/smb5722-configure-vlan-interface-ipv4-address-on-an-sx350-or-sg350x.html)

