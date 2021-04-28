```
docker volume create mysql && \
docker network create full-cycle && \
docker run --rm -d --network full-cycle -e MYSQL_ROOT_PASSWORD=password -v mysql:/var/lib/mysql --name mysql mysql && \
docker run --rm -d --network full-cycle --name desafio \
  -e DB_HOST=mysql -e DB_PORT=3306 -e DB_USER=root -e DB_PASSWORD=password -e DB_DATABASE=mysql \
  ryaryu/full-cycle-aceleracao-docker-desafio-1-java && \
docker run --rm -d --network full-cycle -p 8080:8080 --name ngnix ryaryu/full-cycle-aceleracao-docker-desafio-1-ngnix
```

Como é java demora um bocadinho pra 8080 retornar alguma coisa.