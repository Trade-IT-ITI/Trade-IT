import { subcategory } from "./subcategory";

export interface category {
    categoryId: number,
    name: string,
    categoryInstructions: null,
    subcategories: subcategory[]
}
