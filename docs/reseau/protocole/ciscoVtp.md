# VTP : Vlan Trunking Protocol

Un **protocole propriétaire de cisco** permettant d'avoir un switch maitre et ensuite propagé la configuration VLAN.

Les vlan sont propagé en multi-cast.

Plusieurs mode : 

**VTP Server :** Switch maître ou l'administrateur peu faire tout les modification qui sont ensuite propagé.

**VTP Client :** Switch qui reçoit et se synchronise puis propage les annonces VTP

**VTP Transparent :** Switch qui ne traite pas les annonces VTP.
