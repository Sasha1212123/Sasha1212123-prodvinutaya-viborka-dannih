-- Таблица жанров
CREATE TABLE Genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Таблица исполнителей
CREATE TABLE Artist (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL
);

-- Таблица альбомов
CREATE TABLE Album (
    id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    release_year INT
);

-- Таблица треков
CREATE TABLE Track (
    id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    duration INT, -- длительность в секундах
    album_id INT NOT NULL REFERENCES Album(id) ON DELETE CASCADE
);

-- Таблица сборников
CREATE TABLE Compilation (
    id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    release_year INT
);

-- Связь многие-ко-многим: Исполнители ↔ Жанры
CREATE TABLE artist_genre (
    artist_id INT NOT NULL REFERENCES Artist(id) ON DELETE CASCADE,
    genre_id INT NOT NULL REFERENCES Genre(id) ON DELETE CASCADE,
    PRIMARY KEY (artist_id, genre_id)
);

-- Связь многие-ко-многим: Исполнители ↔ Альбомы
CREATE TABLE album_artist (
    album_id INT NOT NULL REFERENCES Album(id) ON DELETE CASCADE,
    artist_id INT NOT NULL REFERENCES Artist(id) ON DELETE CASCADE,
    PRIMARY KEY (album_id, artist_id)
);

-- Связь многие-ко-многим: Сборники ↔ Треки
CREATE TABLE compilation_track (
    compilation_id INT NOT NULL REFERENCES Compilation(id) ON DELETE CASCADE,
    track_id INT NOT NULL REFERENCES Track(id) ON DELETE CASCADE,
    PRIMARY KEY (compilation_id, track_id)
);

-- Жанры
INSERT INTO Genre (name) VALUES
('Rock'),
('Pop'),
('Jazz');

-- Исполнители
INSERT INTO Artist (name) VALUES
('The Beatles'),
('Adele'),
('Miles Davis'),
('Linkin Park');

-- Альбомы
INSERT INTO Album (title, release_year) VALUES
('Abbey Road', 1969),
('21', 2011),
('Kind of Blue', 1959);

-- Треки
INSERT INTO Track (title, duration, album_id) VALUES
('Come Together', 259, 1),
('Something', 183, 1),
('Rolling in the Deep', 228, 2),
('Someone Like You', 285, 2),
('So What', 545, 3),
('Freddie Freeloader', 589, 3);

-- Сборники
INSERT INTO Compilation (title, release_year) VALUES
('Best of Rock', 2020),
('Jazz Classics', 2019),
('Pop Hits', 2021),
('Mixed Vibes', 2022);

-- Связь: исполнители ↔ жанры
INSERT INTO artist_genre (artist_id, genre_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1);

-- Связь: исполнители ↔ альбомы
INSERT INTO album_artist (album_id, artist_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Связь: сборники ↔ треки
INSERT INTO compilation_track (compilation_id, track_id) VALUES
(1, 1), (1, 2),
(2, 5), (2, 6),
(3, 3), (3, 4),
(4, 2), (4, 5);