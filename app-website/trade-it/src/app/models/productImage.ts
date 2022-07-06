import { Product } from "./product";

export interface ProductImage {
    productImageId: number;
    name: string;
    product: Product;
    productId: number;
}