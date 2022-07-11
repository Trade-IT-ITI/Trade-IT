import { HttpParams } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Options } from "@angular-slider/ngx-slider";
import { ProductsDetailsService } from 'src/app/services/products-details.service';
import { City } from '../../models/city'
import { Area } from '../../models/area'
import { CityService } from 'src/app/services/city.service';
import { CategoyService } from 'src/app/services/categoy.service';
import { category } from 'src/app/models/category';
import { subcategory } from 'src/app/models/subcategory';
import { StatusService } from 'src/app/services/status.service';
import { Status } from 'src/app/models/status';


@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.css']
})
export class SearchComponent implements OnInit {
  productsQueryParams: HttpParams = new HttpParams();

  //order products
  orderBy: string = 'PostDateTime';
  asc: boolean = false;

  //filters
  minValue: number = 0;
  maxValue: number = 0;
  cityId: number = 0;
  areaId: number = 0;
  categoryId: number = 0;
  subcategoryId: number = 0;
  statusId: number = 0
  isFiltersClean: boolean = true;

  // price slider
  isChanged: boolean = false;
  options: Options = {
    floor: 0,
    ceil: 0
  };

  //location
  cities: City[] = []
  areas: Area[] = []
  isAreasDisabled: boolean = true;

  //location
  categories: category[] = []
  subcategories: subcategory[] = []
  isSubcategoriesDisabled: boolean = true;

  //status
  statuses: Status[] = []

  //search
  searchText: string = '';

  constructor(private productsDetailsService: ProductsDetailsService,
    private cityService: CityService,
    private categoryService: CategoyService,
    private statusService: StatusService) { }

