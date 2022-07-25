import { ProductImage } from "./productImage";
import { subcategory } from "./subcategory";
import { City } from "./city";
import { Area } from "./area";

export interface Product {
    productId: number;
    title: string;
    descrioption: string;
    postDateTime: string;
    price: number;
    city: City;
    area: Area;
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