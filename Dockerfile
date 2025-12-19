# Etap 1: Budowanie (używamy lekkiego obrazu z Mavenem)
FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

# Etap 2: Uruchamianie
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY --from=build /target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]