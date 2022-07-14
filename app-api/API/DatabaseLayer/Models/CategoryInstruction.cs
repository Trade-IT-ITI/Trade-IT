namespace DatabaseLayer.Models
{
    public class CategoryInstruction
    {
        public Instruction Instruction { get; set; }
        public int InstructionId { get; set; }

        public Category Category { get; set; }
        public int CategoryId { get; set; }
    }
}
