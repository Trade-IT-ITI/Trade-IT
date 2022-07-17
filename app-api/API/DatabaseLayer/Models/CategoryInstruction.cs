namespace DatabaseLayer.Models
{
    public class CategoryInstruction
    {
        public virtual Instruction Instruction { get; set; }
        public int InstructionId { get; set; }

        public virtual Category Category { get; set; }
        public int CategoryId { get; set; }
    }
}
