using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using onlineCinema.Models;
using onlineCinema.Repositories.Interfaces;

namespace onlineCinema.Controllers
{
    public class ActorController : Controller
    {
        private readonly ILogger<ActorController> _logger;

        private readonly IActorRepository _actorRepository;

        public ActorController(ILogger<ActorController> logger, IActorRepository actorRepository)
        {
            _actorRepository = actorRepository;
            _logger = logger;
        }
        public IActionResult Edit(int id)
        {
            ActorModel actor = _actorRepository.GetActorById(id);
            return View("EditActor", actor);
        }


        [HttpPost]
        public IActionResult Edit(ActorModel actor)
        {
            _actorRepository.UpdateActor(actor);
            return RedirectToAction("actors", "Actor");
        }

        public IActionResult Create()
        {
            ViewBag.Actors = _actorRepository.GetAllActors();
            return View("AddActor");
        }


        [HttpPost]
        public IActionResult Create(ActorModel actor)
        {
            _actorRepository.AddActor(actor);
            return RedirectToAction("actors", "Actor");
        }

        public IActionResult Delete(int id)
        {
            _actorRepository.DeleteActor(id);
            return RedirectToAction("actors", "Actor");
        }


        public IActionResult Actors()
        {
            var actors = _actorRepository.GetAllActors();
            return View(actors);
        }

        public IActionResult PopularActor()
        {
            var actor = _actorRepository.GetPopularActor();
            return View("ActorDetails", actor);
        }
    }
}
