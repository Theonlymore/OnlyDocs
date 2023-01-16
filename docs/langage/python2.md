# Algo avancé 

## Strutures de données

### Pile (Stack)

**LIFO** (Last In, First Out) : (Dernier arriver, premier sortie)

Empiler (push) : ajouter sur la pile
Sommet (peek) : sommet de la pile
Dépiler (pop) : retirer de la pile
estVide (isEmpty) :


=== "Exemple"

    ```md
    historique (retour sur le site d'avant); CTRL-Z.
    ``` 

=== "En python"

    ```python
    def PileVide():
        return []

    def Empiler(x, p):
        p.append(x)

    def EstVide(p):
        return (p == [])

    def Sommet(p):
        return p[-1]

    def Depiler(p):
        p.pop(-1)

    def creer_pile(n,p):
        if n > 0:
            for i in range(n):
                Empiler(int(input("Element à ajouter a la pile : ")),p)
        print(p)
        

    def vider_pile(p):
        if not EstVide(p):
            print(Sommet(p))
            Depiler(p)
            vider_pile(p)

    p = PileVide()

    creer_pile(6,p)

    vider_pile(p)
    ```

**Exemple :** historique (retour sur le site d'avant); CTRL-Z.

#### Implémentation : 

Tableau ; Liste chainée (la valeurs et le pointeurs de la prochaine valeurs)

### File (Queue)

**FIFO** (First In, First Out) : (Premiere arriver, premier sortie)

Enfiler (enqueue) : ajouter sur la file
Defiler (dequeue) : retirer de la file
Tête (head) : premier element de la file

=== "Exemple"

    ```md
    Systeme d'impresion, ordre de tâches, ...
    ```
=== "En python"

    ```python
    def Enfiler(n,q):
        q.append(n)

    def Defiler(q):
        q.pop(0)

    def EstVide(q):
        return(q == [])

    def Tete(q):
        return(q[0])

    def FileVide():
        return []

    def creer_file(n,q):
        if n > 0:
            for i in range(n):
                Enfiler(int(input("Element à ajouter a la file : ")),q)
            print(q)

    def vider_file(q):
        if not EstVide(q):
            print(Tete(q))
            Defiler(q)
            vider_file(q)

    q = FileVide()

    creer_file(5,q)

    vider_file(q)    
    ```




### Sources 

- [File&Pile](https://www.youtube.com/watch?v=v_g1yizlUxc)