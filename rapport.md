###Table des matières

**1.REMERCIEMENTS**
**2.INTRODUCTION ET PROBLÉMATIQUE**

- Le cloud computing
- Contexte et Problématique
- Terraform (intro rapide)
- Gestion du Projet

**3.TERRAFORM**

---------------------------------------------
	
###2.INTRODUCTION ET PROBLÉMATIQUE

####Le cloud computing : 
http://www.lebigdata.fr/definition-cloud-computing
https://www.numergy.com/centre-de-ressources/article/quest-ce-que-le-cloud-computing

Le Cloud computing est un concept fourre‐tout qui s'oppose à la notion de stockage local.   Pour faire simple, le cloud computing va permettre d'utiliser des ressources informatiques sans les posséder réellement, de fournir des services ou des applications accessibles partout depuis internet. Il y a de nombreux avantages à utiliser un cloud computing. Tout d'abord, l'utilisateur n'a pas d'infrastucture à gérer, ce qui est parfois plus simple pour des entreprises, car c'est le fournisseur Cloud qui s'occupe de la maintenance de ses équipements. Il permet donc une réduction des coûts en ayant pas besoin d'investir dans une infrastucture interne mais en payant uniquement ce qu'il consomme à son fournisseur de cloud. Cependant on a bien entendu des inconvénients comme le fait de savoir ou le prestataire de service stocke nos données (territoire national ou pas -> problèmes de loi), la sécurité du cloud sur le stockage, la confidentialité et aussi vis-à-vis de hackers, on doit donc avoir confiance en le prestataire. 
Il existe trois catégories de services pour le cloud computing. 

- Le cloud privé : infrastucture pouvant être gérée en interne par l'entreprise ou par un prestataire qui se verra confier les tâches relatives à l'administration et l'optimisation des performances. Il est conçu uniquement pour un seul utilisateur pour répondre aux mieux aux besoins. Ce modèle a pour avantage de laisser à l'entreprise le contrôle à la fois sur la gestion des services, les données et l'infrastructure. Le fait que ce soit un système fermé permet de mieux connaître les paramètres de sécurité, les garanties de service et la politique de confidentialité. Cependant le déploiement de ce type d'infrastructure est très coûteux à mettre en place. 

- le cloud public : structure souple et ouverte proposé par des tiers spécialisées comme Amazon Web Services, Microsoft Azure, IBM, Google Compute Engine ou encore Cloudwatt. Le plus souvent les services sont vendus sur demande, le client va donc être facturé sur ce qu'il consomme. L'ensemble de l'infrastructure est gérés par le fournisseur de service, ce qui permet une utilisation plus souple pour le client. Le cloud public s'adapte rapidement au différents besoins, c'est ce qui charme le plus les entreprises (ne pas être limités par le volume de données), mais l'un des inconvénient c'est que l'on a aucun contrôle sur cette solution que ce soit sur les données, sur la rapidité (beaucoup d'utilisateurs il n'est pas que pour un client), pas forcément adapté à nos besoins. Si l'entreprise recherche de la confidentialité, le service de cloud public n'est pas recommandé. Pour l'aspect économique, ce service va permettre une réelle économie car il n'y a pas de matériel ou d'informaticien à gérer mais plus le client utilisera le service plus la facture sera élevé. 

- le cloud hybride : est un système mixte qui mélange le cloud privé et public. Le client va faire appel à plusieurs clouds, indépendants les uns des autres, ce qui permet de placer les données sensibles et confidentielles dans un cloud privé et le reste dans un cloud public. Avec ce type de cloud on va aussi pouvoir réduire les coûts d'exploitation en tirant l'avantage des deux infrastuctures, on va ainsi dimensionner son cloud privé pour une charge moyenne et le cloud public pour répondre au monté de charge.

