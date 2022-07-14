
import { Injectable } from '@angular/core';
import { catchError, Observable, throwError } from 'rxjs';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';

import { instruction } from 'src/app/models/instruction';

@Injectable({
  providedIn: 'root'
})
export class InstructionService {

  public url = "http://localhost:5228/api/Instruction"

  constructor(private http: HttpClient) { }

  getAllInstruction(): Observable<instruction[]> {
    return this.http.get<instruction[]>(this.url)
      .pipe(catchError(this.handleError));
  }
  addInstruction(text: string) {
    return this.http.post<any>(this.url, { text })
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
