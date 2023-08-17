-- How many artists
SELECT count(*) AS Artists
FROM artists;
-- How many genres
SELECT count(*) AS Genres
FROM genres;
-- How many Playlists
SELECT count(*) AS Playlists
FROM playlists;
-- Playlists that Start with 'M'
SELECT *
FROM playlists
WHERE Name LIKE 'M%';
-- Find all the albums for a given artist
SELECT *
FROM artists
WHERE Name = "Lost";
SELECT *
FROM albums
WHERE ArtistId = 149;
-- OR 
SELECT *
FROM artists
    join albums on artists.ArtistId = albums.ArtistId
WHERE Name = "U2";
-- 
-- SELECT artists.Name,
--     albums.Title
-- FROM artists
--     JOIN albums ON artists.ArtistId = albums.ArtistId;
-- ORDER BY artists.ArtistId;
-- 
-- Find all the songs for a given Genre
SELECT *
FROM genres
    JOIN tracks on genres.GenreId = tracks.GenreId
where genres.Name = "Blues";
SELECT *
FROM genres
    join tracks on genres.GenreId = tracks.GenreId;
-- Find all the songs in a playlist by playlist Name
SELECT *
from playlists
    JOIN playlist_track on playlists.PlaylistId = playlist_track.PlaylistId
    JOIN tracks ON tracks.TrackId = playlist_track.TrackId
WHERE playlists.Name = "Music";
-- Find all artists for a given genre
SELECT DISTINCT artists.Name 
FROM genres
    join tracks on genres.GenreId = tracks.GenreId
    JOIN albums on tracks.TrackId = albums.ArtistId
    JOIN artists on albums.ArtistId = artists.ArtistId
WHERE genres.Name = "Classical";
-- Find the Playlist with the most / least songs
SELECT playlists.Name, count(*) AS Song_Count
from playlists
    join playlist_track on playlist_track.PlaylistId = playlists.PlaylistId
    join tracks on tracks.TrackId = playlist_track.TrackId
    join albums on albums.AlbumId = tracks.AlbumId
    join artists on artists.ArtistId = albums.ArtistId
    GROUP BY playlists.Name
    ORDER BY Song_Count DESC LIMIT 1;

-- Find the total for a given invoice (will need a sum)

SELECT * FROM invoices
WHERE 
