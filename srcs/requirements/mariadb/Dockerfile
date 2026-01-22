FROM debian:buster

ARG DB_NAME
ARG MYSQL_ADMIN_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

RUN sed -i 's|deb.debian.org|archive.debian.org|g' /etc/apt/sources.list && \
    sed -i 's|security.debian.org|archive.debian.org|g' /etc/apt/sources.list && \
    sed -i '/buster-updates/d' /etc/apt/sources.list

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server

RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chmod 777 /var/run/mysqld

RUN rm -f /etc/mysql/mariadb.conf.d/50-server.conf
COPY tools/50-server.conf /etc/mysql/mariadb.conf.d/50-server.conf

# added '@'%' to connetction of wordpress
RUN echo "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;" > configure.sql && \
    echo "CREATE USER IF NOT EXISTS '${MYSQL_ADMIN_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" >> configure.sql && \
    echo "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${MYSQL_ADMIN_USER}'@'%';" >> configure.sql && \
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" >> configure.sql && \
    echo "FLUSH PRIVILEGES;" >> configure.sql

RUN service mysql start && mysql < configure.sql && rm configure.sql

EXPOSE 3306

CMD ["mysqld", "--bind-address=0.0.0.0"]