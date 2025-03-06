FROM akeneo/pim-php-dev:8.1

# Definir variables de entorno
ENV APP_ENV=${APP_ENV:-prod} \
    COMPOSER_HOME=/var/www/.composer \
    PHP_IDE_CONFIG=serverName=pim-docker-cli

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
