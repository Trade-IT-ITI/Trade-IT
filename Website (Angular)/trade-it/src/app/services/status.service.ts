import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Status } from '../models/status';

@Injectable({
  providedIn: 'root'
})
export class StatusService {

  constructor(private http: HttpClient) { }
  getAll(params: HttpParams) {
    return this.http.get<Status[]>('http://localhost:5228/api/Status', {
      params: params
    })
  }
}
