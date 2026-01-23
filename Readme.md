# Inception

*Este proyecto ha sido creado como parte del plan de estudios 42 por igvisera*

### Descripción

Es un proyecto en el que se aprende a utilizar Docker y Docker-compose, además de los conceptos de virtualización, servicios web y contenedores.

Todo esto se aprende ya que tenemos que hacer las conexiones de nginx, wordpress y mariadb.

### Instrucciones

1. tenemos que tener en `/etc/hosts` 127.0.0.1 igvisera.42.fr
2. Hacemos make para que ejecute el compose levante las imágenes y se apliquen las configuraciones necesarias.
3. accedemos a [https://igvisera.42.fr](http://igvisera.42.com.fr) y ya podremos entrar en el wordpress.

### Recursos

- La web de [Debian](https://www.debian.org) para descargar la iso.
- La [documentación](https://docs.docker.com/get-started/docker-overview/) oficial de Docker así como algunos videos de youtube el cual me gustaria recalcar [este](https://youtu.be/CV_Uf3Dq-EU?si=CazCBBCrjXZ8hWKy).
- Para este proyecto utilice gemini en ciertos momentos ya que los errores que estaba teniendo eran a raíz de malas configuraciones mías.

### Preguntas del subject

1. Máquinas virtuales vs Docker
    - Maquinas virtuales: Consume los recursos del equipo y pueden ir lento por problemas de virtualización, tardan bastante tiempo en crearse y arrancarse, pesan mucho.
    - Docker: Rendimiento casi nativo, son bastante rápidas, instalaciones mas personalizadas.
2. Secretos frente a variables de entorno
    - Las variables de entorno `.env` son fáciles de: añadir, visualizar y usar. Pero no están cifradas a la hora de guardarse.
    - Los `Docker Secrets` Se almacenan cifrados y solo se añaden en el contenedor que los necesita limitando así su acceso.
3. Red Docker frente a red host
    - La red host es tu propio equipo no tiene aislamiento de puertos.
    - La red Docker es un entorno virtual (privada) los contenedores se ven entre ellos solo si están en la misma red.
4. Volúmenes Docker vs Bind mounts
    - Bind mounts: Depende de la estructura de carpetas del host, si una carpeta no existe el contenedor falla. `/home/user/data`
    - Volúmenes Docker: Son independientes del SO host `/var/lib/docker/volumes`