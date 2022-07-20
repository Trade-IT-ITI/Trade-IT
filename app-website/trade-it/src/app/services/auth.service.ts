import { Injectable } from '@angular/core';
import { catchError, Observable, Subject, throwError } from 'rxjs';
import { HttpClient, HttpErrorResponse, HttpHeaders, JsonpClientBackend } from '@angular/common/http';

import { User } from 'src/app/models/user';

interface UserResponse {
  user: User;
  token: string
}

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  isAuth: boolean = false;
  isAdmin: boolean = false;

  public url = "http://localhost:5228/api/User"

  constructor(private http: HttpClient) { }

  login(email: string, password: string, type: number) {
    let response = this.http.post<UserResponse>(`${this.url}/Login`, { email, password, type });
    response.subscribe(data => {
      this.isAuth = true;
      this.isAdmin = data.user.type == 0;
      localStorage.setItem("user", JSON.stringify(data.user));
      localStorage.setItem("token", data.token);
    });
    return response.pipe(catchError(this.handleError));
  }
  register(user: User) {
    let response = this.http.post<UserResponse>(`${this.url}/Register`, user);
    response.subscribe(data => {
      this.isAuth = true;
      this.isAdmin = false;
      localStorage.setItem("user", JSON.stringify(data.user));
      localStorage.setItem("token", JSON.stringify(data.token));
    });
    return response.pipe(catchError(this.handleError));
    ;
  }
  checkIsAuth(): boolean { return localStorage.getItem('token') != null }
  checkIsAdmin(): boolean { return (JSON.parse(localStorage.getItem('user') ?? '')).type == 0 }
  getToken() {
    let token = localStorage.getItem("token")
    return token
  }
  logout() {
    this.isAuth = false;
    this.isAdmin = false;
    localStorage.removeItem('user');
    localStorage.removeItem('token');
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

  //on login
  private emitChangeSource = new Subject<any>();
  changeEmitted = this.emitChangeSource.asObservable();
  emitChange(change: { fullname: string, isAuth: boolean, isAdmin: boolean }) {
    this.emitChangeSource.next(change);
  }
}
