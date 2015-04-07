# VMs para desarrollo con Ansible y SIU-Toba

Playbooks de [Ansible](http://www.ansible.com/) para hacer deploy de entornos LAPP (Linux, Apache2, Postgres, PHP5) y el framework [SIU-Toba](http://toba.siu.edu.ar/trac/toba).

# Software

Usando [Vagrant](https://www.vagrantup.com/), se descarga una version de [Ubuntu Trusty 64](https://atlas.hashicorp.com/ubuntu/boxes/trusty64) y se crea la Maquina Virtual con [Virtualbox](https://www.virtualbox.org/). Luego se ejecuta un [Playbook](http://docs.ansible.com/playbooks.html) de Ansible que configura la VM instalando un entorno LAPP y SIU-Toba.

# Prerrequisitos

Se requiere tener instalado y funcionando el siguiente software

- Virtualbox
- Vagrant
- Ansible
- VM de [Ubuntu Trusty 64](https://atlas.hashicorp.com/ubuntu/boxes/trusty64)

# Features

Hasta el momento, se contemplan las siguientes caracteristicas:

## Parametrizaciones

Se proveen parametrizaciones para los siguientes softwares

### Postgres

- Version a instalar
- Puerto y Password

### Toba

- Version a descargar
- Carpeta de instalacion
- Id de desarrollo
- Base de Metadatos

### Proxy

- Parametro para usar proxy o ignorarlo
- URL y Puerto del proxy

## Configuraciones


