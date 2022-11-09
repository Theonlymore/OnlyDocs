# Switch HP

trunk

2 switch avec deux fibre

## Interface 

```sh
# Activation / Desctivation interface
switch(config)# interface ethernet 1
switch(eth-1)# enable
switch(eth-1)# disable

# Description d'une interface
switch(config)# interface ethernet 1
switch(eth-1)# name "TO Switch SW2"

```

## Vlan

| Description     | Commandes                            |
| --------------- | ------------------------------------ |
| Crée un vlan    | `switch(config)#vlan 99`             |
| Nom sur le vlan | `switch(vlan-99)#name "nom du vlan"` |

#### Assignment d'un vlan à un port

| Nom | Description | Commentaire |
| --- | ----------- | ----------- |
| `Tagged`| trunker - faire passer des plusieurs vlans à travert le même port | | 
`Untagged`| access - forcer un vlan sur un port par exemple | impossible d'avoir plusieurs "untagged" sur le même port|


**Mode trunk(tagged) pour faire passer le vlan 99-101 dans les port 5 à 10**

```sh
switch(config)#vlan 99
switch(vlan-99)#tagged ethernet 5-10

switch(config)#vlan 99
switch(vlan-100)#tagged ethernet 5-10

switch(config)#vlan 99
switch(vlan-101)#tagged ethernet 5-10
```

**Mode access(untagged) pour mettre "forcer" un vlan sur un port**

```sh
switch(config)#vlan 99
switch(vlan-99)#untagged ethernet 1
```

## LACP

Switch A

```sh

switchA(config)# interface 2,4
switchA(eth-2,4)# speed-duplex auto
switchA(eth-2,4)# lacp active
```

Switch B

```sh

switchB(config)# interface 2,4
switchB(eth-2,4)# speed-duplex auto
switchB(eth-2,4)# lacp passive
```


## Trunks (dans hp)

- supprimer un trunks


- transpondeur 
- enelver lacp ?; mettre vlan sur un grp lacp ?
- activier snmp



## Mémoire 

| Description            | Commandes      |
| ---------------------- | -------------- |
| Enregister (ram > rom) | `write memory` |
| Reset usine | `erase startup-config`|


A tester / voir : 

- lacp
- 
## Sources

- [Network vlan/trunk and native VLANs](https://networkdirection.net/articles/network-theory/taggeduntaggedandnativevlans/)
- [coindunet](https://www.lecoindunet.com/comprendre-notion-vlan-tagged-untagged-1629#:~:text=Si%20un%20appareil%20peut%20ajouter,et%20rediriger%20correctement%20le%20trafic.)
- [lacp - itconnect](https://www.it-connect.fr/mise-en-place-du-protocole-lacp-sur-hp-procurve/#:~:text=Pr%C3%A9sentation,et%20de%20r%C3%A9partition%20de%20charge.)
- [networklab.fr](https://www.networklab.fr/guide-de-configuration-hp-procurve-switch/)
- [Pdf-HP](./sources/hp-procurve.pdf)
- [Vlan](https://support.hpe.com/hpesc/public/docDisplay?docId=emr_na-c03182828)






