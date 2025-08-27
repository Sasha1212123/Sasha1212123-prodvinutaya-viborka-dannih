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
('Kind of Blue', 1959),
('Reanimation', 2020);

-- Треки (основные)
INSERT INTO Track (title, duration, album_id) VALUES
('Come Together', 259, 1),
('Something', 183, 1),
('Rolling in the Deep', 228, 2),
('Someone Like You', 285, 2),
('So What', 545, 3),
('Freddie Freeloader', 589, 3),
('My Song', 240, 2),
('My December', 250, 4),
('Pts.OF.Athrty', 200, 4);

-- Тестовые треки для проверки поиска по слову "my"/"мой"
INSERT INTO Track (title, duration, album_id) VALUES
('my own', 180, 2),
('own my', 200, 2),
('my', 150, 2),
('oh my god', 210, 2),
('myself', 200, 2),
('by myself', 220, 2),
('bemy self', 230, 2),
('myself by', 210, 2),
('by myself by', 240, 2),
('beemy', 180, 2),
('premyne', 190, 2);

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
(3, 3),
(4, 4);

-- Связь: сборники ↔ треки
INSERT INTO compilation_track (compilation_id, track_id) VALUES
(1, 1), (1, 2),
(2, 5), (2, 6),
(3, 3), (3, 4), (3, 7),
(4, 2), (4, 5), (4, 8), (4, 9);