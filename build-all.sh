#!/bin/bash

cp -f wait-for-it.sh ngnix/wait-for-it.sh

mvn clean package -DskipTests

docker build -t ryaryu/full-cycle-aceleracao-docker-desafio-1-java .
cd ngnix
docker build -t ryaryu/full-cycle-aceleracao-docker-desafio-1-ngnix .

docker stop ngnix && docker rm ngnix
docker stop desafio && docker rm desafio
docker stop mysql && docker rm mysql
docker volume rm mysql
docker network rm full-cycle

docker volume create mysql && \
docker network create full-cycle && \
docker run --rm -d --network full-cycle -e MYSQL_ROOT_PASSWORD=password -v mysql:/var/lib/mysql --name mysql mysql && \
docker run --rm -d --network full-cycle --name desafio \
  -e DB_HOST=mysql -e DB_PORT=3306 -e DB_USER=root -e DB_PASSWORD=password -e DB_DATABASE=mysql \
  ryaryu/full-cycle-aceleracao-docker-desafio-1-java && \
docker run --rm -d --network full-cycle -p 8080:8080 --name ngnix ryaryu/full-cycle-aceleracao-docker-desafio-1-ngnix

cd ..

./wait-for-it.sh localhost:8080 --timeout=300 --strict || exit 1

docker login
docker push ryaryu/full-cycle-aceleracao-docker-desafio-1-java
docker push ryaryu/full-cycle-aceleracao-docker-desafio-1-ngnix

