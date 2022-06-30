using API_Layer.QueryParameters;
namespace API_Layer.Repositories.Interfaces
{
    public interface IRepository<T>
    {
        Task<List<T>> GetAll(QueryParameter queryParameters);
    }
}
