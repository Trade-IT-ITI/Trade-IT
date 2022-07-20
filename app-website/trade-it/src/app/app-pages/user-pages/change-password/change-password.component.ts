import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-change-password',
  templateUrl: './change-password.component.html',
  styleUrls: ['./change-password.component.css']
})
export class ChangePasswordComponent implements OnInit {
  oldPassword: string = ""
  newPassword: string = ""
  constructor(private userService: UserService) { }

  ngOnInit(): void {
  }
  changePassword() {
    //  this.userService.changePassword().subscribe(data=>{
    //this.router.navigate(["/profile"]);
    //   })
  }
}
