using onlineCinema.Models;
using System.Collections.Generic;

namespace onlineCinema.Repositories.Interfaces
{
    public interface ILanguageRepository
    {
        void AddLanguage(LanguageModel Language);
        void UpdateLanguage(LanguageModel Language);
        void DeleteLanguage(int id);
        LanguageModel GetLanguageById(int id);
        IEnumerable<LanguageModel> GetAllLanguages();
    }
}
