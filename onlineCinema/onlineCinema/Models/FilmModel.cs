using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;

namespace onlineCinema.Models
{
    public class FilmModel
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "The Title field is required.")]
        public string Title { get; set; }

        [Required(ErrorMessage = "The Name field is required.")]
        public string OriginalTitle { get; set; }

        [Required(ErrorMessage = "The Name field is required.")]
        public string Tagline { get; set; }

        [Required(ErrorMessage = "The Name field is required.")]
        public DateTime ReleaseDate { get; set; }

        [Required(ErrorMessage = "The Name field is required.")]
        public uint Rating { get; set; }

        [Required(ErrorMessage = "The Name field is required.")]
        public uint Budget { get; set; }

        [Required(ErrorMessage = "The Name field is required.")]
        public string MpaaRating{ get; set; }

        [Required(ErrorMessage = "The Name field is required.")]
        public string Description { get; set; }

        [Required(ErrorMessage = "The Name field is required.")]
        public LanguageModel Language { get; set; }

        [Required(ErrorMessage = "The Name field is required.")]
        public DateTime Duration { get; set; }

        public List<ActorModel> Actors { get; set; }

        public List<string> Genres { get; set; }

        public List<string> Countries { get; set; }

        public List<string> Directors { get; set; }

        public List<string> Companies { get; set; }

        public List<string> Scriptwriters { get; set; }

        public FilmModel(MySqlDataReader reader)
        {
            Console.WriteLine(reader.ToString());
            Id = int.Parse(reader.GetString("id"));
            Title = reader.GetString("title");
            OriginalTitle = reader.GetString("original_title");
            Tagline = reader.GetString("tagline");
            ReleaseDate = DateTime.Parse(reader.GetString("release_date"));
            Rating = uint.Parse(reader.GetString("rating"));
            Budget = uint.Parse(reader.GetString("budget"));
            MpaaRating = reader.GetString("MPAA_rating");
            Description = reader.GetString("description");
            //Language = reader.GetString("language");
            Duration = DateTime.ParseExact(reader.GetString("duration"), "HH:mm:ss", null);
            //Actors = reader["actors_list"].ToString().Split(", ").ToList();
            Genres = reader["genres_list"].ToString().Split(", ").ToList();
            Countries = reader["countries_list"].ToString().Split(", ").ToList();
            Directors = reader["directors_list"].ToString().Split(", ").ToList();
            Companies = reader["companies_list"].ToString().Split(", ").ToList();
            Scriptwriters = reader["scriptwriters_list"].ToString().Split(", ").ToList();

        }

        public FilmModel(string title, string originalTitle, string tagline, DateTime releaseDate, uint rating, uint budget,
            string mpaaRating, string description, DateTime duration,
            List<string> genres, List<string> countires, List<string> directors, List<string> companies, List<string> scripwriters)
        {
            Title = title;
            OriginalTitle = originalTitle;
            Tagline = tagline;
            ReleaseDate = releaseDate;
            Rating = rating;
            Budget = budget;
            MpaaRating = mpaaRating;
            Description = description;
            //Language = language;
            Duration = duration;
            //Actors = actors;
            Genres = genres;
            Countries = countires;
            Directors = directors;
            Companies = companies;
            Scriptwriters = scripwriters;
        }

        public FilmModel()
        {

        }

    }
}
