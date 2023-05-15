using onlineCinema.Models;
using System.Collections.Generic;

namespace onlineCinema.Repositories.Interfaces
{
    public interface IFilmRepository
    {
        void AddFilm(FilmModel film);
        void UpdateFilm(FilmModel film);
        void DeleteFilm(int id);
        FilmModel GetFilmById(int id);
        IEnumerable<FilmModel> GetAllFilms();

        List<string> GetMpaaRatingValues();

        public List<string> GetActors();

        public FilmModel GetRatedFilm();
    }
}
