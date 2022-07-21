using API_Layer.Repositories.Interfaces;
using DatabaseLayer.Data;
using DatabaseLayer.Models;

namespace API_Layer.Repositories
{
    public class FavouriteRepository : IFavouriteRepository
    {
        private readonly AppDbContext context;

        public FavouriteRepository(AppDbContext context)
        {
            this.context = context;
        }

        public async Task Add(Favourite favourite)
        {
            
            await context.AddAsync(favourite);
            await context.SaveChangesAsync();
        }

        public async Task Delete(Favourite favourite)
        {
             context.Remove(favourite);
            await context.SaveChangesAsync();
        }
        public bool findByIDs(int ProductId, int UserId)
        {
            Favourite favourite = context.Favourites.SingleOrDefault(f=>f.ProductId==ProductId && f.UserId==UserId);
            return favourite!=null;
        }
    }
}
