FROM maven:3-openjdk-11 AS build
RUN mkdir -p /usr/src/app/
WORKDIR /usr/src/app/
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:11-jdk
COPY --from=build /usr/src/app/target/spring-petclinic-2.4.2.jar /spring-petclinic.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "-Xmx5128M", "/spring-petclinic.jar"]

