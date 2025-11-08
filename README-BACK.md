# Sports Quiz - Backend API

API REST développée avec Spring Boot pour gérer les quiz sportifs, questions, utilisateurs et résultats.

## 🔧 Stack technique

- **Java** : 17
- **Framework** : Spring Boot 3.1.3
- **Base de données** : PostgreSQL 15
- **Build** : Maven 3.8+
- **Documentation API** : Swagger/OpenAPI

## 📁 Structure du projet

```
back-skeleton/
├── src/main/java/com/takima/backskeleton/
│   ├── controllers/          # Endpoints REST
│   ├── DAO/                  # Repositories JPA
│   ├── models/               # Entités (Quiz, Question, User, Result)
│   └── BackSkeletonApplication.java
├── src/main/resources/
│   └── application.properties
├── initdb/                   # Scripts SQL d'initialisation
│   ├── 1_TABLES.sql         # Schéma de la base
│   └── 2_DEFAULT_ENTRIES.sql # Données de test
├── docker-compose.yml
├── Dockerfile
└── pom.xml
```

## 🚀 Lancement manuel

### Prérequis
- Java 17 (JDK)
- Maven 3.8+
- PostgreSQL 15+ (ou Docker)

### Option 1 : Base de données avec Docker (recommandé)

1. **Démarrer uniquement PostgreSQL**
```bash
docker-compose up database -d
```

2. **Créer le fichier `.env`**
```bash
cp .env.sample .env
```

Contenu :
```env
DATABASE_NAME=default-database
DATABASE_USER=root
DATABASE_PASSWORD=toor
```

3. **Créer et remplir les tables manuellement**
```bash
# Se connecter à la base
docker exec -it quiz_database psql -U root -d default-database
```

Dans PostgreSQL, exécuter :
```sql
\i /docker-entrypoint-initdb.d/1_TABLES.sql
\i /docker-entrypoint-initdb.d/2_DEFAULT_ENTRIES.sql
\q
```

4. **Lancer l'application**
```bash
# Avec Maven Wrapper
./mvnw spring-boot:run

# Ou avec Maven installé
mvn spring-boot:run
```

### Option 2 : PostgreSQL installé localement

1. **Créer la base de données**
```sql
CREATE DATABASE default-database;
CREATE USER root WITH PASSWORD 'toor';
GRANT ALL PRIVILEGES ON DATABASE default-database TO root;
```

2. **Exécuter les scripts SQL**
```bash
psql -U root -d default-database -f initdb/1_TABLES.sql
psql -U root -d default-database -f initdb/2_DEFAULT_ENTRIES.sql
```

3. **Configurer l'application**
```bash
cp .env.sample .env
# Modifier les valeurs si nécessaire
```

4. **Lancer l'application**
```bash
./mvnw spring-boot:run
```

## ✅ Vérification

Une fois lancé, l'API est accessible sur :
- **Base URL** : http://localhost:8080
- **Test endpoint** : http://localhost:8080/api/quizzes
- **Swagger UI** : http://localhost:8080/swagger-ui.html

## 📡 Endpoints principaux

### Quiz
- `GET /api/quizzes` - Liste tous les quiz
- `GET /api/quizzes/{id}` - Récupère un quiz
- `POST /api/quizzes` - Crée un quiz (admin)
- `PUT /api/quizzes/{id}` - Modifie un quiz (admin)
- `DELETE /api/quizzes/{id}` - Supprime un quiz (admin)

### Questions
- `GET /api/questions/quiz/{quizId}` - Questions d'un quiz
- `POST /api/questions` - Crée une question (admin)
- `PUT /api/questions/{id}` - Modifie une question (admin)
- `DELETE /api/questions/{id}` - Supprime une question (admin)

### Utilisateurs
- `GET /api/users` - Liste les utilisateurs
- `GET /api/users/{id}` - Récupère un utilisateur
- `POST /api/users` - Crée un utilisateur

### Résultats
- `GET /api/results/user/{userId}` - Résultats d'un utilisateur
- `POST /api/results` - Enregistre un résultat
- `GET /api/results/leaderboard/{quizId}` - Classement

*Documentation complète disponible sur Swagger UI.*

## 🛠️ Commandes utiles

```bash
# Compiler sans lancer
./mvnw clean package

# Lancer les tests
./mvnw test

# Créer le JAR
./mvnw clean package -DskipTests

# Lancer avec un profil spécifique
./mvnw spring-boot:run -Dspring-boot.run.profiles=dev
```

## 🔗 Repository

https://github.com/ivanoffffff/Quizz_backend