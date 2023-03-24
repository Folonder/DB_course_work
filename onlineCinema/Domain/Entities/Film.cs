using System;
using LinqToDB.Mapping;

namespace Domain.Entities
{

    public enum MpaaRating
    {
        [MapValue("G")]
        G,
        [MapValue("PG")]
        Pg,
        [MapValue("PG-13")]
        Pg13,
        [MapValue("R")]
        R,
        [MapValue("NC-17")]
        Nc17
    }


    public class Film
    {
        public static int Id { get; set; }
        
        public static string Title { get; set; }
        
        public static string OriginalTitle { get; set; }
        
        public static string Tagline { get; set; }
        
        public static DateTime ReleaseDate { get; set; }
        
        public static uint Rating { get; set; }
        
        public static uint Budget { get; set; }

        public MpaaRating MpaaRating { get; set; }
    
        public static string Description { get; set; }
        
        public static string Language { get; set; }
        
        public static TimeSpan Duration { get; set; }
    }
}