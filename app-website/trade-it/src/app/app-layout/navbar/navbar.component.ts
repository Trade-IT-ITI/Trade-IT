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
  // loggedUserFlag: boolean = false
  // loggedUser: User = {};
  isLogged: boolean = false;
  isAdmin: boolean = false;
  userEmail: string = '';

  constructor(private authService: AuthService, private router: Router) {
    this.authService.changeEmitted.subscribe(data => {
      this.isLogged = true;
      this.isAdmin = data.isAdmin;
      this.userEmail = data.email;
    })
  }

  ngOnInit(): void {
    let user = localStorage.getItem('user');
    if (user) {
      this.isLogged = true;
      this.userEmail = (JSON.parse(user)).email;
    }
  }
  toggleSubscribe(value: boolean) {
    this.categoriesToggle = value

  }
  logout() {
    this.isLogged = false;
    this.isAdmin = false;
    this.userEmail = '';
    localStorage.removeItem('user');
    localStorage.removeItem('token');
    this.router.navigateByUrl('');
  }
}
