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

-- Dump completed on 2023-05-17 13:45:58
