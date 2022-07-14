import { Component, OnInit } from '@angular/core';
import { StatusService } from 'src/app/services/status.service';

@Component({
  selector: 'app-add-status',
  templateUrl: './add-status.component.html',
  styleUrls: ['./add-status.component.css']
})
export class AddStatusComponent implements OnInit {

  statusName:string="";
  constructor( private statusService:StatusService) { }
  
  addStatus(){
    this.statusService.addStatus(this.statusName).subscribe(data => {console.log(data)});
  }

  ngOnInit(): void {
  }

}
