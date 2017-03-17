# Introduction
## Infrastructure as code

L'infrastructure as code ou encore "infrastructure programmable" est un type d'infrastructure IT administré via du code (avec divers langage possible suivant la technologie utilisée). L'IAC est utilsée à la fois pour gérer les configurations, déployer et automatiser le provisionnement d'une infrastructure. Nous allons donc avoir le code écrit pour pouvoir fournir et gérer nos serveurs tout en permettant d'automatiser les tâches. 
L'IAC, n'est plus seulement utilisée par les admins sys, en effet les développeurs de logiciels et d'applications peuvent facilement écrire un code d'infrastructure pour pouvoir se créer un environnement à des fins expérimentales pour tester leurs logiciels.
De nombreux outils utilisent l'IAC comme par exemple Vagrant qui va permettre de créer un environnement virtuel grâce au code contenu dans le Vagrantfile, ou encore Ansible qui va lui permettre un provisionement. Plus récemment le logiciel Docker qui permet d'automatiser le déploiement d'applications dans des conteneurs logiciels utilise également l'IAC avec les dockerfile.
Une infrastructure as code à aussi la particularité de pouvoir être déployée (suivant la technologie que l'on utlise) à la fois sur des machines locales, des serveurs, des environnements virtuels ou encore dans le cloud.
L'IAC permet aussi de suivre les modifications d'une infrastructure, en cas de problème il sera alors très simple de revenir à la configuration précédente.
Cependant, l'infrastructure as code possède aussi des inconvénients. Une mauvaise configuration sera dupliquée sur toutes les machines concernées, il faut aussi faire attention aux modifications que l'on fait, par exemple si on modifie la configuration d'un serveur manuellement, elle n'aura plus rien à voir avec le modèle de base qui est dans le code. L'IAC utilisant de nombreux logiciels différents, il faut aussi effectuer des tâches de recherche pour savoir lequel va le plus correspondre à ses besoins.

## Mouvance Devops

Devops est la concaténation du mot *development* et *operations* (en anglais). Au début de l'informatique en entreprise, les applications ne jouaient pas un grand rôle et étaient peu intégrées, il n'y avait alors pas de séparation entre développement et opérations, la même équipe d'informaticiens se chargeait à la fois du développement de l'application et de sa maintenance.


L'évolution de l'informatique d'entreprise a entrainé l'évolution de l'utilisation des logiciels. Aujourd'hui les logiciels ont une place beaucoup plus importante dans une entreprise.
et ont prisent plus de place en terme d'utilisation ce qui a conduit à une séparation de dev et ops en deux équipes distinctes. L'équipe de développement apportait les changements aux logiciels souvent le plus rapidement possible pour un moindre coût tandis que l'équipe ops garantissait la stabilité du système en ce concentrant sur la qualité. 

> Sanjeev Sharma et Bernie Coyne7 recommandent :

    un déploiement régulier des applications, la seule répétition contribuant à fiabiliser le processus ;
    un décalage des tests "vers la gauche", autrement dit de tester au plus tôt ;
    une pratique des tests dans un environnement similaire à celui de production ;
    une intégration continue incluant des "tests continus" ;
    une boucle d'amélioration courte (i.e. un feed-back rapide des utilisateurs) ;
    une surveillance étroite de l'exploitation et de la qualité de production factualisée par des métriques et indicateurs "clé".

La mise en oeuvre du DevOPs vient de la vonlonté de travaller ensemble pour produire de la valeur pour l'entreprise. Pour cela on va définir des objectifs communs aux équipes de développement et de production

## Le cloud computing

Le Cloud computing est un concept qui s'oppose à la notion de stockage local. Pour faire simple, le cloud computing va permettre d'utiliser des ressources informatiques sans les posséder réellement, de fournir des services ou des applications accessibles partout depuis internet. Il y a de nombreux avantages à utiliser un cloud computing. Tout d'abord, l'utilisateur n'a pas d'infrastructure à gérer, ce qui est parfois plus simple pour des entreprises, car c'est le fournisseur cloud qui s'occupe de la maintenance de ses équipements. Il permet donc une réduction des coûts en n'ayant pas besoin d'investir dans une infrastructure interne, mais en payant uniquement ce qu'il consomme à son fournisseur de cloud. Cependant, on a bien entendu des inconvénients comme le fait de savoir où le prestataire de service stocke nos données (territoire national ou pas -> problèmes de loi), la sécurité du cloud sur le stockage, la confidentialité et aussi vis-à-vis des hackers, on doit donc avoir confiance en le prestataire.

Il existe trois catégories de services pour le cloud computing.

- Le cloud privé : infrastructure pouvant être gérée en interne par l'entreprise ou par un prestataire qui se verra confier les tâches relatives à l'administration et l'optimisation des performances. Il est conçu uniquement pour un seul utilisateur pour répondre aux mieux aux besoins. Ce modèle a pour avantage de laisser à l'entreprise le contrôle à la fois sur la gestion des services, des données et de l'infrastructure. Le fait que ce soit un système fermé permet de mieux connaître les paramètres de sécurité, les garanties de service et la politique de confidentialité. Cependant, le déploiement de ce type d'infrastructure est très coûteux à mettre en place.

- Le cloud public : structure souple et ouverte proposée par des tiers spécialisés comme Amazon Web Services, Microsoft Azure, IBM, Google Compute Engine ou encore Cloudwatt. Le plus souvent ces services sont vendus sur demande, le client va donc être facturé sur ce qu'il consomme. L'ensemble de l'infrastructure est géré par le fournisseur de service, ce qui permet une utilisation plus souple pour le client. Le cloud public s'adapte rapidement aux différents besoins, c'est ce qui charme le plus les entreprises (ne pas être limités par le volume de données). L'un des inconvénients est l'absence de contrôle sur cette solution, que ce soit sur les données, sur la rapidité (beaucoup d'utilisateurs serveur mutualisé) pas forcément adapté à nos besoins. Si l'entreprise recherche de la confidentialité, le service de cloud public n'est pas recommandé. Pour l'aspect économique, ce service va permettre une réelle économie, car il n'y a pas de matériel ou d'informaticien à gérer, mais plus le client utilisera le service plus la facture sera élevée.

