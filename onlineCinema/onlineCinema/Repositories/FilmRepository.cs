using Google.Protobuf.WellKnownTypes;
using Microsoft.Extensions.Options;
using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Common;
using onlineCinema.Models;
using onlineCinema.Repositories.Interfaces;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using static System.Net.WebRequestMethods;

namespace onlineCinema.Repositories
{
    public class FilmRepository : IFilmRepository
    {
        private readonly MySqlConnection _connection;

        public FilmRepository(IOptions<RepositoryOptions> options)
        {
            _connection = new MySqlConnection(options.Value.ConnectionString);
        }

        public void AddFilm(FilmModel film)
        {
            _connection.Open();
            int langId = (int) new MySqlCommand($"SELECT language_id FROM languages WHERE name LIKE '{film.Language.Name}'", _connection).ExecuteScalar();
            Console.WriteLine($"INSERT INTO films ( title, original_title, tagline, release_date, rating, budget, MPAA_rating, description, language_id, duration) VALUES ('{film.Title}', '{film.OriginalTitle}', '{film.Tagline}', '{film.ReleaseDate.ToString("yyyy-MM-dd")}', {film.Rating}, {film.Budget}, '{film.MpaaRating}', '{film.Description}', {langId}, '{film.Duration.ToString("HH:mm:ss")}')");
            new MySqlCommand($"INSERT INTO films ( title, original_title, tagline, release_date, rating, budget, MPAA_rating, description, language_id, duration) VALUES ('{film.Title}', '{film.OriginalTitle}', '{film.Tagline}', '{film.ReleaseDate.ToString("yyyy-MM-dd")}', {film.Rating}, {film.Budget}, '{film.MpaaRating}', '{film.Description}', {langId}, '{film.Duration.ToString("HH:mm:ss")}')", _connection).ExecuteNonQuery();
            var reader = new MySqlCommand($"SELECT film_id FROM films WHERE films.title LIKE '{film.Title}'", _connection).ExecuteReader();
            if (reader.Read())
            {
                int film_id = int.Parse(reader.GetString("film_id"));
                _connection.Close();
                _connection.Open();
                foreach (var actor in film.Actors)
                {
                    new MySqlCommand($"INSERT INTO films_has_actors (films_film_id, actors_actor_id) VALUES ({film_id}, {actor.Id})", _connection).ExecuteNonQuery();
                }
                _connection.Close();
            }
        }

        public void DeleteFilm(int id)
        {
            _connection.Open();
            new MySqlCommand($"DELETE FROM films_has_actors WHERE films_film_id = {id}", _connection).ExecuteNonQuery();
            new MySqlCommand($"DELETE FROM films WHERE film_id = {id}", _connection).ExecuteNonQuery();
            _connection.Close();
        }

        public IEnumerable<FilmModel> GetAllFilms()
        {
            var films = new List<FilmModel>();
            _connection.Open();
            new MySqlCommand("SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));", _connection).ExecuteNonQuery();
            MySqlDataReader reader = new MySqlCommand("SELECT * FROM movies.full_films_view", _connection).ExecuteReader();
            while (reader.Read())
            {
                var film = new FilmModel(
                reader.GetString("title"),
                reader.GetString("original_title"),
                reader.GetString("tagline"),
                DateTime.Parse(reader.GetString("release_date")),
                uint.Parse(reader.GetString("rating")),
                uint.Parse(reader.GetString("budget")),
                reader.GetString("MPAA_rating"),
                reader.GetString("description"),
                DateTime.ParseExact(reader.GetString("duration"), "HH:mm:ss", null),
                reader["genres_list"].ToString().Split(", ").ToList(),
                reader["countries_list"].ToString().Split(", ").ToList(),
                reader["directors_list"].ToString().Split(", ").ToList(),
                reader["companies_list"].ToString().Split(", ").ToList(),
                reader["scriptwriters_list"].ToString().Split(", ").ToList());
                film.Id = int.Parse(reader.GetString("id"));
                films.Add(film);
            }
            _connection.Close();
            foreach (var film in films)
            {
                _connection.Open();
                var actorsList = new List<ActorModel>();
                MySqlDataReader actorReader = new MySqlCommand($"SELECT actors.actor_id, actors.name FROM actors JOIN films_has_actors ON actors.actor_id = films_has_actors.actors_actor_id WHERE films_has_actors.films_film_id = {film.Id}", _connection).ExecuteReader();
                while (actorReader.Read())
                {
                    actorsList.Add(new ActorModel(actorReader));
                }
                film.Actors = actorsList;
                _connection.Close();
                _connection.Open();
                var langReader = new MySqlCommand($"SELECT * FROM languages WHERE language_id LIKE (SELECT language_id FROM films where film_id = {film.Id})", _connection).ExecuteReader();
                if (langReader.Read())
                {
                    LanguageModel language = new LanguageModel(langReader);
                    film.Language = language;
                }
                _connection.Close();
            }

            return films;
        }

