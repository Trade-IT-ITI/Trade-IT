import { User } from './user'
import { Product } from './product'
export interface Favourite {

    user: User,
    userId: number,
    product: Product,
    productId: number
}