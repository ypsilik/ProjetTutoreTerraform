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

si on fait un truc aws_truc, on utilise le provider aws.

## Quelques commandes
- `terraform plan` -- génére un plan d'action de la configuration. plan inclu toutes les actions faites, montre modif que vas effectuer terraform
- `terraform graph` -- permet visualisation du plan 
- `terraform apply` -- applique le plan
- `terraform show` -- montre les infra en place




