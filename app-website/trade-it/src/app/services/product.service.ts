import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Product } from '../models/product';
import { ProductsData } from '../models/productsData';

@Injectable({
  providedIn: 'root'
})
export class ProductService {
  constructor(private http: HttpClient) {
  }
  getall(params?: HttpParams): Observable<ProductsData> {
    return this.http.get<ProductsData>('http://localhost:5228/api/Product', {
      params: params
    })
  }
}
