using Microsoft.Extensions.Options;
using MySql.Data.MySqlClient;
using onlineCinema.Models;
using onlineCinema.Repositories.Interfaces;
using System;
using System.Collections.Generic;

namespace onlineCinema.Repositories
{
    public class ActorRepository : IActorRepository
    {
        private readonly MySqlConnection _connection;

        public ActorRepository(IOptions<RepositoryOptions> options)
        {
            _connection = new MySqlConnection(options.Value.ConnectionString);
        }
        public void AddActor(ActorModel actor)
        {
            _connection.Open();
            string query = $"INSERT INTO actors ( name ) VALUES ('{actor.Name}')";
            Console.WriteLine(query);
            new MySqlCommand(query, _connection).ExecuteNonQuery();
            _connection.Close();
        }

        public void DeleteActor(int id)
        {
            _connection.Open();
            new MySqlCommand($"DELETE FROM actors WHERE actor_id = {id}", _connection).ExecuteNonQuery();
            _connection.Close();
        }

        public ActorModel GetActorById(int id)
        {
            _connection.Open();
            MySqlDataReader reader = new MySqlCommand($"SELECT * FROM actors WHERE actor_id = {id}", _connection).ExecuteReader();
            if (reader.Read())
            {
                var actor = new ActorModel(reader);
                _connection.Close();
                return actor;
            }
            throw new Exception();
        }

        public IEnumerable<ActorModel> GetAllActors()
        {
            var actors = new List<ActorModel>();
            _connection.Open();
            MySqlDataReader reader = new MySqlCommand("SELECT * FROM actors", _connection).ExecuteReader();
            while (reader.Read())
            {
                actors.Add(new ActorModel(reader));
            }
            _connection.Close();
            return actors;
        }

        public void UpdateActor(ActorModel actor)
        {
            _connection.Open();
            string query = $"UPDATE actors SET name = '{actor.Name}' WHERE actor_id = {actor.Id}";
            Console.WriteLine(query);
            new MySqlCommand(query, _connection).ExecuteNonQuery();
            _connection.Close();
        }

        public ActorModel GetPopularActor()
        {
            _connection.Open();
            MySqlDataReader reader = new MySqlCommand($"SELECT actors.actor_id, actors.name, COUNT(films.film_id) AS num_films" +
                $" FROM actors JOIN films_has_actors ON actors.actor_id = films_has_actors.actors_actor_id" +
                $" JOIN films ON films_has_actors.films_film_id = films.film_id" +
                $" GROUP BY actors.actor_id ORDER BY num_films DESC LIMIT 1", _connection).ExecuteReader();
            if (reader.Read())
            {
                var actor = new ActorModel(reader);
                _connection.Close();
                return actor;
            }
            throw new Exception();
        }
    }
}
