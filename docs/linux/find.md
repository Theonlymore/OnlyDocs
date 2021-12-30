# Find

**Find** est un outil de recherche disposant d'un grand nombre d'options. 

## Utilisation

```bash
find <emplacement> -name "nom du fichier" -print
```

Exemple

```bash
find /root/ -name "glacierBack.sh" -print
# Résultat
/root/script/glacierBack.sh
```

#### Quand on ne connaît pas le nom du fichier, on peut donner une partie de son nom. Les jockers `*` (un ou plusieurs caractères) et `?` (un caractère) 

iname : pas sensible à la casse.

```bash
find /root/ -iname "glac?erBack.*" -print
```

Docs : `man find`

## Sources
-  [linuxtricks](https://www.linuxtricks.fr/wiki/find-rechercher-et-bien-plus)