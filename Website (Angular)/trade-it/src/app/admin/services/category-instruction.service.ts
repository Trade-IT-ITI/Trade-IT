import { Injectable } from '@angular/core';
import { catchError, Observable, throwError } from 'rxjs';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';

import { categoryInstruction } from 'src/app/models/categoryInstruction';

@Injectable({
  providedIn: 'root'
})
export class CategoryInstructionService {

  public url = "http://localhost:5228/api/CategoryInstruction"

  constructor(private http: HttpClient) { }

  getAllCategoryInstruction(): Observable<categoryInstruction[]> {
    return this.http.get<categoryInstruction[]>(this.url)
      .pipe(catchError(this.handleError));
  }
  addCategoryInstruction(categoryId:number,InstructionId:number) {
    return this.http.post<any>(this.url, { categoryId,InstructionId })
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
