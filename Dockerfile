FROM openjdk:11 AS BUILD_IMAGE

# Install Maven
RUN apt-get update && \
    apt-get install -y maven && \
    apt-get clean

# Set working directory
WORKDIR /app

# Copy the project files
COPY . /app

# Build the project
RUN mvn clean install -DskipTests

FROM tomcat:9-jre11

# Remove existing webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file from the BUILD_IMAGE
COPY --from=BUILD_IMAGE /app/target/spring-petclinic-2.4.2.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]

