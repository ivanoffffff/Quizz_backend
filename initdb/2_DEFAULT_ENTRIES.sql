Do $$

    BEGIN

    INSERT INTO "user" (name, email, role) VALUES
                                                   ('Alice', 'alice@example.com', 'admin'),
                                                   ('Bob', 'bob@example.com', 'player'),
                                                   ('Charlie', 'charlie@example.com', 'player'),
                                                   ('Diana', 'diana@example.com', 'player'),
                                                   ('Ethan', 'ethan@example.com', 'player');

    INSERT INTO Quiz (title, description) VALUES
                                                  ('Football Quiz', 'Test your general knowledge about football'),
                                                  ('Basketball Quiz', 'Test your general knowledge about basketball');

    INSERT INTO Question (quiz_id, statement, choices, correct_answer) VALUES
                                                                               (1, 'Which country won the 2018 FIFA World Cup?', 'France;Brazil;Germany;Argentina', 'France'),
                                                                               (1, 'Who has won the most Ballon d''Or titles?', 'Cristiano Ronaldo;Lionel Messi;Michel Platini;Ronaldinho', 'Lionel Messi'),
                                                                               (1, 'Which club has the most UEFA Champions League titles?', 'Real Madrid;AC Milan;Liverpool;Barcelona', 'Real Madrid'),
                                                                               (1, 'Where was the 2006 FIFA World Cup held?', 'Germany;Italy;South Africa;France', 'Germany'),
                                                                               (1, 'Which player is nicknamed "El Fenomeno"?', 'Ronaldo Nazario;Ronaldinho;Romario;Kaka', 'Ronaldo Nazario'),
                                                                               (1, 'Who scored the "Hand of God" goal?', 'Maradona;Pele;Zidane;Platini', 'Maradona'),
                                                                               (1, 'Which country hosted the first FIFA World Cup in 1930?', 'Brazil;Uruguay;Argentina;Italy', 'Uruguay'),
                                                                               (1, 'Which African country reached the World Cup quarterfinal in 2010?', 'Ghana;Nigeria;Cameroon;Senegal', 'Ghana'),
                                                                               (1, 'Who is the all-time top scorer of the UEFA Champions League?', 'Cristiano Ronaldo;Messi;Lewandowski;Raul', 'Cristiano Ronaldo'),
                                                                               (1, 'Which team won the Premier League in 2021?', 'Manchester City;Chelsea;Liverpool;Manchester United', 'Manchester City');

        -- ==========================
-- Insert Questions - Basketball Quiz (quiz_id = 2)
-- ==========================
        INSERT INTO Question (quiz_id, statement, choices, correct_answer) VALUES
                                                                               (2, 'Which team won the 2020 NBA Championship?', 'Lakers;Heat;Warriors;Bucks', 'Lakers'),
                                                                               (2, 'Who is known as "His Airness"?', 'Kobe Bryant;Michael Jordan;LeBron James;Magic Johnson', 'Michael Jordan'),
                                                                               (2, 'Which country won the first Olympic basketball tournament in 1936?', 'USA;Spain;Argentina;Italy', 'USA'),
                                                                               (2, 'Which player is called "The King"?', 'Kareem Abdul-Jabbar;Shaquille O''Neal;LeBron James;Kobe Bryant', 'LeBron James'),
                                                                               (2, 'Which NBA player has the most championship rings?', 'Bill Russell;Michael Jordan;Magic Johnson;Kareem Abdul-Jabbar', 'Bill Russell'),
                                                                               (2, 'Which team drafted Kobe Bryant in 1996?', 'Lakers;Hornets;Celtics;Bulls', 'Hornets'),
                                                                               (2, 'Where is the NBA team Toronto Raptors based?', 'New York;Toronto;Vancouver;Montreal', 'Toronto'),
                                                                               (2, 'Who holds the record for most points in a single NBA game?', 'Wilt Chamberlain;Michael Jordan;LeBron James;Kobe Bryant', 'Wilt Chamberlain'),
                                                                               (2, 'Which NBA team is nicknamed "The Splash Brothers"?', 'Lakers;Warriors;Bulls;Celtics', 'Warriors'),
                                                                               (2, 'Who won the NBA MVP award in 2021?', 'Giannis Antetokounmpo;Nikola Jokic;Steph Curry;Joel Embiid', 'Nikola Jokic');

        -- ==========================
-- Insert Results (Players playing quizzes)
-- ==========================
-- Bob plays both quizzes
        INSERT INTO Result (user_id, quiz_id, score) VALUES (2, 1, 8);
        INSERT INTO Result (user_id, quiz_id, score) VALUES (2, 2, 7);

-- Charlie plays Football Quiz only
        INSERT INTO Result (user_id, quiz_id, score) VALUES (3, 1, 6);

-- Diana plays Basketball Quiz only
        INSERT INTO Result (user_id, quiz_id, score) VALUES (4, 2, 9);

-- Ethan plays both quizzes
        INSERT INTO Result (user_id, quiz_id, score) VALUES (5, 1, 10);
        INSERT INTO Result (user_id, quiz_id, score) VALUES (5, 2, 5);

    END $$;

