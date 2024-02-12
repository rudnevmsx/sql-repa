-- Создание таблицы для тестов
CREATE TABLE Tests (
TestID INT PRIMARY KEY,
TestName VARCHAR(255) NOT NULL
);

-- Создание таблицы для вопросов
CREATE TABLE Questions (
QuestionID INT PRIMARY KEY,
TestID INT,
QuestionText TEXT NOT NULL,
FOREIGN KEY (TestID) REFERENCES Tests(TestID)
);

-- Создание таблицы для вариантов ответов
CREATE TABLE AnswerOptions (
OptionID INT PRIMARY KEY,
QuestionID INT,
OptionText TEXT NOT NULL,
IsCorrect BOOLEAN NOT NULL,
FOREIGN KEY (QuestionID) REFERENCES Questions(QuestionID)
);

-- Создание таблицы для студентов
CREATE TABLE Students (
StudentID INT PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL
);

-- Создание таблицы для прохождения тестов
CREATE TABLE TestResults (
ResultID INT PRIMARY KEY,
TestID INT,
StudentID INT,
TestDate DATE NOT NULL,
FOREIGN KEY (TestID) REFERENCES Tests(TestID),
FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Создание таблицы для ответов студентов на вопросы
CREATE TABLE StudentAnswers (
AnswerID INT PRIMARY KEY,
ResultID INT,
QuestionID INT,
OptionID INT,
FOREIGN KEY (ResultID) REFERENCES TestResults(ResultID),
FOREIGN KEY (QuestionID) REFERENCES Questions(QuestionID),
FOREIGN KEY (OptionID) REFERENCES AnswerOptions(OptionID)
);