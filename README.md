#  Sports Quiz - Backend API

##  Description

API REST développée avec Spring Boot pour l'application Sports Quiz. Cette API gère les quiz sportifs, les questions, les utilisateurs et les résultats.

##  Repository

**Lien GitHub Backend** : https://github.com/ivanoffffff/Quizz_backend
**Lien GitHub Frontend** : https://github.com/ivanoffffff/Quizz_frontend

##  Structure du projet

```
backend/
├── src/
│   ├── main/
│   │   ├── java/com/takima/backskeleton/
│   │   │   ├── BackSkeletonApplication.java    # Point d'entrée
│   │   │   ├── controllers/                    # Contrôleurs REST
│   │   │   │   ├── QuizController.java
│   │   │   │   ├── QuestionController.java
│   │   │   │   ├── UserController.java
│   │   │   │   └── ResultController.java
│   │   │   ├── DAO/                            # Repositories (Data Access Object)
│   │   │   │   ├── QuizRepository.java
│   │   │   │   ├── QuestionRepository.java
│   │   │   │   ├── UserRepository.java
│   │   │   │   └── ResultRepository.java
│   │   │   ├── models/                         # Entités JPA
│   │   │   │   ├── Quiz.java
│   │   │   │   ├── Question.java
│   │   │   │   ├── User.java
│   │   │   │   └── Result.java
│   │   │   └── services/                       # Services (optionnel)
│   │   │       └── [Logique métier si nécessaire]
│   │   └── resources/
│   │       ├── application.properties          # Configuration Spring
│   │       └── [autres ressources]
│   └── test/                                   # Tests unitaires et d'intégration
│       └── java/com/takima/backskeleton/
├── initdb/                                     # Scripts SQL d'initialisation
│   ├── 1_TABLES.sql                           # Création du schéma
│   └── 2_DEFAULT_ENTRIES.sql                  # Données de test
├── img-readme/                                # Images pour la documentation
├── .env.sample                                # Exemple de configuration
├── .gitignore
├── docker-compose.yml                         # Configuration Docker
├── Dockerfile                                 # Image Docker du backend
├── pom.xml                                    # Configuration Maven
├── mvnw                                       # Maven Wrapper (Linux/Mac)
├── mvnw.cmd                                   # Maven Wrapper (Windows)
└── README.md                                  # Ce fichier
```

##  Installation et démarrage

### Option 1 : Avec Docker Compose (recommandé)
Dans cette partie on va démarrer toute l'application.

#### Prérequis
- Docker
- Docker Compose

#### Étapes

1. **Cloner les repositories**

Placer les deux dossiers dans un seul et même dossier parent.

```bash
git clone https://github.com/ivanoffffff/Quizz_frontend
```
```bash
git clone https://github.com/ivanoffffff/Quizz_backend
```

2. **Créer le fichier `.env`**

Copiez le fichier d'exemple et modifiez les valeurs si nécessaire :
```bash
cd backend
cp .env.sample .env
```

Contenu du fichier `.env` :
```env
# Configuration PostgreSQL
DATABASE_NAME=default-database
DATABASE_USER=root
DATABASE_PASSWORD=toor
```

3. **Démarrer tous les services**
```bash
cd backend
docker-compose up -d
```

4. **Créer et remplir les tables de la base de données**
```bash
docker exec -it quiz_database psql -U root -d default-database
```
```bash
 \i /docker-entrypoint-initdb.d/1_TABLES.sql
 \i /docker-entrypoint-initdb.d/2_DEFAULT_ENTRIES.sql
```

Ces commandes vont :
-  Créer et démarrer le conteneur PostgreSQL
-  Exécuter les scripts SQL (`initdb/*.sql`)
-  Créer les tables et insérer les données de test
-  Démarrer l'API Spring Boot sur le port 8080
-  Démarrer le frontend sur le port 4200

5. **Vérifier que l'API fonctionne**

Ouvrez votre navigateur sur :
- API : http://localhost:8080/api/quizzes
- Swagger UI : http://localhost:8080/swagger-ui.html

6. **Acceder à l'Application**

Ouvrez votre navigateur sur :
- http://localhost:4200/quiz
- http://localhost:4200/

7. **Arrêter les services**
```bash
docker-compose down
```

