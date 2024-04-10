FROM maven:3-openjdk-11 AS build
RUN mkdir -p /usr/src/app/
WORKDIR /usr/src/app/
COPY . .
RUN mvn clean package -DskipTests

FROM tomcat:9-jre11

RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=BUILD_IMAGE cloud-hight/target/spring-petclinic-2.4.2.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
