# Vim 

## Modes dans vim

Changer de mode : esc
- a : apprend
- i : insertion

## enregistrer et quitter

- :w (enregistrer le fichier en cours d'édition sans quitter)
- :w /chemin/vers/le/fichier (enregistrer sous )
- :x ou :wq (enregistrer et quiter)
- :q (quitter)

## Se déplacer dans le fichier
On peut utiliser les flèches du clavier, page up/down ou les touches h j k l

- :1 (aller au début du fichier)
- :10 (aller à la 10e ligne)
- :$ (aller à la fin du fichier)
- $ (place le curseur à la fin d'une ligne)

## Copier / couper / coller
- Y (copie une ligne)
- 10Y (copie 10 lignes)
- dd (coupe ou supprime une ligne)
- d10 (coupe ou supprime 10 lignes)
- dw (coupe ou supprime un mot)
- v (pour sélectionner du texte en mode visuel)
- Ctrl+v (pour sélectionner un bloc de texte en mode visuel)
- p (coller)

## Annuler / refaire une action
- u (annuler)
- . (refaire)

## Afficher / masquer les numéros de lignes
- :set nu
- :set nu!

> Source : https://www.syloe.com/utiliser-vim-guide/