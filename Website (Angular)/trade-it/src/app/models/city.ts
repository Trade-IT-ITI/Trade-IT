import { Product } from "./product";
import { Area } from "./area";

export interface City {
    cityId: number;
    name: string;
    areas: Area[];
    products: Product[];
}