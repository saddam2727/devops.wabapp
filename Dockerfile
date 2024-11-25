FROM tomcat:8.0-alpine
WORKDIR /usr/local/tomcat
COPY **/*.war webapps/
CMD ["catalina.sh","run"]
EXPOSE 8080
