
import { Injectable } from '@angular/core';
import { catchError, Observable, throwError } from 'rxjs';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
@Injectable({
  providedIn: 'root'
})
export class AreaService  {
  public url = "http://localhost:5228/api/Area";

  constructor(private http: HttpClient) { }

  addArea(name: string,cityId: number) {
    return this.http.post<any>(this.url, { name,cityId })
      .pipe(catchError(this.handleError));
    
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
