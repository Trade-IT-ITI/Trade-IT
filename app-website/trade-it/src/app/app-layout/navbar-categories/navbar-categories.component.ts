import { HttpParams } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { category } from 'src/app/models/category';
import { CategoyService } from '../../services/categoy.service';


@Component({
  selector: 'app-navbar-categories',
  templateUrl: './navbar-categories.component.html',
  styleUrls: ['./navbar-categories.component.css']
})
export class NavbarCategoriesComponent implements OnInit {
  categories: category[] = [];
  constructor(private categoryService: CategoyService) {
  }

  ngOnInit(): void {
    let params: HttpParams = new HttpParams();
    params = params.append('expand', 'Subcategories');
    this.categoryService.getall(params).subscribe(data => {
      this.categories = data
    });
  }

}
