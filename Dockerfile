FROM maven
WORKDIR /opt/app
EXPOSE 8585
COPY . .
RUN mvn clean package && cp ./target/*.jar /opt/app/app.jar
ENTRYPOINT ["java","-jar","app.jar"]


## sudo docker run -p 8080:8080 -t docker-spring-boot:1.0
## sudo docker run -p 80:8080 -t docker-spring-boot:1.0
## sudo docker run -p 443:8443 -t docker-spring-boot:1.0