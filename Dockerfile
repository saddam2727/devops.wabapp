FROM tomcat
MAINTAINER "KRISHNA"
COPY **/*.war /usr/local/tomcat/webapps
CMD ["catalina.sh","run"]
EXPOSE 8080
