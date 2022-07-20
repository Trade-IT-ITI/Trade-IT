import { Component, OnInit } from '@angular/core';

import { UserService } from 'src/app/services/user.service';
import { User } from 'src/app/models/user';

@Component({
  selector: 'app-edit-profile',
  templateUrl: './edit-profile.component.html',
  styleUrls: ['./edit-profile.component.css']
})
export class EditProfileComponent implements OnInit {
  user:User={}

  constructor(private userService:UserService) { }

  ngOnInit(): void {
    let userData = localStorage.getItem('user');
    this.user= userData!=null?JSON.parse(userData):null
    console.log(this.user)
  }
  updateUser(){
      this.userService.updateUser(this.user.userId!,this.user.firstName!,this.user.lastName!,this.user.email!,this.user.phone!).subscribe(data=>{
        console.log(data)
      })
    
  }
}
