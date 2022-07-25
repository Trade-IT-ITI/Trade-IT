import { Injectable } from "@angular/core";
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from "@angular/router";
import { Observable } from "rxjs";
import { AuthService } from "../auth.service";
@Injectable({
  providedIn: 'root'
})
export class NotAuthGuard {

  constructor(private authService: AuthService, private router: Router) {

  }
  canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean | UrlTree | Observable<boolean | UrlTree> | Promise<boolean | UrlTree> {
    let isAuth: boolean = this.authService.checkIsAuth();
    if (!isAuth) return true
    else {
      this.router.navigate(['/not-accessible']);
      return false
    }
  }
}
