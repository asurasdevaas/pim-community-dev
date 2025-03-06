FROM akeneo/pim-php-dev:8.1

# Definir variables de entorno
ENV APP_ENV=${APP_ENV:-prod} \
    COMPOSER_HOME=/var/www/.composer \
    PHP_IDE_CONFIG=serverName=pim-docker-cli \
    XDEBUG_MODE=${XDEBUG_MODE:-off} \
    XDEBUG_CONFIG=client_host=172.17.0.1 \
    BLACKFIRE_CLIENT_ID=${BLACKFIRE_CLIENT_ID:-client_id} \
    BLACKFIRE_CLIENT_TOKEN=${BLACKFIRE_CLIENT_TOKEN:-client_token} \
    EXPERIMENTAL_TEST_DATABASE=${EXPERIMENTAL_TEST_DATABASE:-0}

# Configurar el directorio de trabajo
WORKDIR /srv/pim

# Copiar archivos locales al contenedor
COPY . /srv/pim

# Establecer permisos adecuados
RUN chown -R www-data:www-data /srv/pim

# Especificar el usuario
USER www-data

# Definir el comando por defecto
CMD ["php"]
