using onlineCinema.Models;
using System.Collections.Generic;

namespace onlineCinema.Repositories.Interfaces
{
    public interface IFilmRepository
    {
        void AddFilm(FilmModel movie);
        void UpdateFilm(FilmModel movie);
        void DeleteFilm(int id);
        FilmModel GetFilmById(int id);
        IEnumerable<FilmModel> GetAllFilms();
    }
}
