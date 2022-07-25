import { subcategory } from "./subcategory";
import { categoryInstruction } from "./categoryInstruction";

export interface category {
    categoryId: number,
    name: string,
    categoryInstructions?: categoryInstruction[] ,
    subcategories: subcategory[]
}
