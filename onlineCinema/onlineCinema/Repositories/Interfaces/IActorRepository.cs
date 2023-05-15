using onlineCinema.Models;
using System.Collections.Generic;

namespace onlineCinema.Repositories.Interfaces
{
    public interface IActorRepository
    {
        void AddActor(ActorModel actor);
        void UpdateActor(ActorModel actor);
        void DeleteActor(int id);
        ActorModel GetActorById(int id);
        IEnumerable<ActorModel> GetAllActors();

        public ActorModel GetPopularActor();
    }
}
