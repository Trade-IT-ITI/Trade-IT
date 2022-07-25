using DatabaseLayer.Models;

namespace API_Layer.Repositories.Interfaces
{
    public interface IFavouriteRepository : IRepository<Favourite>
    {
        public Task Delete(Favourite favourite);
        public bool findByIDs(int ProductId, int UserId);
    }
}
