# Python : Programmation Orientée Objet

La programmation orienté objet est un paradigme de programmation comme :

- **Impératif ou procédurale** : celui au quels on est habitués
- Objet
- Fonctionnel

De base (impératif), on écrit une recette / une suite d'instructions.

Quand on écrit un programme object, on modélise le problème par objet que l'on fait ensuite interagir entre eux.

## Plus concrètement 

Avant d'utiliser un objet dans un programme, il faut le décrire et le définir.

Une objet est créés à partir de **classes**. Un **classe** est la définition.

L'objet crée à partir d'une classe est : **instance**

Le contructeur est la méthode qui détermine comment elle va être construite. 


```py
class Chambre():
    ouverte = False
    code_secret = 0000

    def __init__(self, pays, departement):
        self.pays = pays    
        self.departement = departement

        # Constructeur de la classe
        pass
    
    def fermer(self):
        self.ouverte = False
        return self.ouverte

    def ouvrir(self, code_saisi):
        if code_saisi == self.code_secret:
            print("mot de passe correct")
            self.ouverte = True
        else:
            print("mot de passe incorrect")
        return self.ouverte
    
    def modifier_code(self, ancien_code, nouveau_code):
        if ancien_code == self.code_secret:
            self.code_secret = nouveau_code
            return True
        return False

class Villageois():
    
    def __init__(self, prenom, code, maison):
        self.prenom = prenom
        self.code = code
        self.maison = maison

    def ouvrirChambre(self):
        return self.maison.ouvrir(self.code)


Room = Chambre("france", "53")  # Création d'une instance de la classe Chambre
Room.modifier_code(0000, 2512)

Alex = Villageois("Alexandre",2512, Room) # Création d'une instance de la classe Villageois

print(Alex.ouvrirChambre()) # Ouvrir la chambre avec le mot de passe en memoire d'Alex
``` 
