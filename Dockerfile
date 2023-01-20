FROM openjdk:17-jdk-alpine
ARG JAR_FILE=build/libs/spring-boot-starter-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar", "application.Application"]
EXPOSE 8080
