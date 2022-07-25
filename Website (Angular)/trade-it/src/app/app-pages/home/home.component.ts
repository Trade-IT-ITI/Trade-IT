import { HttpParams } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
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
