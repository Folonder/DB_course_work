using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using onlineCinema.Models;
using onlineCinema.Repositories.Interfaces;

namespace onlineCinema.Controllers
{
    public class LanguageController : Controller
    {
        private readonly ILogger<LanguageController> _logger;

        private readonly ILanguageRepository _languageRepository;

        public LanguageController(ILogger<LanguageController> logger, ILanguageRepository languageRepository)
        {
            _languageRepository = languageRepository;
            _logger = logger;
        }
        public IActionResult Edit(int id)
        {
            LanguageModel language = _languageRepository.GetLanguageById(id);
            return View("EditLanguage", language);
        }


        [HttpPost]
        public IActionResult Edit(LanguageModel language)
        {
            _languageRepository.UpdateLanguage(language);
            return RedirectToAction("languages", "Language");
        }

        public IActionResult Create()
        {
            ViewBag.Languages = _languageRepository.GetAllLanguages();
            return View("AddLanguage");
        }


        [HttpPost]
        public IActionResult Create(LanguageModel language)
        {
            _languageRepository.AddLanguage(language);
            return RedirectToAction("lanuages", "Language");
        }

        public IActionResult Delete(int id)
        {
            _languageRepository.DeleteLanguage(id);
            return RedirectToAction("languages", "Language");
        }


        public IActionResult Languages()
        {
            var languages = _languageRepository.GetAllLanguages();
            return View(languages);
        }
    }
}
