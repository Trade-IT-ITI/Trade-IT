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
  constructor(private categoryService: CategoyService) { }

  ngOnInit(): void {
    this.categories = this.categoryService.getall();
  }

}
