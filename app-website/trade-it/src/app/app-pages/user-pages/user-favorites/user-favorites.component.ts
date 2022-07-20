import { HttpParams } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-user-favorites',
  templateUrl: './user-favorites.component.html',
  styleUrls: ['./user-favorites.component.css']
})
export class UserFavoritesComponent implements OnInit {
  productsQueryParams: HttpParams = new HttpParams();

  constructor() { }


  ngOnInit(): void {
    this.productsQueryParams = this.productsQueryParams.append('expand', 'City');
    this.productsQueryParams = this.productsQueryParams.append('expand', 'Area');
    this.productsQueryParams = this.productsQueryParams.append('expand', 'ProductImages');
    this.productsQueryParams = this.productsQueryParams.append('orderBy', 'PostDateTime');
    this.productsQueryParams = this.productsQueryParams.append('asc', 'false');
  }

}
