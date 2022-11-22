# Python

## Les bases

| Object/Expression | Commentaire |
| ----------------- | ----------- |
| `print`           |
| `type`            |


Python est un language à typage **dynamique**. ( auto string, int, autres)


Les boucles :

| Franglo    | pythonSynt        |
| ---------- | ----------------- |
| `tant que` | `while`           |
| `jusqu'a`  | `for .. in range` |
| `pour`     | `for`             |

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

# Liste les mots avec "A" et "a"

motsTraiter=[[moty] for moty in mots if "a" in moty if "A" in moty]

# Crée un dico

ligne0 = ["nom", "couleur"]
ligne1 = ["chou-fleur", "blanc"]
ligne2 = ["courgette", "vert"]
ligne3 = ["tomate", "rouge"]

table = [ligne0, ligne1, ligne2, ligne3]
table

# Premiere lettre dans un dico
table[0][1][0]

# Crée un table à partir d'un csv en enlever la premiere ligne d'index 
import csv
with open("legumes.csv", encoding='utf-8-sig') as legumes_file:
    legumes_data = csv.reader(legumes_file, delimiter=';')
    legumes_list = []
    for row in legumes_data:
        if legumes_data.line_num >1:
            legumes_list.append(row)


```

## Source

- school
- other 

