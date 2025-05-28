FROM eclipse-temurin:17-jre

WORKDIR /app

# copy the jar flexibly
COPY target/my-app-*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
