using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using onlineCinema.Models;
using onlineCinema.Repositories;
using onlineCinema.Repositories.Interfaces;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
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
            var films = _filmRepository.GetAllFilms();
            foreach (var film in films)
            {
                Console.WriteLine(film.Id);
            }
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
