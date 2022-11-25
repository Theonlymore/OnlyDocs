# ACL

Vérifier si les acl sont installé : `grep ACL /boot/config-$(uname -r)`

install: apt install acl


## Diagnostique

ls -l fichier :

drwxrwxrwx **+** 2 root root 4096 Jun 10 15:19 test (le plus permet de montrer qu'il y a des acl)



### Sources :

- [grafikart](https://www.youtube.com/watch?v=yb3TloUaIk8
- )
- [doc.ubuntu](https://doc.ubuntu-fr.org/acl)