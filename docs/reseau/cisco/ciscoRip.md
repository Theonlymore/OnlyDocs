# RIP

## RIPv1 VS RIPv2

**RIPV1 ne prend pas en charge les VLSM** mais les classe ( A, B, C) alors que **RIPv2 prend en charge les VLSM**

Le protocole RIP :
- routage dynamique par vectuer de distance.
- Un router = saut
- Le nombre de saut maximum d'un paquet est 15
- 


Mise en place du protocole de routage RIPv2 :

```bash
Le Mans(config)#router rip -> activation du processus RIP
Le Mans(config-router)#version 2 -> utilisation de la version 2 de RIP
Le Mans(config-router)#no auto-summary -> désactivation de l’agrégation de routes
Le Mans(config-router)#network 192.168.3.0 -> déclaration d’un réseau
Le Mans(config-router)#network 10.1.1.0
Le Mans(config-router)#network 10.1.2.0
Le Mans(config-router)#exit
Le Mans#debug ip rip -> permet de voir le debug du protocole RIP (utile en cas incident ou de mauvaise manipulation)
```


### Interface passive : 

Les interface passive n'envois pas de mise à jours RIP :

`#passive-interface fa 0/1`




Diagnostique 

| Description | Commandes |
| ----------- | --------- |
|  | `#show ip route`|
| | `#show ip rip database`
|  | `#show ip protocols` |
|  | `#debug ip rip`|

## Source

- [it-connect](https://www.it-connect.fr/cisco-configuration-du-routage-rip/)