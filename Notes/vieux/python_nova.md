python-novaclient est un package python facilitant la création et le management des images, instances et hardware d'openstack.

Nova est une api pour les utilisateurs qui permet de configurer les instances, adresse ip, keypairs, networks, snapshots, admin APIs.

`pip install -U python-novaclient`

Avant configurer les variable d'environnmeent suivante
```language
OS_AUTH_URL=http://$KEYSTONE_IP:5000/v2.0
OS_PASSWORD=password
OS_TENANT_NAME=demo
OS_USERNAME=demo
```

Initialisation Nova client
```python
#!/usr/bin/env python
import os

from novaclient.v1_1 import client

def get_nova_creds():
    d = {}
    d['username'] = os.environ['OS_USERNAME']
    d['api_key'] = os.environ['OS_PASSWORD']
    d['auth_url'] = os.environ['OS_AUTH_URL']
    d['project_id'] = os.environ['OS_TENANT_NAME']
    return d

nova = client.Client(**get_nova_creds())
#Get token (optional, happens on its own if not specified)
nova.authenticate()
```
Chargement key pair
```python
if not nova.keypairs.findall(name="mykey"):
    with open(os.path.expanduser('~/.ssh/id_rsa.pub')) as fpubkey:
        nova.keypairs.create(name="mykey", public_key=fpubkey.read())
print nova.keypairs.list()
```
Chargement instance
```python
image = nova.images.find(name="cirros")
flavor = nova.flavors.find(name="m1.tiny")
instance = nova.servers.create(name="test", image=image, flavor=flavor, key_name="mykey")

```



```python
# Création d'une instance de client python nova
from keystoneauth1.identity import v3
from keystoneauth1 import session
from novaclient import client
auth = v3.Password(auth_url='http://example.com:5000/v3',
                   username='username',
                   password='password',
                   project_name='project-name',
                   user_domain_id='default',
                   project_domain_id='default')
sess = session.Session(auth=auth)
nova = client.Client("2.1", session=sess)
OU
credentials = get_nova_credentiials_v2
nova = client.Client(**credentials)


# list des serveurs et conf matériels disponible sur ce clients, des images
nova.servers.list()
nova.flavors.list()
nova.images.list()
nova.networks.list()

# Création d'un nouveau serveur
## Recherche du flavor
fl = nova.flavors.find(ram=512)
nova.servers.create("my-server", flavor=fl)
## Creation srv v2
server = nova.servers.create(name = "api_cir_test",
                             image = image.id,
                             flavor = flavor.id,
                             nics=[{'net-id': network1.id},
                             	   {'net-id': network2.id}])

```

[](http://docs.openstack.org/user-guide/sdk-compute-apis.html)
[](http://jogo.github.io/slides/python-novaclient/#/3)
[](github.com/openstack/python-novaclient)
[](https://github.com/openstack/python-novaclient/blob/master/novaclient/client.py)

Les fonctions ont toujours la même structure
`nova.obj.list()` -- pour lister les info sur l'obj (images / flavor /...)
`nova.obj.find()` -- pour rechercher un objet (images / flavor /...)
`trucRecup.id` -- pour obtenir l'i du flavor / image ... récupérée
Tracking l'instance
```python
# Poll at 5 second intervals, until the status is no longer 'BUILD'
status = instance.status
while status == 'BUILD':
    time.sleep(5)
    # Retrieve the instance again so the status field updates
    instance = nova.servers.get(instance.id)
    status = instance.status
print "status: %s" % status
print "address: %s" % instance.addresses
```

[](http://anusreea.blogspot.fr/2015/06/how-to-create-virtual-machine-using.html)
[](https://dev.cloudwatt.com/fr/doc/sdk/sdk-python.html)

Les variables USERNAME/PASSWORD que vous allez renseigner vous ont été transmises lors de l’activation de votre compte Cloudwatt. La variable AUTH_URL est fournie dans la console Cloudwatt. Il s’agit de : https://identity.fr1.cloudwatt.com/v2.0

Testing
There are multiple test targets that can be run to validate the code.

* tox -e pep8 - style guidelines enforcement
* tox -e py27 - traditional unit testing
* tox -e functional - live functional testing against an existing openstack



snapshot (assited_volume_snapshots)
Utiliser pas module cinder
`create(volume_id, create_info)`

[snapshot](http://docs.openstack.org/user-guide/cli-use-snapshots-to-migrate-instances.html)
