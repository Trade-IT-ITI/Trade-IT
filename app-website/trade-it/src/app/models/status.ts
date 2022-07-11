import { Product } from "./product";

export interface Status {
    statusId: number;
    name: string;
    products: Product[];
}