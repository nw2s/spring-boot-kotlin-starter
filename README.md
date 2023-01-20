# Spring Boot Kotlin Starter

This project is set up as a starter project for a spring boot kotlin-based 
microservice which runs within a docker container. 

Some of the features enabled in this project include:

- Kotlin-logging, asynchronous, json logs
- Stateless endpoints, no authentication
- Builds spring-boot jar with Tomcat container
- Swagger documentation for endpoints


Requires Java 17

## Building/Running

There are a number of bash scripts included which take care of the basic
build and run cases, as well as building Docker images. 



Swagger UI is available at http://localhost:8080/swagger-ui/index.html

Test endpoint is available at http://localhost:8080/test/isup
