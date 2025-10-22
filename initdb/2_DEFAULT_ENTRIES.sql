DO $$

    BEGIN

        INSERT INTO "user" (name, email, role) VALUES
                                                   ('Alice', 'alice@example.com', 'admin'),
                                                   ('Bob', 'bob@example.com', 'player'),
                                                   ('Charlie', 'charlie@example.com', 'player'),
                                                   ('Diana', 'diana@example.com', 'player'),
                                                   ('Ethan', 'ethan@example.com', 'player');

        -- ==========================
        -- Insertion des Quiz
        -- ==========================
        INSERT INTO Quiz (title, description, type) VALUES
                                                        ('Quiz Football', 'Testez vos connaissances générales sur le football', 'FOOTBALL'),
                                                        ('Quiz Basketball', 'Testez vos connaissances générales sur le basketball', 'BASKETBALL'),
                                                        ('Quiz Football Avancé', 'Testez vos connaissances approfondies sur l''histoire et les légendes du football', 'FOOTBALL'),
                                                        ('Quiz Légendes NBA', 'Testez vos connaissances sur l''histoire de la NBA et les joueurs légendaires', 'BASKETBALL'),
                                                        ('Quiz Tennis Grand Chelem', 'Testez vos connaissances sur le tennis et les tournois du Grand Chelem', 'TENNIS'),
                                                        ('Quiz Golf Masters', 'Testez vos connaissances sur le golf et les championnats majeurs', 'GOLF'),
                                                        ('Quiz Athlétisme', 'Testez vos connaissances sur l''athlétisme et les records', 'ATHLETISME'),
                                                        ('Quiz Champions de Natation', 'Testez vos connaissances sur la natation et les champions olympiques', 'NATATION'),
                                                        ('Quiz Coupe du Monde de Rugby', 'Testez vos connaissances sur le rugby et la Coupe du Monde', 'RUGBY'),
                                                        ('Quiz Histoire du Sport', 'Testez vos connaissances générales sur différents sports', 'AUTRE');

        -- ==========================
        -- Insertion des Questions - Quiz Football (quiz_id = 1)
        -- ==========================
        INSERT INTO Question (quiz_id, statement, choices, correct_answer) VALUES
                                                                               (1, 'Quel pays a remporté la Coupe du Monde FIFA 2018 ?', 'France;Brésil;Allemagne;Argentine', 'France'),
                                                                               (1, 'Qui a remporté le plus de Ballons d''Or ?', 'Cristiano Ronaldo;Lionel Messi;Michel Platini;Ronaldinho', 'Lionel Messi'),
                                                                               (1, 'Quel club a remporté le plus de titres de Ligue des Champions ?', 'Real Madrid;AC Milan;Liverpool;Barcelone', 'Real Madrid'),
                                                                               (1, 'Où s''est déroulée la Coupe du Monde FIFA 2006 ?', 'Allemagne;Italie;Afrique du Sud;France', 'Allemagne'),
                                                                               (1, 'Quel joueur est surnommé "El Fenomeno" ?', 'Ronaldo Nazario;Ronaldinho;Romario;Kaka', 'Ronaldo Nazario'),
                                                                               (1, 'Qui a marqué le but de "la main de Dieu" ?', 'Maradona;Pelé;Zidane;Platini', 'Maradona'),
                                                                               (1, 'Quel pays a accueilli la première Coupe du Monde en 1930 ?', 'Brésil;Uruguay;Argentine;Italie', 'Uruguay'),
                                                                               (1, 'Quel pays africain a atteint les quarts de finale de la Coupe du Monde 2010 ?', 'Ghana;Nigeria;Cameroun;Sénégal', 'Ghana'),
                                                                               (1, 'Qui est le meilleur buteur de tous les temps en Ligue des Champions ?', 'Cristiano Ronaldo;Messi;Lewandowski;Raul', 'Cristiano Ronaldo'),
                                                                               (1, 'Quelle équipe a remporté la Premier League en 2021 ?', 'Manchester City;Chelsea;Liverpool;Manchester United', 'Manchester City');

        -- ==========================
        -- Insertion des Questions - Quiz Basketball (quiz_id = 2)
        -- ==========================
        INSERT INTO Question (quiz_id, statement, choices, correct_answer) VALUES
                                                                               (2, 'Quelle équipe a remporté le championnat NBA 2020 ?', 'Lakers;Heat;Warriors;Bucks', 'Lakers'),
                                                                               (2, 'Qui est connu sous le nom de "His Airness" ?', 'Kobe Bryant;Michael Jordan;LeBron James;Magic Johnson', 'Michael Jordan'),
                                                                               (2, 'Quel pays a remporté le premier tournoi olympique de basketball en 1936 ?', 'USA;Espagne;Argentine;Italie', 'USA'),
                                                                               (2, 'Quel joueur est surnommé "The King" ?', 'Kareem Abdul-Jabbar;Shaquille O''Neal;LeBron James;Kobe Bryant', 'LeBron James'),
                                                                               (2, 'Quel joueur NBA possède le plus de bagues de champion ?', 'Bill Russell;Michael Jordan;Magic Johnson;Kareem Abdul-Jabbar', 'Bill Russell'),
                                                                               (2, 'Quelle équipe a drafté Kobe Bryant en 1996 ?', 'Lakers;Hornets;Celtics;Bulls', 'Hornets'),
                                                                               (2, 'Où est basée l''équipe NBA Toronto Raptors ?', 'New York;Toronto;Vancouver;Montréal', 'Toronto'),
                                                                               (2, 'Qui détient le record de points marqués en un seul match NBA ?', 'Wilt Chamberlain;Michael Jordan;LeBron James;Kobe Bryant', 'Wilt Chamberlain'),
                                                                               (2, 'Quelle équipe NBA est surnommée "The Splash Brothers" ?', 'Lakers;Warriors;Bulls;Celtics', 'Warriors'),
                                                                               (2, 'Qui a remporté le prix MVP de la NBA en 2021 ?', 'Giannis Antetokounmpo;Nikola Jokic;Steph Curry;Joel Embiid', 'Nikola Jokic');

        -- ==========================
        -- Insertion des Questions - Quiz Football Avancé (quiz_id = 3)
        -- ==========================
        INSERT INTO Question (quiz_id, statement, choices, correct_answer) VALUES
                                                                               (3, 'Quel pays a remporté le plus de Coupes du Monde FIFA ?', 'Brésil;Allemagne;Italie;Argentine', 'Brésil'),
                                                                               (3, 'Qui est le meilleur buteur de tous les temps en Coupe du Monde ?', 'Miroslav Klose;Ronaldo;Pelé;Gerd Muller', 'Miroslav Klose'),
                                                                               (3, 'Quel joueur a disputé le plus de matchs en Ligue des Champions ?', 'Iker Casillas;Cristiano Ronaldo;Xavi;Lionel Messi', 'Cristiano Ronaldo'),
                                                                               (3, 'Quelle équipe a remporté la première Ligue des Champions en 1956 ?', 'Real Madrid;Barcelone;AC Milan;Bayern Munich', 'Real Madrid'),
                                                                               (3, 'Qui était le meilleur buteur de la Coupe du Monde 2014 ?', 'James Rodriguez;Thomas Muller;Neymar;Lionel Messi', 'James Rodriguez'),
                                                                               (3, 'Quel club anglais a réalisé le triplé en 1999 ?', 'Manchester United;Arsenal;Liverpool;Chelsea', 'Manchester United'),
                                                                               (3, 'Qui est le plus jeune joueur à avoir marqué en finale de Coupe du Monde ?', 'Pelé;Kylian Mbappé;Diego Maradona;Ronaldo', 'Pelé'),
                                                                               (3, 'Quel joueur a remporté le plus de titres en Ligue des Champions ?', 'Cristiano Ronaldo;Paco Gento;Sergio Ramos;Karim Benzema', 'Paco Gento'),
                                                                               (3, 'Quel stade est connu comme "The Theatre of Dreams" ?', 'Old Trafford;Anfield;Camp Nou;Santiago Bernabeu', 'Old Trafford'),
                                                                               (3, 'Qui a remporté le Ballon d''Or de la Coupe du Monde 2018 ?', 'Luka Modric;Kylian Mbappé;Eden Hazard;Antoine Griezmann', 'Luka Modric');

        -- ==========================
        -- Insertion des Questions - Quiz Légendes NBA (quiz_id = 4)
        -- ==========================
        INSERT INTO Question (quiz_id, statement, choices, correct_answer) VALUES
                                                                               (4, 'Pour quelle équipe Michael Jordan n''a-t-il PAS joué ?', 'Lakers;Bulls;Wizards;Aucune', 'Lakers'),
                                                                               (4, 'Qui a été le premier joueur à marquer 100 points en un seul match NBA ?', 'Wilt Chamberlain;Michael Jordan;Kobe Bryant;Elgin Baylor', 'Wilt Chamberlain'),
                                                                               (4, 'Quel joueur est connu sous le nom de "The Black Mamba" ?', 'Kobe Bryant;Kevin Garnett;Allen Iverson;Vince Carter', 'Kobe Bryant'),
                                                                               (4, 'Qui a remporté le plus de prix MVP de la NBA ?', 'Kareem Abdul-Jabbar;Michael Jordan;LeBron James;Bill Russell', 'Kareem Abdul-Jabbar'),
                                                                               (4, 'Quelle équipe détient le meilleur bilan en saison régulière de l''histoire NBA ?', '2015-16 Warriors;1995-96 Bulls;2016-17 Warriors;1971-72 Lakers', '2015-16 Warriors'),
                                                                               (4, 'Qui est le meilleur marqueur de tous les temps en NBA ?', 'LeBron James;Kareem Abdul-Jabbar;Karl Malone;Kobe Bryant', 'LeBron James'),
                                                                               (4, 'Quel joueur détient le plus de triple-doubles en carrière ?', 'Russell Westbrook;Oscar Robertson;Magic Johnson;LeBron James', 'Russell Westbrook'),
                                                                               (4, 'Qui était surnommé "The Big Fundamental" ?', 'Tim Duncan;Shaquille O''Neal;Hakeem Olajuwon;David Robinson', 'Tim Duncan'),
                                                                               (4, 'Quelle équipe a remporté le championnat NBA en 2011 ?', 'Mavericks;Heat;Lakers;Celtics', 'Mavericks'),
                                                                               (4, 'Qui était le joueur le plus petit à remporter un prix MVP de la NBA ?', 'Allen Iverson;Isaiah Thomas;Chris Paul;Stephen Curry', 'Allen Iverson');

        -- ==========================
        -- Insertion des Questions - Quiz Tennis Grand Chelem (quiz_id = 5)
        -- ==========================
        INSERT INTO Question (quiz_id, statement, choices, correct_answer) VALUES
                                                                               (5, 'Qui a remporté le plus de titres du Grand Chelem en simple messieurs ?', 'Novak Djokovic;Rafael Nadal;Roger Federer;Pete Sampras', 'Novak Djokovic'),
                                                                               (5, 'Quel tournoi du Grand Chelem se joue sur terre battue ?', 'Roland-Garros;Wimbledon;US Open;Open d''Australie', 'Roland-Garros'),
                                                                               (5, 'Qui est connu comme le "Roi de la terre battue" ?', 'Rafael Nadal;Bjorn Borg;Novak Djokovic;Roger Federer', 'Rafael Nadal'),
                                                                               (5, 'Quel Grand Chelem est le tournoi de tennis le plus ancien ?', 'Wimbledon;Roland-Garros;US Open;Open d''Australie', 'Wimbledon'),
                                                                               (5, 'Qui a remporté le Golden Slam en 1988 ?', 'Steffi Graf;Martina Navratilova;Serena Williams;Monica Seles', 'Steffi Graf'),
                                                                               (5, 'Sur quelle surface se joue Wimbledon ?', 'Gazon;Terre battue;Dur;Moquette', 'Gazon'),
                                                                               (5, 'Qui a remporté le plus de titres en simple messieurs à Wimbledon ?', 'Roger Federer;Novak Djokovic;Pete Sampras;Bjorn Borg', 'Roger Federer'),
                                                                               (5, 'Quel joueur a complété le Grand Chelem en carrière en gagnant Roland-Garros 2016 ?', 'Novak Djokovic;Andy Murray;Stan Wawrinka;Marin Cilic', 'Novak Djokovic'),
                                                                               (5, 'Qui a remporté le plus de titres du Grand Chelem en simple dames ?', 'Serena Williams;Margaret Court;Steffi Graf;Martina Navratilova', 'Margaret Court'),
                                                                               (5, 'Quel pays a remporté le plus de titres en Coupe Davis ?', 'USA;Australie;Grande-Bretagne;France', 'USA');

        -- ==========================
        -- Insertion des Questions - Quiz Golf Masters (quiz_id = 6)
        -- ==========================
        INSERT INTO Question (quiz_id, statement, choices, correct_answer) VALUES
                                                                               (6, 'Qui a remporté le plus de championnats majeurs au golf ?', 'Jack Nicklaus;Tiger Woods;Walter Hagen;Ben Hogan', 'Jack Nicklaus'),
                                                                               (6, 'Quel parcours accueille le tournoi Masters ?', 'Augusta National;Pebble Beach;St Andrews;Pinehurst', 'Augusta National'),
                                                                               (6, 'Quel est le terme pour un score d''un coup sous le par sur un trou ?', 'Birdie;Eagle;Bogey;Par', 'Birdie'),
                                                                               (6, 'Qui a remporté le Masters 2019 à l''âge de 43 ans ?', 'Tiger Woods;Phil Mickelson;Ernie Els;Vijay Singh', 'Tiger Woods'),
                                                                               (6, 'Combien de trous y a-t-il dans un parcours standard de golf ?', '18;9;12;27', '18'),
                                                                               (6, 'De quelle couleur est la veste remise au champion du Masters ?', 'Verte;Rouge;Bleue;Jaune', 'Verte'),
                                                                               (6, 'Quel parcours est connu comme "La Maison du Golf" ?', 'St Andrews;Augusta National;Royal Troon;Carnoustie', 'St Andrews'),
                                                                               (6, 'Qui est le plus jeune joueur à avoir remporté le Masters ?', 'Tiger Woods;Jordan Spieth;Seve Ballesteros;Jack Nicklaus', 'Tiger Woods'),
                                                                               (6, 'Comment appelle-t-on un score de deux coups sous le par ?', 'Eagle;Birdie;Albatros;Condor', 'Eagle'),
                                                                               (6, 'Quel tournoi n''est PAS un majeur de golf ?', 'Players Championship;Le Masters;US Open;The Open Championship', 'Players Championship');

        -- ==========================
        -- Insertion des Questions - Quiz Athlétisme (quiz_id = 7)
        -- ==========================
        INSERT INTO Question (quiz_id, statement, choices, correct_answer) VALUES
                                                                               (7, 'Qui détient le record du monde du 100m ?', 'Usain Bolt;Carl Lewis;Tyson Gay;Yohan Blake', 'Usain Bolt'),
                                                                               (7, 'Quel est le record du monde du 100m d''Usain Bolt ?', '9,58 secondes;9,63 secondes;9,69 secondes;9,72 secondes', '9,58 secondes'),
                                                                               (7, 'Quel athlète a remporté le plus de médailles d''or olympiques en athlétisme ?', 'Paavo Nurmi;Carl Lewis;Usain Bolt;Allyson Felix', 'Paavo Nurmi'),
                                                                               (7, 'Quelle est la distance d''un marathon ?', '42,195 km;40 km;45 km;50 km', '42,195 km'),
                                                                               (7, 'Qui détient le record du monde féminin du 100m ?', 'Florence Griffith-Joyner;Elaine Thompson;Shelly-Ann Fraser-Pryce;Marion Jones', 'Florence Griffith-Joyner'),
                                                                               (7, 'Combien de haies y a-t-il dans une course de 110m haies standard ?', '10;8;12;15', '10'),
                                                                               (7, 'Quel pays a remporté le plus de médailles en athlétisme aux Jeux Olympiques ?', 'USA;Union soviétique;Grande-Bretagne;Kenya', 'USA'),
                                                                               (7, 'Qui a été la première personne à courir un mile en moins de 4 minutes ?', 'Roger Bannister;John Landy;Herb Elliott;Jim Ryun', 'Roger Bannister'),
                                                                               (7, 'Quel est le poids standard d''un lancer de poids masculin ?', '7,26 kg;6 kg;8 kg;5 kg', '7,26 kg'),
                                                                               (7, 'Qui détient le record du monde du saut à la perche ?', 'Armand Duplantis;Sergey Bubka;Renaud Lavillenie;Sam Kendricks', 'Armand Duplantis');

        -- ==========================
        -- Insertion des Questions - Quiz Champions de Natation (quiz_id = 8)
        -- ==========================
        INSERT INTO Question (quiz_id, statement, choices, correct_answer) VALUES
                                                                               (8, 'Qui a remporté le plus de médailles d''or olympiques en natation ?', 'Michael Phelps;Mark Spitz;Ryan Lochte;Ian Thorpe', 'Michael Phelps'),
                                                                               (8, 'Combien de médailles d''or olympiques Michael Phelps a-t-il remporté au total ?', '23;19;28;15', '23'),
                                                                               (8, 'Quelle nage est considérée comme la plus rapide ?', 'Nage libre;Papillon;Dos;Brasse', 'Nage libre'),
                                                                               (8, 'Quelle est la longueur d''une piscine olympique ?', '50 mètres;25 mètres;100 mètres;75 mètres', '50 mètres'),
                                                                               (8, 'Qui est connu sous le nom de "Baltimore Bullet" ?', 'Michael Phelps;Katie Ledecky;Caeleb Dressel;Mark Spitz', 'Michael Phelps'),
                                                                               (8, 'Combien de nages différentes composent le quatre nages individuel ?', '4;3;2;5', '4'),
                                                                               (8, 'Quel nageur a remporté 7 médailles d''or aux Jeux Olympiques de 1972 ?', 'Mark Spitz;Michael Phelps;Matt Biondi;Ian Thorpe', 'Mark Spitz'),
                                                                               (8, 'Quel est l''ordre des nages dans le quatre nages individuel ?', 'Papillon-Dos-Brasse-Nage libre;Dos-Brasse-Papillon-Nage libre;Nage libre-Dos-Brasse-Papillon;Brasse-Dos-Papillon-Nage libre', 'Papillon-Dos-Brasse-Nage libre'),
                                                                               (8, 'Qui détient le record du monde féminin du 800m nage libre ?', 'Katie Ledecky;Sarah Sjostrom;Ariarne Titmus;Federica Pellegrini', 'Katie Ledecky'),
                                                                               (8, 'Quel pays a historiquement dominé la natation olympique ?', 'USA;Australie;Chine;Russie', 'USA');

        -- ==========================
        -- Insertion des Questions - Quiz Coupe du Monde de Rugby (quiz_id = 9)
        -- ==========================
        INSERT INTO Question (quiz_id, statement, choices, correct_answer) VALUES
                                                                               (9, 'Quel pays a remporté le plus de Coupes du Monde de rugby ?', 'Nouvelle-Zélande;Afrique du Sud;Australie;Angleterre', 'Nouvelle-Zélande'),
                                                                               (9, 'Combien de joueurs composent une équipe de rugby sur le terrain ?', '15;13;11;7', '15'),
                                                                               (9, 'Quel est le nom du trophée de la Coupe du Monde de rugby ?', 'Webb Ellis Cup;Calcutta Cup;Bledisloe Cup;Trophée des Six Nations', 'Webb Ellis Cup'),
                                                                               (9, 'Quel pays a remporté la première Coupe du Monde de rugby en 1987 ?', 'Nouvelle-Zélande;Australie;Afrique du Sud;France', 'Nouvelle-Zélande'),
                                                                               (9, 'Combien de points vaut un essai au rugby ?', '5 points;3 points;7 points;2 points', '5 points'),
                                                                               (9, 'Quelle équipe est connue sous le nom de "All Blacks" ?', 'Nouvelle-Zélande;Afrique du Sud;Australie;Angleterre', 'Nouvelle-Zélande'),
                                                                               (9, 'Comment s''appelle la danse de guerre maorie exécutée par les All Blacks ?', 'Haka;Siva;Kapa;Poi', 'Haka'),
                                                                               (9, 'Qui a remporté la Coupe du Monde de rugby 2019 ?', 'Afrique du Sud;Angleterre;Nouvelle-Zélande;Pays de Galles', 'Afrique du Sud'),
                                                                               (9, 'Combien de points vaut un drop au rugby ?', '3 points;5 points;2 points;1 point', '3 points'),
                                                                               (9, 'Quel pays est connu sous le nom de "Springboks" ?', 'Afrique du Sud;Nouvelle-Zélande;Australie;Argentine', 'Afrique du Sud');

        -- ==========================
        -- Insertion des Questions - Quiz Histoire du Sport (quiz_id = 10)
        -- ==========================
        INSERT INTO Question (quiz_id, statement, choices, correct_answer) VALUES
                                                                               (10, 'Quand ont eu lieu les premiers Jeux Olympiques modernes ?', '1896;1900;1888;1904', '1896'),
                                                                               (10, 'Où ont eu lieu les premiers Jeux Olympiques modernes ?', 'Athènes;Paris;Londres;Rome', 'Athènes'),
                                                                               (10, 'Quel sport a été inventé par James Naismith ?', 'Basketball;Volleyball;Baseball;Football', 'Basketball'),
                                                                               (10, 'En quelle année les femmes ont-elles participé pour la première fois aux Jeux Olympiques ?', '1900;1896;1920;1924', '1900'),
                                                                               (10, 'Que représentent les cinq anneaux olympiques ?', 'Cinq continents;Cinq sports;Cinq nations;Cinq éléments', 'Cinq continents'),
                                                                               (10, 'Quel pays a accueilli les Jeux Olympiques d''été en 2012 ?', 'Royaume-Uni;Chine;Grèce;Brésil', 'Royaume-Uni'),
                                                                               (10, 'Quelle est la devise des Jeux Olympiques ?', 'Plus vite Plus haut Plus fort;Unité Paix Victoire;Excellence Honneur Gloire;Vitesse Puissance Grâce', 'Plus vite Plus haut Plus fort'),
                                                                               (10, 'Quel athlète a allumé la flamme olympique aux Jeux d''Atlanta en 1996 ?', 'Mohamed Ali;Carl Lewis;Jesse Owens;Michael Johnson', 'Mohamed Ali'),
                                                                               (10, 'Dans quel sport effectueriez-vous un "slam dunk" ?', 'Basketball;Volleyball;Tennis;Handball', 'Basketball'),
                                                                               (10, 'Quel pays a accueilli le plus de Jeux Olympiques d''été ?', 'USA;France;Royaume-Uni;Grèce', 'USA');

        -- ==========================
        -- Insertion des Résultats (Joueurs participant aux quiz)
        -- ==========================
        -- Bob joue plusieurs quiz
        INSERT INTO Result (user_id, quiz_id, score) VALUES (2, 1, 8);
        INSERT INTO Result (user_id, quiz_id, score) VALUES (2, 2, 7);
        INSERT INTO Result (user_id, quiz_id, score) VALUES (2, 5, 6);
        INSERT INTO Result (user_id, quiz_id, score) VALUES (2, 10, 9);

        -- Charlie joue Football et Rugby
        INSERT INTO Result (user_id, quiz_id, score) VALUES (3, 1, 6);
        INSERT INTO Result (user_id, quiz_id, score) VALUES (3, 3, 7);
        INSERT INTO Result (user_id, quiz_id, score) VALUES (3, 9, 8);

        -- Diana joue Basketball et Tennis
        INSERT INTO Result (user_id, quiz_id, score) VALUES (4, 2, 9);
        INSERT INTO Result (user_id, quiz_id, score) VALUES (4, 4, 8);
        INSERT INTO Result (user_id, quiz_id, score) VALUES (4, 5, 7);

        -- Ethan joue plusieurs quiz variés
        INSERT INTO Result (user_id, quiz_id, score) VALUES (5, 1, 10);
        INSERT INTO Result (user_id, quiz_id, score) VALUES (5, 2, 5);
        INSERT INTO Result (user_id, quiz_id, score) VALUES (5, 6, 6);
        INSERT INTO Result (user_id, quiz_id, score) VALUES (5, 7, 8);
        INSERT INTO Result (user_id, quiz_id, score) VALUES (5, 8, 7);

    END $$;