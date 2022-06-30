using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;

namespace API_Layer.Helper
{
    public static class IQueryableHelper
    {
        public static void Expand<T>(this IQueryable<T> Set , string[] properties) where T : class
        {
            //using reflection

            //Type type = typeof(EntityFrameworkQueryableExtensions);
            //var includeMethod = type.GetMethods().SingleOrDefault(mi => mi.Name == "Include" && mi.ReturnType.Name == "IQueryable`1");
            //var genericIncludeMethod = includeMethod?.MakeGenericMethod(typeof(T));

            //foreach (string prop in properties)
            //{
            //    if (typeof(T).GetProperty(prop) != null)
            //        Set = (IQueryable<T>) genericIncludeMethod.Invoke(null , new object[] { Set , prop });
            //}
            //Set.Load();

            //--------------------------------

            //using expression tree

            var parameter = Expression.Parameter(typeof(T));
            foreach (string propertyName in properties)
            {
                if (typeof(T).GetProperty(propertyName) != null)
                {
                    var property = Expression.Property(parameter , propertyName);
                    var exp = Expression.Lambda<Func<T , object>>(property , parameter);
                    Set = Set.Include(exp);
                }
            }
            Set.Load();

        }
        public static IQueryable<T> Sort<T>(this IQueryable<T> source , string propertyName , string sortType)
        {
            if (Enum.TryParse(sortType , out SortType type))
            {
                var parameter = Expression.Parameter(typeof(T));
                var property = Expression.Property(parameter , propertyName);
                var propAsObject = Expression.Convert(property , typeof(object));

                var exp = Expression.Lambda<Func<T , object>>(propAsObject , parameter);

                return (type == SortType.asc)
                    ? source.OrderBy(exp)
                    : source.OrderByDescending(exp);
            }
            return source;
        }
    }
}