- le cloud hybride : est un système mixte qui mélange le cloud privé et public. Le client va faire appel à plusieurs clouds indépendants les uns des autres, ce qui permet de placer les données sensibles et confidentielles dans un cloud privé et les autres dans un cloud public. Avec ce type de cloud, on va aussi pouvoir réduire les coûts d'exploitation en tirant l'avantage des deux infrastructures, on va ainsi dimensionner son cloud privé pour une charge moyenne et le cloud public pour répondre aux montées de charge.

(TODO : encore du C/c)
Les différents modèles de cloud englobent plusieurs types de services, que l’on peut regrouper en trois parties :
- IaaS - Infrastructure As a Service : le but est d’offrir un service de bas niveau, le consommateur peut alors choisir le système d’exploitation et y installer les outils adaptés à ses besoins. Il est possible de louer dynamiquement des machines virtuelles pour une courte durée. Il est également possible de louer un ensemble de machines constituant une infrastructure externe. Les acteurs français du IaaS sont Online.net, OVH (Kimsufi), ...
- PaaS - Platform As a Service : cette fois-ci, le système est déjà installé, c’est le fournisseur qui gère le système et l’infrastructure. Le consommateur profite alors de la plate-forme pour y installer les applications souhaitées. Un exemple illustrant bien le PaaS est l’hébergement web, où l’hébergeur fournit une plate-forme souvent LAMP4, afin d’y héberger des sites web ou des systèmes de gestion de contenus.
- SaaS - Software As a Service : c’est une suite d’applications proposées aux consommateurs. Ces derniers ne s’occupent de rien, c’est le fournisseur qui gère l’intégralité de l’infrastructure, des systèmes et des logiciels. Gmail, Office Web Apps, Google Apps sont les fournisseurs de SaaS les plus connus.

## Contexte du projet

Xilopix (NOTE : url du site) est une start-up basée à Epinal qui développe un moteur de recherche pensée pour le tactile. Leur technologie se diffère des autres navigateurs web, car lors d'une recherche on va avoir une combinaison d'éléments de différentes natures (textes, images, vidéos, pages web, géolocalisation, sons, etc.) qui sera possible d'affiner en choisissant à quel info on souhaite avoir accès. De fait Xilopix va permettre d'améliorer la pertinence des résultats de recherche tout en offrant une nouvelle expérience utilisateur à la fois visuelle, tactile et ludique.
Xilopix utilise une infrastructure cloud avec plusieurs hébergeurs (ovh et cloudwatt) tous sur OpenStack. OpenStack permet de faire du IaaS (le consommateur peut choisir pour ses machines le système d'exploitation et les différents outils dont il a besoin), il va monter une infrastructure dans le domaine du cloud computing. Cependant, Xilopix souhaiterait ne plus être dépendant d'OpenStack et être libre d'utiliser AWS par exemple. C'est dans cette optique qu'intervient Terraform.

## Enjeu et problématique

L'objectif du projet est de développer un proof of concept sur l'outil Terraform pour pouvoir démontrer les avantages de cet outil.

> Un proof of concept est une réalisation expérimentale concrète et préliminaire, courte ou incomplète, illustrant une certaine méthode ou idée afin d'en démontrer la faisabilité. (NOTE source wikipédia: https://fr.wikipedia.org/wiki/Preuve_de_concept)

Pour se faire, nous allons mettre en place un cluster de quatres machines virtuelles ainsi qu'un réseau, un sous-réseau et un routeur pour recréer une infrastructure minimale fonctionnelle avec l'outil Terraform. Xilopix ayant une infrastructure utilisant OpenStack, nous avons créer des configurations fonctionnant pour OpenStack.

A partir de ces études, Xilopix pourra choisir d'utiliser ou non cet outil.

La finalité du projet est d'obtenir une création rapide et demandant un minimum d'intervention humaine pour déployer plusieurs machines aussi bien sous OpenStack, sous AWS ou tout autre provider. Terraform va donc nous permettre de réduire les dépendances entre ces outils et les infrastructures qui les utilisent tout en facilitant la mise en place de machines.

## Quelques mots sur Openstack

OpenStack est un ensemble de logiciels/modules open source permettant de déployer des infrastructures de cloud computing. La technologie possède une architecture modulaire composée de plusieurs projets (Nova, Swift, Glance…) qui permettent de contrôler les différentes ressources des machines virtuelles telles que la puissance de calcul, le stockage ou encore le réseau inhérents au centre de données sollicité.

## Quelques mots sur Terraform

Terraform est une solution pour la construction, la modification et le versionning d'infrastructure de manière sûre et efficace. Développé depuis 2013 par HashiCorp, c'est un outil en pleine expansion. Il permet de gérer plusieurs fournisseurs de services existant ainsi que des solutions développées en interne. Avec cette technologie, il est possible d'administrer des composants de bas niveau comme les IaaS, le stockage et la mise à niveau, ainsi que des composants haut niveau comme les entrées DNS et les fonctionnalités SaaS.

