# VMs para desarrollo con Ansible y SIU-Toba

Playbooks de [Ansible](http://www.ansible.com/) para hacer deploy de entornos LAPP (Linux, Apache2, Postgres, PHP5) y el framework [SIU-Toba](http://toba.siu.edu.ar/trac/toba).

# Software

Usando [Vagrant](https://www.vagrantup.com/), se descarga una versión de [Ubuntu Trusty 64](https://atlas.hashicorp.com/ubuntu/boxes/trusty64) y se crea la Maquina Virtual con [Virtualbox](https://www.virtualbox.org/). Luego se ejecuta un [Playbook](http://docs.ansible.com/playbooks.html) de Ansible que configura la VM instalando un entorno LAPP y SIU-Toba.

# Prerrequisitos

Se requiere tener instalado y funcionando el siguiente software

- Git
- Virtualbox
- Vagrant
- Ansible
- VM de [Ubuntu Trusty 64](https://atlas.hashicorp.com/ubuntu/boxes/trusty64)

# Instalación

Clonar este proyecto

`git clone https://github.com/tomasdelvechio/toba-ansible.git ~/toba_ansible`

Luego levantar la VM con Vagrant

```
cd ~/toba_ansible
vagrant up
```

Cuando finaliza el comando, se deberia poder acceder al Toba Editor con la URL http://localhost:8080/toba_editor/2.6

Actualmente no se esta creando ningun proyecto nuevo, con lo cual, se debe ingresar a la VM y crear el proyecto desde la instalacion de Toba.

```
cd ~/toba_ansible
vagrant ssh
cd /vagrant/toba/2.6/bin/
./toba proyecto crear -p nombre_proyecto -i desarrollo
```

Si se quieren ir realizando cambios en los Playbooks y destruir y crear de cero la VM, se puede hacer todo en una linea, dentro de la carpeta del proyecto clonado:

`vagrant destroy -f && vagrant up`

## Archivo de parametros

Las variables de parametrización de los servicios se pueden encontrar en `<copia local>/deploy/vars/vars.yml.default`

Si se quiere sobreescribir los valores (Para configurar un proxy, por ejemplo), se aconseja generar una copia del archivo y nombrarlo `vars.yml`. El playbook carga este ultimo archivo, si existe, y en caso contrario, levanta el archivo de los valores por default.

el archivo `vars.yml` se encuentra ignorado por Git.

# Features

Hasta el momento, se contemplan las siguientes características:

## Parametrizaciones

Se proveen parametrizaciones para los siguientes softwares

### Postgres (deploy/vars/postgresql.yml.default)

- Versión a instalar
- Puerto y Password

### Toba  (deploy/vars/toba.yml.default)

- Versión a descargar
- Carpeta de instalación
- Id de desarrollo
- Base de Metadatos
- Nombre de la instalación
- Proyectos
 - Proyectos nuevos
 - Proyectos existentes en un repositorio SVN

### Proxy (deploy/vars/vars.yml.default)

- Parametro para usar proxy o ignorarlo
- URL y Puerto del proxy

## Tareas

El playbook realiza las siguientes tareas:

1. Configura las locales (Si esto no se hace, Postgres no crea el cluster)
2. Actualiza la lista de paquetes (Configura el Proxy si se indica)
3. Actualiza los paquetes del sistema que se necesiten actualizar
4. Instala el entorno LAPP, SVN y otras dependencias utiles
5. Configura Apache y Postgres
6. Descarga SIU-Toba desde el SVN del proyecto (Rama de versiones de desarrollo)
7. Instala SIU-Toba y publica el Toba Editor en Apache2

## Nuevas Características

Se iran agregando nuevas características en futuras versiones. Para proponer mejoras, se aceptan Issues y Pull Requests.

# Troubleshooting

## Vagrant no ejecuta el Playbook

El error que aparece en estos casos es:

```
The executable 'ansible-playbook' Vagrant is trying to run was not
found in the PATH variable. This is an error. Please verify
this software is installed and on the path.

```

Este error ocurre porque ansible no esta instalado en el Host. Se resuelve simplemente instalando Ansible. Si nuestro Host es Ubuntu:

`sudo aptitude install ansible`

## Problemas con el modulo apache2_module

El error es

```
ERROR: apache2_module is not a legal parameter in an Ansible task or handler
Ansible failed to complete successfully. Any error output should be
visible above. Please fix these errors and try again.

```

Este problema sucede por tener una versión de Ansible antigua. En estos casos, lo mejor es seguir la [indicación oficial de Ansible](http://docs.ansible.com/intro_installation.html) para tener instalada la ultima versión. Para Ubuntu, [leer acá](http://docs.ansible.com/intro_installation.html#latest-releases-via-apt-ubuntu).