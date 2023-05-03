using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using onlineCinema.Models;
using onlineCinema.Repositories;
using onlineCinema.Repositories.Interfaces;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;

namespace onlineCinema.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        private readonly IFilmRepository _filmRepository;

        public HomeController(ILogger<HomeController> logger, IFilmRepository filmRepository)
        {
            _filmRepository = filmRepository;
            _logger = logger;
        }

        public IActionResult Index()
        {
            var film = new FilmModel(
                "Список Шиндлера",
                "Schindlers List",
                "Этот список - жизнь",
                DateTime.Parse("2004-09-28"),
                90,
                22000000,
                "R",
                "Фильм рассказывает реальную историю загадочного Оскара Шиндлера, члена нацистской партии, преуспевающего фабриканта, спасшего во время Второй мировой войны почти 1200 евреев.",
                "русский",
                DateTime.ParseExact("03:15:00", "HH:mm:ss", null)
                );
            film.Id = 1;
            _filmRepository.UpdateFilm(film);

            /*var film = _filmRepository.GetFilmById(1);
            Console.WriteLine(film.Id);*/

            /*            var film = new FilmModel(
                            "Список Шиндлера",
                            "Schindlers List",
                            "Этот список - жизнь",
                            DateTime.Parse("2004-09-28"),
                            90,
                            22000000,
                            "R",
                            "Фильм рассказывает реальную историю загадочного Оскара Шиндлера, члена нацистской партии, преуспевающего фабриканта, спасшего во время Второй мировой войны почти 1200 евреев.",
                            "английский",
                            DateTime.ParseExact("03:15:00", "HH:mm:ss", null)
                            );
                        _filmRepository.AddFilm(film);*/

            /*            var films = _filmRepository.GetAllFilms();
                        foreach (var film in films)
                        {
                            Console.WriteLine(film.Id);
                        }*/
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
