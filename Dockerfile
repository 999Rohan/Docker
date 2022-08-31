FROM maven AS maven-build
WORKDIR /app
COPY . /app
COPY ./libraries /root/.m2
RUN mvn --version
RUN mvn clean package -Dmaven.test.skip=true

FROM tomcat:8.0-alpine
COPY --from=maven-build /app/target/calculator.war $CATALINA_HOME/webapps/calculator.war
EXPOSE 8080
CMD ["catalina.sh","run"]
