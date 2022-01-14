# Commande HSRP 

Pour mettre en place l'HSRP, il faut que chaque adresse IP physique possède un réelle.

Et ensuite configurer le protocole HSRP. 

```ios title="infra"
            PC1
      192.168.0.10/24
            |
            |
     _____Switch1_______
    |                   |
    |                   |
192.168.0.1/24        192.168.0.2/24
Routeur1              Routeur2
Réseau FAI            Réseau FAI
```

Nous allons configurer le protocole HSRP avec R1 en routeur primaire.

```ios title="routeur1"
R1(config)#interface local
R1(config-if)#ip address 192.168.0.1 255.255.255.0
R1(config-if)#standby 1 ip 192.168.0.3
R1(config-if)#standby 1 priority 105
R1(config-if)#standby 1 preempt
```

```ios title="routeur2"
R1(config)#interface local
R1(config-if)#ip address 192.168.0.2 255.255.255.0
R1(config-if)#standby 1 ip 192.168.0.3
R1(config-if)#standby 1 preempt
```

"preempt" indique au routeur de "prendre la main" pour devenir routeur primaire mais le niveau de priorité de base est de 100 donc le r**outeur 1 avec un priorité de 105**, il deviens donc **routeur primaire**.

## Tracking

Si le routeur R1 n'a pas accès au réseau externe mais que l'interface local est toujours actif :

- La routeur primaire sera toujours R1 même si il n'a plus accès au réseau externe car sont interface est toujours actif.
Pour résoudre le problème, il faut mettre en place du **tracking**.

### Commandes

```ios title="routeur1"
R1(config)#interface local
R1(config-if)#standby 1 track [interface fai] [priority] #par défaut : 10 de priority
```


## Diagnostique 

`show standy`






