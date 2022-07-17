export interface ProductData {
    productId: number;
    title: string;
    descrioption: string;
    city: string;
    area: string;
    status: string;
    category: string;
    subcategory: string;
    postDateTime: string;
    price: number;
    requestCount: number | null;
    viewsCount: number | null;
    ownerFullName: string;
    ownerPhoneNumber: string;
    instructions: string[];
    productImages: string[];
}