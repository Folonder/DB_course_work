using System.ComponentModel.DataAnnotations;

namespace onlineCinema.Repositories
{
    public class RepositoryOptions
    {
        public const string Key = "FilmRepository";

        [Required]

        public string ConnectionString { get; set; }
    }
}
