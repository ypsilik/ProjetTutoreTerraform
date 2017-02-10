# Installation de python-nova
Pour installer le plugin python-nova, il faut avoir préalablement installé python et son système d'installation pip. Pour lancer l'installation il suffit de taper `pip install -U python-novaclient`.

##Configuration des variables d'environnement pour Openstack

Pour configurer toutes les variables, Openstack génère un fichier RC contenant toutes les variables d'environnement à configurer.
Depuis cloudwatt il faut aller dans les paramètres *accès et sécurité* puis *accès API* et enfin télécharger le fichier.
L'éxécution du fichier se fait grâce à la commande `source 0750182707_projet_tutore_2017-openrc.sh` et permet la configuration automatique des variables.

# Python-nova

La liste des instances créées sont visibles à l'aide de la commande `nova list`.

## Création de l'instance
### Génération de la clef ssh

`ssh-keygen`

### Intégration clef ssh au keypair Openstack

`nova keypair-add --pub-key .ssh/id_rsa.pub SSHKEY`

### Choix du flavor

`nova flavor-list` affiche la liste des flavors disponibles. Une fois choisi, il faut récuperer son ID qui sera renseigné lors de la création de l'instance.

### Choix de l'image (système installé)

`nova image-list` affiche la liste des images systèmes disponibles. Une fois choisi,
 il faut récuperer son ID qui sera demandé lors de la génération de l'instance.

### Création de l'instance

`nova boot --key-name SSHKEY --flavor 16 --image 185e1975-c9c5-4358-909e-5e329808902e instance1`
Pour la création de l'instance on retrouve quatres éléments :
- le nom du keypair 
- l'id du flavor
- l'id de l'image
- le nom de l'instance

![2017-02-08-104901_1600x900_scrot.png](/home/ypsilik/Images/2017-02-08-104901_1600x900_scrot.png)


## Supression de l'instance

`nova delete instaneName`

- connexion à l'instance via ssh

[Doc nova](http://docs.openstack.org/cli-reference/nova.html)
[Création instance](https://www.ovh.com/fr/g1935.debuter_avec_lapi_nova[](http://)

## rajouter ip a l'instance : 
`nova add-fixed-ip <id_server> <network-id>`

## backup
`nova backup <server_id> <backup_name> <backup-type(daily/weekly)> <rotation>`


# Terraform
On attache un volume (*blocStorage*) qu'a une seule instance.

## Création d'une recette

La clef ssh est préalablement généré avec la commande `ssh-keygen`.
Resource pour parametrer le partage de clef ssh.
```language
resource "openstack_compute_keypair_v2" "my_keypair" {
  name = "my_keypair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAtAMxDSFQtH5VGM4CQmgNt/x3Kse2zA0//BqNj6aKZLBdxQdd0yuqkMwvNWFi47dESRWRoNzukFS7dFW1VWGxJnj/hkZJnB7pSxOG/PGLw8tcwFThjkTivk0J0cTUT5vF7dQmuUANBHMRFki/8lWmLIlKTGjHQM/KnaiwHJbUNa4PsrXNweg7fVl1zRLMXGGL+fUCgrVKqeymqoGdjRBK1NQvRAvZkgOC9YM71ZLRqiiOp2awdkEcQXCvG7F6gf98y67pMEZRg0P7XK81zis/f9CD3HPTCSG67oPDGjdaap+JhQhP+KTEfZ9gmLdbENoL5ffDKIOM+68PH8Wpj1C3"
}
```

Resource pour la génération d'un sécure group. Ce sécure group contient des règles d'autorisations de port.
```
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

Resource pour la création de 5 instances (le nombre d'instance est défini avec l'attibut *count*). Ces instances sont reliées au réseau "terraform" et possède une ip fixe sur ce réseau.
```language
# Création de l'instance
resource "openstack_compute_instance_v2" "vps" {
  count = 5 
  name = "vps-test-${(count.index)+1}"
  image_id = "185e1975-c9c5-4358-909e-5e329808902e"
  flavor_id = "16"
  key_pair = "my_keypair"
  security_groups = ["${openstack_compute_secgroup_v2.terraform.id}"]

  network {
    name = "terraform"
    uuid = "bbac9bf3-8a9d-47b9-8222-4929cb5a701"
    fixed_ip_v4 = "192.168.0.1${(count.index)+1}"
  }
}
```

Resource pour l'instance de test du réseau. Intégration d'une ip flotante 
```language
resource "openstack_compute_instance_v2" "test-network" {
  name = "test-network"
  image_id = "185e1975-c9c5-4358-909e-5e329808902e"
  flavor_id = "16"
  key_pair = "my_keypair"
  security_groups = ["${openstack_compute_secgroup_v2.terraform.id}"]
  floating_ip = "84.39.37.204"

  network {
    name = "terraform"
    uuid = "bbac9bf3-8a9d-47b9-8222-4929cb5a701"
  }
}
```