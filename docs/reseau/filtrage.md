# Le filtrage 

### Abréviation :

- `*` = Tout
- `A` = Accepte
- `B` = Bloquer

## Exemple de règles :

### Infrastructure :

![Exemple d'infrastructure avec filtrage](images/filtrageReseau.png)

### Règles :

A : Toutes les communications entre le poste 195.115.100.2 et toutes les autres postes sont autorisées.

### Table de filtrage

| N'  | Zone A        | Action | Ip Source        | Port source      | Ip Destination | Port destination | Protocole | Etat TCP | Description |
| --- | ------------- | ------ | ---------------- | ---------------- | -------------- | ---------------- | --------- | -------- | ----------- |
| 1   | 192.115.100.1 | A      | 195.115.100.2/32 | *                | *              | *                | *         |          | A:Demande   |
| 2   | 213.152.247.9 | A      | *                | 195.115.100.2/32 | *              | *                | *         |          | A:Retour    |


## Fonctionnement de la table sur le filtre

Quand un paquet arrive, le filtre regard la table du nombre le plus faible au plus haut, si la règle concerne le paquet la règle aboutie. 