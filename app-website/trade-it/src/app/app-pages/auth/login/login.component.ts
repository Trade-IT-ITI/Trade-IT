import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  email: string = ""
  password: string = ""
  type: number = 1
  constructor(private authService: AuthService, private router: Router) { }

  ngOnInit(): void {
  }
  login() {
    this.authService.login(this.email, this.password, this.type).subscribe((data) => {
      this.authService.emitChange({
        fullname: data.user.firstName + ' ' + data.user.lastName,
        isAuth: this.authService.isAuth,
        isAdmin: this.authService.isAdmin,
      })
      this.router.navigate(["/home"]);
    })
  }
}
