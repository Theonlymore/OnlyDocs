# Un serveur DNS par tunnel SSLVPN sur un fortigate

Mises en contexte : par défaut, avec l'interface web du fortigate, il n'est pas possible de choisir un serveur DNS par tunnel SSLVPN.
Toutes les machines connectées SSLVPN ont donc le même serveur DNS peu importe le tunnel.

C'est un problème quand il y a besoin d'un dns précis pour des utilisateurs.

#### Exemple avec configuration actuelle :
```
Entreprise A<-+
              |
Entreprise B<-+----SV DNS A
              |
Entreprise C<-+

```

#### Objectif :

```
Entreprise A<-+----SV DNS A
              |
Entreprise B<-+----SV DNS B
              |
Entreprise C<-+-SV DNS C

```
            


## Solution

La solution que j'ai trouvé dans la [documentation de forti]((https://docs.fortinet.com/document/fortigate/7.2.4/administration-guide/988717/ssl-vpn-split-dns) est de passer via la CLI pour choisir un DNS par tunnel.

## Configuration

Aller sur l'interface web du fortigate et aller dans `VPN > SSLVPN - Settings` : DNS Server : "Same as client system DNS" `la configuration écrit ici remplace la configuration de la CLI sur tunnel (donc remove)`

### Configuration DNS sur tunnel

```
config vpn ssl web portal

edit "full-access"
set dns-server1 1.1.1.1
set dns-server2 8.8.8.8
end
```


### Problèmes rencontrés

- Il y a une configuration supérieure (`config vpn ssl settings`) qui écrase la configuration de la CLI 
- La configuration n'était pas prise en compte par le fortigate (sans avoir mis "end"  après le set)



### Sources

- [DocsFortinet](https://docs.fortinet.com/document/fortigate/7.2.4/administration-guide/988717/ssl-vpn-split-dns)