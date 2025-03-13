CREATE TABLE ARTISTS(
	
	ARTIST_ID INT,
	ARTIST_NAME VARCHAR(20)

);
SELECT * FROM ARTISTS;

CREATE TABLE ALBUMS(
	ALBUM_ID INT,
	ALBUM_TITLE VARCHAR(30),
	ARTIST_ID INT,
	RELEASE_YEAR INT
);
SELECT*FROM ALBUMS

CREATE TABLE SONGS(
	SONG_ID INT,
	SONG_TITLE VARCHAR(40),
	DURATION DECIMAL(3,2),
	GENRE VARCHAR(40),
	ALBUM_ID INT
);
SELECT* FROM SONGS

--Part – A 
--1. Retrieve a unique genre of songs.
SELECT DISTINCT GENRE FROM SONGS;

--2. Find top 2 albums released before 2010.
SELECT TOP 2 ALBUM_TITLE FROM ALBUMS 
WHERE RELEASE_YEAR<2010;

--3. Insert Data into the Songs Table. (1245, ‘Zaroor’, 2.55, ‘Feel good’, 1005) 
--INSERT INTO (1245,'ZAROOR',2.55,'FEEL GOOD',1005);

--4. Change the Genre of the song ‘Zaroor’ to ‘Happy’
UPDATE SONGS 
SET GENRE = 'HAPPY'
WHERE SONG_TITLE = 'ZAROOR';

SELECT* FROM SONGS
--5. Delete an Artist ‘Ed Sheeran’
DELETE FROM ARTISTS
WHERE ARTIST_NAME = 'Ed Sheeran'

--6. Add a New Column for Rating in Songs Table. [Ratings decimal(3,2)] 
ALTER TABLE SONGS
ADD RATINGS DECIMAL(3,2);
SELECT*FROM SONGS

--7. Retrieve songs whose title starts with 'S'.
SELECT SONG_TITLE 
FROM SONGS
WHERE SONG_TITLE LIKE 'S%'

--8. Retrieve all songs whose title contains 'Everybody'.
SELECT SONG_TITLE
FROM SONGS
WHERE SONG_TITLE LIKE '%EVERYBODY%'

--9. Display Artist Name in Uppercase. 
SELECT UPPER(ARTIST_NAME) 
FROM ARTISTS

--10. Find the Square Root of the Duration of a Song ‘Good Luck’ 
SELECT SQRT(DURATION) 
FROM SONGS
WHERE SONG_TITLE = 'GOOD LUCK'

--11. Find Current Date. 
SELECT GETDATE();

--12. Find the number of albums for each artist.
SELECT ARTIST_ID,COUNT(ALBUM_ID) AS NUM_OF_ALB_FOR_EACH
FROM ALBUMS
GROUP BY ARTIST_ID

--13. Retrieve the Album_id which has more than 5 songs in it.
SELECT ALBUM_ID
FROM SONGS
GROUP BY ALBUM_ID
HAVING COUNT(ALBUM_ID)>2

--14. Retrieve all songs from the album 'Album1'. (using Subquery) 
SELECT SONG_TITLE
FROM SONGS
WHERE ALBUM_ID IN
		(
		SELECT ALBUM_ID 
		FROM ALBUMS
		WHERE ALBUM_TITLE = 'ALBUM1'
		);

--15. Retrieve all albums name from the artist ‘Aparshakti Khurana’ (using Subquery)
SELECT ALBUM_TITLE
FROM ALBUMS 
WHERE ARTIST_ID = (SELECT ARTIST_ID
					FROM ARTISTS
					WHERE ARTIST_NAME = 'Aparshakti Khurana')

--16. Retrieve all the song titles with its album title.
SELECT SONG_TITLE,ALBUM_TITLE
FROM SONGS S
JOIN
ALBUMS A
ON A.ALBUM_ID = S.ALBUM_ID;

--17. Find all the songs which are released in 2020.
SELECT SONG_TITLE
FROM SONGS S
JOIN
ALBUMS A
ON A.ALBUM_ID = S.ALBUM_ID
WHERE A.RELEASE_YEAR = 2020;

