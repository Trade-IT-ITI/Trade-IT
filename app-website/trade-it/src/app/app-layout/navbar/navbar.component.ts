import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

// import { User } from 'src/app/models/user'
import { AuthService } from 'src/app/services/auth.service';
@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {

  categoriesToggle: boolean = false;
  isAuth: boolean = false;
  isAdmin: boolean = false;
  fullName: string = '';

  constructor(private authService: AuthService, private router: Router) {
    this.authService.changeEmitted.subscribe(data => {
      console.log(data)
      this.fullName = data.fullname;
      this.isAuth = data.isAuth;
      this.isAdmin = data.isAdmin;
    })
  }

  ngOnInit(): void {
    let userString = localStorage.getItem('user');
    if (userString) {
      let user = JSON.parse(userString);
      if (user) {
        this.isAdmin = user.type == 0;
        this.isAuth = true;
        this.fullName = user.firstName + ' ' + user.lastName;
      }
    }
  }
  toggleSubscribe(value: boolean) {
    this.categoriesToggle = value

  }
  logout() {
    this.isAuth = false;
    this.isAdmin = false;
    this.fullName = '';
    this.authService.logout();
    this.router.navigateByUrl('');
  }
}
