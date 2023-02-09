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
    code_secret = 2512
    pays = "suisse"
    departement = "75"

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


AlexRoom = Chambre("france", "53")  # Création d'une instance de la classe Chambre

print(AlexRoom.ouverte) # Affiche si la chambre est ouverte ou non

AlexRoom.ouvrir(2512) # Ouvre la chambre avec le code 2512

AlexRoom.modifier_code(2512, 1234) # Modifie le code de la chambre

AlexRoom.ouvrir(2512) # Tente d'ouvrir la chambre avec l'ancien code
AlexRoom.ouvrir(1234) # Tente d'ouvrir la chambre avec le nouveau code

print(AlexRoom.pays) # Affiche le pays de la chambre pour être sur que le constructeur a bien fonctionné
print(AlexRoom.departement)
``` 


