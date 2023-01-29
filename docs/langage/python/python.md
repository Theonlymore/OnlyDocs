# Python

## Les bases

| Object/Expression | Commentaire |
| ----------------- | ----------- |
| `print`           |
| `type`            |
| `input`           |
| `len`             |	
| `dir`             |


Python est un language à typage **dynamique**. ( auto string, int, autres)

Toutes les méthode sur un objet : `dir(liste)`
help(list.append)

## Les Conditions/tests


## Les boucles

| Franglo    | pythonSynt        |
| ---------- | ----------------- |
| `tant que` | `while`           |
| `jusqu'a`  | `for .. in range` |
| `pour`     | `for`             |


## Liste


```py
exemple = ["papi", "mami", "papa", "maman"]

exemple[1] : 'mami'
exemple[1:3] : ['mami', 'papa']

#Ajouter élément
exemple.append("soeur")

# Retirer un élément ( si par exemple mami meur)
exemple.remove("mami")
del exemple[1]

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

s = 'egg egg beans'
a = s.split() : ['egg', 'egg', 'beans'] # Split sur les espaces
a.join(' ') : 'egg egg beans'

```

### Tuple

à faire

### Autres

Savoir le temps pour executer un instruction.


### Compréhensions de listes :

```py
# Crée une liste de 0 à 9
liste = [1,2,3,4,5,6,7,8,9,10]

liste = []
liste = [1,2,3,4,5,6,7,8,9,10]
```

def addOne(p):
    return p+1

p = []
p = [i+1 for i in liste if i > 5] :

p : [7, 8, 9, 10, 11]

prenom = ["Alice", "bbeBnn", "JfffdPf", "jklJ"]

prenom = [i.title() for i in prenom] : ['Alice', 'Bebnn', 'Jfffdpf', 'Jklj']
```

## Import

Savoir les fonction dans un modules :
    
    ```py
    import math
    dir(math)
    ```

## Chaines de caractères

dir(str)

```py
# Concaténation
"Bonjour" + " " + "tout le monde"
quelque fonction
'123'.isdecimal()

age = '20'
n = 'alex'
"{} {}".format(n, age)
```
## Les séquences


```py
s = 'egg, bacon'
s[0]: 'e'
# Concaténation
s + ' and spam': 'egg, bacon and spam'
s[0:3]: 'egg' # Jusqu'a 3 exclu
s[0:10:2]: 'eg,an' # Jusqu'a 10 exclu, de 2 en 2
s[-10:-7]: 'egg' # 
```






## Source

- school
- other 

