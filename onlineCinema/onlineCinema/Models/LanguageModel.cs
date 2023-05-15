using MySql.Data.MySqlClient;
using System;

namespace onlineCinema.Models
{
    public class LanguageModel
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public LanguageModel(MySqlDataReader reader)
        {
            Console.WriteLine(reader.ToString());
            Id = int.Parse(reader.GetString("language_id"));
            Name = reader.GetString("name");
        }

        public LanguageModel(int id, string name)
        {
            Id = id;
            Name = name;
        }

        public LanguageModel()
        {

        }
    }
}
