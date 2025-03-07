FROM akeneo/pim-php-dev:8.1

# Establecer directorio de trabajo
WORKDIR /srv/pim

# Actualizar paquetes y limpiar caché
RUN apt-get update && apt-get install -y \
    unzip \
    git \
    nano \
    && rm -rf /var/lib/apt/lists/*

# Configurar permisos
RUN chown -R www-data:www-data /srv/pim && chmod -R 755 /srv/pim

# Copiar archivos de configuración personalizados (si es necesario)
# COPY config/ /srv/pim/config/

# Instalar Akeneo PIM
USER www-data
RUN php /usr/local/bin/composer create-project \ 
    akeneo/pim-community-standard /srv/pim "7.0.*@stable"

USER root

# Exponer el puerto predeterminado de Akeneo
EXPOSE 8080

# Comando de inicio
CMD ["php-fpm"]
