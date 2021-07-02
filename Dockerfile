FROM tomcat:9.0-alpine

RUN ["rm", "-fr", "/usr/local/tomcat/webapps/ROOT"]

COPY ./webapp/target/webapp.war /usr/local/tomcat/webapps/ROOT.war

CMD ["catalina.sh", "run"]
