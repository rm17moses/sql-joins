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
SELECT playlists.Name,
    count(*) AS SongCount
from playlists
    join playlist_track on playlist_track.PlaylistId = playlists.PlaylistId
GROUP BY playlists.Name
ORDER BY SongCount DESC
LIMIT 1;

SELECT playlists.Name,
    count(*) AS SongCount
from playlists
    join playlist_track on playlist_track.PlaylistId = playlists.PlaylistId
GROUP BY playlists.Name
ORDER BY count(*) ASC
LIMIT 1;
-- Find the total for a given invoice (will need a sum)
SELECT invoices.InvoiceId AS Invoice_ID,
    'R' || invoices.Total AS Total
FROM invoices
WHERE invoices.InvoiceId = 1;

-- Find all the playlists containing a given genre

SELECT DISTINCT playlists.Name AS Playlists
FROM playlists
    JOIN playlist_track on playlists.PlaylistId = playlist_track.PlaylistId
JOIN tracks ON playlist_track.TrackId = tracks.TrackId
JOIN genres ON tracks.GenreId = genres.GenreId
WHERE genres.Name = "Rock";


--  Find the biggest/smallest invoice amounts

SELECT InvoiceId, Min(Total) FROM invoices;
SELECT InvoiceId, Max(Total) FROM invoices;

-- Find the artist with the most/least songs

SELECT artists.Name AS Artists, count(*) AS Track_Count
FROM artists
JOIN albums on albums.ArtistId = artists.ArtistId
JOIN tracks on tracks.AlbumId = albums.AlbumId
GROUP BY artists.Name
ORDER BY Track_Count DESC LIMIT 1;

SELECT artists.Name AS Artists, count(*) AS Track_Count
FROM artists
JOIN albums on albums.ArtistId = artists.ArtistId
JOIN tracks on tracks.AlbumId = albums.AlbumId
GROUP BY artists.Name
ORDER BY Track_Count ASC LIMIT 1;