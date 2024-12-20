FROM ubuntu:22.04 AS builder

# Install dependencies for building the application
RUN apt update && \
    apt install -y openjdk-17-jdk maven && \
    apt clean

# Set working directory
WORKDIR /app

# Copy application source code
COPY . .

# Build the application and create the WAR file
RUN mvn clean install

# Download and set up Tomcat
FROM tomcat:8-alpine

# Set Tomcat working directory
WORKDIR /usr/local/tomcat

# Copy WAR file from builder stage to Tomcat webapps directory
COPY --from=builder /app/target/*.war webapps/

# Expose the application port
EXPOSE 8080

# Command to start Tomcat
CMD ["bin/catalina.sh", "run"]
