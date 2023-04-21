using System;


public enum MpaaRatingEnum
{
    G,
    PG,

}


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

        /*public MpaaRating*/

        public string Description { get; set; }

        public string Language { get; set; }

        public DateTime Duration { get; set; }
    }
}
