#### Installation de python-nova
Pour installer le plugin python-nova, il faut avoir préalablement installé python et son système d'installation pip. Pour lancer l'installation il suffit de taper `pip install -U python-novaclient`.

#### Configuration des variables d'environnement pour Openstack

Pour configurer toutes les variables, Openstack génère un fichier RC contenant toutes les variables d'environnement à configurer.
Depuis cloudwatt il faut aller dans les paramètres *accès et sécurité* puis *accès API* et enfin télécharger le fichier.
L'éxécution du fichier se fait grâce à la commande `source 0750182707_projet_tutore_2017-openrc.sh` et permet la configuration automatique des variables.

#### Python-nova

La liste des instances créées sont visibles à l'aide de la commande `nova list`.

##### Création de l'instance
###### Génération de la clef ssh

`ssh-keygen`

###### Intégration clef ssh au keypair Openstack

`nova keypair-add --pub-key .ssh/id_rsa.pub SSHKEY`

###### Choix du flavor

`nova flavor-list` affiche la liste des flavors disponibles. Une fois choisi, il faut récuperer son ID qui sera renseigné lors de la création de l'instance.

###### Choix de l'image (système installé)

`nova image-list` affiche la liste des images systèmes disponibles. Une fois choisi,
 il faut récuperer son ID qui sera demandé lors de la génération de l'instance.

###### Création de l'instance

`nova boot --key-name SSHKEY --flavor 16 --image 185e1975-c9c5-4358-909e-5e329808902e instance1`
Pour la création de l'instance on retrouve quatres éléments :
- le nom du keypair 
- l'id du flavor
- l'id de l'image
- le nom de l'instance

![2017-02-08-104901_1600x900_scrot.png](/home/ypsilik/Images/2017-02-08-104901_1600x900_scrot.png)

# Truc en vrac
#### Supression de lsintance

`nova delete instaneName`

- connexion à l'instance via ssh

[Doc nova](http://docs.openstack.org/cli-reference/nova.html)
[creation instance](https://www.ovh.com/fr/g1935.debuter_avec_lapi_nova[](http://))

# rajouter ip a l'instance : 
`nova add-fixed-ip <id_server> <network-id>`

# backup
`nova backup <server_id> <backup_name> <backup-type(daily/weekly)> <rotation>`



# Objectif du moment
créer instance avec terraform
1. Importer vos clefs ssh sur le tenant
2. Créer le/les VPS, en les rattachant au sous-réseau que je vous ai crée hier
3. Eventuellement, créer les security groups et y rattacher les VPS
4. Créer VPS en masse avec ip qui se suivent (du genre: vps-01 / vps-02/vps-03 --- avec comme ip: 192.168.1.1/192.168.1.2/192.168.1.3)
> Normalement, avec ça, vous aurez un process de création de cluster complet

# Objectif suivant
créer aussi le network comme ca on crézer tout auto et c'st la classe :p
> Si vous faites ça rapidement, on ajoutera ensuite:
1. Création du réseau privé
2. Création d'un sous-réseau
3. Création du routeur pour sortir sur internet
4. Provisionnement de base via ansible/salt (à choisir)


# Terraform

## Création d'une instance minimale
```language
# Configure the OpenStack Provider
resource "openstack_blockstorage_volume_v1" "myvol" {
  name = "myvol"
  size = 1
}

resource "openstack_compute_instance_v2" "volume-attached" {
  name = "volume-attached"
  image_id = "185e1975-c9c5-4358-909e-5e329808902e"
  flavor_id = "16"
  key_pair = "JUL"
  security_groups = ["default"]

  volume {
    volume_id = "${openstack_blockstorage_volume_v1.myvol.id}"
  }
}
```

`terraform validate` -- valide syntaxe

```language
# Création de la Keypair
resource "openstack_compute_keypair_v2" "testKeypair" {
  name = "my-keypair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAtAMxDSFQtH5VGM4CQmgNt/x3Kse2zA0//BqNj6aKZLBdxQdd0yuqkMwvNWFi47dESRWRoNzukFS7dFW1VWGxJnj/hkZJnB7pSxOG/PGLw8tcwFThjkTivk0J0cTUT5vF7dQmuUANBHMRFki/8lWmLIlKTGjHQM/KnaiwHJbUNa4PsrXNweg7fVl1zRLMXGGL+fUCgrVKqeymqoGdjRBK1NQvRAvZkgOC9YM71ZLRqiiOp2awdkEcQXCvG7F6gf98y67pMEZRg0P7XK81zis/f9CD3HPTCSG67oPDGjdaap+JhQhP+KTEfZ9gmLdbENoL5ffDKIOM+68PH8Wpj1C3"
}

# Création de l'instance
resource "openstack_compute_instance_v2" "volume_test" {
  count = 2 
  name = "vps-test-${count.index}"
  image_id = "185e1975-c9c5-4358-909e-5e329808902e"
  flavor_id = "16"
  key_pair = "my-keypair"
  security_groups = ["default"]

  network {
    name = "terraform"
    uuid = "bbac9bf3-8a9d-47b9-8222-4929cb5a701"
    fixed_ip_v4 = "192.168.0.1${count.index}"
  }
}
```

On attache un volume qu'a une seule instance.
