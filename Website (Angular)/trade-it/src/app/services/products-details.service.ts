import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { ProductsDetails } from '../models/productsDetails';

@Injectable({
  providedIn: 'root'
})
export class ProductsDetailsService {

  constructor(private http: HttpClient) { }

  getProductsDetails(params: HttpParams) {
    return this.http.get<ProductsDetails>('http://localhost:5228/api/ProductsDetails', {
      params: params
    })
  }
}
