import { Injectable } from '@angular/core';
import { catchError, Observable, throwError } from 'rxjs';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';

import { Status } from 'src/app/models/status';

@Injectable({
  providedIn: 'root'
})
export class StatusService {

  public url = "http://localhost:5228/api/Status"
  constructor(private http: HttpClient) { }

  getAllStatus(): Observable<Status[]> {
    return this.http.get<Status[]>(this.url)
      .pipe(catchError(this.handleError));
  }
  addStatus(name: string) {
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
