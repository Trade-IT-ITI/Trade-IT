namespace DatabaseLayer.Models
{
    public class Instruction
    {
        public int InstructionId { get; set; }
        public string Text { get; set; }

        public ICollection<CategoryInstruction> CategoryInstructions{ get; set; }
    }
}
