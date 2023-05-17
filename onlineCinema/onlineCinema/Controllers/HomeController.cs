using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using onlineCinema.Models;
using onlineCinema.Repositories;
using onlineCinema.Repositories.Interfaces;
using Org.BouncyCastle.Asn1.Crmf;
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

        private readonly IActorRepository _actorRepository;

        public HomeController(ILogger<HomeController> logger, IFilmRepository filmRepository, IActorRepository actorRepository)
        {
            _filmRepository = filmRepository;
            _logger = logger;
            _actorRepository = actorRepository;
        }

        public IActionResult Index()
        {
            /*_filmRepository.GetMpaaRatingValues();*/
            /*var film = new FilmModel(
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
            _filmRepository.UpdateFilm(film);*/

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
            foreach (var actor in _actorRepository.GetAllActors())
            {
                Console.WriteLine(actor.Name);
            }
            return View();
        }


        public IActionResult Create()
        {
            ViewBag.MpaaRating = _filmRepository.GetMpaaRatingValues();
            
            return View("Film");
        }


        [HttpPost]
        public IActionResult Create(FilmModel film)
        {
            Console.WriteLine(film.ReleaseDate.ToString());
            Console.WriteLine(film.Title);
            return RedirectToAction("Index", "Home");
        }


        public IActionResult Edit()
        {
            ViewBag.MpaaRating = _filmRepository.GetMpaaRatingValues();
            ViewBag.Actors = _filmRepository.GetActors();
            FilmModel film = _filmRepository.GetFilmById(1);
            return View("FilmEdit", film);
        }


        [HttpPost]
        public IActionResult Edit(FilmModel film)
        {
            foreach (var actor in film.Actors)
            {
                Console.WriteLine(actor);
            }
            
            Console.WriteLine(film.Title);
            return RedirectToAction("Index", "Home");
        }


        public IActionResult Films()
        {
            var films = _filmRepository.GetAllFilms();
            return View(films);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
