# Vim 

## Les modes dans Vim

- `Normal` : par défaut, il permet de lancer les macros et commandes
- `Insertion` : permet d'insérer du texte
- `Visuel` : permet de sélectionner du texte

### Undo / redo
- undo : `u`
- redo : `Ctrl+r`
## Déplacement de base dans vim

- `h` : gauche
- `j` : bas - 10j (descendre de 10 lignes)
- `k` : haut - 5k (monter de 5 lignes)
- `l` : droite

## Enregistrer / quitter

- `:w` (enregistrer le fichier en cours d'édition sans quitter)
- `:x` ou `:wq` (enregistrer et quitter)
- `:q!` (quitter sans enregistrer)

## Se déplacer dans le fichier

- `gg`  : début du fichier
- `G` : fin du fichier
- `w` : mot suivant 
- `e` : fin du mot
- `b` : mot précédent
- `:10` (aller à la 10e ligne)
- `:$` (aller à la fin du fichier)
- `$` (place le curseur à la fin d'une ligne)
- `0` (place le curseur au début d'une ligne)


## Copier / couper / coller
- `10Y` (copie 10 lignes)
- `dd` (coupe ou supprime une ligne)
- `10Y` (copie 10 lignes)
- `d10` (coupe ou supprime 10 lignes)
- `dw` (coupe ou supprime un mot)
- `v` (pour sélectionner du texte en mode visuel)
- `Ctrl+v` (pour sélectionner un bloc de texte en mode visuel)
- `p` (coller après le curseur)
- `P` (coller avant le curseur)

## Annuler / refaire une action
- `u` (annuler)
- `.` (refaire)

## Afficher / masquer les numéros de lignes
- `:set nu` Afficher numéros de lignes
- `:set nu!` Masquer numéros de lignes
- `u / U` Lowercase / Uppercase
## Recherche / remplacement de texte

- `/` Rechercher vers le bas
- `?` Rechercher vers le haut
- `n` Rechercher l'occurrence suivante
- `N` Rechercher l'occurrence précédente
- `cw` Remplacer le texte jusqu'à la fin du mot
- `ciw` Remplacer le mot
- `C` Remplacer jusqu'en fin de ligne
- `.` Répéter la dernière opération d'édition

## Onglets Vim

- `:tabe fichier.txt` (ouvre un nouvel onglet avec le fichier.txt)
- `gt` (pour passer à l'onglet suivant)
- `gT` (pour passer à l'onglet précédent)
- `:qa` (pour quitter tous les onglets)
# D'autres raccourcis du mode visuel

- `:set nu` Afficher numéros de lignes
- `:set nu!` Masquer numéros de lignes
- ### Source : 
- [devhints](https://devhints.io/vim)
- [Syloe](https://www.syloe.com/utiliser-vim-guide/)
- [Alexis Madrzejewski](https://www.tutoriels-video.fr/apprendre-a-utiliser-lediteur-vi/)
- [Ubuntu](https://doc.ubuntu-fr.org/vim) 
- [CoursPdf](image/vim.pdf)

**Jeux pour apprendre vim :**
- [vim-adventures.com/](https://vim-adventures.com/)
- [vimgenius](http://www.vimgenius.com/lessons/vim-intro/)
- [vim-avec-une-tasse-de.cafe](https://vim.avec.une-tasse-de.cafe/)

