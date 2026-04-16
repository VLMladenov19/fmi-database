USE moviesNoConstraints

BEGIN TRANSACTION Exercise1

INSERT INTO MOVIESTAR([NAME], [GENDER], [BIRTHDATE])
VALUES ('Nicole Kidman', 'F', '1967-06-20')

ROLLBACK


BEGIN TRANSACTION Exercise2

DELETE FROM MOVIEEXEC
WHERE NETWORTH < 30000000

ROLLBACK


BEGIN TRANSACTION Exercise3

DELETE FROM MOVIESTAR
WHERE [ADDRESS] IS NULL

ROLLBACK


USE pcNoConstraints

BEGIN TRANSACTION Exercise4

SELECT * FROM pc
SELECT * FROM [product]

INSERT INTO pc([code], [model], [speed], [ram], [hd], [cd], [price])
	VALUES ((SELECT MAX(code) + 1 FROM pc), '1100', 2400, 2048, 500, '52x', 299)

INSERT INTO [product]([maker], [model], [type])
	VALUES ('C', '1100', 'PC')
	
SELECT * FROM pc
SELECT * FROM [product]

ROLLBACK


BEGIN TRANSACTION Exercise5

DELETE FROM pc
WHERE [model] = '1100'

ROLLBACK


BEGIN TRANSACTION Exercise6

SELECT * FROM [laptop]

DELETE FROM laptop
WHERE [model] IN (
	SELECT [model] FROM [product]
	WHERE [maker] NOT IN (
			SELECT [maker] 
			FROM [product]
			WHERE [type] = 'Printer'
		) 
		AND [type] = 'Laptop'
)

SELECT * FROM [laptop]
SELECT * FROM [product]

ROLLBACK


BEGIN TRANSACTION Exercise7

SELECT * FROM [product]

UPDATE [product]
	SET [maker] = 'A'
	WHERE [maker] = 'B'
	
SELECT * FROM [product]

ROLLBACK


BEGIN TRANSACTION Exercise8

SELECT * FROM [pc]

UPDATE pc
	SET [price] /= 2, [hd] += 20

SELECT * FROM [pc]

ROLLBACK


BEGIN TRANSACTION Exercise9

SELECT * FROM [product]
SELECT * FROM [laptop]

UPDATE [laptop]
	SET [screen] += 1
	WHERE [model] IN (
		SELECT [model]
		FROM [product]
		WHERE [maker] = 'B' AND [type] = 'Laptop'
	)

SELECT * FROM [laptop]

ROLLBACK


USE shipsNoConstraints

BEGIN TRANSACTION Exercise10

SELECT * FROM [CLASSES]
SELECT * FROM [SHIPS]

INSERT INTO [CLASSES] ([CLASS], [TYPE], [COUNTRY], [NUMGUNS], [BORE], [DISPLACEMENT])
	VALUES ('Nelson', 'bb', 'Gt. Britain', 9, 16, 34000)

INSERT INTO [SHIPS] ([NAME], [CLASS], [LAUNCHED])
	VALUES ('Nelson', 'Nelson', 1927),
		('Rodney', 'Nelson', 1927)

SELECT * FROM [CLASSES]
SELECT * FROM [SHIPS]

ROLLBACK


BEGIN TRANSACTION Exercise11

SELECT * FROM [OUTCOMES]
SELECT * FROM [SHIPS]

DELETE FROM [SHIPS]
WHERE [NAME] IN (
		SELECT [SHIP]
		FROM [OUTCOMES]
		WHERE [RESULT] = 'sunk'
	)

SELECT * FROM [SHIPS]

ROLLBACK


BEGIN TRANSACTION Exercise12

SELECT * FROM [CLASSES]

UPDATE [CLASSES]
	SET [BORE] *= 2.5, [DISPLACEMENT] /= 1.1
	
SELECT * FROM [CLASSES]

ROLLBACK
