# Usa la imagen base de Akeneo
FROM akeneo/pim-php-dev:8.1

RUN apt-get update && apt-get install -y make curl gnupg && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && apt-get install -y nodejs && npm install -g yarn && rm -rf /var/lib/apt/lists/*

RUN curl -X GET http://elasticsearch:9200/_cluster/health?pretty

RUN curl -X DELETE "http://elasticsearch:9200/_all"

RUN curl -X GET "http://elasticsearch:9200/_cat/indices?v"

RUN curl -X PUT "http://elasticsearch:9200/test_index" -H "Content-Type: application/json" -d '{ "settings": { "number_of_shards": 1, "number_of_replicas": 1 }, "mappings": { "properties": { "name": {  "type": "text"  },  "age": {   "type": "integer" },  "created_at": {  "type": "date" } } }'


RUN curl -X POST "http://elasticsearch:9200/test_index/_doc/1" -H "Content-Type: application/json" -d '{ "name": "John Doe", "age": 30, "created_at": "2024-03-16T12:00:00" }'

RUN curl -X GET "http://localhost:9200/test_index/_search?pretty"









