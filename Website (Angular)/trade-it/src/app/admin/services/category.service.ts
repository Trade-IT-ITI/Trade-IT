import { Injectable } from '@angular/core';
import { catchError, Observable, throwError } from 'rxjs';
import { HttpClient, HttpErrorResponse, HttpParams } from '@angular/common/http';

import { category } from 'src/app/models/category';

@Injectable({
  providedIn: 'root'
})
export class CategoryService {

  public url = "http://localhost:5228/api/Category"

  constructor(private http: HttpClient) { }

  getAllCategory(params?: HttpParams): Observable<category[]> {
    return this.http.get<category[]>(this.url,{ params: params })
      .pipe(catchError(this.handleError));
  }
  addCategory(name: string) {
    return this.http.post<any>(this.url, { name })
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
