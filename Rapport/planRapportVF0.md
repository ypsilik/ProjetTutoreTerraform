# Introduction
## Le cloud computing

Le Cloud computing est un concept qui s'oppose à la notion de stockage local. Pour faire simple, le cloud computing va permettre d'utiliser des ressources informatiques sans les posséder réellement, de fournir des services ou des applications accessibles partout depuis internet. Il y a de nombreux avantages à utiliser un cloud computing. Tout d'abord, l'utilisateur n'a pas d'infrastructure à gérer, ce qui est parfois plus simple pour des entreprises, car c'est le fournisseur cloud qui s'occupe de la maintenance de ses équipements. Il permet donc une réduction des coûts en n'ayant pas besoin d'investir dans une infrastructure interne, mais en payant uniquement ce qu'il consomme à son fournisseur de cloud. Cependant, on a bien entendu des inconvénients comme le fait de savoir où le prestataire de service stocke nos données (territoire national ou pas -> problèmes de loi), la sécurité du cloud sur le stockage, la confidentialité et aussi vis-à-vis des hackers, on doit donc avoir confiance en le prestataire.

Il existe trois catégories de services pour le cloud computing.

- Le cloud privé : infrastructure pouvant être gérée en interne par l'entreprise ou par un prestataire qui se verra confier les tâches relatives à l'administration et l'optimisation des performances. Il est conçu uniquement pour un seul utilisateur pour répondre aux mieux aux besoins. Ce modèle a pour avantage de laisser à l'entreprise le contrôle à la fois sur la gestion des services, des données et de l'infrastructure. Le fait que ce soit un système fermé permet de mieux connaître les paramètres de sécurité, les garanties de service et la politique de confidentialité. Cependant, le déploiement de ce type d'infrastructure est très coûteux à mettre en place.

- Le cloud public : structure souple et ouverte proposée par des tiers spécialisés comme Amazon Web Services, Microsoft Azure, IBM, Google Compute Engine ou encore Cloudwatt. Le plus souvent ces services sont vendus sur demande, le client va donc être facturé sur ce qu'il consomme. L'ensemble de l'infrastructure est géré par le fournisseur de service, ce qui permet une utilisation plus souple pour le client. Le cloud public s'adapte rapidement aux différents besoins, c'est ce qui charme le plus les entreprises (ne pas être limités par le volume de données). L'un des inconvénients est l'absence de contrôle sur cette solution, que ce soit sur les données, sur la rapidité (beaucoup d'utilisateurs serveur mutualisé) pas forcément adapté à nos besoins. Si l'entreprise recherche de la confidentialité, le service de cloud public n'est pas recommandé. Pour l'aspect économique, ce service va permettre une réelle économie, car il n'y a pas de matériel ou d'informaticien à gérer, mais plus le client utilisera le service plus la facture sera élevée.

- le cloud hybride : est un système mixte qui mélange le cloud privé et public. Le client va faire appel à plusieurs clouds indépendants les uns des autres, ce qui permet de placer les données sensibles et confidentielles dans un cloud privé et les autres dans un cloud public. Avec ce type de cloud, on va aussi pouvoir réduire les coûts d'exploitation en tirant l'avantage des deux infrastructures, on va ainsi dimensionner son cloud privé pour une charge moyenne et le cloud public pour répondre aux montées de charge.

Les différents modèles de cloud englobent plusieurs types de services, que l’on peut regrouper en trois parties :
- IaaS - Infrastructure As a Service : le but est d’offrir un service de bas niveau, le consommateur peut alors choisir le système d’exploitation et y installer les outils adaptés à ses besoins. Il est possible de louer dynamiquement des machines virtuelles pour une courte durée. Il est également possible de louer un ensemble de machines constituant une infrastructure externe. Les acteurs français du IaaS sont Online.net, OVH (Kimsufi), ...
- PaaS - Platform As a Service : cette fois-ci, le système est déjà installé, c’est le fournisseur qui gère le système et l’infrastructure. Le consommateur profite alors de la plate-forme pour y installer les applications souhaitées. Un exemple illustrant bien le PaaS est l’hébergement web, où l’hébergeur fournit une plate-forme souvent LAMP4, afin d’y héberger des sites web ou des systèmes de gestion de contenus.
- SaaS - Software As a Service : c’est une suite d’applications proposées aux consommateurs. Ces derniers ne s’occupent de rien, c’est le fournisseur qui gère l’intégralité de l’infrastructure, des systèmes et des logiciels. Gmail, Office Web Apps, Google Apps sont les fournisseurs de SaaS les plus connus.

