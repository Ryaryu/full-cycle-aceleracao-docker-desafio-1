FROM adoptopenjdk/openjdk15:alpine

RUN apk update && apk upgrade && apk add bash

COPY wait-for-it.sh wait-for-it.sh
RUN chmod +x wait-for-it.sh

ENV DB_HOST=mysql
ENV DB_PORT=3306

COPY target/pfca-docker-desafio-1-0.1.0.jar app.jar

CMD ./wait-for-it.sh $DB_HOST:$DB_PORT --strict --timeout=300 -- java -jar /app.jar