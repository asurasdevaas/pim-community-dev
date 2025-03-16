# Usa la imagen base de Akeneo
FROM akeneo/pim-php-dev:8.1

curl -X GET http://localhost:9200/_cluster/health?pretty
