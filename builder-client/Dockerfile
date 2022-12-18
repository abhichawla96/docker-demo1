FROM maven:3.6.3-jdk-11-slim AS build

WORKDIR usr/src/app

COPY . ./

RUN apt-get update && apt -y upgrade

RUN mvn -e clean package

#FROM openjdk:11-jre-slim/tomcat
FROM tomcat:8.5-jdk8

ARG JAR_NAME="Builder"

COPY DMClient.properties /usr/local/tomcat/bin
WORKDIR /usr/src/app

ADD /*.war /DMClient.war

COPY --from=build /usr/src/app/target/*.war /usr/local/tomcat/webapps

#COPY /usr/src/app/target/* /usr/local/tomcat/webapps

CMD ["catalina.sh", "run"]


#CMD ["java","-jar", "./Builder.war"]