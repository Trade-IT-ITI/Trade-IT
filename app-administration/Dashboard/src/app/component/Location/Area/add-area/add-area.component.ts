
import { Component, OnInit } from '@angular/core';

import { AreaService } from 'src/app/services/area.service';
import { CityService } from 'src/app/services/city.service';
import { city } from 'src/app/models/city';

@Component({
  selector: 'app-add-area',
  templateUrl: './add-area.component.html',
  styleUrls: ['./add-area.component.css']
})

export class AddAreaComponent implements OnInit {

  areaName:string = ""
  cityId:number =0
  cities:city[]=[]
  constructor(private cityService:CityService,private areaService:AreaService) { }

  ngOnInit(): void {
    this.cityService.getAllCities().subscribe(data=>{
      this.cities = data;
      console.log(data)
    });
  }
  addArea(){
    console.log(this.areaName,this.cityId)
    this.areaService.addArea(this.areaName,this.cityId).subscribe(d=>{
      console.log(d)
    })
  }
}

