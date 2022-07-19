import { ProductService } from 'src/app/services/product.service';
import { Product } from 'src/app/models/product';
import { HttpParams } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';

import { Area } from 'src/app/models/area';
import { category } from 'src/app/models/category';
import { City } from 'src/app/models/city';
import { subcategory } from 'src/app/models/subcategory';
import { CategoryService } from 'src/app/services/category.service';
import { CityService } from 'src/app/services/city.service';

@Component({
  selector: 'app-add-product',
  templateUrl: './add-product.component.html',
  styleUrls: ['./add-product.component.css']
})
export class AddProductComponent implements OnInit {
  title: string = "qefc";
  descrioption: string = "qqq";
  price: number = 1;
  cityId: number = 0;
  areaId: number = 0;
  categoryId: number = 0;
  subcategoryId: number = 0;
  userId: number = 0;
  //location
  cities: City[] = []
  areas: Area[] = []
  isAreasDisabled: boolean = true;

  //categories
  categories: category[] = []
  subcategories: subcategory[] = []
  isSubcategoriesDisabled: boolean = true;
  constructor(private cityService: CityService, private categoryService: CategoryService, private productService: ProductService) { }

  ngOnInit(): void {
    let userData = localStorage.getItem('userData');
    let user = userData != null ? JSON.parse(userData) : null
    this.userId = user != null ? user.userId : 0;
    let CitiesParams: HttpParams = new HttpParams();
    CitiesParams = CitiesParams.append('expand', 'Areas');
    this.cityService.getAll(CitiesParams).subscribe(data => {
      this.cities = data;
    })
    let CategoriesParams: HttpParams = new HttpParams();
    CategoriesParams = CategoriesParams.append('expand', 'Subcategories')
    this.categoryService.getall(CategoriesParams).subscribe(data => {
      this.categories = data;
    })
  }
  //location
  onSelectCity() {
    if (this.cityId == 0) {
      this.isAreasDisabled = true;
      this.areas = [];
    }
    else {
      let city = this.cities.find(c => c.cityId == this.cityId);
      if (city) {
        this.isAreasDisabled = false
        this.areas = city.areas;
      }
    }
  }
  //category
  onSelectCategory() {
    if (this.categoryId == 0) {
      this.isSubcategoriesDisabled = true;
      this.subcategories = [];
    }
    else {
      let category = this.categories.find(c => c.categoryId == this.categoryId);
      if (category) {
        this.isSubcategoriesDisabled = false
        this.subcategories = category.subcategories;
      }
    }
  }

  //product data
  image: File | null = null;
  fileName = '';
  onFileSelected(event: any) {
    this.image = event.target.files[0];
    if (this.image) {
      this.fileName = this.image.name;
    }
  }
  formData = new FormData();
 async addProduct() {
    this.formData.append('title', this.title);
    this.formData.append('descrioption', this.descrioption);
    this.formData.append('price', this.price.toString());
    this.formData.append('cityId', this.cityId.toString());
    this.formData.append('areaId', this.areaId.toString());
    this.formData.append('subcategoryId', this.subcategoryId.toString());
    this.formData.append('userId', this.userId.toString());
    this.formData.append("image", this.image!);
await this.productService.addProduct(this.formData).subscribe((product) => {
        console.log(product);
      });
  }

}
