- intro
	 + def cloud / IAAS...
	 + Problématique + contexte + enjeu
	 + openstack (dire use python-nova)
	 + terraform
	 + cloudwatt
	 + gestion projet
- pyhon-nova
	+ presentation ...
- terraform
	+ presentation
	+ utilisation
	+ fonctionnement
	+ config CCM ...
- cloudwatt / MEP / deploiement 
	+ install
	+ archi
	+ python-nova code (minimal + avancée)
	+ terraform code (minimal + avancé)
- Conclu
- Annexes


-----

- une machine avec api openstack (python-nova)
- une machine avec terraform

Terraform et python nova minimal pour que ca marche (pour avant vac)



# Plan

- introduction (5 pages)
	+ Infra as code / dev ops
	+ problématique
	+ contexte
	+ enjeu
	+ QQ mot sur Terraform

- openstack / python nova (3 pages)
	+ cloud computing
- terraform (15 pages)
	+ presentation
	+ caractéristique
	+ ex use case
	+ syntaxe
	+ fonctionnement
	+ contexte d'utilisation pour nous (aveec openstack)
	+ Configuration effectuée (ce qu'on a fait)
		- keypair (on ne peut attribuer qu'une keypair aux VPS)
		- vps
		- securegroup
		- ip flotantes
        parler remote-exec/ local-exec / connection , difference
		- réseau
		- router
- ansible (6 pages )
	+ présentation
	+ utilisation
	+ fonctionnement
	+ intégration à terraform
	+ configuration effectué et pk on a fait ca (surtout pour explication pour les clef ssh) bordel ip flo
- Conclusion (3 pages)
	+ ce qu'on a fait...
	+ utilité de Terraform