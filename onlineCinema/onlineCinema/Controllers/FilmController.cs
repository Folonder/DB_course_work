using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Logging;
using onlineCinema.Models;
using onlineCinema.Repositories.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;

namespace onlineCinema.Controllers
{
    public class FilmController : Controller
    {
        private readonly ILogger<FilmController> _logger;

        private readonly IFilmRepository _filmRepository;

        private readonly IActorRepository _actorRepository;

        private readonly ILanguageRepository _languageRepository;

        public FilmController(ILogger<FilmController> logger, IFilmRepository filmRepository, IActorRepository actorRepository, ILanguageRepository languageRepository)
        {
            _filmRepository = filmRepository;
            _actorRepository = actorRepository;
            _languageRepository = languageRepository;
            _logger = logger;
        }
        public IActionResult Edit(int id)
        {
            ViewBag.MpaaRating = _filmRepository.GetMpaaRatingValues();
            ViewBag.Languages = _languageRepository.GetAllLanguages();
            ViewBag.Actors = _actorRepository.GetAllActors();
            FilmModel film = _filmRepository.GetFilmById(id);
            return View("EditFilm", film);
        }


        [HttpPost]
        public IActionResult Edit(FilmModel film, int[] SelectedActors)
        {
            if (film.Actors == null)
            {
                film.Actors = new List<ActorModel> { };
            }
            foreach (int i in SelectedActors)
            {
                film.Actors.Add(_actorRepository.GetActorById(i));
            }
            Console.WriteLine(film.Title);
            _filmRepository.UpdateFilm(film);
            return RedirectToAction("Index", "Home");
        }

        public IActionResult Create()
        {
            ViewBag.Actors = _actorRepository.GetAllActors();
            ViewBag.MpaaRating = _filmRepository.GetMpaaRatingValues();
            ViewBag.Languages = _languageRepository.GetAllLanguages();
            return View("AddFilm");
        }


        [HttpPost]
        public IActionResult Create(FilmModel film, int[] SelectedActors)
        {
            Console.WriteLine(film.Title);
            if (film.Actors == null)
            {
                film.Actors = new List<ActorModel> { };
            }
            foreach (int i in SelectedActors)
            {
                film.Actors.Add(_actorRepository.GetActorById(i));
            }
            _filmRepository.AddFilm(film);
            return RedirectToAction("films", "Film");
        }

        public IActionResult Delete(int id)
        {
            _filmRepository.DeleteFilm(id);
            return RedirectToAction("films", "Film");
        }


        public IActionResult Films()
        {
            var films = _filmRepository.GetAllFilms();
            return View(films);
        }


        public IActionResult Details(int id)
        {
            var film = _filmRepository.GetFilmById(id);
            return View("FilmDetails", film);
        }

        [HttpPost]
        public IActionResult Details(FilmModel film)
        {
            return View("films", "Film");
        }

        public IActionResult RatedFilm()
        {
            var film = _filmRepository.GetRatedFilm();
            return View("FilmDetails", film);
        }
    }
}
