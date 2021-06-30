FROM tomcat:latest

RUN ["rm", "-fr", "/usr/local/tomcat/webapps/webapp.war"]

ADD ./webapp/target/webapp.war /usr/local/tomcat/webapps/

CMD [“catalina.sh”, “run”]
