# build the JAR with Maven inside the container
FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package

# run the JAR
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=builder /app/target/my-app-*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]

