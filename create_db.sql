-- СОЗДАНИЕ ТАБЛИЦ
CREATE TABLE table_languages
(
    id       INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    language TEXT    NOT NULL
);

CREATE TABLE table_words
(
    id          INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    word        TEXT    NOT NULL,
    language_id INTEGER NOT NULL,
    FOREIGN KEY (language_id) REFERENCES table_languages (id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE table_translates
(
    id          INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    translate   TEXT    NOT NULL,
    language_id INTEGER NOT NULL,
    word_id     INTEGER NOT NULL,
    FOREIGN KEY (language_id) REFERENCES table_languages (id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    FOREIGN KEY (word_id) REFERENCES table_words (id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);


-- ЗАПОЛНЕНИЕ ТЕСТОВЫМИ ДАННЫМИ
INSERT INTO table_languages(language)
VALUES ('en'),
       ('ru');

INSERT INTO table_words(word, language_id)
VALUES ('world', (SELECT id FROM table_languages WHERE language = 'en'));

INSERT INTO table_translates(translate, language_id, word_id)
VALUES ('мир',
        (SELECT id FROM table_languages WHERE language = 'ru'),
        (SELECT id FROM table_words WHERE word = 'world'));

-- ЗАПРОС ДАННЫХ
SELECT word
FROM table_words
WHERE language_id = (SELECT id FROM table_languages WHERE language = 'en');

SELECT word
FROM table_words
    JOIN table_languages
        ON table_words.language_id = table_languages.id
WHERE language = 'en';

SELECT word, translate
FROM table_translates
    JOIN table_languages
        ON table_translates.language_id = table_languages.id
    JOIN table_words
        ON table_translates.word_id = table_words.id
WHERE table_words.word = 'world' AND
      table_languages.language = 'ru';