# 1 -- Momo
# 2 -- momo
# 3 -- val
# 4 -- Maud
Xilopix à besoin d'être capable de déployer une multitude d'instance sous OpenStack, mais souhaite aussi ne pas être dépendant de ce service de cloud computing. C'est dans cette optique que l'utilisation de Terraform rentre en compte dans leur architecture.
### créer infrastructure as code
- utilisé pour versionning appli
- permet décrire infrastructure
- facilite remise en place ancienne version si besoin
- facilite déployement même infra si besoin
### Réduire dep hébergeurs
Pouvoir changer d'hébergeur facilement, en gérant le moins possible les pb de compatibilité entre ceux-là
### automatiser création client openstack
Besoin de créer plusieurs instance clientes d'openstack rapidement et simplement
# 5 -- momo
# 6 -- val
# 7 -- maud
Objectif attendu:
pour cette soutenance nous devions avoir assimilé les concept ddes différents logiciels utilisé, de terraform principalement mais aussi openstack pour comprendre son fonctionnement.
Le second objectifs était aussi d'avoir un mini proof of concept fonctionnel créee a partir d'une recette terraform;

Objectif réalisé: 
Nous avons réalisé ces objectifs comme nous l'expliquerons dans les diapo suivantes

# 8 -- val
# 9 -- momo
# 10 -- maud
Pour le mois restant sur ce projet, il nous reste à faie 3 parties principales du projet. La création avec une recette terraform d'un réseau et de sous réseau , l'objectif ici sera de créer en le réseau sur lequelle se conecterons les instances créer après. Viendra en-meme temps la création d'un routeur pour permettre l'accès à iternet aux instances crées. 
Suite à cela, viendra la mise en place de provisionnement avec ansible. Ce qui permettera de configurer et d'installer les logiciels des infrastructures qui seront crées.
# 11 -- maud
Pour conclure suite a l'attente des accès cloudwatt pour commencer l'application de nos recettes terraform nous pensions avoir du retard. Finallement ce retard à été rattrapé et nous avons pu créer le proof ofconcept minimal. 
Nos avons pu voir les avantages de Terraform qui permet de centraliser son infrastructure , et d'afficher le plan d'exécution ce qui permet de prévisualiser l'infrastructure qui vas être mise en place.

# 12 -- momo


