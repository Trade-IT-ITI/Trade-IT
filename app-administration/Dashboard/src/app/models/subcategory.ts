import { category } from "./category"
export interface subcategory {
    subcategoryId: number,
    name: string,
    category: category | null,
    categoryId: number,
    products: null,
    productBuyOptions: null
}