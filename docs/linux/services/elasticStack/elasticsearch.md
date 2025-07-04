# Elasticsearch

Moteur de recherche et d'analyse de données distribué et open source.

L'outil permet de stocker, de rechercher et d'analyser des données rapidement et presque en temps réel car Elasticsearch index plutôt de chercher le directement dans la base de données.

Intérêts :
- nosql : atout principale c'est la facilité à disposer d'un système distribué

### Principaux :

Alternative :

- elasticsearch : capacité/qualité d'indexation et donc de recherche.
- cassandra : gros volumes
- mongodb : le plus polyvalente
- redis : in memory donc très rapide (requêtage limité)

## Elasticsearch 

indexation de tous les mots des documents
Qualité de la recherche
  -  TP (Terme Frequency) : fréquence des mots
  -  IDF (Inverse Difference Frequency) : moins un mot est commun plus il a de poids dans la recherche.
Utilise dans la suite Elastic pour l'**analyse de logs**

## Cluster Elastic

Cluster avec tolérance de pannes ( replica )

![cluster elsatic](images/elasticClusterReplica.png)

### Config 

Dans `elasticsearch.yml`

Changer le nom du cluster : `cluster.name: alexCluster`

### Diagnostique d'un cluster elastic

kibana > management > dev tools > Console >

- `GET _cluster/health`
- `GET _cluster/stats`

Dans la console, il est possible d'envoyer directement des requets rest a elasticsearch ( exemple crée un index, post des données,...)

### Sources 

- [Openclassroms - CentraleSupélec](https://openclassrooms.com/fr/courses/4462426-maitrisez-les-bases-de-donnees-nosql/4474691-etudiez-le-fonctionnement-d-elasticsearch)
- [xavki](https://www.youtube.com/watch?v=_nmDN9nf1Lw)
- [Tuto officiel](https://www.youtube.com/watch?v=gS_nHTWZEJ8)
- https://codingexplained.com/coding/elasticsearch/understanding-replication-in-elasticsearch