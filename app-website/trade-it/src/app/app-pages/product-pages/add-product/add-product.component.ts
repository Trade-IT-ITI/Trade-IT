import { Component, OnInit } from '@angular/core';

import { Area } from 'src/app/models/area';
import { category } from 'src/app/models/category';
import { City } from 'src/app/models/city';
import { subcategory } from 'src/app/models/subcategory';

@Component({
  selector: 'app-add-product',
  templateUrl: './add-product.component.html',
  styleUrls: ['./add-product.component.css']
})
export class AddProductComponent implements OnInit {
  cityId: number = 0;
  areaId: number = 0;
  categoryId: number = 0;
  subcategoryId: number = 0;

  //location
  cities: City[] = []
  areas: Area[] = []
  isAreasDisabled: boolean = true;

   //categories
   categories: category[] = []
   subcategories: subcategory[] = []
   isSubcategoriesDisabled: boolean = true;
  constructor() { }

  ngOnInit(): void {
  }
  //location
  onSelectCity() {
    // if (this.cityId == 0) {
    //   this.isAreasDisabled = true;
    //   this.areas = [];
    //   this.productsQueryParams = this.productsQueryParams.delete('city');
    //   this.productsQueryParams = this.productsQueryParams.delete('area');
    //   this.isFiltersClean = true;
    // }
    // else {
    //   let city = this.cities.find(c => c.cityId == this.cityId);
    //   if (city) {
    //     this.isAreasDisabled = false
    //     this.areas = city.areas;
    //     if (this.productsQueryParams.has('city'))
    //       this.productsQueryParams = this.productsQueryParams.set('city', this.cityId);
    //     else
    //       this.productsQueryParams = this.productsQueryParams.append('city', this.cityId);

    //     this.productsQueryParams = this.productsQueryParams.delete('area');
    //     this.isFiltersClean = false;
    //   }
    // }
  }
  onSelectArea() {
    // if (this.areaId == 0) {
    //   this.productsQueryParams = this.productsQueryParams.delete('area');
    // }
    // else {
    //   if (this.productsQueryParams.has('area'))
    //     this.productsQueryParams = this.productsQueryParams.set('area', this.areaId);
    //   else
    //     this.productsQueryParams = this.productsQueryParams.append('area', this.areaId);
    // }
  }
  //category
  onSelectCategory() {
    // if (this.categoryId == 0) {
    //   this.isSubcategoriesDisabled = true;
    //   this.subcategories = [];
    //   this.productsQueryParams = this.productsQueryParams.delete('category');
    //   this.productsQueryParams = this.productsQueryParams.delete('subcategory');
    //   this.isFiltersClean = true;

    // }
    // else {
    //   let category = this.categories.find(c => c.categoryId == this.categoryId);
    //   if (category) {
    //     this.isSubcategoriesDisabled = false
    //     this.subcategories = category.subcategories;
    //     if (this.productsQueryParams.has('category'))
    //       this.productsQueryParams = this.productsQueryParams.set('category', this.categoryId);
    //     else
    //       this.productsQueryParams = this.productsQueryParams.append('category', this.categoryId);

    //     this.productsQueryParams = this.productsQueryParams.delete('subcategory');
    //     this.isFiltersClean = false;

    //   }
    // }
  }
  onSelectSubcategory() {
    // if (this.subcategoryId == 0) {
    //   this.productsQueryParams = this.productsQueryParams.delete('subcategory');
    // } else {
    //   if (this.productsQueryParams.has('subcategory'))
    //     this.productsQueryParams = this.productsQueryParams.set('subcategory', this.subcategoryId);
    //   else
    //     this.productsQueryParams = this.productsQueryParams.append('subcategory', this.subcategoryId);
    // }

  }
}
