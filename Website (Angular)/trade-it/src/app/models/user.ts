import { Product } from './product'
import { Favourite } from './favourite'
export interface User {
    userId?: number,
    email?: string,
    password?: string,
    firstName?: string,
    lastName?: string,
    phone?: string,
    type?:number,
    favourites?: Favourite[] ,
    products?: Product[]
}