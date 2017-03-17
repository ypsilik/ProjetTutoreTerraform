# Le bordel des ip flotantes

Pour ansible besoin fichier host avec les adresse ip flottante
mais Terraform générait automatiquement les ip a partir du pool.
donc besoin importé adresse ip crée dans terraform. pour ce faire `terraform import nomRessource IDaddressIP` et ensuite création de la ressource dans le main.tf `resource TypeRessource NomRessource { pool = public} `. 
Mais du coup la création peut comporter qu'une seule ip. Avec Terraform impossible faire boucle 
> le probleme c'est qu'on peut pas faire de boucle sous terraform, tout ce fait avec "count " et donc les resources ont le même nom mais avec .0 / .1 / .2 apres
> le souci c'est qu'on peut pas import avec par exemple terraform import openstack_compute_floatingip_v2.floatip.1 aacd2db2-44fa-4850-809f-f92189c7272

Donc voir avec modules sinon on crée une ressource a la main pour chaque ip : inconvénient du coup si on a 50 vps bah on est obligé de faire 50 fois le truc a la mano Vu qu'on a du ansible derriere sinon ca marche bien avec un count et en générant auto.


Du coup actu on a une liste d'ip et on els appel , ca marche ! 

Rajouter explication provisionners local-exec / remote-exec ..