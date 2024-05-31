FROM tomcat:8.0-alpine
COPY **/*.war /usr/share/local/tomcat/webapps/
CMD ["catalina.sh","run"]
EXPOSE 8080
