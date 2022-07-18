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
  type: number = 0
  constructor(private authService: AuthService,private router:Router) { }

  ngOnInit(): void {
  }
  login() {
    this.authService.login(this.email, this.password, this.type).subscribe((user) => {
      console.log(user)
      this.router.navigateByUrl("/home")
      localStorage.setItem("userData",JSON.stringify(user));
      //TODO navigate and do things :)
    })
  }
}
