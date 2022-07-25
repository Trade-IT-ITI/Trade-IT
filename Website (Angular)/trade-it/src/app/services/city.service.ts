import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { City } from '../models/city';

@Injectable({
  providedIn: 'root'
})
export class CityService {

  constructor(private http: HttpClient) { }
  getAll(params: HttpParams) {
    return this.http.get<City[]>('http://localhost:5228/api/City', {
      params: params
    });
  }
}
