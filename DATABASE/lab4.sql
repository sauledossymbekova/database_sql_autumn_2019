CREATE DATABASE lab4;
CREATE TABLE city
(
    ID INT,
    name varchar(45) not null,
    CountryCode CHAR (3) NOT NULL DEFAULT '',
    District CHAR (20) NOT NULL DEFAULT '',
    Population INT,
    CONSTRAINT work_pkey PRIMARY KEY(ID)
);
INSERT INTO city VALUES (1,'Kabul','AFG','Kabol',1780000);
INSERT INTO city VALUES (2,'Qandahar','AFG','Qandahar',237500);
INSERT INTO city VALUES (3,'Herat','AFG','Herat',186800);
INSERT INTO city VALUES (4,'Mazar-e-Sharif','AFG','Balkh',127800);
INSERT INTO city VALUES (5,'Amsterdam','NLD','Noord-Holland',731200);
INSERT INTO city VALUES (6,'Rotterdam','NLD','Zuid-Holland',593321);
INSERT INTO city VALUES (7,'Haag','NLD','Zuid-Holland',440900);
INSERT INTO city VALUES (8,'Utrecht','NLD','Utrecht',234323);
INSERT INTO city VALUES (9,'Eindhoven','NLD','Noord-Brabant',201843);
INSERT INTO city VALUES (10,'Tilburg','NLD','Noord-Brabant',193238);
INSERT INTO city VALUES (11,'Groningen','NLD','Groningen',172701);
INSERT INTO city VALUES (12,'Breda','NLD','Noord-Brabant',160398);
INSERT INTO city VALUES (13,'Apeldoorn','NLD','Gelderland',153491);
INSERT INTO city VALUES (14,'Nijmegen','NLD','Gelderland',152463);
INSERT INTO city VALUES (15,'Enschede','NLD','Overijssel',149544);
INSERT INTO city VALUES (16,'Haarlem','NLD','Noord-Holland',148772);
INSERT INTO city VALUES (17,'Almere','NLD','Flevoland',142465);
INSERT INTO city VALUES (18,'Arnhem','NLD','Gelderland',138020);
INSERT INTO city VALUES (19,'Zaanstad','NLD','Noord-Holland',135621);
INSERT INTO city VALUES (20,'�s-Hertogenbosch','NLD','Noord-Brabant',129170);
INSERT INTO city VALUES (21,'Amersfoort','NLD','Utrecht',126270);
INSERT INTO city VALUES (22,'Maastricht','NLD','Limburg',122087);
INSERT INTO city VALUES (23,'Dordrecht','NLD','Zuid-Holland',119811);
INSERT INTO city VALUES (24,'Leiden','NLD','Zuid-Holland',117196);
INSERT INTO city VALUES (25,'Haarlemmermeer','NLD','Noord-Holland',110722);
INSERT INTO city VALUES (26,'Zoetermeer','NLD','Zuid-Holland',110214);
INSERT INTO city VALUES (27,'Emmen','NLD','Drenthe',105853);
INSERT INTO city VALUES (28,'Zwolle','NLD','Overijssel',105819);
INSERT INTO city VALUES (29,'Ede','NLD','Gelderland',101574);
INSERT INTO city VALUES (30,'Delft','NLD','Zuid-Holland',95268);
INSERT INTO city VALUES (31,'Heerlen','NLD','Limburg',95052);
INSERT INTO city VALUES (32,'Alkmaar','NLD','Noord-Holland',92713);
INSERT INTO city VALUES (33,'Willemstad','ANT','Cura�ao',2345);
INSERT INTO city VALUES (34,'Tirana','ALB','Tirana',270000);
INSERT INTO city VALUES (35,'Alger','DZA','Alger',2168000);
INSERT INTO city VALUES (36,'Oran','DZA','Oran',609823);
INSERT INTO city VALUES (37,'Constantine','DZA','Constantine',443727);
INSERT INTO city VALUES (38,'Annaba','DZA','Annaba',222518);
INSERT INTO city VALUES (39,'Batna','DZA','Batna',183377);
INSERT INTO city VALUES (40,'S�tif','DZA','S�tif',179055);
INSERT INTO city VALUES (41,'Sidi Bel Abb�s','DZA','Sidi Bel Abb�s',153106);
INSERT INTO city VALUES (42,'Skikda','DZA','Skikda',128747);
INSERT INTO city VALUES (43,'Biskra','DZA','Biskra',128281);
INSERT INTO city VALUES (44,'Blida (el-Boulaida)','DZA','Blida',127284);
INSERT INTO city VALUES (45,'B�ja�a','DZA','B�ja�a',117162);
INSERT INTO city VALUES (46,'Mostaganem','DZA','Mostaganem',115212);
INSERT INTO city VALUES (47,'T�bessa','DZA','T�bessa',112007);
INSERT INTO city VALUES (48,'Tlemcen (Tilimsen)','DZA','Tlemcen',110242);
INSERT INTO city VALUES (49,'B�char','DZA','B�char',107311);
INSERT INTO city VALUES (50,'Tiaret','DZA','Tiaret',100118);
CREATE TABLE country(
  Code CHAR(3) NOT NULL DEFAULT '',
  Name CHAR(52) NOT NULL DEFAULT '',
  Continent VARCHAR(20) NOT NULL DEFAULT 'Asia',
  Region CHAR(26) NOT NULL DEFAULT '',
  SurfaceArea FLOAT NOT NULL DEFAULT '0.00',
  IndepYear SMALLINT DEFAULT NULL,
  Population INT NOT NULL DEFAULT '0',
  LifeExpectancy FLOAT DEFAULT NULL,
  GNP FLOAT DEFAULT NULL,
  GNPOld FLOAT DEFAULT NULL,
  LocalName CHAR(45) NOT NULL DEFAULT '',
  GovernmentForm CHAR(45) NOT NULL DEFAULT '',
  HeadOfState CHAR(60) DEFAULT NULL,
  Capital INT DEFAULT NULL,
  Code2 CHAR(2) NOT NULL DEFAULT '',
  CONSTRAINT pr_key PRIMARY KEY (Code)
);
INSERT INTO country VALUES ('ABW','Aruba','North America','Caribbean',193.00,NULL,103000,78.4,828.00,793.00,'Aruba','Nonmetropolitan Territory of The Netherlands','Beatrix',129,'AW');
INSERT INTO country VALUES ('AFG','Afghanistan','Asia','Southern and Central Asia',652090.00,1919,22720000,45.9,5976.00,NULL,'Afganistan/Afqanestan','Islamic Emirate','Mohammad Omar',1,'AF');
INSERT INTO country VALUES ('AGO','Angola','Africa','Central Africa',1246700.00,1975,12878000,38.3,6648.00,7984.00,'Angola','Republic','Jos� Eduardo dos Santos',56,'AO');
INSERT INTO country VALUES ('AIA','Anguilla','North America','Caribbean',96.00,NULL,8000,76.1,63.20,NULL,'Anguilla','Dependent Territory of the UK','Elisabeth II',62,'AI');
INSERT INTO country VALUES ('ALB','Albania','Europe','Southern Europe',28748.00,1912,3401200,71.6,3205.00,2500.00,'Shqip�ria','Republic','Rexhep Mejdani',34,'AL');
INSERT INTO country VALUES ('AND','Andorra','Europe','Southern Europe',468.00,1278,78000,83.5,1630.00,NULL,'Andorra','Parliamentary Coprincipality','',55,'AD');
INSERT INTO country VALUES ('ANT','Netherlands Antilles','North America','Caribbean',800.00,NULL,217000,74.7,1941.00,NULL,'Nederlandse Antillen','Nonmetropolitan Territory of The Netherlands','Beatrix',33,'AN');
INSERT INTO country VALUES ('ARE','United Arab Emirates','Asia','Middle East',83600.00,1971,2441000,74.1,37966.00,36846.00,'Al-Imarat al-�Arabiya al-Muttahida','Emirate Federation','Zayid bin Sultan al-Nahayan',65,'AE');
INSERT INTO country VALUES ('ARG','Argentina','South America','South America',2780400.00,1816,37032000,75.1,340238.00,323310.00,'Argentina','Federal Republic','Fernando de la R�a',69,'AR');
INSERT INTO country VALUES ('ARM','Armenia','Asia','Middle East',29800.00,1991,3520000,66.4,1813.00,1627.00,'Hajastan','Republic','Robert Kot�arjan',126,'AM');

SELECT * FROM city WHERE ID IN (1,2,3,5,14);

SELECT * FROM city WHERE ID>18 AND CountryCode = 'NLD' AND Population>201843;

SELECT MAX(Population) FROM city;
SELECT MIN(population) FROM city;

SELECT AVG(population) FROM city;

SELECT LifeExpectancy FROM country ORDER BY Capital DESC ;

SELECT name from country WHERE IndepYear IS NOT NULL ORDER BY IndepYear DESC;

SELECT GNP from country WHERE GNP>1500 AND GNP<6000;

SELECT Capital AS capital_number FROM country GROUP BY Capital HAVING Capital>=65;

SELECT COUNT(ID) FROM city GROUP BY ID;