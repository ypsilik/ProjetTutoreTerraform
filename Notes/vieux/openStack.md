# Cloud
Le Cloud computing est un concept fourre‐tout. C’est le fait d’utiliser de la puissance de calcul ou de stockage de serveurs informatiques distants par l’intermédiaire d’un réseau, avec certaines caractéristiques comme la disponibilité, l’élasticité, la mutualisation et le paiement à l’usage.
## Cloud privé
Le cloud public est un cloud qui permet à l’entreprise d’externaliser ses moyens. Il y a donc moins d’informaticiens à embaucher. L’entreprise doit par contre payer une autre entreprise et perd le contrôle de l’infrastructure et les données. Exemple IaaS public connu : Amazon EC2, Windows Azure, RackSpace et CloudWatt.

## Cloud public
Le cloud privé est un cloud qui permet de ne pas perdre le contrôle de l’infrastructure et des données tout en améliorant la qualité de service. Ce type de cloud est de plus en plus utilisé dans les grandes entreprises. Cela demande des compétences en interne. Exemple IaaS privé connu : OpenStack, OpenNebula.

## Cloud hybride
Il y a aussi le cloud hybride qui permet d’utiliser les avantages du cloud privé et du cloud public. Avec un cloud hybride, une possibilité est de mettre les données sensibles et importantes dans le cloud privé et le reste dans le cloud public. Une autre possibilité dans l’optique de réduire ses coûts d’exploitation est de dimensionner son cloud privé pour une charge moyenne et d’utiliser le cloud public afin d’absorber les surcharges ponctuelles.

# IaaS
Infrastucture As a Service : Le but est d’offrir un service de bas niveau, le consommateur peut alors choisir le système d’exploitation et y installer les outils adaptés à ses besoins. Il est possible de louer dynamiquement des machines virtuelles pour une courte durée, mais il est également possible de louer un ensemble de machines constituant une infrastructure externe. Les acteurs français du IaaS sont Online.net, OVH (Kimsufi), ...

# OpenStack
OpenStack (actuellement version Newton) est un ensemble de logiciels/modules open source permettant de déployer des infrastructures de cloud computing. La technologie possède une architecture modulaire composée de plusieurs projets (Nova, Swift, Glance…) qui permettent de contrôler les différentes ressources des machines virtuelles telles que la puissance de calcul, le stockage ou encore le réseau inhérents au centre de données sollicité.
Chaque module - écrits en Python - est dédié à une fonction précise (gestion des machines virtuelles, gestion du réseau, gestion du stockage, gestion des utilisateurs, supervision de l’ensemble…) et ont chacun une base de données SQL attitrée dans laquelle ils écrivent et lisent les informations qui leur permettent de travailler. Ils communiquent entre eux et avec l’extérieur au moyen d’un jeu de commandes propres (l’API) et selon le protocole MQ. Selon l’usage que l’on veut faire d’OpenStack, il n’est pas nécessaire d’installer tous les modules.

## Architecture
### Controller Node
Contient l'identité du service, l'image du service, et gère le compute et le Networking. Il gère aussi le tableau de bord (l'interface graphique) et la base de données.

### Compute Node 1
Contient l'hyperviseur (par defaut KVM). C'est la partie principale d'une IaaS, cette partie est gérée par le module nova.

### Block Storage
Contient les blocks de données, il permet la création de volumes ,snapshots et backups et est géré par le module cinder.

## Modules
### Keystone, le service d'identité
Fournit un service d’authentification et d’autorisation pour les autres services d’OpenStack. Fournit un catalogue de endpoints pour tous les services d’OpenStack.

### Glance, la gestion d'images
Stocke et récupère des images disques de machines virtuelles. OpenStack Compute les utilise lors du provisioning d’instance.

### Nova, le Compute
Gère le cycle de vie des instances dans un environnement OpenStack. Les tâches incluent la planification, la création et la mise hors service de machines virtuelles à la demande. Il est composé de multiples services.

### Horizon, l'interface web
Fournit un portail libre-service de type web permettant d’interagir avec les services sous-jacents d’OpenStack, comme le lancement d’une instance, l’attribution d’adresses IP ou la configuration des contrôles d’accès.

### Cinder, le service de disques persistants
Fournit un stockage bloc persistant aux instances en cours d’exécution. Son architecture basée sur des drivers de type plugin facilite la création et la gestion des devices de stockage bloc.

### Neutron, la gestion de réseaux
Permet le Network-Connectivity-as-a-Service pour d’autres services d’OpenStack, comme Compute. Fournit une API utilisateur pour définir les réseaux et les attachements à ces réseaux. Possède une architecture modulaire qui permet le support de la plupart des fournisseurs et des technologies réseau.

### Swift, le stockage d'objet
Stocke et récupère des objets de données non structurées via une API RESTful basée sur HTTP. Le service est hautement tolérant aux pannes avec sa réplication de données et son architecture de type scale-out. Son implémentation diffère des serveurs de fichiers à répertoires montables. Le service écrit les objets et les fichiers vers plusieurs disques, en s’assurant que les données sont répliquées sur un cluster de serveurs.

### Heat, le service d'orchestration
Orchestre de nombreuses applications de cloud composites en utilisant soit le format de template natif HOT ou le format CloudFormation d’AWS, soit au travers d’une API REST native OpenStack, soit au travers d’une API compatible avec CloudFormation.

### Ceilometer, le service de métrologie
Surveille et mesure un cloud OpenStack dans un but de facturation, de mesure de performances, de scalabilité et de statistiques.

# Liens
- http://docs.openstack.org
- members.loria.fr/LNussbaum/ptasrall2017/rapport_g_openstack2014.pdfttps://en.wikipedia.org/wiki/OpenStack
- 