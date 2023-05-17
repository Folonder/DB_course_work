CREATE DATABASE  IF NOT EXISTS `movies` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `movies`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: movies
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actors` (
  `actor_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`actor_id`),
  KEY `actor_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES (12,'Брэд Питт'),(7,'Вигго Мортенсен'),(9,'Джон Траволта'),(4,'Лиам Нисон'),(3,'Морган Фриман'),(8,'Мэттью МакКонахи'),(10,'Сэмюэл Л. Джексон'),(2,'Тим Роббинс'),(1,'Том Хэнкс'),(11,'Эдвард Нортон'),(6,'Элайджа Вуд'),(5,'Энтони Гонсалес');
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `company_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Paramount Pictures'),(2,'	Warner Bros. Pictures'),(3,'New Line Cinema'),(4,'	Pixar Animation Studios'),(5,'Walt Disney Pictures'),(6,'Atman Entertainment'),(7,'	Universal Pictures'),(8,'Miramax Films');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compilations`
--

DROP TABLE IF EXISTS `compilations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compilations` (
  `compilation_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `users_user_id` int NOT NULL,
  PRIMARY KEY (`compilation_id`,`users_user_id`),
  KEY `fk_compilations_user1_idx` (`users_user_id`),
  CONSTRAINT `fk_compilations_user1` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compilations`
--

LOCK TABLES `compilations` WRITE;
/*!40000 ALTER TABLE `compilations` DISABLE KEYS */;
/*!40000 ALTER TABLE `compilations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `compilations_view`
--

DROP TABLE IF EXISTS `compilations_view`;
/*!50001 DROP VIEW IF EXISTS `compilations_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `compilations_view` AS SELECT 
 1 AS `compilation_id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `username`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'США'),(2,'Великобритания'),(3,'Франция'),(4,'Новая Зеландия'),(5,'Канада');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directors`
--

DROP TABLE IF EXISTS `directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directors` (
  `director_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`director_id`),
  KEY `director_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directors`
--

LOCK TABLES `directors` WRITE;
/*!40000 ALTER TABLE `directors` DISABLE KEYS */;
INSERT INTO `directors` VALUES (8,'Дэвид Финчер'),(7,'Квентин Тарантино'),(6,'Кристофер Нолан'),(4,'Ли Анкрич'),(5,'Питер Джексон'),(3,'Роберт Земекис'),(2,'Стивен Спилберг'),(1,'Фрэнк Дарабонт');
/*!40000 ALTER TABLE `directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films` (
  `film_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `original_title` varchar(100) DEFAULT NULL,
  `tagline` varchar(100) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `rating` int unsigned DEFAULT NULL,
  `budget` int unsigned DEFAULT NULL,
  `MPAA_rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `language_id` int NOT NULL,
  `duration` time DEFAULT NULL,
  PRIMARY KEY (`film_id`,`language_id`),
  KEY `fk_films_languages1_idx` (`language_id`),
  KEY `MPAA_rating_index` (`MPAA_rating`),
  CONSTRAINT `fk_films_languages1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films`
--

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
INSERT INTO `films` VALUES (1,'Список Шиндлера','Schindlers List','Этот список - жизнь','2004-09-28',90,22000000,'R','Фильм рассказывает реальную историю загадочного Оскара Шиндлера, члена нацистской партии, преуспевающего фабриканта, спасшего во время Второй мировой войны почти 1200 евреев.',1,'03:15:00'),(2,'Побег из Шоушенка','The Shawshank Redemption','Страх - это кандалы. Надежда - это свобода','1994-09-10',91,25000000,'R','Бухгалтер Энди Дюфрейн обвинён в убийстве собственной жены и её любовника. Оказавшись в тюрьме под названием Шоушенк, он сталкивается с жестокостью и беззаконием, царящими по обе стороны решётки. Каждый, кто попадает в эти стены, становится их рабом до конца жизни. Но Энди, обладающий живым умом и доброй душой, находит подход как к заключённым, так и к охранникам, добиваясь их особого к себе расположения.',1,'02:22:00'),(3,'Зеленая Миля','The Green Mile','Пол Эджкомб не верил в чудеса. Пока не столкнулся с одним из них','1999-12-06',81,60000000,'R','Пол Эджкомб — начальник блока смертников в тюрьме «Холодная гора», каждый из узников которого однажды проходит «зеленую милю» по пути к месту казни. Пол повидал много заключённых и надзирателей за время работы. Однако гигант Джон Коффи, обвинённый в страшном преступлении, стал одним из самых необычных обитателей блока.',1,'03:09:00'),(4,'Форест Гамп','Forrest Gump','Мир уже никогда не будет прежним, после того как вы увидите его глазами Форреста Гампа','1994-06-23',89,55000000,'PG-13','Сидя на автобусной остановке, Форрест Гамп — не очень умный, но добрый и открытый парень — рассказывает случайным встречным историю своей необыкновенной жизни.',1,'02:22:00'),(5,'Тайна Коко','Coco','The celebration of a lifetime','2017-10-20',89,175000000,'PG','12-летний Мигель живёт в мексиканской деревушке в семье сапожников и тайно мечтает стать музыкантом. Тайно, потому что в его семье музыка считается проклятием. Когда-то его прапрадед оставил жену, прапрабабку Мигеля, ради мечты, которая теперь не даёт спокойно жить и его праправнуку. С тех пор музыкальная тема в семье стала табу. Мигель обнаруживает, что между ним и его любимым певцом Эрнесто де ла Крусом, ныне покойным, существует некая связь. Паренёк отправляется к своему кумиру в Страну Мёртвых, где встречает души предков. Мигель знакомится там с духом-скелетом по имени Гектор, который становится его проводником. Вдвоём они отправляются на поиски де ла Круса.',1,'01:45:00'),(6,'Властелин колец: Возвращение короля','The Lord of the Rings: The Return of the King','There can be no triumph without loss. No victory without suffering. No freedom without sacrifice','2003-12-01',87,94000000,'PG-13','Повелитель сил тьмы Саурон направляет свою бесчисленную армию под стены Минас-Тирита, крепости Последней Надежды. Он предвкушает близкую победу, но именно это мешает ему заметить две крохотные фигурки — хоббитов, приближающихся к Роковой Горе, где им предстоит уничтожить Кольцо Всевластья.',1,'03:21:00'),(7,'Интерстеллар','Interstella','Следующий шаг человечества станет величайшим','2014-10-26',86,165000000,'PG-13','Когда засуха, пыльные бури и вымирание растений приводят человечество к продовольственному кризису, коллектив исследователей и учёных отправляется сквозь червоточину (которая предположительно соединяет области пространства-времени через большое расстояние) в путешествие, чтобы превзойти прежние ограничения для космических путешествий человека и найти планету с подходящими для человечества условиями.',1,'02:49:00'),(8,'Криминальное чтиво','Pulp Fiction','Just because you are a character doesn\'t mean you have character','1994-05-21',86,8000000,'R','Двое бандитов Винсент Вега и Джулс Винфилд ведут философские беседы в перерывах между разборками и решением проблем с должниками криминального босса Марселласа Уоллеса.',1,'02:34:00'),(9,'Бойцовский клуб','Fight Club','Интриги. Хаос. Мыло','1999-10-10',87,63000000,'R','Сотрудник страховой компании страдает хронической бессонницей и отчаянно пытается вырваться из мучительно скучной жизни. Однажды в очередной командировке он встречает некоего Тайлера Дёрдена — харизматического торговца мылом с извращенной философией. Тайлер уверен, что самосовершенствование — удел слабых, а единственное, ради чего стоит жить, — саморазрушение.',1,'02:19:00'),(10,'Властелин колец: Братство Кольца','The Lord of the Rings: The Fellowship of the Ring','Power can be held in the smallest of things...','2001-12-10',86,93000000,'PG-13','Сказания о Средиземье — это хроника Великой войны за Кольцо, длившейся не одну тысячу лет. Тот, кто владел Кольцом, получал неограниченную власть, но был обязан служить злу.',1,'02:58:00');
/*!40000 ALTER TABLE `films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films_has_actors`
--

DROP TABLE IF EXISTS `films_has_actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films_has_actors` (
  `films_film_id` int NOT NULL,
  `actors_actor_id` int NOT NULL,
  PRIMARY KEY (`films_film_id`,`actors_actor_id`),
  KEY `fk_films_has_actors_actors1_idx` (`actors_actor_id`),
  KEY `fk_films_has_actors_films1_idx` (`films_film_id`),
  CONSTRAINT `fk_films_has_actors_actors1` FOREIGN KEY (`actors_actor_id`) REFERENCES `actors` (`actor_id`),
  CONSTRAINT `fk_films_has_actors_films1` FOREIGN KEY (`films_film_id`) REFERENCES `films` (`film_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films_has_actors`
--

LOCK TABLES `films_has_actors` WRITE;
/*!40000 ALTER TABLE `films_has_actors` DISABLE KEYS */;
INSERT INTO `films_has_actors` VALUES (3,1),(4,1),(2,2),(2,3),(1,4),(5,5),(6,6),(10,6),(6,7),(10,7),(7,8),(8,9),(8,10),(9,11),(9,12);
/*!40000 ALTER TABLE `films_has_actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films_has_companies`
--

DROP TABLE IF EXISTS `films_has_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films_has_companies` (
  `films_film_id` int NOT NULL,
  `companies_company_id` int NOT NULL,
  PRIMARY KEY (`films_film_id`,`companies_company_id`),
  KEY `fk_films_has_companies_companies1_idx` (`companies_company_id`),
  KEY `fk_films_has_companies_films1_idx` (`films_film_id`),
  CONSTRAINT `fk_films_has_companies_companies1` FOREIGN KEY (`companies_company_id`) REFERENCES `companies` (`company_id`),
  CONSTRAINT `fk_films_has_companies_films1` FOREIGN KEY (`films_film_id`) REFERENCES `films` (`film_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films_has_companies`
--

LOCK TABLES `films_has_companies` WRITE;
/*!40000 ALTER TABLE `films_has_companies` DISABLE KEYS */;
INSERT INTO `films_has_companies` VALUES (1,1),(7,1),(3,2),(9,2),(6,3),(10,3),(5,4),(5,5),(2,6),(4,7),(8,8);
/*!40000 ALTER TABLE `films_has_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films_has_compilations`
--

DROP TABLE IF EXISTS `films_has_compilations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films_has_compilations` (
  `films_film_id` int NOT NULL,
  `compilations_compilation_id` int NOT NULL,
  PRIMARY KEY (`films_film_id`,`compilations_compilation_id`),
  KEY `fk_films_has_compilations_compilations1_idx` (`compilations_compilation_id`),
  KEY `fk_films_has_compilations_films1_idx` (`films_film_id`),
  CONSTRAINT `fk_films_has_compilations_compilations1` FOREIGN KEY (`compilations_compilation_id`) REFERENCES `compilations` (`users_user_id`),
  CONSTRAINT `fk_films_has_compilations_films1` FOREIGN KEY (`films_film_id`) REFERENCES `films` (`film_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films_has_compilations`
--

LOCK TABLES `films_has_compilations` WRITE;
/*!40000 ALTER TABLE `films_has_compilations` DISABLE KEYS */;
/*!40000 ALTER TABLE `films_has_compilations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films_has_countries`
--

DROP TABLE IF EXISTS `films_has_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films_has_countries` (
  `films_film_id` int NOT NULL,
  `countries_country_id` int NOT NULL,
  PRIMARY KEY (`films_film_id`,`countries_country_id`),
  KEY `fk_films_has_countries_countries1_idx` (`countries_country_id`),
  KEY `fk_films_has_countries_films_idx` (`films_film_id`),
  CONSTRAINT `fk_films_has_countries_countries1` FOREIGN KEY (`countries_country_id`) REFERENCES `countries` (`country_id`),
  CONSTRAINT `fk_films_has_countries_films` FOREIGN KEY (`films_film_id`) REFERENCES `films` (`film_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films_has_countries`
--

LOCK TABLES `films_has_countries` WRITE;
/*!40000 ALTER TABLE `films_has_countries` DISABLE KEYS */;
INSERT INTO `films_has_countries` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(6,2),(10,2),(6,4),(10,4);
/*!40000 ALTER TABLE `films_has_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films_has_directors`
--

DROP TABLE IF EXISTS `films_has_directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films_has_directors` (
  `films_film_id` int NOT NULL,
  `directors_director_id` int NOT NULL,
  PRIMARY KEY (`films_film_id`,`directors_director_id`),
  KEY `fk_films_has_directors_directors1_idx` (`directors_director_id`),
  KEY `fk_films_has_directors_films1_idx` (`films_film_id`),
  CONSTRAINT `fk_films_has_directors_directors1` FOREIGN KEY (`directors_director_id`) REFERENCES `directors` (`director_id`),
  CONSTRAINT `fk_films_has_directors_films1` FOREIGN KEY (`films_film_id`) REFERENCES `films` (`film_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films_has_directors`
--

LOCK TABLES `films_has_directors` WRITE;
/*!40000 ALTER TABLE `films_has_directors` DISABLE KEYS */;
INSERT INTO `films_has_directors` VALUES (1,1),(2,1),(3,2),(4,3),(5,4),(6,5),(10,5),(7,6),(8,7),(9,8);
/*!40000 ALTER TABLE `films_has_directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films_has_genres`
--

DROP TABLE IF EXISTS `films_has_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films_has_genres` (
  `films_film_id` int NOT NULL,
  `genres_genre_id` int NOT NULL,
  PRIMARY KEY (`films_film_id`,`genres_genre_id`),
  KEY `fk_films_has_genres_genres1_idx` (`genres_genre_id`),
  KEY `fk_films_has_genres_films1_idx` (`films_film_id`),
  CONSTRAINT `fk_films_has_genres_films1` FOREIGN KEY (`films_film_id`) REFERENCES `films` (`film_id`),
  CONSTRAINT `fk_films_has_genres_genres1` FOREIGN KEY (`genres_genre_id`) REFERENCES `genres` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films_has_genres`
--

LOCK TABLES `films_has_genres` WRITE;
/*!40000 ALTER TABLE `films_has_genres` DISABLE KEYS */;
INSERT INTO `films_has_genres` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(7,1),(9,1),(5,2),(3,3),(6,3),(10,3),(7,4),(8,5),(8,9);
/*!40000 ALTER TABLE `films_has_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films_has_scriptwriters`
--

DROP TABLE IF EXISTS `films_has_scriptwriters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films_has_scriptwriters` (
  `films_film_id` int NOT NULL,
  `scriptwriters_scriptwriter_id` int NOT NULL,
  PRIMARY KEY (`films_film_id`,`scriptwriters_scriptwriter_id`),
  KEY `fk_films_has_scriptwriters_scriptwriters1_idx` (`scriptwriters_scriptwriter_id`),
  KEY `fk_films_has_scriptwriters_films1_idx` (`films_film_id`),
  CONSTRAINT `fk_films_has_scriptwriters_films1` FOREIGN KEY (`films_film_id`) REFERENCES `films` (`film_id`),
  CONSTRAINT `fk_films_has_scriptwriters_scriptwriters1` FOREIGN KEY (`scriptwriters_scriptwriter_id`) REFERENCES `scriptwriters` (`scriptwriter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films_has_scriptwriters`
--

LOCK TABLES `films_has_scriptwriters` WRITE;
/*!40000 ALTER TABLE `films_has_scriptwriters` DISABLE KEYS */;
INSERT INTO `films_has_scriptwriters` VALUES (1,1),(2,1),(1,2),(2,2),(3,3),(4,4),(5,6),(6,7),(10,7),(7,8),(8,9),(9,10),(9,11);
/*!40000 ALTER TABLE `films_has_scriptwriters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `films_view`
--

DROP TABLE IF EXISTS `films_view`;
/*!50001 DROP VIEW IF EXISTS `films_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `films_view` AS SELECT 
 1 AS `id`,
 1 AS `title`,
 1 AS `original_title`,
 1 AS `tagline`,
 1 AS `release_date`,
 1 AS `rating`,
 1 AS `budget`,
 1 AS `MPAA_rating`,
 1 AS `description`,
 1 AS `language`,
 1 AS `duration`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `full_films_view`
--

DROP TABLE IF EXISTS `full_films_view`;
/*!50001 DROP VIEW IF EXISTS `full_films_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `full_films_view` AS SELECT 
 1 AS `id`,
 1 AS `title`,
 1 AS `original_title`,
 1 AS `tagline`,
 1 AS `release_date`,
 1 AS `rating`,
 1 AS `budget`,
 1 AS `MPAA_rating`,
 1 AS `description`,
 1 AS `language`,
 1 AS `duration`,
 1 AS `actors_list`,
 1 AS `genres_list`,
 1 AS `countries_list`,
 1 AS `directors_list`,
 1 AS `companies_list`,
 1 AS `scriptwriters_list`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `genre_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`genre_id`),
  KEY `genre_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (7,'биография'),(8,'военный'),(1,'драма'),(9,'комедия'),(5,'криминал'),(2,'мультфильм'),(6,'триллер'),(4,'фантастика'),(3,'фэнтези');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `genre_to_lowercase` BEFORE INSERT ON `genres` FOR EACH ROW BEGIN
    SET NEW.name = LOWER(NEW.name);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `language_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'английский'),(2,'русский'),(3,'немецкий');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scriptwriters`
--

DROP TABLE IF EXISTS `scriptwriters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scriptwriters` (
  `scriptwriter_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`scriptwriter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scriptwriters`
--

LOCK TABLES `scriptwriters` WRITE;
/*!40000 ALTER TABLE `scriptwriters` DISABLE KEYS */;
INSERT INTO `scriptwriters` VALUES (1,'Фрэнк Дарабонт'),(2,'Стивен Кинг'),(3,'Стивен Зеллиан'),(4,'Эрик Рот'),(5,'Уинстон Грум'),(6,'Ли Анкрич'),(7,'Фрэн Уолш'),(8,'Джонатан Нолан'),(9,'Квентин Тарантино'),(10,'Чак Паланик'),(11,'Джим Улс');
/*!40000 ALTER TABLE `scriptwriters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `users_view`
--

DROP TABLE IF EXISTS `users_view`;
/*!50001 DROP VIEW IF EXISTS `users_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `users_view` AS SELECT 
 1 AS `user_id`,
 1 AS `username`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users_watched_films`
--

DROP TABLE IF EXISTS `users_watched_films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_watched_films` (
  `users_user_id` int NOT NULL,
  `films_film_id` int NOT NULL,
  `rating` varchar(45) DEFAULT NULL,
  `review` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`users_user_id`,`films_film_id`),
  KEY `fk_user_has_films_films1_idx` (`films_film_id`),
  KEY `fk_user_has_films_user1_idx` (`users_user_id`),
  CONSTRAINT `fk_user_has_films_films1` FOREIGN KEY (`films_film_id`) REFERENCES `films` (`film_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_watched_films`
--

LOCK TABLES `users_watched_films` WRITE;
/*!40000 ALTER TABLE `users_watched_films` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_watched_films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `users_watched_films_view`
--

DROP TABLE IF EXISTS `users_watched_films_view`;
/*!50001 DROP VIEW IF EXISTS `users_watched_films_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `users_watched_films_view` AS SELECT 
 1 AS `username`,
 1 AS `review`,
 1 AS `rating`,
 1 AS `title`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users_watching_films`
--

DROP TABLE IF EXISTS `users_watching_films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_watching_films` (
  `films_film_id` int NOT NULL,
  `users_user_id` int NOT NULL,
  `last_time` time DEFAULT NULL,
  PRIMARY KEY (`films_film_id`,`users_user_id`),
  KEY `fk_films_has_user_user1_idx` (`users_user_id`),
  KEY `fk_films_has_user_films1_idx` (`films_film_id`),
  CONSTRAINT `fk_films_has_user_films1` FOREIGN KEY (`films_film_id`) REFERENCES `films` (`film_id`),
  CONSTRAINT `fk_films_has_user_user1` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_watching_films`
--

LOCK TABLES `users_watching_films` WRITE;
/*!40000 ALTER TABLE `users_watching_films` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_watching_films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_will_watch_films`
--

DROP TABLE IF EXISTS `users_will_watch_films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_will_watch_films` (
  `users_user_id` int NOT NULL,
  `films_film_id` int NOT NULL,
  PRIMARY KEY (`users_user_id`,`films_film_id`),
  KEY `fk_user_has_films_films2_idx` (`films_film_id`),
  KEY `fk_user_has_films_user2_idx` (`users_user_id`),
  CONSTRAINT `fk_user_has_films_films2` FOREIGN KEY (`films_film_id`) REFERENCES `films` (`film_id`),
  CONSTRAINT `fk_user_has_films_user2` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_will_watch_films`
--

LOCK TABLES `users_will_watch_films` WRITE;
/*!40000 ALTER TABLE `users_will_watch_films` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_will_watch_films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'movies'
--

--
-- Dumping routines for database 'movies'
--
/*!50003 DROP FUNCTION IF EXISTS `get_film_director` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_film_director`(id INT) RETURNS varchar(50) CHARSET utf8mb3
    READS SQL DATA
BEGIN
  DECLARE film_director VARCHAR(50);
  SELECT director INTO film_director FROM films WHERE film_id = id;
  
  IF ISNULL(film_director) THEN
    SET film_director = "Unknown";
  END IF;
  
  RETURN film_director;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_film_duration` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_film_duration`(id INT) RETURNS time
    DETERMINISTIC
BEGIN
  DECLARE length TIME;
  SELECT duration INTO length FROM films WHERE film_id = id;
  IF ISNULL(length) THEN
    RETURN 0;
  ELSE
    RETURN length;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_film_MPAA_rating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_film_MPAA_rating`(id INT) RETURNS varchar(50) CHARSET utf8mb3
    READS SQL DATA
BEGIN
  DECLARE film_MPAA_rating VARCHAR(50);
  SELECT MPAA_rating INTO film_MPAA_rating FROM films WHERE film_id = id;
  
  IF ISNULL(film_MPAA_rating) THEN
    SET film_MPAA_rating = "Unknown";
  END IF;
  
  RETURN film_MPAA_rating;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_film_original_title` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_film_original_title`(id INT) RETURNS varchar(50) CHARSET utf8mb3
    READS SQL DATA
BEGIN
  DECLARE title VARCHAR(50);
  SELECT original_title INTO title FROM films WHERE film_id = id;
  
  IF ISNULL(title) THEN
    SET title = "Unknown";
  END IF;
  
  RETURN title;
RETURN 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_film_rating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_film_rating`(id INT) RETURNS int
    DETERMINISTIC
BEGIN
  DECLARE film_rating INT;
  SELECT rating INTO film_rating FROM films WHERE film_id = id;
  
  IF ISNULL(film_rating) THEN
    SET film_rating = -1;
  END IF;
  
  RETURN film_rating;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_films_by_genre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_films_by_genre`(genre varchar(50))
BEGIN
	SELECT films_genres.film from 
	(SELECT films.title as film, genres.name as genre
	FROM films
	JOIN films_has_genres ON films.film_id = films_has_genres.films_film_id
	JOIN genres ON films_has_genres.genres_genre_id = genres.genre_id) as films_genres
    where films_genres.genre = genre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_films_by_limited_rating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_films_by_limited_rating`(min INT, max INT)
BEGIN
	select films.title, films.rating from films where films.rating between min and max;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_films_titles_by_genre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_films_titles_by_genre`(IN genre VARCHAR(50))
BEGIN
  DECLARE films_titles TEXT DEFAULT '';
  
  	SELECT films_genres.film INTO films_titles from 
	(SELECT films.title as film, genres.name as genre
	FROM films
	JOIN films_has_genres ON films.film_id = films_has_genres.films_film_id
	JOIN genres ON films_has_genres.genres_genre_id = genres.genre_id) as films_genres
    where films_genres.genre = genre;
  
  SELECT films_titles;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `compilations_view`
--

/*!50001 DROP VIEW IF EXISTS `compilations_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `compilations_view` AS select `compilations`.`compilation_id` AS `compilation_id`,`compilations`.`name` AS `name`,`compilations`.`description` AS `description`,`users`.`username` AS `username` from (`compilations` join `users` on((`compilations`.`users_user_id` = `users`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `films_view`
--

/*!50001 DROP VIEW IF EXISTS `films_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `films_view` AS select `films`.`film_id` AS `id`,`films`.`title` AS `title`,`films`.`original_title` AS `original_title`,`films`.`tagline` AS `tagline`,`films`.`release_date` AS `release_date`,`films`.`rating` AS `rating`,`films`.`budget` AS `budget`,`films`.`MPAA_rating` AS `MPAA_rating`,`films`.`description` AS `description`,`languages`.`name` AS `language`,`films`.`duration` AS `duration` from (`films` join `languages`) where (`films`.`language_id` = `languages`.`language_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `full_films_view`
--

/*!50001 DROP VIEW IF EXISTS `full_films_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `full_films_view` AS select `f`.`film_id` AS `id`,`f`.`title` AS `title`,`f`.`original_title` AS `original_title`,`f`.`tagline` AS `tagline`,`f`.`release_date` AS `release_date`,`f`.`rating` AS `rating`,`f`.`budget` AS `budget`,`f`.`MPAA_rating` AS `MPAA_rating`,`f`.`description` AS `description`,`l`.`name` AS `language`,`f`.`duration` AS `duration`,group_concat(distinct `a`.`name` separator ', ') AS `actors_list`,group_concat(distinct `g`.`name` separator ', ') AS `genres_list`,group_concat(distinct `c`.`name` separator ', ') AS `countries_list`,group_concat(distinct `d`.`name` separator ', ') AS `directors_list`,group_concat(distinct `cmp`.`name` separator ', ') AS `companies_list`,group_concat(distinct `s`.`name` separator ', ') AS `scriptwriters_list` from (((((((((((((`films` `f` left join `languages` `l` on((`f`.`language_id` = `l`.`language_id`))) left join `films_has_actors` `fa` on((`f`.`film_id` = `fa`.`films_film_id`))) left join `actors` `a` on((`fa`.`actors_actor_id` = `a`.`actor_id`))) left join `films_has_genres` `fg` on((`f`.`film_id` = `fg`.`films_film_id`))) left join `genres` `g` on((`fg`.`genres_genre_id` = `g`.`genre_id`))) left join `films_has_countries` `fc` on((`f`.`film_id` = `fc`.`films_film_id`))) left join `countries` `c` on((`fc`.`countries_country_id` = `c`.`country_id`))) left join `films_has_directors` `fd` on((`f`.`film_id` = `fd`.`films_film_id`))) left join `directors` `d` on((`fd`.`directors_director_id` = `d`.`director_id`))) left join `films_has_companies` `fcmp` on((`f`.`film_id` = `fcmp`.`films_film_id`))) left join `companies` `cmp` on((`fcmp`.`companies_company_id` = `cmp`.`company_id`))) left join `films_has_scriptwriters` `fs` on((`f`.`film_id` = `fs`.`films_film_id`))) left join `scriptwriters` `s` on((`fs`.`scriptwriters_scriptwriter_id` = `s`.`scriptwriter_id`))) group by `f`.`film_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `users_view`
--

/*!50001 DROP VIEW IF EXISTS `users_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `users_view` AS select `users`.`user_id` AS `user_id`,`users`.`username` AS `username`,`users`.`email` AS `email` from `users` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `users_watched_films_view`
--

/*!50001 DROP VIEW IF EXISTS `users_watched_films_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `users_watched_films_view` AS select `users`.`username` AS `username`,`uwf`.`review` AS `review`,`uwf`.`rating` AS `rating`,`films`.`title` AS `title` from ((`users_watched_films` `uwf` join `films` on((`films`.`film_id` = `uwf`.`films_film_id`))) join `users` on((`users`.`user_id` = `uwf`.`users_user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-17 15:32:20
