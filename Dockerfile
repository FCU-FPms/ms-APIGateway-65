FROM openjdk:8-jdk-alpine
COPY target/apiGateway-0.0.1-SNAPSHOT.jar app.jar

ENV application-name=ms-apiGateway
ENV instance-id=instance-id
EXPOSE 46557

ENTRYPOINT ["java","-jar","/app.jar","--spring.application.name=${application-name}","--eureka.instance.instance-id=${instance-id}"]