--18. Create a view called ‘Fav_Songs’ from the songs table having songs with song_id 101-105.  
CREATE VIEW FAV_SONGS AS
SELECT *
FROM SONGS
WHERE SONG_ID = 101 OR SONG_ID = 105;
SELECT*FROM FAV_SONGS

--19. Update a song name to ‘Jannat’ of song having song_id 101 in Fav_Songs view. 
UPDATE FAV_SONGS
SET SONG_TITLE = 'JANNAT'
WHERE SONG_ID = 101

--20. Find all artists who have released an album in 2020.  
SELECT ARTIST_NAME
FROM ARTISTS A
JOIN
ALBUMS B
ON A.ARTIST_ID = B.ARTIST_ID
WHERE B.RELEASE_YEAR = 2020

--21. Retrieve all songs by Shreya Ghoshal and order them by duration. 
SELECT S.SONG_TITLE
FROM ARTISTS A
JOIN ALBUMS B
ON A.ARTIST_ID = B.ARTIST_ID
JOIN SONGS S
ON S.ALBUM_ID = B.ALBUM_ID
WHERE A.ARTIST_NAME = 'Shreya Ghoshal'
ORDER BY S.DURATION

--Part – B 
--22. Retrieve all song titles by artists who have more than one album.
SELECT S.SONG_TITLE
FROM SONGS S
JOIN ALBUMS A
ON S.ALBUM_ID = A.ALBUM_ID
WHERE A.ARTIST_ID IN(SELECT ARTIST_ID 
						FROM ALBUMS 
						GROUP BY ARTIST_ID
						HAVING COUNT(ARTIST_ID)>1);
	

--23. Retrieve all albums along with the total number of songs. 
SELECT A.ALBUM_TITLE,COUNT(S.ALBUM_ID) 
FROM SONGS S
JOIN
ALBUMS A
ON A.ALBUM_ID = S.ALBUM_ID
WHERE S.ALBUM_ID IN (SELECT ALBUM_ID FROM SONGS GROUP BY ALBUM_ID)
GROUP BY A.ALBUM_TITLE


--24. Retrieve all songs and release year and sort them by release year.  
SELECT S.SONG_TITLE,A.RELEASE_YEAR 
FROM SONGS S
JOIN ALBUMS A
ON A.ALBUM_ID = S.ALBUM_ID
ORDER BY A.RELEASE_YEAR

--25. Retrieve the total number of songs for each genre, showing genres that have more than 2 songs. 
SELECT COUNT(SONG_ID)
FROM SONGS
GROUP BY GENRE
HAVING COUNT(GENRE)>2

--26. List all artists who have albums that contain more than 3 songs. 
(SELECT ARTIST_NAME 
	FROM ARTISTS
	WHERE ARTIST_ID IN(SELECT ARTIST_ID 
	FROM ALBUMS WHERE ALBUM_ID IN(
	SELECT ALBUM_ID
	FROM SONGS
	GROUP BY ALBUM_ID
	HAVING COUNT(ALBUM_ID)>3)
	))


--Part – C 
--27. Retrieve albums that have been released in the same year as 'Album4' 
SELECT ALBUM_TITLE
FROM ALBUMS
WHERE RELEASE_YEAR = '2020' AND ALBUM_TITLE!='ALBUM4'

--28. Find the longest song in each genre 
SELECT SONG_TITLE,DURATION,GENRE
FROM SONGS
WHERE DURATION IN (SELECT MAX(DURATION)
					FROM SONGS
					GROUP BY GENRE);




--29. Retrieve the titles of songs released in albums that contain the word 'Album' in the title. 
		SELECT S.SONG_TITLE
		FROM SONGS S
		JOIN ALBUMS A
		ON S.ALBUM_ID = A.ALBUM_ID
		WHERE A.ALBUM_TITLE LIKE '%ALBUM%'

--30. Retrieve the total duration of songs by each artist where total duration exceeds 15 minutes.
		SELECT A.ARTIST_ID, SUM(S.DURATION) AS TOTAL_DURATION
		FROM SONGS S
		JOIN ALBUMS A
		ON S.ALBUM_ID = A.ALBUM_ID
		GROUP BY A.ARTIST_ID
		HAVING SUM(S.DURATION) > 15;

		