# ACL

Vérifier si les acl sont installé : `grep ACL /boot/config-$(uname -r)`

install: apt install acl

## Utilisation

### Création

```bash
setfacl -m u:utilisateur:rw fichier # ajoute les droits rw à l'utilisateur
setfacl -m g:groupe:rw fichier # ajoute les droits rw au groupe
setfacl -m o:rw fichier # ajoute les droits rw à tous les autres
```

Sur un dossier :

```bash
setfacl -Rm u:utilisateur:rw dossier # ajoute les droits rw à l'utilisateur

Avec héritage ( si on il crée un dossier les fichiers dans le dossier créers auront les droits rw)
setfacl -Rmd u:utilisateur:rw dossier # ajoute les droits rw à l'utilisateur
```

### Suppression

```bash
setfacl -b test
setfacl -x u:alex,g:ecole test
```




## Diagnostique

ls -l fichier :

drwxrwxrwx **+** 2 root root 4096 Jun 10 15:19 test (le plus permet de montrer qu'il y a des acl)



### Sources :

- [bien](http://sdz.tdct.org/sdz/les-acl-access-control-lists-sous-linux.html)
- [goffinet](https://linux.goffinet.org/administration/securite-locale/access-control-lists-acls-linux/)
- [grafikart](https://www.youtube.com/watch?v=yb3TloUaIk8=
- [doc.ubuntu](https://doc.ubuntu-fr.org/acl)