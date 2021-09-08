


## Changement de réseau :

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
#iptables -t nat -A POSTROUTING -o etho0 -j MASQUEADE
#iptables-save > /etc/iptables.save
```
post-up iptables-restore < /etc/iptables.save



## Activation du routage

Décomenter la ligne

nano/etc/sysctl.conf
```bash
net.ipv4.ip_forward=1
```

## Création de [route](https://www.cyberciti.biz/faq/ip-route-add-network-command-for-linux-explained/) 

```bash
ip route add {NETWORK/MASK} via {GATEWAYIP}
```

[Commanderéseau](commandeReseau.pdf)
