import { UserService } from 'src/app/services/user.service';
import { User } from 'src/app/models/user';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.css']
})
export class ProfileComponent implements OnInit {
user:User={}
  constructor(private userService:UserService) { }

  ngOnInit(): void {
    this.userService.getUserById(1).subscribe((data)=>{
      localStorage.setItem("user", JSON.stringify(data));
      this.user=data
    })
  }

}
