# Python

## Les bases

| Object/Expression | Commentaire |
| ----------------- | ----------- |
| `print`           |
| `type`            |


Python est un language à typage **dynamique**. ( auto string, int, autres)


Les boucles :

| Franglo | pythonSynt |   |
| `tant que` | `while` |
| `jusqu'a` | `for .. in range`| 
| `pour` | `for` |

## Liste

```py
exemple = ["papi", "mami", "papa", "maman"]

exemple[1]
'mami'

#Ajouter élément
exemple.append("soeur")

# Retirer un élément ( si par exemple mami meur)
exemple.remove("mami")

#Parcourir une liste
for i in range(len(exemple)):
    print(exemple[i])

#Traitement d'une liste
char = input("mot qui contient les charactere :")
for i in range(len(exemple)):
    if char in mots[i]:
        print(mots[i])

```

