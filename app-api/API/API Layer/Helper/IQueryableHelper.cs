using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;

namespace API_Layer.Helper
{
    public static class IQueryableHelper
    {
        public static void Expand<T>(this IQueryable<T> Set , string[] properties) where T : class
        {
            Type type = typeof(EntityFrameworkQueryableExtensions);
            var includeMethod = type.GetMethods().SingleOrDefault(mi => mi.Name == "Include" && mi.ReturnType.Name == "IQueryable`1");
            var genericIncludeMethod = includeMethod?.MakeGenericMethod(typeof(T));

            foreach (string prop in properties)
            {
                if (typeof(T).GetProperty(prop) != null)
                    Set = (IQueryable<T>) genericIncludeMethod.Invoke(null , new object[] { Set , prop });
            }
            Set.Load();
        }
        public static IQueryable<T> Sort<T>(this IQueryable<T> source , string propertyName , string sortType)
        {
            if (Enum.TryParse(sortType , out SortType type))
            {
                return (type == SortType.asc)
                    ? source.OrderBy(ToLambda<T>(propertyName))
                    : source.OrderByDescending(ToLambda<T>(propertyName));
            }
            return source;
        }
        private static Expression<Func<T , object>> ToLambda<T>(string propertyName)
        {
            var parameter = Expression.Parameter(typeof(T));
            var property = Expression.Property(parameter , propertyName);
            var propAsObject = Expression.Convert(property , typeof(object));

            return Expression.Lambda<Func<T , object>>(propAsObject , parameter);
        }
    }
}
