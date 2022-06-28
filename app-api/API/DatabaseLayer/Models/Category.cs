namespace DatabaseLayer.Models
{
    public class Category
    {
        public int CategoryId { get; set; }
        public string Name { get; set; }

        public ICollection<CategoryInstruction> CategoryInstructions { get; set; }

        public ICollection<Subcategory> Subcategories { get; set; }
    }
}
