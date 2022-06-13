namespace DatabaseLayer.Models
{
    public class CategoryInstruction
    {
        public Instruction Instruction { get; set; }
        public int InsturctionId { get; set; }

        public Category Category { get; set; }
        public int CategoryId { get; set; }
    }
}
