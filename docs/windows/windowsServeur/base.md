# Les bases

## Licence

Licence de base.

Puis `CAL` : pour des services supplémentaire, par exemple RDS.

## Services

- partage de fichiers
- bases de données
- Exchange
- non-microsoft


## Type de partitionnement :

**MBR** :
- Cette table faisiat partie es informations stockées sur le *premier secteur* adressable du disque.
- Le BIOS recherche un sectuer d'amorçage sur les miédiasd bootables.

**GPT**
- à ce jour, la majorité des machines disposent d'un UEFI
- Meilleure perf en UEFI
- Optimiser pour les systèmes d'exploitation 64 bits

## Gestion de disques :


## Gestion de disques :

# Ordre 

1. Machine
2. Disque(s)
   1. Table de partition ( MBR ou GPT et BIOS et UEFI )
3. Partions/Volumes
   1. Systeme de fichier (NTFS,FAT32,...)
   2. Raid 0/1/5

## Comparatif entre techno de gestion de disque

| Techo              | Nombre de disque(s) | Fiabilité | Performance | Coût/Go | Description         |
| ------------------ | ------------------- | --------- | ----------- | ------- | ------------------- |
| Simple             | 1                   | 0         | +           | $       | Bah un disque       |
| Fractionné         | 2 -> N              | 0-        | +           | $       | Etendre le stockage |
| Agrégé             | 2 -> N              | 0-        | N+          | $       | Raid 0              |
| Miroir             | 2 -> N              | +         | -           | $$      | Raid 1              |
| Agrégé avec parité | 3 -> N              | +         | (N-1)*+     | 1,5 $   | Raid 5              |

## Sources 

- Cours ESGI 