# User Doc

### Servicios Proporcionados

Este proyecto tiene un stack que proporciona los siguientes 3 servicios

1. **Nginx**: Servidor web que actúa como puerto de entrada (puerto 443)
2. **Wordpress**: Creador de paginas web.
3. **MariaDB**: La base de datos utilizada para guardar.

### Como ejecutar el proyecto

1. Tenemos que tener en `/etc/hosts` 127.0.0.1 igvisera.42.fr
2. Hacemos `make` para que ejecute el compose levante las imágenes y se apliquen las configuraciones necesarias.
3. Accedemos a [https://igvisera.42.fr](http://igvisera.42.com.fr) y ya podremos entrar en el wordpress.
Para apagar el proyecto tenemos que usar
    
    ```c
    make down
    ```
    
    Para borrar los datos 
    
    ```c
    make clean
    ```
    
    Para borrar el contenido de las imágenes del  docker 
    
    ```c
    make fclean
    ```
    
    Para borrar las carpetas de srcs para reconstruir el proyecto.
    
    ```c
    make re
    ```
    

### Credenciales

Las credenciales necesarias se localizan en el `srcs/.env` 

### Estado de los servicios

Para ver el estado de los servicios podemos hacer

```c
docker ps
```

 Para ver los logs en tiempo real de los servicios

```c
docker logs nginx
docker logs wordpress
docker logs mariadb
```