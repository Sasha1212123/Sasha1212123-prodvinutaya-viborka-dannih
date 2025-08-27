-- Задание 2

-- 1. Название и продолжительность самого длительного трека
SELECT title, duration
FROM Track
ORDER BY duration DESC
LIMIT 1;

-- 2. Название треков, продолжительность которых не менее 3,5 минут (210 секунд)
SELECT title
FROM Track
WHERE duration >= 210;

-- 3. Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT title
FROM Compilation
WHERE release_year BETWEEN 2018 AND 2020;

-- 4. Исполнители, чьё имя состоит из одного слова
SELECT name
FROM Artist
WHERE name NOT LIKE '% %';

-- 5. Название треков, которые содержат слово "мой" или "my" (только отдельное слово)
SELECT title
FROM Track
WHERE title ILIKE 'my'
   OR title ILIKE 'мой'
   OR title ILIKE 'my %'
   OR title ILIKE 'мой %'
   OR title ILIKE '% my'
   OR title ILIKE '% мой'
   OR title ILIKE '% my %'
   OR title ILIKE '% мой %';


-- Задание 3

-- 1. Количество исполнителей в каждом жанре
SELECT g.name AS genre, COUNT(ag.artist_id) AS artist_count
FROM Genre g
JOIN artist_genre ag ON g.id = ag.genre_id
GROUP BY g.name;

-- 2. Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(t.id) AS track_count
FROM Track t
JOIN Album a ON t.album_id = a.id
WHERE a.release_year BETWEEN 2019 AND 2020;

-- 3. Средняя продолжительность треков по каждому альбому
SELECT a.title AS album, AVG(t.duration) AS avg_duration
FROM Album a
JOIN Track t ON a.id = t.album_id
GROUP BY a.title;

-- 4. Все исполнители, которые не выпустили альбомы в 2020 году
SELECT ar.name
FROM Artist ar
WHERE ar.id NOT IN (
    SELECT aa.artist_id
    FROM album_artist aa
    JOIN Album a ON aa.album_id = a.id
    WHERE a.release_year = 2020
);

-- 5. Названия сборников, в которых присутствует конкретный исполнитель (например, 'Adele')
SELECT DISTINCT c.title AS compilation
FROM Compilation c
JOIN compilation_track ct ON c.id = ct.compilation_id
JOIN Track t ON ct.track_id = t.id
JOIN Album a ON t.album_id = a.id
JOIN album_artist aa ON a.id = aa.album_id
JOIN Artist ar ON aa.artist_id = ar.id
WHERE ar.name = 'Adele';