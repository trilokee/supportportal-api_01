FROM openjdk:8-alpine

# Set the working directory within the container
WORKDIR /app

# Copy the jar file to the container
COPY target/supportportal-api.jar /app/supportportal-api.jar

# Expose the default port for the Spring Boot app
EXPOSE 8082

# Run the jar file to start the Spring Boot app
CMD ["java", "-jar", "/app/supportportal-api.jar"]

# Use the official MySQL image as the base image for the database
FROM mysql:8

# Set the working directory within the container
WORKDIR /app

# Copy the SQL script to the container
COPY db/init.sql /docker-entrypoint-initdb.d/init.sql

# Set the environment variables for the MySQL database
ENV MYSQL_DATABASE=supportportal \	
    MYSQL_ROOT_USER=root \
    #MYSQL_PASSWORD=@Tn33333 \
    #MYSQL_ALLOW_EMPTY_PASSWORD=yes \
    MYSQL_ROOT_PASSWORD=root	

# Expose the default port for the MySQL database
EXPOSE 3306
