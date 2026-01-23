# Dev Doc

### Requisistos previos

- make
- Docker
- sudo

### Configuración del proyecto

Esta es la estructura que se necesita para el proyecto.

```c
├── Makefile
├── srcs
│   ├── .env
│   ├── compose.yml
│   └── requirements
│       ├── mariadb
│       │   ├── Dockerfile
│       │   └── tools
│       │       └── 50-server.conf
│       ├── nginx
│       │   ├── Dockerfile
│       │   └── tools
│       │       └── default.conf
│       └── wordpress
│           ├── Dockerfile
│           └── tools
│               ├── configure.sh
│               └── www.conf
```

Variables del env

```c
MYSQL_ADMIN_USER=xxxx
MYSQL_USER=xxxx
MYSQL_ROOT_PASSWORD=xxxxx
MYSQL_PASSWORD=xxxxx
DB_NAME=my_wp_xxxxxxxx
```

### Administración de contenedores

Inspeccionar procesos

```c
docker-compose ps
```

Logs en tiempo real

```c
docker exec -it nombre_contenedor /bin/bash
```

### Almacenamiento de datos

Los datos se mapean desde el host a los contenedores mediante volúmenes de Docker definidos en el `docker-compose.yml`

| **Servicio** | **Ruta del Host**  | **Punto de montaje en el Contenedor** |
| --- | --- | --- |
| **MariaDB** | `/home/igvisera/data/mariadb` | `/var/lib/mysql` |
| **WordPress** | `/home/igvisera/data/wordpress` | `/var/www/html/wordpress` |