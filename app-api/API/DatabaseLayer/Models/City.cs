using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseLayer.Models
{
    public class City
    {
        public int CityId { get; set; }
        public string Name { get; set; }
        public virtual ICollection<Area> Areas { get; set; }
        public virtual ICollection<Product> Products { get; set; }

    }
}
