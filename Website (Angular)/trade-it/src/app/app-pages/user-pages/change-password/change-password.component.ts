import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-change-password',
  templateUrl: './change-password.component.html',
  styleUrls: ['./change-password.component.css']
})
export class ChangePasswordComponent implements OnInit {
  oldPassword: string = ""
  newPassword: string = ""
  id:number=0
  constructor(private userService: UserService,private router:Router) { }

  ngOnInit(): void {
    let userString = localStorage.getItem('user');
    if (userString) {
      let u = JSON.parse(userString);
      this.id = u.userId;
    }
  }
  changePassword() {
      this.userService.changePassword(this.id,this.oldPassword,this.newPassword).subscribe(data=>{
      this.router.navigate(["/profile"]);
       })
  }
}
