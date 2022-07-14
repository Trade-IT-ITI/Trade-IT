import { Product } from "./product";
export interface status {
    statusId: number,
    name: string,
    products: Product[]|null
}