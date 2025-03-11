# Usa la imagen base de Akeneo PHP
FROM akeneo/pim-php-dev:8.1


# Define el directorio de trabajo
#WORKDIR /srv/pim







# Validar conexión a MySQL
#RUN mysql -h"$APP_DATABASE_HOST" -u"$APP_DATABASE_USER" -p"$APP_DATABASE_PASSWORD" -e "SELECT 1" || echo "MySQL connection failed!"

#RUN rm -rf /srv/pim/*

#CMD ["/usr/bin/supervisord", "-c", "docker/supervisord.conf"]

#CMD /usr/bin/supervisord -c docker/supervisord.conf

#RUN cat docker/supervisord.conf

# Instala Akeneo PIM
#RUN php /usr/local/bin/composer create-project --prefer-dist akeneo/pim-community-standard /srv/pim "dev-master@dev"

# Exponer el puerto predeterminado de Akeneo
#EXPOSE 8080

#RUN php bin/console pim:installer:check-requirements





#RUN NO_DOCKER=true make dev
