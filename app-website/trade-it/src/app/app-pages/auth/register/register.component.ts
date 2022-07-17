import { Component, OnInit } from '@angular/core';
import { User } from 'src/app/models/user';
import { AuthService } from 'src/app/services/auth.service';
@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
user:User={};
  constructor(private authService:AuthService) { }

  ngOnInit(): void {
  }
  register(){
    this.authService.register(this.user).subscribe((user)=>{
      console.log(user);
      //TODO navigate and do things :)
    })
  }

}
