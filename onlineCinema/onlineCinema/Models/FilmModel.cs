﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;

/*public enum MpaaRatingEnum
{
    G,
    PG,
    PG13,
    R,
    NC17

}*/


namespace onlineCinema.Models
{
    public class FilmModel
    {
        public int Id { get; set; }
        public string Title { get; set; }

        public string OriginalTitle { get; set; }

        public string Tagline { get; set; }

        public DateTime ReleaseDate { get; set; }

        public uint Rating { get; set; }

        public uint Budget { get; set; }

        public string MpaaRating{ get; set; }

        public string Description { get; set; }

        public string Language { get; set; }

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
    }
}