Pour supprimer également les volumes (données) :
```bash
docker-compose down -v
```

### Option 2 : Développement local (sans Docker)

#### Prérequis
- Java 17 (JDK)
- Maven 3.8+
- PostgreSQL 15+ installé localement

#### Étapes

1. **Cloner le repository**
```bash
git clone https://github.com/ivanoffffff/Quizz_backend
cd backend
```

2. **Démarrer PostgreSQL avec Docker** (recommandé)
```bash
# Lance uniquement la base de données
docker-compose up database -d
```

Ou installez PostgreSQL localement et créez la base de données :
```sql
CREATE DATABASE quiz_db;
CREATE USER postgres WITH PASSWORD 'postgres123';
GRANT ALL PRIVILEGES ON DATABASE quiz_db TO postgres;
```

3. **Configurer l'application**

Créez un fichier `.env` :
```env
DATABASE_NAME=quiz_db
DATABASE_USER=postgres
DATABASE_PASSWORD=postgres123
```

4. **Installer les dépendances et lancer l'application**

```bash
# Avec Maven Wrapper (recommandé)
./mvnw spring-boot:run

# Ou avec Maven installé globalement
mvn spring-boot:run
```

5. **Exécuter les scripts SQL manuellement**

Si la base est vide, exécutez les scripts :
```bash
# Se connecter à PostgreSQL
psql -U postgres -d quiz_db

# Exécuter les scripts
\i initdb/1_TABLES.sql
\i initdb/2_DEFAULT_ENTRIES.sql
```

6. **Vérifier que l'API fonctionne**
- API : http://localhost:8080/api/quizzes
- Swagger : http://localhost:8080/swagger-ui.html

### Option 3 : Avec un IDE (IntelliJ IDEA, Eclipse, VS Code)

1. **Importer le projet**
    - Ouvrez l'IDE
    - Importez le projet Maven (fichier `pom.xml`)

2. **Configurer les variables d'environnement**

Dans IntelliJ IDEA :
- Allez dans `Run > Edit Configurations`
- Ajoutez le plugin EnvFile (voir image dans `img-readme/`)
- Ajoutez votre fichier `.env`

3. **Démarrer la base de données**
```bash
docker-compose up database -d
```

4. **Lancer l'application**
    - Exécutez la classe principale : `BackSkeletonApplication.java`
    - L'API démarre sur http://localhost:8080
  
##  Accès à l'application

### Users
Vous pouvez utiliser l'application sans vous connecter. Vous aurez néanmoins besoinde vous connecter pour consulter votre score suite à un quiz.
Pour accéder à la partie administrateur, il vous faudra utiliser une adresse mail 'admin' déjà présente dans la BDD. Vous pourrez par la suite créer d'autres administrateurs.

#### Players
- Bob, bob@example.com
- Charlie, charlie@example.com
- Diana, diana@example.com
- Ethan, ethan@example.com

#### Admins
- Alice, alice@example.com

##  Base de données

### Schéma de la base de données

