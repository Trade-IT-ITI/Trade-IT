
import { categoryInstruction } from "./categoryInstruction";

export interface instruction {
    instructionId: number,
    text: string,
    categoryInstructions: categoryInstruction[]|null
}