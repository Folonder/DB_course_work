using Google.Protobuf.WellKnownTypes;
using MySql.Data.MySqlClient;
using System.IO;
using System;

namespace onlineCinema.Models
{
    public class ActorModel
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public ActorModel(MySqlDataReader reader)
        {
            Console.WriteLine(reader.ToString());
            Id = int.Parse(reader.GetString("actor_id"));
            Name = reader.GetString("name");
        }

        public ActorModel(int id, string name)
        {
            Id = id;
            Name = name;
        }

        public ActorModel()
        {

        }
    }
}