```sql
-- Table des utilisateurs
CREATE TABLE "user" (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (role IN ('admin', 'player'))
);

-- Table des quiz
CREATE TABLE Quiz (
    quiz_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    type VARCHAR(50) NOT NULL,
    description TEXT
);

-- Table des questions
CREATE TABLE Question (
    question_id SERIAL PRIMARY KEY,
    quiz_id INT NOT NULL REFERENCES Quiz(quiz_id) ON DELETE CASCADE,
    statement TEXT NOT NULL,
    choices TEXT,
    correct_answer VARCHAR(255) NOT NULL
);

-- Table des résultats
CREATE TABLE Result (
    result_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES "user"(user_id) ON DELETE CASCADE,
    quiz_id INT NOT NULL REFERENCES Quiz(quiz_id) ON DELETE CASCADE,
    score INT NOT NULL,
    play_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### Types de quiz disponibles

- `FOOTBALL` - Quiz sur le football
- `BASKETBALL` - Quiz sur le basketball
- `TENNIS` - Quiz sur le tennis
- `GOLF` - Quiz sur le golf
- `ATHLETISME` - Quiz sur l'athlétisme
- `NATATION` - Quiz sur la natation
- `RUGBY` - Quiz sur le rugby
- `AUTRE` - Autres sports

### Scripts SQL

Les scripts sont dans le dossier `initdb/` :

1. **`1_TABLES.sql`** - Création du schéma
    - Suppression des tables existantes (DROP IF EXISTS)
    - Création des 4 tables principales
    - Définition des contraintes et clés étrangères

2. **`2_DEFAULT_ENTRIES.sql`** - Données de test
    - 5 utilisateurs (1 admin + 4 joueurs)
    - 10 quiz sur différents sports
    - Plus de 100 questions variées
    - Plusieurs résultats de test pour chaque utilisateur

##  API Endpoints

### Documentation interactive

La documentation complète de l'API est disponible via Swagger UI :  
**http://localhost:8080/swagger-ui.html**

### Endpoints disponibles

####  Quiz

| Méthode | Endpoint | Description | Paramètres |
|---------|----------|-------------|------------|
| GET | `/api/quizzes` | Liste tous les quiz | - |
| GET | `/api/quizzes/{id}` | Récupère un quiz par ID | `id` (path) |
| POST | `/api/quizzes` | Crée un nouveau quiz | Body JSON |
| PUT | `/api/quizzes/{id}` | Met à jour un quiz | `id` (path) + Body JSON |
| DELETE | `/api/quizzes/{id}` | Supprime un quiz | `id` (path) |

**Exemple de Body pour POST/PUT :**
```json
{
  "title": "Quiz Football Avancé",
  "type": "FOOTBALL",
  "description": "Testez vos connaissances approfondies sur le football"
}
```

####  Questions

| Méthode | Endpoint | Description | Paramètres |
|---------|----------|-------------|------------|
| GET | `/api/questions` | Liste toutes les questions | - |
| GET | `/api/questions/{id}` | Récupère une question par ID | `id` (path) |
| GET | `/api/questions/quiz/{quizId}` | Questions d'un quiz spécifique | `quizId` (path) |
| POST | `/api/questions` | Crée une nouvelle question | Body JSON |
| PUT | `/api/questions/{id}` | Met à jour une question | `id` (path) + Body JSON |
| DELETE | `/api/questions/{id}` | Supprime une question | `id` (path) |

**Exemple de Body pour POST/PUT :**
```json
{
  "quizId": 1,
  "statement": "Qui a remporté la Coupe du Monde FIFA 2018 ?",
  "choices": "France;Brésil;Allemagne;Argentine",
  "correctAnswer": "France"
}
```

**Note** : Les choix sont stockés sous forme de chaîne séparée par des points-virgules.

####  Utilisateurs

| Méthode | Endpoint | Description | Paramètres |
|---------|----------|-------------|------------|
| GET | `/api/users` | Liste tous les utilisateurs | - |
| GET | `/api/users/{id}` | Récupère un utilisateur par ID | `id` (path) |
| GET | `/api/users/email/{email}` | Récupère un utilisateur par email | `email` (path) |
| POST | `/api/users` | Crée un nouvel utilisateur | Body JSON |
| PUT | `/api/users/{id}` | Met à jour un utilisateur | `id` (path) + Body JSON |
| DELETE | `/api/users/{id}` | Supprime un utilisateur | `id` (path) |

**Exemple de Body pour POST/PUT :**
```json
{
  "name": "John Doe",
  "email": "john.doe@example.com",
  "role": "player"
}
```

**Rôles disponibles** : `admin`, `player`

####  Résultats

| Méthode | Endpoint | Description | Paramètres |
|---------|----------|-------------|------------|
| GET | `/api/results` | Liste tous les résultats | - |
| GET | `/api/results/{id}` | Récupère un résultat par ID | `id` (path) |
| GET | `/api/results/user/{userId}` | Résultats d'un utilisateur | `userId` (path) |
| GET | `/api/results/quiz/{quizId}` | Résultats d'un quiz | `quizId` (path) |
| GET | `/api/results/leaderboard/{quizId}` | Classement pour un quiz | `quizId` (path) |
| POST | `/api/results` | Enregistre un nouveau résultat | Body JSON |
| DELETE | `/api/results/{id}` | Supprime un résultat | `id` (path) |

**Exemple de Body pour POST :**
```json
{
  "userId": 2,
  "quizId": 1,
  "score": 8
}
```

### Exemples avec curl

```bash
# Récupérer tous les quiz
curl http://localhost:8080/api/quizzes

