namespace DatabaseLayer.Models
{
    public class Category
    {
        public int CategoryId { get; set; }
        public string Name { get; set; }

        public virtual ICollection<CategoryInstruction> CategoryInstructions { get; set; }

        public virtual ICollection<Subcategory> Subcategories { get; set; }
    }
}
