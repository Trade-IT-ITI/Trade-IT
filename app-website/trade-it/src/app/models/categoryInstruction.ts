
import { category } from "./category";
import { instruction } from "./instruction";

export interface categoryInstruction {
    categoryId: number,
    instructionId: number,
    category: category | null,
    instruction: instruction | null
}