        public FilmModel GetFilmById(int id)
        {
            _connection.Open();
            new MySqlCommand("SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));", _connection).ExecuteNonQuery();
            MySqlDataReader reader = new MySqlCommand($"SELECT * FROM movies.full_films_view WHERE id = {id}", _connection).ExecuteReader();
            var film = new FilmModel();
            if (reader.Read())
            {
                film = new FilmModel(
                reader.GetString("title"),
                reader.GetString("original_title"),
                reader.GetString("tagline"),
                DateTime.Parse(reader.GetString("release_date")),
                uint.Parse(reader.GetString("rating")),
                uint.Parse(reader.GetString("budget")),
                reader.GetString("MPAA_rating"),
                reader.GetString("description"),
                DateTime.ParseExact(reader.GetString("duration"), "HH:mm:ss", null),
                reader["genres_list"].ToString().Split(", ").ToList(),
                reader["countries_list"].ToString().Split(", ").ToList(),
                reader["directors_list"].ToString().Split(", ").ToList(),
                reader["companies_list"].ToString().Split(", ").ToList(),
                reader["scriptwriters_list"].ToString().Split(", ").ToList());
                film.Id = int.Parse(reader.GetString("id"));
            }
            _connection.Close();
            _connection.Open();
            var actorsList = new List<ActorModel>();
            MySqlDataReader actorReader = new MySqlCommand($"SELECT actors.actor_id, actors.name FROM actors JOIN films_has_actors ON actors.actor_id = films_has_actors.actors_actor_id WHERE films_has_actors.films_film_id = {film.Id}", _connection).ExecuteReader();
            while (actorReader.Read())
            {
                actorsList.Add(new ActorModel(actorReader));
            }
            film.Actors = actorsList;
            _connection.Close();
            _connection.Open();
            MySqlDataReader languageReader = new MySqlCommand($"SELECT * FROM languages WHERE language_id LIKE (SELECT language_id FROM films where film_id = {film.Id})", _connection).ExecuteReader();
            if (languageReader.Read())
            {
                LanguageModel language = new LanguageModel(languageReader);
                film.Language = language;
            }
            _connection.Close();
            return film;
            throw new Exception();
            
        }

        public void UpdateFilm(FilmModel film)
        {
            _connection.Open();
            int langId = (int)new MySqlCommand($"SELECT language_id FROM languages WHERE name LIKE '{film.Language.Name}'", _connection).ExecuteScalar();
            new MySqlCommand($"UPDATE films SET title = '{film.Title}', original_title = '{film.OriginalTitle}', tagline = '{film.Tagline}', release_date = '{film.ReleaseDate.ToString("yyyy-MM-dd")}', rating = {film.Rating}, budget = {film.Budget}, MPAA_rating = '{film.MpaaRating}', description = '{film.Description}', language_id = {langId}, duration = '{film.Duration.ToString("HH:mm:ss")}' WHERE film_id = {film.Id}", _connection).ExecuteNonQuery();
            new MySqlCommand($"DELETE FROM films_has_actors WHERE films_film_id = {film.Id}", _connection).ExecuteNonQuery();
            foreach (var actor in film.Actors)
            {
                new MySqlCommand($"INSERT INTO films_has_actors (films_film_id, actors_actor_id) VALUES ({film.Id}, {actor.Id})", _connection).ExecuteNonQuery();   
            }
            _connection.Close();
        }

        public List<string> GetMpaaRatingValues()
        {
            _connection.Open();
            MySqlDataReader reader = new MySqlCommand($"SELECT SUBSTRING(COLUMN_TYPE, 5) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'films' AND COLUMN_NAME = 'MPAA_rating';", _connection).ExecuteReader();
            if (reader.Read())
            {
                List<string> values = new List<string>();

                foreach (Match match in new Regex("'(.*?)'").Matches(reader[0].ToString()))
                {
                    values.Add(match.Groups[1].Value);
                }
                _connection.Close();
                return values;
            }
            throw new Exception();
        }

        public List<string> GetActors()
        {
            List<string> actors = new List<string> { };
            _connection.Open();
            MySqlDataReader reader = new MySqlCommand("SELECT * FROM actors", _connection).ExecuteReader();
            while (reader.Read())
            {
                actors.Add(reader["name"].ToString());
            }
            _connection.Close();
            return actors;
        }

        public FilmModel GetRatedFilm()
        {
            _connection.Open();
            var reader = new MySqlCommand("SELECT film_id FROM films WHERE rating = (SELECT MAX(rating) FROM films) LIMIT 1", _connection).ExecuteReader();

            var id = 0;
            if (reader.Read())
            {
                id = int.Parse(reader.GetString("film_id"));
            }
            _connection.Close();
            var film = GetFilmById(id);
            return film;
        }
    }
}
