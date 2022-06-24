import { Injectable } from '@angular/core';
import { Product } from '../models/product';

@Injectable({
  providedIn: 'root'
})
export class ProductService {

  LenovoThinkpadX1: Product = {
    productId: 1,
    title: 'Lenovo Thinkpad X1',
    descrioption: `16" powerhouse with up to 12th Gen Intel® Core™ vPro® i9
    Always connected with optional 5G, plus WiFi 6 / 6E option
    Stunning NVIDIA® GeForce RTX™ graphics options
    Stellar videocalls with FHD camera, Dolby Atmos®, & up-firing speakers
    Ideal for creative professionals & gamers alike
    Super-secure login: fingerprint reader integrated with power button`,
    postDateTime: new Date(new Date('June 24 2022, 01:50:00')),
    city: 'Egypt',
    area: 'Cairo',
    price: 10500,
    requestCount: 0,
    viewsCount: 0,
    notifications: null,
    favourites: null,
    productImages: [{ productImageId: 1, name: 'lenovo_x1.jpg' }, { productImageId: 2, name: 'lenovo_x1_2.jpg' }],
    status: null,
    statusId: 1,
    subcategory: { subcategoryId: 1, name: 'labtobs', category: null, categoryId: 1, productBuyOptions: null, products: null },
    subcategoryId: 1,
    owner: null,
    userId: 0,
    productBuyOptions: null,
  }
  IPhoneXs13Max: Product = {
    productId: 2,
    title: 'IPhone 13 Pro Max',
    descrioption: `The iPhone 13 Pro display has rounded corners that follow a beautiful curved design, and these corners are within a standard rectangle. When measured as a standard rectangular shape, the screen is 6.06 inches diagonally (actual viewable area is less).`,
    postDateTime: new Date('June 23 2022, 18:00:00'),
    city: 'Egypt',
    area: 'Alex',
    price: 18900,
    requestCount: 0,
    viewsCount: 0,
    notifications: null,
    favourites: null,
    productImages: [{ productImageId: 1, name: 'Iphone13promax.jpg' }, { productImageId: 2, name: 'Iphone13promax_2.jpg' }],
    status: null,
    statusId: 1,
    subcategory: { subcategoryId: 2, name: 'mobiles', category: null, categoryId: 1, productBuyOptions: null, products: null },
    subcategoryId: 2,
    owner: null,
    userId: 0,
    productBuyOptions: null,
  }
  NissanAcentaPremium: Product = {
    productId: 3,
    title: 'Nissan Acenta Premium',
    descrioption: `
    فتحة سقف بانوراما
    زجاج فاميه
    حسسات اماميه
    حسسات خلفيه
    كاميرا خلفية
    35,000 جنيه`,
    postDateTime: new Date(new Date('June 23 2022, 01:38:00')),
    city: 'Egypt',
    area: 'Ismailia',
    price: 560000,
    requestCount: 0,
    viewsCount: 0,
    notifications: null,
    favourites: null,
    productImages: [{ productImageId: 1, name: 'Nissan.jpg' }, { productImageId: 2, name: 'Nissan2.jpg' }],
    status: null,
    statusId: 1,
    subcategory: { subcategoryId: 5, name: 'cars', category: null, categoryId: 2, productBuyOptions: null, products: null },
    subcategoryId: 5,
    owner: null,
    userId: 0,
    productBuyOptions: null,
  }
  LenovoThinkpadCoreX2: Product = {
    productId: 1,
    title: 'Lenovo Thinkpad Core X1',
    descrioption: `18" powerhouse with up to 12th Gen Intel® Core™ vPro® i11
    Always connected with optional 5G, plus WiFi 6 / 6E option
    Stunning NVIDIA® GeForce RTX™ graphics options
    Stellar videocalls with FHD camera, Dolby Atmos®, & up-firing speakers
    Ideal for creative professionals & gamers alike
    Super-secure login: fingerprint reader integrated with power button`,
    postDateTime: new Date(new Date('July 25 2021, 00:00:00')),
    city: 'Egypt',
    area: 'Cairo',
    price: 12000,
    requestCount: 0,
    viewsCount: 0,
    notifications: null,
    favourites: null,
    productImages: [{ productImageId: 2, name: 'LenovoThinkpadCoreX2_2.jpg' }, { productImageId: 1, name: 'LenovoThinkpadCoreX2.jpg' }],
    status: null,
    statusId: 1,
    subcategory: { subcategoryId: 1, name: 'labtobs', category: null, categoryId: 1, productBuyOptions: null, products: null },
    subcategoryId: 1,
    owner: null,
    userId: 0,
    productBuyOptions: null,
  }
  products: Product[] = [this.LenovoThinkpadX1, this.IPhoneXs13Max, this.NissanAcentaPremium, this.LenovoThinkpadCoreX2, this.IPhoneXs13Max, this.LenovoThinkpadX1, this.LenovoThinkpadCoreX2, this.NissanAcentaPremium];
  constructor() {

  }


  getAll(): Product[] {
    return this.products;
  }
}
