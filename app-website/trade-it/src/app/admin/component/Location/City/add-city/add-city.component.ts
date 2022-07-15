
import { Component, OnInit } from '@angular/core';
import { CityService } from 'src/app/admin/services/city.service';

@Component({
  selector: 'app-add-city',
  templateUrl: './add-city.component.html',
  styleUrls: ['./add-city.component.css']
})
export class AddCityComponent implements OnInit {

  cityName:string="";
  constructor( private CityService:CityService) { }
  
  addCity(){
    this.CityService.addCity(this.cityName).subscribe(data => {console.log(data)});
  }

  ngOnInit(): void {
  }

}
