import { Component, OnInit } from '@angular/core';
import { CategoryService } from 'src/app/admin/services/category.service';

@Component({
  selector: 'app-add-category',
  templateUrl: './add-category.component.html',
  styleUrls: ['./add-category.component.css']
})
export class AddCategoryComponent implements OnInit {

  categoryName:string="";
  constructor( private categoryService:CategoryService) { }
  
  addCategory(){
    this.categoryService.addCategory(this.categoryName).subscribe(data => {console.log(data)});
  }

  ngOnInit(): void {
  }

}
