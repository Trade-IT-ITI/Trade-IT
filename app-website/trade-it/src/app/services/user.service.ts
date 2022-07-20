import { HttpClient } from '@angular/common/http';
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
  }

  updateUser(id:number,firstName:string,lastName:string,email:string,phone:string) {
    return this.http.put(`${this.url}`, {id,firstName,lastName,email,phone})
  }
}
