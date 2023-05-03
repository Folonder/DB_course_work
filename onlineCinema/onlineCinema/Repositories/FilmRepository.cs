using Microsoft.Extensions.Options;
using MySql.Data.MySqlClient;
using onlineCinema.Models;
using onlineCinema.Repositories.Interfaces;
using System;
using System.Collections.Generic;

namespace onlineCinema.Repositories
{
    public class FilmRepository : IFilmRepository
    {
        private readonly MySqlConnection _connection;

        public FilmRepository(IOptions<RepositoryOptions> options)
        {
            _connection = new MySqlConnection(options.Value.ConnectionString);
        }

        public void AddFilm(FilmModel movie)
        {
            throw new System.NotImplementedException();
        }

        public void DeleteFilm(int id)
        {
            throw new System.NotImplementedException();
        }

        public IEnumerable<FilmModel> GetAllFilms()
        {
            var films = new List<FilmModel>();
            _connection.Open();
            //var command = new MySqlCommand("SELECT * FROM movies.films_view", _connection);
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
            throw new System.NotImplementedException();
        }

        public void UpdateFilm(FilmModel movie)
        {
            throw new System.NotImplementedException();
        }
    }
}
