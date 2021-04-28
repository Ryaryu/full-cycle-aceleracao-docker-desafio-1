FROM nginx:alpine

RUN apk update && apk upgrade && apk add bash

COPY ngnix.conf /etc/nginx/nginx.conf
COPY wait-for-it.sh wait-for-it.sh
RUN chmod +x wait-for-it.sh

ENV JAVA_HOST=desafio

CMD ./wait-for-it.sh $JAVA_HOST:8080 --strict --timeout=300 -- nginx -g "daemon off;"