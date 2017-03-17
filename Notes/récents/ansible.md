https://quentin.dufour.io/blog/2015-10-02/ansible
http://docs.ansible.com/ansible/playbooks_intro.html#playbook-language-example

#ANSIBLE

##Présentation
Ansible est un logiciel libre de licence GPL-3.0, crée par Michael DeHaan et écrit en python. La première version du logiciel date de avril 2012 et la dernière version est la 2.2.1.0 datant de janvier 2016.
Ansible est un outil de gestion de configuration qui se veut plus simple dans la prise en main que d’autres produits concurrents comme Puppet ou Chef.

##Utilisation 
D’une manière général on utilise un outil de gestion de configuration pour pouvoir maintenir une configuration identique sur différentes machines que se soit des serveurs ou des machines virtuelles.
Il est difficile de pouvoir gérer à la main tout un parc informatique, il est peu probable que chaque machine est parfaitement la même configuration (du par exemple à un oublie) et de plus sa peut être une tâche très répétitive et une réelle perte de temps suivant la taille du parc.
Il est donc conseillé d’utiliser un outil de gestion de configuration qui va permettre de mettre à jour de façon automatisée des serveurs, par exemple si on souhaite changer un paramètre ou encore déployé un nouveau paquet, il nous suffit juste de modifier l’outil de gestion de configuration. Il permet également de contrôler et de corrigé tout écart dans la configuration.
Pour plusieurs raisons, Ansible est plus simple d’utilisation que les logiciels concurrents. Tout d’abord il est agent-less, c’est à dire qu’il n’y a pas de configuration de type client/serveur à gérer. Il faut seulement un serveur SSH sur les machines à gérer pour qu’elle puisse être gérer par Ansible. Ansible utilise aussi un langage qui est très simple a aborder, le YAML. 
YAML acronyme de Yet Another Markup Language est proposé par Clark Evans en 2001, il reprend le concepts d’autres langages comme le XML. Le YAMl se veut être le plus lisible possible par tous.
Tous les fichiers en YAML peuvent commencer par --- et terminer par ... , c'est le format qui indique le début et la fin d'un document. Lorsque l'on fait une liste, chaque élément de la liste est de type key: value que l'on appelle "hash" et "dictionnaire". Tous les membres d'une liste correspondent à une ligne qui doivent commencer au même niveau d'indentation et par un tiret plus un espace.
exemple :

	---
	# Liste d'OS LInux
	OS:
		- Debian
		- Manjaro
		- Linux Mint
		- Ubuntu
	
	...

##Fonctionnement
Ansible utilise des Playbooks pour pouvoir déclarer des configurations, ce sont la base du système de gestion de configuration et de déploiement multi-machines. Les PLaybooks sont écrit en YAML pour ne pas ressembler à un script de configuration mais plutôt à un modèle descriptif d'une configuration. 

####Les hôtes et les utilisateurs :
 