Les différents modèles de cloud englobent plusieurs types de services, que l’on peut regrouperen trois parties (il existe néanmoins d’autres types de « As a Service » comme le DaaS 2, STaaS 3 :
— IaaS - Infrastructure As a Service : Le but est d’offrir un service de bas niveau, le consommateur peut alors choisir le système d’exploitation et y installer les outils adaptés à ses besoins. Il est possible de louer dynamiquement des machines virtuelles pour une courte
durée, mais il est également possible de louer un ensemble de machines constituant une
infrastructure externe. Les acteurs français du IaaS sont Online.net, OVH (Kimsufi), . . .
— PaaS - Platform As a Service : Cette fois-ci, le système est déjà installé, c’est le fournisseur
qui gère le système et l’infrastructure. Le consommateur profite alors de la plate-forme pour
y installer les applications souhaitées. Un exemple illustrant bien le PaaS est l’hébergement
web, où l’hébergeur fournit une plate-forme souvent LAMP 4
, afin d’y héberger des sites
web ou des systèmes de gestion de contenus.
— SaaS - Software As a Service : C’est une suite d’application(s) proposée(s) aux consommateurs.
Ces derniers ne s’occupent de rien, c’est le fournisseur qui gère l’intégralité de
l’infrastructure, des systèmes et des logiciels. Gmail, Office Web Apps, Google Apps sont
les fournisseurs de SaaS les plus connus.


####Contexte et Problématique : 
Xilopix, start-up basé à Epinal, souhaiterai mettre en place rapidement des services OpenStack, tout en n'etant pas bloqué avec cette technique et voudrais donc pouvoir aux besoins changer d'outils pour le déploiement de cloud en passant par exemple à AWS. Terrafom vas donc leur permettre de réduire leur dépendances avec la syntaxe et la mise en place d'openstack.

L'objectif de notre projet tutoré est de développer un proof of concept sur l'outil Terraform, et de démontrer les avantages de celui-ci.

Pour se faire nous allons mettre en place un cluster de quatres machines virtuelles cliente Openstack avec Terraform.

La finalité du projet est d'obtenir une création rapide et demandant un minimum d'intervention humaine pour déployer plusieurs machines aussi bien sous OpenStack que sous AWS.

Terraform vas donc nous permettre de réduire les dépendances entre ces outils et les infrastructures qui les utilisent tout en facilitant la mise en place de machines.


####Terraform (intro rapide):
##### Introduction

Terraform à été créé en 2013 et développé en Go. De ce fait, l'installation se compose simplement d'une archive à récupérer pour ensuite pouvoir éxécuter la commande terraform contenu dans celui-ci.
Terraform est un outil pour la construction d'infrastucture, la modification et le versioning de maniére sûre et efficace. Il permet de gérer plusieurs fournisseurs de services existant ainsi que les solutions qui sont developpées en interne.

TerraForm fonctionne avec des fichiers de configuration. Ces fichiers texte servent à décrire l'infrastructure et à définir des variables. Il y a deux type de fichier *.tf* et *.tf.json* selon le language utilisé HCL (HashiCorp Configuration Language) ou JSON. Le format JSON est destiné aux machines. C'est fichiers de configuration décrivent les composants qui seront necessaire à l'exécution de TerraForm pour une seule application ou sur l'ensemble d'un data center. TerraForm génère un plan d'éxécution décrivant les étapes qu'il va effectuer *`terraform plan`*, puis exécute le plan *`terraform apply`*. TerraForm peut aussi détecter les changements et créer des nouveaux plans d'exécution.

TerraForm permet de gérer les composants de bas niveau, comme les IaaS, le stockage et la mise a niveau, ainsi que des composants haut niveau comme les entrées DNS et les fonctionnalités SaaS.

##### Caractéristiques de TerraForm 

Terraform disposent de quatres principales caractéristiques.

- ** Coder son infrastucture : ** L'infrastructure est décrite en utilisant une syntaxe de configuration de haut niveau (HCL). Cela permet à un data center d'être versionné et traité comme tout autre code.L'avantage de cette technique est de permetre le déployment rapide d'une même infrastructure sur différent poste et ainsi obtenir le même environnement de travail / d'exploitation poouvant servir dans plusieurs contexte (test,developpement...).

- ** Plan d'exécution : ** Terraform a une étape de «planification» qui génère un plan d'exécution. Le plan d'exécution montre les actions que TerraForm effectuera lorsqu'il sera lancé. Cela permet d'augmenter la sécurité en evitant d'avoir des surprises lorsque TerraForm manipule l'infrastructure. 

- ** Graphique des resources : ** Terraform construit un graphique de toutes les ressources des infrastructures, et parallélise la création et la modification de toutes ces ressources non-dépendantes. Grâce à cela, TerraForm construit l'infrastructure aussi effacement que possible, et les utilisateurs peuvent avoir un aperçu des dépendances de leur infrastructure.

- ** Automatisation des changements : ** Des ensembles complexes de changements peuvent être appliqués à une infrastructure avec une interaction humaine minimale. Pour se faire TerraForm se base sur le plan d'exécution et le graphique de ressources mentionnés précédemment, évitant ainsi des erreurs humaines possibles.

##### Installation

Ajout du chemin du fichier au PATH `PATH=/usr/local/...:$PATH`

##### Syntaxe 

Les configurations de Terraform sont écrites en HashiCorp Configuration Language (HCL). Ce langage ce veut facile a écrire et à lire. On peut également écrire nos configuration en JSON pour JavaScript Object Notation (dérivé de la notation objet du JavaScript).

Les bases du langage :

*Les commentaires :* 
	- # sur une seule ligne
	- /\* mon commentaires sur plusieurs lignes \*/

*Affectation des valeurs :* On utilise la syntaxe suivante
	
		key = value # la valeur peut être une chaîne, un nombre ou un booléen
		
*Chaînes multilignes :* On utilise << - EOF et EOF qui permettent de créer des chaînes multilignes sans avoir à mettre "\n" partout

Il existe également de nombreuses fonctions utilisable avec HCL comme par exemple la fonction format(format, args, ...) qui va permettre de formater une chaîne selon le format que l'on donne.



####Gestion de projet :

-> parler de Github et de notre organisation.


## Introduction a TerraForm 

### 1. Qu'est-ce que Terraform?

Tout d'abord TerraForm est un outil pour la construction d'infrastucture  , la modification et le versioning de maniére sûre et efficace. Il permet de gérer plusieurs fournisseurs de services existant ainsi que les solutions qui sont developpées en interne.

TerraForm fonctionne avec des fichiers de configuration. Ces fichiers texte servent à décrire l'infrastructure et à définir des variables. Il y a deux type de fichier *.tf* et *.tf.json* selon le language utilisé HCL (HashiCorp Configuration Language) ou JSON. Le format JSON est destiné aux machines. C'est fichiers de configuration décrivent les composants qui seront necessaire à l'exécution de TerraForm pour une seule application ou sur l'ensemble d'un data center. TerraForm génère un plan d'éxécution décrivant les étapes qu'il va effectuer *`terraform plan`*, puis exécute le plan *`terraform apply`*. TerraForm peut aussi détecter les changements et créer des nouveaux plans d'exécution.

TerraForm permet de gérer les composants de bas niveau, comme les IaaS, le stockage et la mise a niveau, ainsi que des composants haut niveau comme les entrées DNS et les fonctionnalités SaaS.

### 2. Caractéristiques de TerraForm 

Les principales caractéristiques de TerraForm 

- ** Coder sont infrastucture : ** L'infrastructure est décrite en utilisant une syntaxe de configuration de haut niveau (HCL). Cela permet à un data center d'être versionné et traité comme tout autre code.

- ** Plan d'exécution : ** Terraform a une étape de «planification» qui génère un plan d'exécution. Le plan d'exécution montre les actions que TerraForm effectuera lorsque qu'il sera lancé. Cela permet d'augmenter la sécurité en evitant d'avoir des surprises lorsque TerraForm manipule l'infrastructure. 

- ** Graphique des resources : ** Terraform construit un graphique de toutes les ressources des infrastructures, et parallélise la création et la modification de toutes ces ressources non-dépendantes. Grâce à ça, TerraForm construit l'infrastructure aussi effacement que possible, et les utilisateurs peuvent avoir un aperçu des dépendances de leur infrastructure.

- ** Automatisation des changements : ** Des ensembles complexes de changements peuvent être appliqués à une infrastructure avec une interaction humaine minimale. Pour se faire TerraForm se base sur le plan d'exécution et le graphique de ressources mentionnés précédemment, évitant ainsi des erreurs humaines possibles.

### 3. Quelque cas d'utilisation de TerraForm 

#### Self-Service Clusters

Dans de grandes organisations il devient plus attrayant de créer une infrastructure «self-service», permettant aux équipes de gérer leur propre infrastructure à l'aide de l'outillage fourni par l'équipe centrale d'exploitation.

À l'aide de Terraform, la connaissance de la construction de l'infrastructure et de l'échelle d'un service peut être codifiée dans une configuration. La configurations de Terraform peut être partagée au sein d'une organisation permettant aux équipes d'utiliser Terraform comme un outil pour gérer leurs services. sans connaître la configuration.

#### Démos de logiciels

A l'instar de Vagrant qui permet la création d'environnement virtualisé, les éditeurs de logiciels peuvent fournir une configuration TerraForm pour créer et démarrer une infrastructure de démonstration. Ceci permet aux utilisateurs finaux de mettre en place rapidement un environnement de test sur leur propre infrastructure.

#### Multi Cloud-Déploiement

Il est souvent attrayant de répandre l'infrastructure sur plusieurs cloud pour augmenter la tolérance aux pannes. En utilisant une seule région ou un seul fournisseur cloud , la tolérance aux pannes est limitée par la disponibilité de ce fournisseur. Avoir un déploiement multi-cloud permet une meilleure récupération de la perte d'une région ou tout le fournisseur.

Terraform permet la configuraton de plusieurs providers en une seule configuration. Cela simplifie la gestion et l'orchestration des providers, en aidant la création d'infrastructures multi-cloud.

## *Installation*
Les fihciers de configuration sont lu par ordre alphabétique.

### Bloc **`provider`**
Configuration du provider (terraform peut contenir plusieurs bloc provider). Gère le cycle de vie des ressources (create, read, update, delete).

### Bloc **`resources`**
Resources (composant physique/logiciel) qui existent dans l'infrastructure. 

si on fait une resource "aws_truc", on utilise le provider aws, il en va de même pour openstack.

### Variable
fichier .tfvars
`terraform apply -var-file=truc.tfvars`

### Modules
Terraform peut avoir des modules qui seront installés par terraform. Un modules peut être un morceaux de code terraform ayant une fonction qui sera ensuite appelé.
```language
module "Name" {
	source = "github.../dossier"
}
```

Possibilité de créer le même resoures plusieurs fois. 
Ex : (les ami c'est un truc d'amazon)
Création de 15 instances
```
resource "aws_instance" "example" {
  count = 15
  ami = "ami-v1"
  instance_type = "t2.micro"
}
```
## Quelques commandes
- `terraform plan` -- génére un plan d'action de la configuration. plan inclu toutes les actions faites, montre modif que vas effectuer terraform
- `terraform graph` -- permet visualisation du plan 
- `terraform apply` -- applique le plan
- `terraform show` -- montre les infra en place


## Openstack et teraform
configuration d'un provider (auth) puis configuration des blocks d'openstack (computer /compute ...) dans des resources Terraform. 
- [Doc officielle Terraform & openstack](https://www.terraform.io/docs/providers/openstack/index.html)
- [tuto op/terr](http://www.matt-j.co.uk/2015/03/27/openstack-infrastructure-automation-with-terraform-part-2/)

## Lien en vrac
[link 1](https://www.terraform.io/docs/configuration/variables.html)
[link 2](https://www.terraform.io/docs/providers/)
[link4](https://blog.gruntwork.io/a-comprehensive-guide-to-terraform-b3d32832baca)