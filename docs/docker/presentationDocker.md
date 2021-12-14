# Docker

On compare souvent les conteneurs aux machines virtuelles. Mais ce sont de grosses simplifications parce qu’on en a un usage similaire : isoler des programmes dans des “contextes”. Une chose essentielle à retenir sur la différence technique : les conteneurs utilisent les mécanismes internes du _kernel de l’OS Linux_ tandis que les VM tentent de communiquer avec l’OS (quel qu’il soit) pour directement avoir accès au matériel de l’ordinateur.

![dockerVsVm](images/vm_vs_containers.png)

## Historiquement

À la base les entreprises utilisaient des machines physiques directement, cela n'était pas pratique si un service ne tourne pas sur le même OS que la machine physique, il faut en démarrer une nouvelle ce qui avait un grand coût, par la suite les entreprises ont utilisé les machines virtuelles qui sont très pratiques, car cela permet de virtualiser des machines ainsi pouvoir lancers plusieurs OS sur la même machine physique en pouvant les isolé les une des autres.

## L'arrivé de docker

L'arrivée de docker est principalement du au gros inconvénient des machines virtuelles, elles sont gourmandes en ressource et lent à démarrer. Docker permet d'éviter l'utilisation  de machine virtuelle





