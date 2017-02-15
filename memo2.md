# 1
# 2
# 3 
Notre projet à été demandé par la société xilopix. Xilopix est une startup qui développe un moteur de recherche basé sur des combinaisons de choix pour permetttre une meilleur pertinance de recherche.

# 4 
Xilopix à besoin d'être capable de déployer une multitude d'instance sous OpenStack, mais souhaite aussi ne pas être dépendant de ce service de cloud computing. C'est dans cette optique que l'utilisation de Terraform rentre en compte dans leur architecture.

# 5
Terraform est donc un logiciel de gestion d'infrastructure, il permet la création, modification et versionning de celle-ci. Il peut être utilisé pour créer divers services de bas niveau comme des IaaS mais aussi de haut niveau avec des Saas.
Terraform est donc une sorte de surcouche à ces logiciels / applications. Pour administrer ses infrastructures, terraform se base sur la création de recettes avec deux catégories principale d'objet : le provider et les ressources. 
Le provider est l'outil utilisé pour créer l'infrastructure, ici Openstack.
Les ressources quant a elles sont les api/modules utilisé pour déployer l'infrastructure.

# 6
L'objectif de ce projet est donc de développer un proof of concept de l'outil Terraform. Nous allons donc mettre en place une infrastructure réduite semblable à celle de Xilopix. Pour ce faire nous allons utilisé un de leur provider qui est cloudwatt et créer un cluster de 4 VM clientes d'openstack qui seront généré a partir de Terraform.

# 7 