import { User } from 'src/app/models/user';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.css']
})
export class ProfileComponent implements OnInit {
user:User={}
  constructor() { }

  ngOnInit(): void {
    let userData = localStorage.getItem('userData');
    this.user= userData!=null?JSON.parse(userData):null
  }

}
