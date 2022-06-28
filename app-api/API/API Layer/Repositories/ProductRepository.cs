using DatabaseLayer.Models;
using DatabaseLayer.Data;
using Microsoft.EntityFrameworkCore;
using API_Layer.Repositories.Interfaces;

namespace API_Layer.Repositories
{
    public class ProductRepository : IRepository<Product>
    {
        private readonly AppDbContext _context;

        public ProductRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<Product>> GetAll()
        { 

            var Products = await _context.Products.ToListAsync<Product>();
             Products.ForEach(p =>_context.Entry(p).Reference(p=>p.Owner).Load());
             Products.ForEach(p =>_context.Entry(p).Collection(p=>p.Notifications).Load());
            return Products;
        }
        
    }
}
