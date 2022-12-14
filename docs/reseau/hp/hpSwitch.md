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

| Nom        | Description                              | Commentaire                           |
| ---------- | ----------------------------------------------------------------- | ------------------------- |
| `Tagged`   | trunker - faire passer des plusieurs vlans à travert le même port | |
| `Untagged` | access - forcer un vlan sur un port par exemple | impossible d'avoir plusieurs "untagged" sur le même port |


**Mode trunk(tagged) pour faire passer le vlan 99-101 dans les port 5 à 10**

=== "Tagged"

    ```sh
    switch(config)#vlan 99
    switch(vlan-99)#tagged ethernet 5-10

    switch(config)#vlan 101
    switch(vlan-101)#tagged ethernet 5-10
    ```

=== "Short"

    ```sh
    switch(config)#vlan 99 tagged 5-10
    switch(config)#vlan 99 tagged 5,7,9,12
    ```

**Les trames non taggées (pas d'ID de VLAN) sont mises dans ce VLAN.**

**/!\ Un port ne peut pas être taggé et non-taggé en même temps.**

```sh
switch(config)#vlan 99
switch(vlan-99)#untagged ethernet 1
```

## LACP

=== "Switch A"

    ``` sh
    SwitchA(config)# trunk 23-24 trk1 lacp
    ```

=== "Switch B"

    ``` sh
    SwitchB(config)# trunk 23-24 trk1 lacp
    ```

=== "Remove lacp/trunk"

    ```sh
    SwitchB(config)# no trunk 23-24 trk1

    ### Si lacp encore la
    
    SwitchB(config)# interface 23-24
    SwitchB(eth-2-3)# no lacp
    ```

**Tagged le lacp : `vlan 5 tagged trk1`**




## Trunks (dans hp)


- transpondeur 
- activier snmp


## Mémoire 

| Description            | Commandes              |
| ---------------------- | ---------------------- |
| Enregister (ram > rom) | `write memory` `save`         |
| Reset usine            | `erase startup-config` |


## Interfaces

| Description            | Commandes              |
| ---------------------- | ---------------------- |
| Voir les interfaces| `show interface`         |
| Information sur le tranceiver | `show interfaces transceiver 28 detail` |



## Diagnostique

| Description            | Commandes              |
| ---------------------- | ---------------------- |
| Voir tout la conf | `show run`         |
| Voir les vlan           | `show vlan` |
| Voir les vlan sur un port |` show vlans ports ethernet 31 detail`

A tester / voir : 

## Sources

- [CLi docs hp](./sources/hpCliDocs.pdf)
- [Network vlan/trunk and native VLANs](https://networkdirection.net/articles/network-theory/taggeduntaggedandnativevlans/)
- [coindunet](https://www.lecoindunet.com/comprendre-notion-vlan-tagged-untagged-1629#:~:text=Si%20un%20appareil%20peut%20ajouter,et%20rediriger%20correctement%20le%20trafic.)
- [lacp - itconnect](https://www.it-connect.fr/mise-en-place-du-protocole-lacp-sur-hp-procurve/#:~:text=Pr%C3%A9sentation,et%20de%20r%C3%A9partition%20de%20charge.)
- [lacp - stormshield](https://documentation.stormshield.eu/SNS/v3/fr/Content/LACP_link_aggregation/Configuring_the_switch.htm)
- [transceiver](https://techhub.hpe.com/eginfolib/networking/docs/switches/WB/15-18/5998-8162_wb_2920_mcg/content/ch11s05.html)
- [networklab.fr](https://www.networklab.fr/guide-de-configuration-hp-procurve-switch/)
- [Pdf-HP](./sources/hp-procurve.pdf)
- [Vlan](https://support.hpe.com/hpesc/public/docDisplay?docId=emr_na-c03182828)





