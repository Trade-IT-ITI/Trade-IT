import { Component, OnInit } from '@angular/core';

import { UserService } from 'src/app/services/user.service';
import { User } from 'src/app/models/user';
import { Router } from '@angular/router';

@Component({
  selector: 'app-edit-profile',
  templateUrl: './edit-profile.component.html',
  styleUrls: ['./edit-profile.component.css']
})
export class EditProfileComponent implements OnInit {
  user:User={}

  constructor(private userService:UserService,private router:Router) { }

  ngOnInit(): void {
    let userString = localStorage.getItem('user');
    if (userString) {
      let u = JSON.parse(userString);
      this.userService.getUserById(u.userId).subscribe((data)=>{
        localStorage.setItem("user", JSON.stringify(data));
        this.user=data
      })
    }
  }
  updateUser(){
      this.userService.updateUser(this.user.userId!,this.user.firstName!,this.user.lastName!,this.user.email!,this.user.phone!).subscribe(data=>{
        this.router.navigate(["/profile"]);
      })
    
  }
}
