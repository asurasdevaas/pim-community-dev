# Usa la imagen base de Akeneo
FROM akeneo/pim-php-dev:8.1

RUN apt-get update && apt-get install -y make curl gnupg && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && apt-get install -y nodejs && npm install -g yarn && rm -rf /var/lib/apt/lists/*

RUN curl -X DELETE "http://elasticsearch:9200/_all"









