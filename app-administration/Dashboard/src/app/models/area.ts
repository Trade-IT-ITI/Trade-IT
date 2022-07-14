import { city } from "./city"
import { Product } from "./product"
export interface area {
    areaId: number,
    name: string,
    cityId: number,
    city: city | null,
    products: Product[]|null
}