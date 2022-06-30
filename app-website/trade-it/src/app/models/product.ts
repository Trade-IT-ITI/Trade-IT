import { ProductImage } from "./productImage";
import { subcategory } from "./subcategory";

export interface Product {
    productId: number;
    title: string;
    descrioption: string;
    postDateTime: Date;
    price: number;
    city: string;
    area: string;
    requestCount: number;
    viewsCount: number;
    notifications: null;
    favourites: null;
    productImages: ProductImage[];
    status: null;
    statusId: number;
    subcategory: subcategory;
    subcategoryId: number;
    owner: null;
    userId: number;
    productBuyOptions: null;
}