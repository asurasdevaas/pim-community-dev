FROM akeneo/pim-php-dev:8.1

# Definir variables de entorno
ENV APP_ENV=${APP_ENV:-prod} \
    BEHAT_TMPDIR=/srv/pim/var/cache/tmp \
    BEHAT_SCREENSHOT_PATH=/srv/pim/var/tests/screenshots \
    PHP_IDE_CONFIG=serverName=pim-docker-web \
    XDEBUG_MODE=${XDEBUG_MODE:-off} \
    XDEBUG_CONFIG=client_host=172.17.0.1 \
    BLACKFIRE_CLIENT_ID=${BLACKFIRE_CLIENT_ID:-client_id} \
    BLACKFIRE_CLIENT_TOKEN=${BLACKFIRE_CLIENT_TOKEN:-client_token}

# Configurar el directorio de trabajo
WORKDIR /srv/pim

# Copiar archivos locales al contenedor
COPY . /srv/pim
COPY docker/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY docker/akeneo.conf /usr/local/apache2/conf/vhost.conf

# Establecer permisos adecuados
RUN chown -R www-data:www-data /srv/pim
RUN chown -R www-data:www-data /etc/httpd/logs/error_log

# Exponer el puerto HTTP
EXPOSE ${DOCKER_PORT_HTTP:-8080}

# Especificar el usuario
USER www-data

# Definir el comando por defecto
CMD ["httpd", "-D", "FOREGROUND"]
