FROM maven:3-openjdk-11 AS build
RUN mkdir -p /usr/src/app/
WORKDIR /usr/src/app/
COPY . .
RUN mvn clean package -DskipTests

FROM tomcat:9.0-jdk8-corretto

# Remove the default ROOT application from Tomcat
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy the .war file into the webapps directory of the Tomcat container
COPY spring-petclinic-2.4.2.war /usr/local/tomcat/webapps/ROOT.war

# Expose the port used by the application server (default: 8080)
EXPOSE 8080

