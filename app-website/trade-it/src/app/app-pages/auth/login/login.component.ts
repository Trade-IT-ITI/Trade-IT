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
      localStorage.setItem("user", JSON.stringify(data.user));
      localStorage.setItem("token", JSON.stringify(data.token));
      this.authService.emitChange({ email: this.email, isAdmin: data.user.type == 0 })
      this.router.navigate(["/home"]);
      //TODO navigate and do things :)
    })
  }
}
