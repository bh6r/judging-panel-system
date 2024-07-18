-- Create tables
CREATE TABLE IF NOT EXISTS Houses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Activities (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Criteria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    activity_id INT,
    name VARCHAR(100) NOT NULL,
    max_score INT NOT NULL,
    FOREIGN KEY (activity_id) REFERENCES Activities(id)
);

CREATE TABLE IF NOT EXISTS Judges (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Scores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    activity_id INT,
    house_id INT,
    judge_id INT,
    criteria_id INT,
    score INT NOT NULL,
    FOREIGN KEY (activity_id) REFERENCES Activities(id),
    FOREIGN KEY (house_id) REFERENCES Houses(id),
    FOREIGN KEY (judge_id) REFERENCES Judges(id),
    FOREIGN KEY (criteria_id) REFERENCES Criteria(id)
);

-- Insert sample data
INSERT INTO Houses (name) VALUES ('Red'), ('Blue'), ('Green'), ('Yellow'), ('Purple');
INSERT INTO Activities (name) VALUES ('Singing'), ('Dancing'), ('Debate');
INSERT INTO Criteria (activity_id, name, max_score) VALUES 
(1, 'Pitch', 10),
(1, 'Rhythm', 10),
(1, 'Overall Performance', 20),
(2, 'Choreography', 15),
(2, 'Synchronization', 15),
(2, 'Creativity', 10),
(3, 'Content', 20),
(3, 'Delivery', 15),
(3, 'Rebuttals', 15);

-- You may want to insert a sample judge here, but in practice, judges should register through the application
-- INSERT INTO Judges (username, password, name) VALUES ('judge1', 'hashedpassword', 'Judge One');