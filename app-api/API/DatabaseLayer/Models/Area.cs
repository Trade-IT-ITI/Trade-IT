using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseLayer.Models
{
    public class Area
    {
        public int AreaId { get; set; }
        public string Name { get; set; }

        public int CityId { get; set; }
        public virtual City City { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}