  ngOnInit(): void {
    //loading products
    this.productsQueryParams = this.productsQueryParams.append('expand', 'City');
    this.productsQueryParams = this.productsQueryParams.append('expand', 'Area');
    this.productsQueryParams = this.productsQueryParams.append('expand', 'ProductImages');
    this.productsQueryParams = this.productsQueryParams.append('orderBy', this.orderBy);
    this.productsQueryParams = this.productsQueryParams.append('asc', this.asc);

    //loading prices
    let ProductsDetailsParams: HttpParams = new HttpParams();
    ProductsDetailsParams = ProductsDetailsParams.append('fetchMinPrice', true);
    ProductsDetailsParams = ProductsDetailsParams.append('fetchMaxPrice', true);
    this.productsDetailsService.getProductsDetails(ProductsDetailsParams).subscribe(data => {
      if (data.minPrice && data.maxPrice) {
        this.options = {
          floor: data.minPrice,
          ceil: data.maxPrice
        }
        this.minValue = data.minPrice;
        this.maxValue = data.maxPrice;
      }
    })

    //loading locations
    let CitiesParams: HttpParams = new HttpParams();
    CitiesParams = CitiesParams.append('expand', 'Areas');
    this.cityService.getAll(CitiesParams).subscribe(data => {
      this.cities = data;
    })

    //loading categories
    let CategoriesParams: HttpParams = new HttpParams();
    CategoriesParams = CategoriesParams.append('expand', 'Subcategories')
    this.categoryService.getall(CategoriesParams).subscribe(data => {
      this.categories = data
    });

    //loading statuses
    let StatusParams: HttpParams = new HttpParams();
    this.statusService.getAll(StatusParams).subscribe(data => {
      this.statuses = data
    });
  }
  //order
  toggleOrderType() {
    this.asc = !this.asc;
    this.setAscParam()
  }
  changeOrderByProperty(element: any) {
    this.orderBy = (<HTMLSelectElement>element).value;
    this.setOrderByParam();
  }
  setOrderByParam() {
    this.productsQueryParams = this.productsQueryParams.set('orderBy', this.orderBy);

  }
  setAscParam() {
    this.productsQueryParams = this.productsQueryParams.set('asc', this.asc);
  }
  //price
  applyPriceFilter() {
    this.isFiltersClean = false;
    if (this.productsQueryParams.has('minPrice') && this.productsQueryParams.has('maxPrice')) {
      this.productsQueryParams = this.productsQueryParams.set('minPrice', this.minValue);
      this.productsQueryParams = this.productsQueryParams.set('maxPrice', this.maxValue);
    } else {
      this.productsQueryParams = this.productsQueryParams.append('minPrice', this.minValue);
      this.productsQueryParams = this.productsQueryParams.append('maxPrice', this.maxValue);
    }
    this.isChanged = false;
  }
  //location
  onSelectCity() {
    if (this.cityId == 0) {
      this.isAreasDisabled = true;
      this.areas = [];
      this.productsQueryParams = this.productsQueryParams.delete('city');
      this.productsQueryParams = this.productsQueryParams.delete('area');
      this.isFiltersClean = true;
    }
    else {
      let city = this.cities.find(c => c.cityId == this.cityId);
      if (city) {
        this.isAreasDisabled = false
        this.areas = city.areas;
        if (this.productsQueryParams.has('city'))
          this.productsQueryParams = this.productsQueryParams.set('city', this.cityId);
        else
          this.productsQueryParams = this.productsQueryParams.append('city', this.cityId);

        this.isFiltersClean = false;
      }
    }
  }
  onSelectArea() {
    if (this.areaId == 0) {
      this.productsQueryParams = this.productsQueryParams.delete('area');
    }
    else {
      if (this.productsQueryParams.has('area'))
        this.productsQueryParams = this.productsQueryParams.set('area', this.areaId);
      else
        this.productsQueryParams = this.productsQueryParams.append('area', this.areaId);
    }
  }
  //category
  onSelectCategory() {
    if (this.categoryId == 0) {
      this.isSubcategoriesDisabled = true;
      this.subcategories = [];
      this.productsQueryParams = this.productsQueryParams.delete('category');
      this.productsQueryParams = this.productsQueryParams.delete('subcategory');
      this.isFiltersClean = true;

    }
    else {
      let category = this.categories.find(c => c.categoryId == this.categoryId);
      if (category) {
        this.isSubcategoriesDisabled = false
        this.subcategories = category.subcategories;
        if (this.productsQueryParams.has('category'))
          this.productsQueryParams = this.productsQueryParams.set('category', this.categoryId);
        else
          this.productsQueryParams = this.productsQueryParams.append('category', this.categoryId);

        this.isFiltersClean = false;

      }
    }
  }
  onSelectSubcategory() {
    if (this.subcategoryId == 0) {
      this.productsQueryParams = this.productsQueryParams.delete('subcategory');
    } else {
      if (this.productsQueryParams.has('subcategory'))
        this.productsQueryParams = this.productsQueryParams.set('subcategory', this.subcategoryId);
      else
        this.productsQueryParams = this.productsQueryParams.append('subcategory', this.subcategoryId);
    }

  }
  //status
  onSelectStatus() {
    if (this.statusId == 0) {
      this.productsQueryParams = this.productsQueryParams.delete('status');
      this.isFiltersClean = true;
    }
    else {
      if (this.productsQueryParams.has('status'))
        this.productsQueryParams = this.productsQueryParams.set('status', this.statusId)
      else
        this.productsQueryParams = this.productsQueryParams.append('status', this.statusId)

      this.isFiltersClean = false;
    }

  }
  //reset filters
  resetFilters() {
    if (this.options.floor)
      this.minValue = this.options.floor;
    if (this.options.ceil)
      this.maxValue = this.options.ceil;
    this.cityId =
      this.areaId =
      this.categoryId =
      this.subcategoryId =
      this.statusId = 0;

    this.isAreasDisabled = true;
    this.isSubcategoriesDisabled = true;
    this.areas = [];
    this.subcategories = [];

    this.productsQueryParams = this.productsQueryParams.delete('minPrice');
    this.productsQueryParams = this.productsQueryParams.delete('maxPrice');
    this.productsQueryParams = this.productsQueryParams.delete('city');
    this.productsQueryParams = this.productsQueryParams.delete('area');
    this.productsQueryParams = this.productsQueryParams.delete('category');
    this.productsQueryParams = this.productsQueryParams.delete('subcategory');
    this.productsQueryParams = this.productsQueryParams.delete('status');

    this.isFiltersClean = true;
  }
  //search
  search() {
    if (this.productsQueryParams.has('searchText')) {
      this.productsQueryParams = this.productsQueryParams.set('searchText', this.searchText)
    }
    else {
      this.productsQueryParams = this.productsQueryParams.append('searchText', this.searchText)
    }
  }
}