## Contexte du projet

Xilopix (NOTE : url du site) est une start-up basée à Epinal qui développe un moteur de recherche pensée pour le tactile. Leur technologie se diffère des autres navigateurs web, car lors d'une recherche on va avoir une combinaison d'éléments de différentes natures (textes, images, vidéos, pages web, géolocalisation, sons, etc.) qui sera possible d'affiner en choisissant à quel info on souhaite avoir accès. De fait Xilopix va permettre d'améliorer la pertinence des résultats de recherche tout en offrant une nouvelle expérience utilisateur à la fois visuelle, tactile et ludique.
Xilopix utilise une infrastructure cloud avec plusieurs providers (ovh et cloudwatt) tous sur OpenStack. OpenStack permet de faire du IaaS (le consommateur peut choisir pour ses machines le système d'exploitation et les différents outils dont il a besoin), il va monter une infrastructure dans le domaine du cloud computing. Cependant, Xilopix souhaiterait ne plus être dépendant d'OpenStack et être libre d'utiliser AWS par exemple. C'est dans cette optique qu'intervient Terraform.

## Enjeu et problématique

L'objectif du projet est de développer un proof of concept sur l'outil Terraform et d'en démontrer les avantages.
Pour se faire, nous allons mettre en place une infrastructure semblable à celle de Xilopix, avec un provider (cloudwatt) et un cluster de quatre machines virtuelles clientes OpenStack avec Terraform.
C'est à partir de ces études que Xilopix pourra choisir d'utiliser ou non cet outil.

La finalité du projet est d'obtenir une création rapide et demandant un minimum d'intervention humaine pour déployer plusieurs machines aussi bien sous OpenStack que sous AWS. Terraform va donc nous permettre de réduire les dépendances entre ces outils et les infrastructures qui les utilisent tout en facilitant la mise en place de machines.

## Quelques mot sur Terraform

Terraform est une solution pour la construction, la modification et le versionning d'infrastructure de manière sûre et efficace. Développé depuis 2013 par HashiCorp, c'est un outil en pleine expansion. Il permet de gérer plusieurs fournisseurs de services existant ainsi que des solutions développées en interne. Avec cette technologie, il est possible d'administrer des composants de bas niveau comme les IaaS, le stockage et la mise à niveau, ainsi que des composants haut niveau comme les entrées DNS et les fonctionnalités SaaS.


# Terraform
## Présenation

Terraform est un outil développé en Go qui permet la gestion d'infrastructure à l'aide de recettes. L'objectif de ce logiciel est de permettre une configuration centralisée, rapide et efficace d'une infrastructure.

Terraform fonctionne avec des fichiers texte pour configurer les futures infrastructures. Ces fichiers texte appelé \og recette \fg servent à décrire l'architecture des providers tel qu'Openstack ou AWS. La configuration se fait dans un fichier \og main.tf \fg qui est écrit en HCL(NOTE: HashiCorp Configuration Language). La configuration peut aussi être générée automatiquement par machine avec le format JSON(NOTE). L'extension du fichier sera alors \og main.tf.json \fg.

Terraform génère un plan d'exécution se basant sur les recettes et décrivant les étapes qu'il va effectuer. Puis exécute le plan précédemment défini pour mettre en place l'infrastructure. Terraform peut aussi détecter les changements et créer des nouveaux plans d'exécution.

Terraform permet de gérer les composants de bas niveau comme les IaaS, le stockage et la mise à niveau, ainsi que des composants hauts niveaux comme les entrées DNS et les fonctionnalités SaaS.

## Caractéristique

- ** Coder sont infrastructure : ** L'infrastructure est décrite en utilisant une syntaxe de configuration de haut niveau (HCL). Cela permet à un data center d'être versionné et traité comme tout autre code.

- ** Plan d'exécution : ** Terraform a une étape de \og planification \fg qui génère un plan d'exécution. Le plan d'exécution montre les actions que Terraform effectuera lorsqu'il sera lancé. Cela permet d'augmenter la sécurité en évitant d'avoir des surprises lorsque Terraform manipule l'infrastructure.

- ** Graphique des ressources : ** Terraform construit un graphique de toutes les ressources des infrastructures, et parallélise la création et la modification de toutes ces ressources non-dépendantes. Grâce à cela, Terraform construit l'infrastructure aussi efficacement que possible, et les utilisateurs peuvent avoir un aperçu des dépendances de leur infrastructure.

- ** Automatisation des changements : ** Des ensembles complexes de changements peuvent être appliqués à une infrastructure avec une interaction humaine minimale. Pour se faire Terraform se base sur le plan d'exécution et le graphique de ressources mentionnés précédemment, évitant ainsi des erreurs humaines possibles.

## Quelques cas d'utilisations

### Self-service Cluster

Dans de grandes organisations, il devient plus attrayant de créer une infrastructure \og self-service \fg, permettant aux équipes de gérer leur propre infrastructure à l'aide de l'outillage fourni par l'équipe centrale d'exploitation.

À l'aide de Terraform, la connaissance de la construction de l'infrastructure et de l'échelle d'un service peut être codifiée dans une configuration. La configuration de Terraform peut être partagée au sein d'une organisation permettant aux équipes d'utiliser Terraform comme un outil pour gérer leurs services sans connaître la configuration.

### Démos de logiciels

A l'instar de Vagrant qui permet la création d'environnement virtualisé, les éditeurs de logiciels peuvent fournir une configuration Terraform pour créer et démarrer une infrastructure de démonstration. Ceci permet aux utilisateurs finaux de mettre en place rapidement un environnement de test sur leur propre infrastructure.

### Multi Cloud-Déploiement

Il est souvent attrayant de répandre l'infrastructure sur plusieurs cloud pour augmenter la tolérance aux pannes. En utilisant une seule région ou un seul fournisseur cloud , la tolérance aux pannes est limitée par la disponibilité de ce fournisseur. Avoir un déploiement multi-cloud permet une meilleure récupération de la perte d'une région ou tout le fournisseur.

Terraform permet la configuration de plusieurs providers en une seule configuration. Cela simplifie la gestion et l'orchestration des providers, en aidant la création d'infrastructures multi-cloud.

## Syntaxe utilisé

Les configurations de Terraform sont écrites en HashiCorp Configuration Language (HCL). Ce langage se veut facile à écrire et à lire. L'écriture des configurations peut aussi se faire en JSON.

### Les bases du langage

*Commentaires*
	- # sur une seule ligne
	- /\* mon commentaires sur plusieurs lignes \*/

*Affectation des valeurs*

	key = value # la valeur peut être une chaîne, un nombre ou un booléen

*Chaînes multilignes* : On utilise `<< - EOF` et `EOF` pour créer des chaînes multilignes ce qui permet principalement d'intégrer des scripts dans la configuration.

Il existe également de nombreuses fonctions utilisables avec HCL comme par exemple la fonction format(format, args, ...) qui va permettre de formater une chaîne selon le format que l'on donne.

## Fonctionnement

Terraform étant développé en Go, il n'a pas besoin d'être installé. Il suffit de télécharger une archive .zip et de l'extraire. Il est ensuite possible d'utiliser les commandes associées à Terraform avec `./terraform ...`. Pour faciliter l'utilisation des commandes, il est recommandé de copier le fichier dans */usr/local/* et d'ajouter ensuite le chemin menant jusqu'au fichier en question dans le PATH `PATH=/usr/local/...:$PATH`.

Terraform peut être composé de plusieurs fichiers de configuration pour une infrastructure. Dans ce cas, les fichiers sont lus par ordre alphabétique, mais la priorité reste au fichier *main.tf*.

### Bloc **`provider`**

C'est la partie configuration du provider avec principalement les accès pour la connexion à celui-ci. Terraform peut contenir plusieurs blocs provider. Ce bloc gère le cycle de vie des ressources (create, read, update, delete).

### Bloc **`resources`**

Partie permettant la gestion des ressources (composants physiques et logiciels) qui existent dans l'infrastructure. Le nom d'une ressource se compose du nom du provider puis du nom de la ressource.

### Variables

Les variables peuvent être enregistrées dans un fichier \og variables.tf \fg ou \og .tfvars \fg. Pour appliquer des variables enregistrées sous cette dernière extension, il faut lancer la commande suivante `terraform apply -var-file=truc.tfvars`. Les variable sont généralement utilisé dans les fichiers sous la forme suivante `${var.nomVar}`.

### Modules

Terraform possède des modules autonome vis-à-vis des configurations Terraform. Terraform peut avoir des modules qui seront installés par Terraform. Un module peut être un morceau de code Terraform ayant une fonction qui sera ensuite appelé.
```language
module "Name" {
	source = "github.../dossier"
}
```
### Les commandes

- `terraform plan` -- génère un plan d'action de la configuration. Le plan inclu toutes les actions faites et montre les modifications que va effectuer Terraform.
- `terraform plan -destroy -out=destroy.tf` -- génère un plan d'action qui à pour objectif de détruire tous le projet défini pas les fichiers de configuration. Le résultat est enregistré dans un fichier pour ensuite être appliqué avec `terraform apply destroy.tf`.
- `terraform apply` -- applique le plan
- `terraform graph` -- permet visualisation du plan
- `terraform show` -- montre les infra en place

## Contexte d'utilisation pour le projet (OpenStack)
## Configuration effectuées
### Keypair (a quoi ca sert, ce qu'on a fait, pk on l'a fait)

Une des premières configuration effectuée vu l'ajout de clef ssh pour le projet. Cet ajout avait pour objectif de nous permettre de nous connecter en ssh avec les instances créées.
```language
resource "openstack_compute_keypair_v2" "my_keypair" {
  name = "my_keypair"
  public_key = "${var.keypair}"
}
```
Terraform prend en paramètre pour cette resource un nom et la clef publique à ajouter. Chaque instance peut etre accessible avec une clef ssh. Dans un premier temps pour avoir tous accès aux instances nous avons du nous partager la clef privé créée spécialement pour le projet. Nous avons ensuite réglé ce problème grâce à ansible.

### Instances (vps) (a quoi ca sert, ce qu'on a fait, pk on l'a fait)

Les instances sont la plus grande partie de la configuration, elles correspondent aux machines qui vont être créées.
```language
resource "openstack_compute_instance_v2" "vps" {
  count = 3
  name = "vps-test-${(count.index)+1}"
  image_id = "185e1975-c9c5-4358-909e-5e329808902e"
  flavor_id = "16"
  key_pair = "${openstack_compute_keypair_v2.my_keypair.name}"
  security_groups = ["${openstack_compute_secgroup_v2.terraform.id}"]
  floating_ip = "${element(openstack_compute_floatingip_v2.terraform.*.address, count.index+1)}"

  network {
    name = "${openstack_networking_network_v2.network_1.name}"
    fixed_ip_v4 = "192.168.0.1${(count.index)+1}"
  }
}
```
Une instance peut être créée dans une configuration unique, mais il est aussi possible d'en généré plusieurs automatiquement avec une seule ressource associée grâce au paramètre `count`. Chaque instance est rataché à un ou plusieurs réseau selon les besoins.

### Security group (a quoi ca sert, ce qu'on a fait, pk on l'a fait)

Le Sécurity group permet d'autoriser les transmissions sur certain port. Un sécurity group est conposé de règles (*rule*). Une règle est définit pour un port.
```language
resource "openstack_compute_secgroup_v2" "terraform" {
  name        = "terraform"
  description = "security group"
  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}
```

### Ip flotante (a quoi ca sert, ce qu'on a fait, pk on l'a fait)

Les ip flotantes permettent aux instances d'avoir une ip publique. Cela permet de pouvoir acceder en ssh à celle-ci. Les ip flotantes sont définies dans un pool. Aucune intervention n'est donc nécessaire sur l'hébergeur pour créer ses adresses. Terraform ne se contente pas d'attribuer les adresse publique aux instances qu'il crée mais génére aussi automatiquement les ip disponibles à partir du pool défini.
```language
resource "openstack_compute_floatingip_v2" "terraform" {
  count = 4
  pool = "${var.pool}"

}
```

### Réseau, sous-réseau et routeur (a quoi ca sert, ce qu'on a fait, pk on l'a fait)

Terraform permettant de créer toute une infrastructure, nous nous sommes aussi penchés sur la création du réseau, de ses sous-réseaux et du routeur nous permettant un accès au monde extérieur.

#### Réseau et sous-réseau
#### Routeur

# Ansible
## Présentation
## Utilisation
## Fonctionnement, syntaxe
## Intégration à Terraform
## Configuration effectuée (pk on l'a fait, surtout expliqué pour les clef ssh)

# Conclusion
## Ce qu'on a fait
## Utilité de Terraform
