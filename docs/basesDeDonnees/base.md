# Bases de données

Qu'est-ce qu'une base de données ?

- Ensemble de données structurées et organisées
  - Données manipulable (ajout, modification, suppression)
  - Ensemble qui peut être interrogé : possibilité de rechercher une partie des informations sur la base de critères définis :


| Nom | Prénom | Age | Ville | Notes 1 | Notes 2 | Notes 3 |
| --- | --- | --- | --- |--|--|--|
| Dupont | Jean | 25 | Paris |20|15|18|
| Durand | Marie | 30 | Lyon ||10|0|


## Problèmes
- je veux ajouter des notes : je dois ajouter des colonnes
-  Je veux modifier le nom d'une école  je dois vérifier toute les lignes


## "Formes normales" - Quand on parle de bbd on attend du formalisme

### Les 3 premières "formes normales" permettent :

- Limiter les redondances de données
- Diminuer la volumétrie globale
- Interdire les incohérences de données venant des redondances dont une partie seulement a été modifiée
- Limiter le nombre et la durée des mises à jour

### Données organisées

Les données sont rangées dans des tableaux appelés **tables**.

Chaque table est composée de **colonnes** et de **lignes**.


```
+----+  +----+  +----+
|  1 |  |  2 |  |  3 | 
+----+ +----+   +----+ 
```

Tables 1 : Ecoles
    - Ecole 1
    - Ecole 2
Tables 2 : Matières
    - Reseau
    - Systèmes
Tables 3 : Notes
    - 20
    - 15
    - 18

## Le MCD : Modèle Conceptuel de Données

- Représentation graphique et structurées des informations mémorisées dans un système d'information.

- Composé de deux notions principales
  - Les entités
  - Les associations(ou relations)
- On l'appelle aussi "schéma Entité / Association"

### Elaboration d'un MCD

D'après les **règles de gestion métier** : 

- Elaboration du **dictionnaire de données**
- Identification des **dépendances entre les fonctionnelles**
- Création des **entités**, puis des **associations**, puis ajout des **cardinalités**

