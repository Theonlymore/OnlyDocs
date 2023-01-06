# GPO pour mettre un users en admin Local

Étapes :

- Créer un groupe de sécurité dans AD : `Administrateur local`
- Créer une GPO (à la racine): `Administrateur local`
- Dans la GPO : 
  - Configuration ordinateur > Paramètres Windows > Paramètres de sécurité > Groupes restreints
    - Ajouter le groupe `Administrateur local` dans la liste des groupes restreints
    - Au niveau de "Ce groupe est membre de " mettre `Administrateurs` (sans faire "Parcourir")

### Sources

- [it-connect](https://www.it-connect.fr/gpo-definir-un-utilisateur-administrateur-local-de-tous-les-pcs/)