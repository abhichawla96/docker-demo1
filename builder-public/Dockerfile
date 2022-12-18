#FROM maven:3.5.4-jdk-8-alpine as maven

#COPY ./pom.xml ./pom.xml

#COPY ./src ./src

#RUN mvn dependency:go-offline -B

#RUN mvn package

#FROM openjdk:8u171-jre-alpine

#WORKDIR /adevguide

#COPY --from=maven target/Builder-*.jar ./Builder*.jar

#CMD ["java", "-jar", "./Builder.jar"]


FROM maven:3.6.3-jdk-11-slim AS build
#COPY demo1.cer /usr/local/share/ca-certificates
#RUN update-ca-certificates

WORKDIR usr/src/app

COPY . ./

RUN apt-get update && apt -y upgrade									
RUN mvn -e clean package

#FROM openjdk:11-jre-slim/tomcat
FROM tomcat:8.5-jdk8

ARG JAR_NAME="Builder"

COPY DMPublic.properties /usr/local/tomcat/bin
WORKDIR /usr/src/app

ADD /*.war /DMPublic.war

COPY --from=build /usr/src/app/target/*.war /usr/local/tomcat/webapps

#COPY /usr/src/app/target/* /usr/local/tomcat/webapps

CMD ["catalina.sh", "run"]


#CMD ["java","-jar", "./Builder.war"]