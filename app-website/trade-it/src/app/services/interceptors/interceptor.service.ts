import { HttpEvent, HttpHandler, HttpHeaders, HttpInterceptor, HttpParams, HttpRequest } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable } from "rxjs";
import { AuthService } from '../auth.service';

@Injectable({
    providedIn: 'root'
})
export class Interceptor implements HttpInterceptor {
    constructor(private authService: AuthService) {

    }
    intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
        // debugger;
        const token = this.authService.getToken()
        if (token != null) {
            const modReq = req.clone({
                headers: new HttpHeaders().set("Authorization", `Bearer ${token}`)
            })
            return next.handle(modReq);
        } else {
            return next.handle(req);
        }
    }
}
