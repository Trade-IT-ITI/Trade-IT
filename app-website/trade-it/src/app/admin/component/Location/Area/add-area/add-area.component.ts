
import { Component, OnInit } from '@angular/core';

import { AreaService } from 'src/app/admin/services/area.service';
import { CityService } from 'src/app/admin/services/city.service';
import { City } from 'src/app/models/city';

@Component({
  selector: 'app-add-area',
  templateUrl: './add-area.component.html',
  styleUrls: ['./add-area.component.css']
})

export class AddAreaComponent implements OnInit {

  areaName:string = ""
  cityId:number =0
  cities:City[]=[]
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

