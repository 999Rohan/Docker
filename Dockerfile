FROM maven AS maven-build
WORKDIR /app
COPY . /app
COPY ./libraries /root/.m2
RUN mvn --version
RUN mvn clean package




FROM tomcat:8.0-alpine AS tomcat-server
COPY --from=maven-build /app/target/calculator.war /usr/local/tomcat/webapps/calculator.war
CMD ["catalina.sh", "run"]
