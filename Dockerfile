FROM akeneo/pim-php-dev:8.1

# Establecer directorio de trabajo
WORKDIR /srv/pim

# Configurar permisos
RUN chown -R www-data:www-data /srv/pim && chmod -R 755 /srv/pim

# Cambiar al usuario www-data
USER www-data

# Instalar Akeneo PIM con composer
RUN php /usr/local/bin/composer create-project --prefer-dist \
    akeneo/pim-community-standard /srv/pim "dev-master@dev"

# Volver al usuario root
USER root

# Exponer el puerto predeterminado de Akeneo
EXPOSE 8080

# Comando de inicio
CMD ["php-fpm"]
