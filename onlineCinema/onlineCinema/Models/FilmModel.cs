using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;



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
        public string Language { get; set; }

        [Required(ErrorMessage = "The Name field is required.")]
        public DateTime Duration { get; set; }

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
            Language = reader.GetString("language");
            Duration = DateTime.ParseExact(reader.GetString("duration"), "HH:mm:ss", null);
        }

        public FilmModel(string title, string originalTitle, string tagline, DateTime releaseDate, uint rating, uint budget, string mpaaRating, string description, string language, DateTime duration)
        {
            Title = title;
            OriginalTitle = originalTitle;
            Tagline = tagline;
            ReleaseDate = releaseDate;
            Rating = rating;
            Budget = budget;
            MpaaRating = mpaaRating;
            Description = description;
            Language = language;
            Duration = duration;
        }

        public FilmModel()
        {

        }
    }
}
