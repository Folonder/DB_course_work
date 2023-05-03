using Microsoft.Extensions.Options;
using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Common;
using onlineCinema.Models;
using onlineCinema.Repositories.Interfaces;
using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;

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
            int langId = (int) new MySqlCommand($"SELECT language_id FROM languages WHERE name LIKE '{film.Language}'", _connection).ExecuteScalar();
            string query = $"INSERT INTO films ( title, original_title, tagline, release_date, rating, budget, MPAA_rating, description, language_id, duration) VALUES ('{film.Title}', '{film.OriginalTitle}', '{film.Tagline}', '{film.ReleaseDate.ToString("yyyy-MM-dd")}', {film.Rating}, {film.Budget}, '{film.MpaaRating}', '{film.Description}', {langId}, '{film.Duration.ToString("HH:mm:ss")}')";
            Console.WriteLine(query);
            new MySqlCommand(query, _connection).ExecuteNonQuery();
            _connection.Close();
        }

        public void DeleteFilm(int id)
        {
            _connection.Open();
            new MySqlCommand($"DELETE FROM films WHERE film_id = {id}", _connection).ExecuteNonQuery();
            _connection.Close();
        }

        public IEnumerable<FilmModel> GetAllFilms()
        {
            var films = new List<FilmModel>();
            _connection.Open();
            MySqlDataReader reader = new MySqlCommand("SELECT * FROM movies.films_view", _connection).ExecuteReader();
            while (reader.Read())
            {
                films.Add(new FilmModel(reader));
            }
            _connection.Close();
            return films;
        }

        public FilmModel GetFilmById(int id)
        {
            _connection.Open();
            MySqlDataReader reader = new MySqlCommand($"SELECT * FROM movies.films_view WHERE id = {id}", _connection).ExecuteReader();
            if (reader.Read())
            {
                var film = new FilmModel(reader);
                _connection.Close();
                return film;
            }
            throw new Exception();
            
        }

        public void UpdateFilm(FilmModel film)
        {
            _connection.Open();
            int langId = (int)new MySqlCommand($"SELECT language_id FROM languages WHERE name LIKE '{film.Language}'", _connection).ExecuteScalar();
            string query = $"UPDATE films SET title = '{film.Title}', original_title = '{film.OriginalTitle}', tagline = '{film.Tagline}', release_date = '{film.ReleaseDate.ToString("yyyy-MM-dd")}', rating = {film.Rating}, budget = {film.Budget}, MPAA_rating = '{film.MpaaRating}', description = '{film.Description}', language_id = {langId}, duration = '{film.Duration.ToString("HH:mm:ss")}' WHERE film_id = {film.Id}";
            Console.WriteLine(query);
            new MySqlCommand(query, _connection).ExecuteNonQuery();
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
    }
}
