import { Injectable } from '@angular/core';
import { catchError, Observable, throwError } from 'rxjs';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';

import { User } from 'src/app/models/user';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  public url = "http://localhost:5228/api/User"

  constructor(private http: HttpClient) { }

  login(email: string, password: string,type:number) {
    return this.http.post<User>(`${this.url}/Login`, { email, password,type })
      .pipe(catchError(this.handleError));
    ;
  }
  register(user: User) {
    return this.http.post<User>(`${this.url}/Register`, user)
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
