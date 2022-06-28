namespace API_Layer.Repositories.Interfaces
{
    public interface IRepository<T>
    {
        Task<List<T>> GetAll();
    }
}
