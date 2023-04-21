using MySql.Data.MySqlClient;
using onlineCinema.Models;
using onlineCinema.Repositories.Interfaces;
using System;
using System.Collections.Generic;

namespace onlineCinema.Repositories
{
    public class FilmRepository : IFilmRepository
    {
        private readonly MySqlConnection Connection;

        public FilmRepository(MySqlConnection connection)
        {
            Connection = connection;
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
            Connection.Open();
            var command = new MySqlCommand("Select * from films LIMIT 10");
            var reader = command.ExecuteReader();
            while (reader.Read())
            {
                Console.WriteLine(reader["id"]);
            }
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
