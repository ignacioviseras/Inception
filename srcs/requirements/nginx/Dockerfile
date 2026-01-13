FROM debian:buster

# FIX ERROR VERSION DEBIAN BUSTER 
RUN sed -i 's|deb.debian.org|archive.debian.org|g' /etc/apt/sources.list && \
    sed -i 's|security.debian.org|archive.debian.org|g' /etc/apt/sources.list && \
    sed -i '/buster-updates/d' /etc/apt/sources.list

RUN apt-get update \
	&& apt-get install -y openssl \
	&& apt-get install -y nginx
	
RUN openssl req -x509 -nodes -days 365 -subj "/C=ES/ST=Madrid/O=42Madrid, Inc./CN=igvisera.42.fr" -addext "subjectAltName=DNS:igvisera.42.fr" -newkey rsa:2048 -keyout /etc/ssl/private/igvisera.key -out /etc/ssl/certs/igvisera.crt

RUN rm -rf /etc/nginx/sites-enabled/*

COPY tools/default.conf /etc/nginx/conf.d

ENTRYPOINT ["nginx", "-g", "daemon off;"]