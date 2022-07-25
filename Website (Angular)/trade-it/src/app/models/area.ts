import { Product } from "./product";
import { City } from "./city";

export interface Area {
    areaId: number;
    name: string;
    cityId: number;
    city: City;
    products: Product[];
}