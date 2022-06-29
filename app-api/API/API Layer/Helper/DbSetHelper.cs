using Microsoft.EntityFrameworkCore;

namespace API_Layer.Helper
{
    public static class DbSetHelper
    {
        public static void Expand<T>(this IQueryable<T> Set , string[] properties) where T : class
        {
            Type type = typeof(EntityFrameworkQueryableExtensions);
            var includeMethod = type.GetMethods().SingleOrDefault(mi => mi.Name == "Include" && mi.ReturnType.Name == "IQueryable`1");
            var genericIncludeMethod = includeMethod?.MakeGenericMethod(typeof(T));

            foreach (string prop in properties)
            {
                if (typeof(T).GetProperty(prop) != null)
                    Set = (IQueryable<T>) genericIncludeMethod?.Invoke(null , new object[] { Set , prop });
            }
            Set.ToList();
        }
    }
}
