import { Injectable } from '@angular/core';
import { category } from '../models/category'
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CategoyService {

  constructor(private http: HttpClient) {
  }
  getall(params?: HttpParams): Observable<category[]> {
    return this.http.get<category[]>('http://localhost:5228/api/Category', {
      params: params
    })
  }
}
