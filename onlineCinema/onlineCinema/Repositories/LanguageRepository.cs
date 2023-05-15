using Microsoft.Extensions.Options;
using MySql.Data.MySqlClient;
using onlineCinema.Models;
using onlineCinema.Repositories.Interfaces;
using System.Collections.Generic;
using System;

namespace onlineCinema.Repositories
{
    public class LanguageRepository : ILanguageRepository
    {
        private readonly MySqlConnection _connection;

        public LanguageRepository(IOptions<RepositoryOptions> options)
        {
            _connection = new MySqlConnection(options.Value.ConnectionString);
        }
        public void AddLanguage(LanguageModel language)
        {
            _connection.Open();
            string query = $"INSERT INTO languages ( name ) VALUES ('{language.Name}')";
            Console.WriteLine(query);
            new MySqlCommand(query, _connection).ExecuteNonQuery();
            _connection.Close();
        }

        public void DeleteLanguage(int id)
        {
            _connection.Open();
            new MySqlCommand($"DELETE FROM languages WHERE language_id = {id}", _connection).ExecuteNonQuery();
            _connection.Close();
        }

        public LanguageModel GetLanguageById(int id)
        {
            _connection.Open();
            MySqlDataReader reader = new MySqlCommand($"SELECT * FROM languages WHERE language_id = {id}", _connection).ExecuteReader();
            if (reader.Read())
            {
                var language = new LanguageModel(reader);
                _connection.Close();
                return language;
            }
            throw new Exception();
        }

        public IEnumerable<LanguageModel> GetAllLanguages()
        {
            var languages = new List<LanguageModel>();
            _connection.Open();
            MySqlDataReader reader = new MySqlCommand("SELECT * FROM languages", _connection).ExecuteReader();
            while (reader.Read())
            {
                languages.Add(new LanguageModel(reader));
            }
            _connection.Close();
            return languages;
        }

        public void UpdateLanguage(LanguageModel language)
        {
            _connection.Open();
            string query = $"UPDATE languages SET name = '{language.Name}' WHERE language_id = {language.Id}";
            Console.WriteLine(query);
            new MySqlCommand(query, _connection).ExecuteNonQuery();
            _connection.Close();
        }
    }
}
