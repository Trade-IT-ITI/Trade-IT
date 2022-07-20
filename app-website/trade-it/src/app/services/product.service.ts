import { HttpClient, HttpErrorResponse, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { catchError, Observable, throwError } from 'rxjs';
import { Product } from 'src/app/models/product';
import { ProductData } from 'src/app/models/productData';
import { ProductsData } from 'src/app/models/productsData';

@Injectable({
  providedIn: 'root'
})
export class ProductService {
  public url = "http://localhost:5228/api/Product"
  constructor(private http: HttpClient) {
  }
  getall(params?: HttpParams): Observable<ProductsData> {
    return this.http.get<ProductsData>(this.url, { params: params })
      .pipe(catchError(this.handleError));
  };
  getById(id: number): Observable<ProductData> {
    return this.http.get<ProductData>(`${this.url}/${id}`)
      .pipe(catchError(this.handleError));
  }
  addProduct(product: any) {
    return this.http.post<any>(this.url,product)
      .pipe(catchError(this.handleError));
    ;
  }
  increaseViewCount(id:number){
    return this.http.put<any>(`${this.url}/increase`,{},{params:{id}})
      .pipe(catchError(this.handleError));
    ;
  }

  private handleError(error: HttpErrorResponse) {
    if (error.status === 0) {
      console.error('An error occurred:', error.error);
    } else {
      console.error(
        `Backend returned code ${error.status}, body was: `, JSON.stringify(error.error));
    }
    return throwError(() => new Error('Something bad happened; please try again later.'));
  }
}
