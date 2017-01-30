# Introduction

> Partie théorique, contexte, enjeu, présentation Terraform... obj : expliquer ce qu'est terraform a quels beosin ca rep, comment ca marche.

## Problématique

L'objectif de notre projet tutoré est de développer un proof of concept sur l'outil Terraform, et de démontrer les avantages de celui-ci.

Pour se faire nous allons mettre en place un cluster de quatres machines virtuelles cliente Openstack avec Terraform.

La finalité du projet est d'obtenir une création rapide et demandant un minimum d'intervention humaine pour déployer plusieurs machines aussi bien sous OpenStack que sous AWS.

Terraform vas donc nous permettre de réduire les dépendances entre ces outils et les infrastructures qui les utilisent tout en facilitant la mise en place de machines.


## Contexte

Xilopix, start-up basé à Epinal, souhaiterai mettre en place rapidement des services OpenStack, tout en n'etant pas bloqué avec cette technique et voudrais donc pouvoir aux besoins changer d'outils pour le déploiement de cloud en passant par exemple à AWS. Terrafom vas donc leur permettre de réduire leur dépendances avec la syntaxe et la mise en place d'openstack.

# Terraform

## Introduction

Terraform à été créé en 2013 et développé en Go. De ce fait, l'installation se compose simplement d'une archive à récupérer pour ensuite pouvoir éxécuter la commande terraform contenu dans celui-ci.
Terraform est un outil pour la construction d'infrastucture, la modification et le versioning de maniére sûre et efficace. Il permet de gérer plusieurs fournisseurs de services existant ainsi que les solutions qui sont developpées en interne.

TerraForm fonctionne avec des fichiers de configuration. Ces fichiers texte servent à décrire l'infrastructure et à définir des variables. Il y a deux type de fichier *.tf* et *.tf.json* selon le language utilisé HCL (HashiCorp Configuration Language) ou JSON. Le format JSON est destiné aux machines. C'est fichiers de configuration décrivent les composants qui seront necessaire à l'exécution de TerraForm pour une seule application ou sur l'ensemble d'un data center. TerraForm génère un plan d'éxécution décrivant les étapes qu'il va effectuer *`terraform plan`*, puis exécute le plan *`terraform apply`*. TerraForm peut aussi détecter les changements et créer des nouveaux plans d'exécution.

TerraForm permet de gérer les composants de bas niveau, comme les IaaS, le stockage et la mise a niveau, ainsi que des composants haut niveau comme les entrées DNS et les fonctionnalités SaaS.

## Caractéristiques de TerraForm 

Terraform disposent de quatres principales caractéristiques.

- ** Coder son infrastucture : ** L'infrastructure est décrite en utilisant une syntaxe de configuration de haut niveau (HCL). Cela permet à un data center d'être versionné et traité comme tout autre code.L'avantage de cette technique est de permetre le déployment rapide d'une même infrastructure sur différent poste et ainsi obtenir le même environnement de travail / d'exploitation poouvant servir dans plusieurs contexte (test,developpement...).

- ** Plan d'exécution : ** Terraform a une étape de «planification» qui génère un plan d'exécution. Le plan d'exécution montre les actions que TerraForm effectuera lorsqu'il sera lancé. Cela permet d'augmenter la sécurité en evitant d'avoir des surprises lorsque TerraForm manipule l'infrastructure. 

- ** Graphique des resources : ** Terraform construit un graphique de toutes les ressources des infrastructures, et parallélise la création et la modification de toutes ces ressources non-dépendantes. Grâce à cela, TerraForm construit l'infrastructure aussi effacement que possible, et les utilisateurs peuvent avoir un aperçu des dépendances de leur infrastructure.

- ** Automatisation des changements : ** Des ensembles complexes de changements peuvent être appliqués à une infrastructure avec une interaction humaine minimale. Pour se faire TerraForm se base sur le plan d'exécution et le graphique de ressources mentionnés précédemment, évitant ainsi des erreurs humaines possibles.

## Installation

Ajout du chemin du fichier au PATH `PATH=/usr/local/...:$PATH`




