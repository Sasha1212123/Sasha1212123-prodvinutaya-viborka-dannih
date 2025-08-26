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