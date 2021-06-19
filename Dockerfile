FROM openjdk:8-jre-alpine

EXPOSE 8080

COPY /var/jenkins_home/workspace/build/webapp/target/webapp.war /usr/app
WORKDIR /usr/app

ENTRYPOINT ["java", "-jar", "webapp.war"]
