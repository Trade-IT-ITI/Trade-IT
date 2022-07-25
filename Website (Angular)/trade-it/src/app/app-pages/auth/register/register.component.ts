import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { User } from 'src/app/models/user';
import { AuthService } from 'src/app/services/auth.service';
@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
  user: User = {};
  constructor(private authService: AuthService, private router: Router) { }

  ngOnInit(): void {
  }
  register() {
    this.authService.register(this.user).subscribe((data) => {
      localStorage.setItem("user", JSON.stringify(data.user));
      localStorage.setItem("token", data.token);
      this.authService.emitChange({
        fullname: data.user.firstName + ' ' + data.user.lastName,
        isAuth: true,
        isAdmin: data.user.type == 0,
      });
      this.router.navigate(["/home"]);
    })
  }

}