# Récupérer un quiz spécifique
curl http://localhost:8080/api/quizzes/1

# Récupérer les questions d'un quiz
curl http://localhost:8080/api/questions/quiz/1

# Créer un nouveau quiz
curl -X POST http://localhost:8080/api/quizzes \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Quiz Tennis",
    "type": "TENNIS",
    "description": "Testez vos connaissances sur le tennis"
  }'

# Enregistrer un résultat
curl -X POST http://localhost:8080/api/results \
  -H "Content-Type: application/json" \
  -d '{
    "userId": 2,
    "quizId": 1,
    "score": 9
  }'

# Récupérer le classement d'un quiz
curl http://localhost:8080/api/results/leaderboard/1
```

##  Tests

### Tester avec Swagger UI

1. Accédez à http://localhost:8080/swagger-ui.html
2. Explorez les endpoints disponibles
3. Cliquez sur "Try it out" pour tester chaque endpoint
4. Modifiez les paramètres et exécutez les requêtes

### Comptes de test

**Administrateur :**
- ID: 1
- Nom: Alice
- Email: alice@example.com
- Rôle: admin

**Joueurs :**
- ID: 2, Nom: Bob, Email: bob@example.com
- ID: 3, Nom: Charlie, Email: charlie@example.com
- ID: 4, Nom: Diana, Email: diana@example.com
- ID: 5, Nom: Ethan, Email: ethan@example.com

##  Configuration

### Fichier `application.properties`

```properties
# Configuration de la base de données
spring.datasource.url=jdbc:postgresql://localhost:5432/${DATABASE_NAME}
spring.datasource.username=${DATABASE_USER}
spring.datasource.password=${DATABASE_PASSWORD}

# Configuration JPA/Hibernate
spring.jpa.hibernate.ddl-auto=none
spring.jpa.show-sql=false
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.PostgreSQLDialect

# Configuration multipart (upload de fichiers)
spring.servlet.multipart.max-file-size=10MB
spring.servlet.multipart.max-request-size=10MB

# Configuration du serveur
server.port=8080
```

### Variables d'environnement (fichier `.env`)

```env
# Base de données PostgreSQL
DATABASE_NAME=quiz_db
DATABASE_USER=postgres
DATABASE_PASSWORD=postgres123
```

##  Dépannage

### L'application ne démarre pas

**Erreur de connexion à la base de données :**
```
java.net.ConnectException: Connection refused
```
**Solution** : Vérifiez que PostgreSQL est démarré
```bash
docker-compose ps
docker-compose up database -d
```

**Port 8080 déjà utilisé :**
```
Web server failed to start. Port 8080 was already in use.
```
**Solution** : Arrêtez l'application qui utilise le port ou changez le port dans `application.properties`
```bash
# Trouver le processus
lsof -i :8080
# Tuer le processus
kill -9 [PID]
```

### Les tables n'existent pas

**Solution** : Exécutez les scripts SQL manuellement
```bash
# Se connecter à PostgreSQL
docker exec -it api_database psql -U postgres -d quiz_db

# Vérifier les tables
\dt

# Si les tables n'existent pas, exécuter les scripts
\i initdb/1_TABLES.sql
\i initdb/2_DEFAULT_ENTRIES.sql
```

### La base de données est vide

**Solution** : Supprimez le volume Docker et redémarrez
```bash
docker-compose down -v
docker-compose up -d
```

### Erreur de compilation Maven

**Solution** : Nettoyez et recompilez
```bash
./mvnw clean install
```

## 📚 Ressources

- [Spring Boot Documentation](https://docs.spring.io/spring-boot/docs/current/reference/html/)
- [Spring Data JPA](https://docs.spring.io/spring-data/jpa/docs/current/reference/html/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [SpringDoc OpenAPI](https://springdoc.org/)

##  Développement

### Build du projet

```bash
# Compiler le projet
./mvnw clean package

# Compiler sans les tests
./mvnw clean package -DskipTests

# Exécuter les tests
./mvnw test
```

### Structure des packages

- `controllers` : Contrôleurs REST qui gèrent les requêtes HTTP
- `DAO` : Interfaces Repository pour l'accès aux données
- `models` : Entités JPA qui représentent les tables de la base
- `services` : Logique métier (si nécessaire)
