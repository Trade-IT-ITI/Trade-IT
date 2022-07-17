import { Product } from "./product";

export interface User {
    userId: number;
    email: string;
    password: string;
    firstName: string;
    lastName: string;
    phone: string;
    favourites: any[];
    products: Product[];
}