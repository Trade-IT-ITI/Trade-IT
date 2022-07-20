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
  isLogged: boolean = false;
  isAdmin: boolean = false;
  fullName: string = '';

  constructor(private authService: AuthService, private router: Router) {
    this.authService.changeEmitted.subscribe(data => {
      this.isLogged = true;
      this.isAdmin = data.isAdmin;
      this.fullName = data.fullname;
    })
  }

  ngOnInit(): void {
    let userString = localStorage.getItem('user');
    if (userString) {
      let user = JSON.parse(userString);
      console.log(user)
      if (user) {
        this.isLogged = true;
        this.fullName = user.firstName + ' ' + user.lastName;
      }
    }
  }
  toggleSubscribe(value: boolean) {
    this.categoriesToggle = value

  }
  logout() {
    this.isLogged = false;
    this.isAdmin = false;
    this.fullName = '';
    localStorage.removeItem('user');
    localStorage.removeItem('token');
    this.router.navigateByUrl('');
  }
}
