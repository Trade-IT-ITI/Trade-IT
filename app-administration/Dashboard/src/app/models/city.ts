import { area } from "./area";
import { Product } from "./product";

export interface city {
    cityId: number,
    name: string,
    areas: area[]|null,
    products: Product[]|null
}
