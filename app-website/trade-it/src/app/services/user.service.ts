import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { catchError, Observable, throwError } from 'rxjs';
import { Injectable } from '@angular/core';
import { User } from '../models/user';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  public url = "http://localhost:5228/api/User"
  constructor(private http: HttpClient) { }


  getUserById(id: number) {
    return this.http.get<User>(`${this.url}/${id}`)
      .pipe(catchError(this.handleError));
  }

  updateUser(id: number, firstName: string, lastName: string, email: string, phone: string) {
    return this.http.put(`${this.url}`, { id, firstName, lastName, email, phone })
      .pipe(catchError(this.handleError));
  }
  changePassword(id: number, oldPassword: string, newPassword: string) {
    return this.http.put(`${this.url}/changePassword`, { id, oldPassword, newPassword })
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
