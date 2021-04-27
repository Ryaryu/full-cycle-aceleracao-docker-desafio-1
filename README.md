Execute esses comandos sequencialmente, adaptando o volume do docker do ngnix
de acordo com o seu SO (configurei pra linux).

```
docker volume create mysql && \
docker network create full-cycle && \
docker run --rm -d --network full-cycle -e MYSQL_ROOT_PASSWORD=password -v mysql:/var/lib/mysql --name mysql mysql && \
docker run --rm -d --network full-cycle --name desafio -e DB_URL=mysql ryaryu/full-cycle-aceleracao-docker-desafio-1 && \
docker run --rm -d --network full-cycle -p 8080:8080 --name ngnix -v $PWD/ngnix/ngnix.conf:/etc/nginx/nginx.conf:ro nginx
```