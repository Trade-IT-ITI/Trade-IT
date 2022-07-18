import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import {User} from 'src/app/models/user'
@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {

  categoriesToggle: boolean = false;
  loggedUserFlag:boolean=false
  loggedUser:User={};
  constructor(private router:Router) { }

  ngOnInit(): void {
    let userData = localStorage.getItem('userData');
    this.loggedUser= userData!=null?JSON.parse(userData):null
    if(this.loggedUser){
      this.loggedUserFlag=true;
      console.log(this.loggedUser)
    }
  }
  toggleSubscribe(value: boolean) {
    this.categoriesToggle = value
    
  }
  logout(){
    localStorage.removeItem('userData');
    this.router.navigateByUrl('');
  }


}
