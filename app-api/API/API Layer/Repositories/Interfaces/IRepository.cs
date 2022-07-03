namespace API_Layer.Repositories.Interfaces
{
    public interface IRepository<T>
    {
        public Task Add(T model);
    }
}
