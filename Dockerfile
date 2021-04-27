FROM adoptopenjdk/openjdk15:alpine
COPY target/pfca-docker-desafio-1-0.1.0.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]