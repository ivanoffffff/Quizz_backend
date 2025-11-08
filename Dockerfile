# ========================================
# STAGE 1 : Build de l'application
# ========================================
FROM maven:3.8.7-eclipse-temurin-17 AS build

# Définit le répertoire de travail
WORKDIR /app

# Copie les fichiers de configuration Maven
COPY pom.xml .

# Télécharge les dépendances (cette étape est cachée si pom.xml ne change pas)
RUN mvn dependency:go-offline -B

# Copie le code source
COPY src ./src

# Build de l'application (skip les tests pour accélérer)
RUN mvn clean package -DskipTests

# ========================================
# STAGE 2 : Image de production
# ========================================
# Utilise amazoncorretto qui supporte ARM64 et AMD64
FROM amazoncorretto:17-alpine

# Informations sur l'image
LABEL maintainer="sports-quiz-team"
LABEL description="Backend API for Sports Quiz Application"

# Crée un utilisateur non-root pour plus de sécurité
RUN addgroup -S spring && adduser -S spring -G spring

# Définit le répertoire de travail
WORKDIR /app

# Copie le JAR depuis l'étape de build
COPY --from=build /app/target/*.jar app.jar

# Change le propriétaire du fichier
RUN chown spring:spring app.jar

# Utilise l'utilisateur non-root
USER spring:spring

# Expose le port 8080
EXPOSE 8080

# Healthcheck pour vérifier que l'application est prête
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:8080/api/quizzes || exit 1

# Point d'entrée de l'application
ENTRYPOINT ["java", \
            "-Djava.security.egd=file:/dev/./urandom", \
            "-Dspring.profiles.active=prod", \
            "-jar", \
            "app.jar"]
