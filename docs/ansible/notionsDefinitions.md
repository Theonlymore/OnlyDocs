# Notions et definitions Ansible

## Control node :

-  noeud disposant de ansible et permettant de déployer
-  accès ssh aux autres machines
-  password ou clef ssh
-  sécurité importante

Managed modes :

- serveur cibles
- permet la connexion ssh
- élevation de privilèges via le user
  
Inventory :

- Inventaires des machines (ip, dns)
- format ini (plat) ou format yaml
- les variables (host vars et group vars)
- statique (fichiers) ou dynamique (api via script)
- utilisaation de patterns possible (srv-p)


### Source :

https://www.youtube.com/watch?v=tirjpYSMkkM&list=PLn6POgpklwWoCpLKOSw3mXCqbRocnhrh-&index=4
