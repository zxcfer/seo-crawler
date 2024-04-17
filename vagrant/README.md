# web #

Descripción de tu proyecto

- AUTOR       :   iwxfer
- EMAIL       :   iwxfer@gmail.com
- URL         :   djangobox
- EMPRESA     :   Nombre de tu empresa
- LICENCIA    :   MIT
- VERSION     :   0.1.0


## Como usar el entorno de desarrollo ##

### Instalar Vagrant y plugins ###

Vagrant y virtualbox se puede descargar de sus sitios para cualquier plataforma, si su sistema operativo (linux) tiene repositorios
que se pueden usar tambien.

- Virtual box: https://www.virtualbox.org
- Vagrant: http://www.vagrantup.com
- Vagrant landrush plugin: https://github.com/phinze/landrush

Para instalar el plugin solo es necesario:

  $ vagrant plugin install landrush

### Descripción del entorno de desarrollo ###

El proyecto esta pensando para crear aplicaciones 12 factor http://12factor.net/ se genera tanto un entorno de desarrollo en vagrant.

- Vagrant para generar el entorno de desarrollo https://www.vagrantup.com/
- Django 1.7 como framework de desarrollo https://www.djangoproject.com/
- PostgreSQl como base de datos http://www.postgresql.org/
- PsycoPG2 como driver de Postgres http://initd.org/psycopg/
- Pillow para manipulacion de imagenes https://pypi.python.org/pypi/Pillow/
- Django Debug Toolbar para facilitar el debug de Django http://django-debug-toolbar.readthedocs.org/
- Django Compressor para comprimir archivos CSS y JS linkeados http://django-compressor.readthedocs.org/en/latest/
- Django HtmlMin para comprimir el HTML https://pypi.python.org/pypi/django-htmlmin
- Django Grappelli para customizar el panel de adimnistración http://grappelliproject.com/
- Django Getenv para configurar via variables de entorno las settings de Django https://pypi.python.org/pypi/django-getenv

Al crear la maquina virtual se podrá acceder desde el siguiente dominio local: djangobox.lo

### Configuración de archivos  ###

Este es el unico paso obligatorio para poder empezar a usar el entorno de desarrollo:

- Copiar __config/Envfile.example__ a __config/Envfile__ y editar las variables de entorno si es necesario.

Los siguientes pasos son opcionales:

- Para editar las configuraciones de django especificas del proyecto se puede editar __src/settings/project.py__.
- Si se necesitan instalar paquetes en el entorno de desarrollo se puede editar __config/packages.sh__.
- Si se necesita configurar algo en el entorno de desarrollo se puede editar __config/setup.sh__.
- Si se necesitan instalar paquetes en python se puede editar __src/requirements.txt__.

### Manejando maquinas virtuales con vagrant ###

- Ejecutar __vagrant up__ para encender la maquina virtual la primera vez se instalan todos los paquetes necesarios.
- Ejecutar __vagrant ssh__ para entrar a la maquina virtual.
- Ejecutar __vagrant halt__ para apagar la maquina virtual.
- Ejecutar __vagrant reload__ para resetear la maquina virtual.
- Ejecutar __vagrant destroy__ para borrar la maquina virtual.

### Comandos para ejecutar dentro de la VM desde el host ###

- __bin/shell__ Muestra la shell de Django.
- __bin/runserver__ Ejecuta el servidor de desarrollo y se vuelve accesible por http://djangobox.lo:8000 en la maquina host.
- __bin/migrate__ Instala toda las migraciones en la base de datos.
- __bin/makemigrations__ Crea migraciones.
- __bin/makemessages \<paarametros\>__ Crea archivos de lenguaje.
- __bin/compilemessages__ Compila los archivos de lenguaje.
- __bin/startapp \<app-name\>__ Crea una nueva app.
- __bin/pip__ Instala todos los paquetes definidos en el requirements.txt.
- __bin/debugsqlshell__ Muestra la shell de debug-toolbar.
- __bin/manage \<comando\>__ Ejecuta comandos con manage.py.
- __bin/exec \<comando\>__ Ejecuta comandos en bash.
- __bin/psql__ Ejecuta la shell de postgres.
- __bin/pgweb__ Ejecuta pgweb un frontend web para postgres accesible desde http://djangobox.lo:5000.

### Workflow de ejemplo ###

#### Creando el entorno de desarrollo para el proyecto ####

- Ejecutar __vagrant up__ para crear la maquina virtual y provisionarla con todo lo necesario.
- Ejecutar __bin/migrate__ para crear las tablas principales.
- Ejecutar __bin/createsuperuser__ para crear el usuario de administración.
- Ejecutar __bin/runserver__ para correr el servidor de desarrollo.

*NOTA: Para para poder acceder a la aplicación se hace por http://.lo:8000.*

#### Retomando el desarrollo ya existente en un equipo ####

- Ejecutar __vagrant up__ para encender la maquina virtual.
- Ejecutar __bin/migrate__ para actualizar la base de datos en caso de usar migraciones.
- Ejecutar __bin/runserver__ para correr el servidor de desarrollo.
