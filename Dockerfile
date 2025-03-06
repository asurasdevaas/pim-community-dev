# Usar la imagen base de Akeneo PHP Dev
FROM akeneo/pim-php-dev:8.1

# Definir variables de entorno
ENV APP_ENV=${APP_ENV:-prod}
ENV BEHAT_TMPDIR=/srv/pim/var/cache/tmp
ENV BEHAT_SCREENSHOT_PATH=/srv/pim/var/tests/screenshots
ENV PHP_IDE_CONFIG=serverName=pim-docker-web
ENV XDEBUG_MODE=${XDEBUG_MODE:-off}
ENV XDEBUG_CONFIG=client_host=172.17.0.1
ENV BLACKFIRE_CLIENT_ID=${BLACKFIRE_CLIENT_ID:-client_id}
ENV BLACKFIRE_CLIENT_TOKEN=${BLACKFIRE_CLIENT_TOKEN:-client_token}

# Definir el directorio de trabajo
WORKDIR /srv/pim

# Copiar los archivos de configuración
COPY ./docker/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./docker/akeneo.conf /usr/local/apache2/conf/vhost.conf

# Exponer el puerto HTTP (por defecto 80)
EXPOSE 80

# Comando por defecto (mantener el comportamiento original de la imagen base)
CMD ["apache2-foreground"]
