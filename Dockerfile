FROM openjdk:21-slim-buster AS build
COPY . .
RUN chmod 700 mvnw
RUN ./mvnw clean package

FROM openjdk:21-slim-buster
WORKDIR /app
COPY --from=build target/*.jar app.jar
ENV SERVER_PORT=8080
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]