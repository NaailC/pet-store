FROM maven:latest AS build-stage
COPY . /build
WORKDIR /build
RUN mvn clean package -DskipTests 

FROM openjdk:8-jre-alpine AS runtime 
WORKDIR /opt/spring-petclinic-rest
 
COPY --from=build-stage /build/target/*.jar app.jar
ENTRYPOINT ["/usr/bin/java", "-jar", "app.jar"]
EXPOSE 9966 