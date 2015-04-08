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

## Archivo de parametros

Las variables de parametrización de los servicios se pueden encontrar en `<copia local>/deploy/vars/vars.yml.default`

Si se quiere sobreescribir los valores, se aconseja generar una copia del archivo y nombrarlo `vars.yml`. El playbook carga este ultimo archivo, si existe, y en caso contrario, levanta el archivo de los valores por default.

el archivo `vars.yml` se encuentra ignorado por Git.

# Features

Hasta el momento, se contemplan las siguientes características:

## Parametrizaciones

Se proveen parametrizaciones para los siguientes softwares

### Postgres

- Versión a instalar
- Puerto y Password

### Toba

- Versión a descargar
- Carpeta de instalación
- Id de desarrollo
- Base de Metadatos

### Proxy

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