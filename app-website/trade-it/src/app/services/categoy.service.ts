import { Injectable } from '@angular/core';
import { category } from '../models/category'
import { subcategory } from '../models/subcategory'

@Injectable({
  providedIn: 'root'
})
export class CategoyService {
  electronics: category = {
    categoryId: 1, name: 'electronics', categoryInstructions: null, subcategories: []
  };
  veichles: category = {
    categoryId: 2, name: 'veichles', categoryInstructions: null, subcategories: []
  };
  properties: category = {
    categoryId: 3, name: 'properties', categoryInstructions: null, subcategories: []
  };

  labtobs: subcategory = { subcategoryId: 1, name: 'labtobs', category: null, categoryId: 1, productBuyOptions: null, products: null }
  mobiles: subcategory = { subcategoryId: 2, name: 'mobiles', category: null, categoryId: 1, productBuyOptions: null, products: null }
  tablets: subcategory = { subcategoryId: 3, name: 'tablets', category: null, categoryId: 1, productBuyOptions: null, products: null }
  electronics_subcategories: subcategory[] = [this.labtobs, this.mobiles, this.tablets];

  bycycles: subcategory = { subcategoryId: 4, name: 'bycycles', category: null, categoryId: 2, productBuyOptions: null, products: null }
  cars: subcategory = { subcategoryId: 5, name: 'cars', category: null, categoryId: 2, productBuyOptions: null, products: null }
  motorcycles: subcategory = { subcategoryId: 6, name: 'motorcycles', category: null, categoryId: 2, productBuyOptions: null, products: null }
  buses: subcategory = { subcategoryId: 7, name: 'buses', category: null, categoryId: 2, productBuyOptions: null, products: null }
  skoters: subcategory = { subcategoryId: 8, name: 'skoters', category: null, categoryId: 2, productBuyOptions: null, products: null }

  veichles_subcategories: subcategory[] = [this.bycycles, this.cars, this.motorcycles, this.buses, this.skoters];

  houses: subcategory = { subcategoryId: 9, name: 'houses', category: null, categoryId: 3, productBuyOptions: null, products: null }
  buildings: subcategory = { subcategoryId: 10, name: 'buildings', category: null, categoryId: 3, productBuyOptions: null, products: null }
  properties_subcategories: subcategory[] = [this.houses, this.buildings];

  categories: category[] = [this.electronics, this.veichles, this.properties, this.veichles, this.properties, this.electronics, this.properties, this.electronics, this.veichles, this.electronics, this.veichles, this.properties, this.veichles];

  constructor() {
    this.electronics.subcategories = this.electronics_subcategories;
    this.veichles.subcategories = this.veichles_subcategories;
    this.properties.subcategories = this.properties_subcategories;
  }
  getall(): category[] {
    return this.categories;
  }
}
