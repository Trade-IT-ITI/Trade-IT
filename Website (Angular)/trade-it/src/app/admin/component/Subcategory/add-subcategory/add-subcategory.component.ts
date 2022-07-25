import { Component, OnInit } from '@angular/core';

import { SubcategoryService } from 'src/app/admin/services/subcategory.service';
import { CategoryService } from 'src/app/admin/services/category.service';
import { category } from 'src/app/models/category';

@Component({
  selector: 'app-add-subcategory',
  templateUrl: './add-subcategory.component.html',
  styleUrls: ['./add-subcategory.component.css']
})
export class AddSubcategoryComponent implements OnInit {

  subcategoryName:string = ""
  categoryId:number =0
  categories:category[]=[]
  constructor(private categoryService:CategoryService,private subcategoryService:SubcategoryService) { }

  ngOnInit(): void {
    this.categoryService.getAllCategory().subscribe(data=>{
      this.categories = data;
      console.log(data)
    });
  }
  addSubcategory(){
    console.log(this.subcategoryName,this.categoryId)
    this.subcategoryService.addSubcategory(this.subcategoryName,this.categoryId).subscribe(d=>{
      console.log(d)
    })
  }
}
